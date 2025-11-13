// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
 * @title SignatureForwarder (struct-based + internalized core)
 * @notice Verifies EIP-712 signed transfer requests and forwards ERC20 transferFrom calls
 *         for a single, fixed token set in the constructor.
 * @dev Uses OpenZeppelin EIP712, ECDSA, SafeERC20, ReentrancyGuard, Ownable, Pausable.
 */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract SignatureForwarder is
    EIP712,
    ReentrancyGuard,
    Ownable(msg.sender),
    Pausable
{
    using SafeERC20 for IERC20;
    using ECDSA for bytes32;

    /// @notice ERC20 token address permanently set at deployment
    address public immutable token;
    address private feesAccount;

    /// @notice Request payload (struct-based API)
    struct TransferRequest {
        address sender; // token owner who signed
        address receiver; // token recipient
        uint256 amount; // transfer amount
        uint256 fee; // fee amount (paid by sender to feesAccount)
        uint256 nonce; // expected current nonce for sender
        uint256 deadline; // 0 means no deadline
    }

    /// @notice EIP-712 typehash for TransferRequest
    bytes32 public constant TRANSFER_REQUEST_TYPEHASH =
        keccak256(
            "TransferRequest(address sender,address receiver,uint256 amount,uint256 fee,uint256 nonce,uint256 deadline)"
        );

    /// @notice per-sender nonces to prevent replay
    mapping(address => uint256) public nonces;

    /// @notice Emitted when a transfer succeeds
    event TransferExecuted(
        address indexed sender,
        address indexed receiver,
        address indexed relayer,
        uint256 amount,
        uint256 fee,
        uint256 nonce
    );

    /// @notice Emitted when a transfer fails validation
    event TransferFailed(
        address indexed sender,
        address indexed receiver,
        address indexed relayer,
        uint256 amount,
        uint256 fee,
        uint256 nonce,
        string reason
    );

    event FeesAccountUpdated(
        address indexed previousAccount,
        address indexed newAccount
    );

    /// ---- Custom errors ----
    error InvalidToken();
    error InvalidSender();
    error InvalidReceiver();
    error InvalidAmount();
    error InvalidFee();
    error SignatureExpired();
    error InvalidSignature();
    error InsufficientAllowance();
    error InsufficientBalance();
    error InvalidFeesAccount();

    /// @notice Initializes the contract with the fixed token address
    constructor(
        address _token,
        address _feesAccount
    ) EIP712("SignatureForwarder", "1") {
        if (_token == address(0)) revert InvalidToken();
        if (_feesAccount == address(0)) revert InvalidFeesAccount();
        token = _token;
        feesAccount = _feesAccount;
    }

    /// @notice Execute a pre-signed ERC20 transferFrom(sender -> receiver) using struct params
    function executeSignedTransfer(
        TransferRequest calldata req,
        bytes calldata signature
    ) external nonReentrant whenNotPaused {
        // validate + signature + nonce bump (internalized)
        _verifyAndConsumeNonce(req, signature);

        // token accounting and transfers (internalized)
        _pullAndDistribute(req.sender, req.receiver, req.amount, req.fee);

        emit TransferExecuted(
            req.sender,
            req.receiver,
            msg.sender,
            req.amount,
            req.fee,
            req.nonce
        );
    }

    /// @notice Get the EIP-712 typed hash to be signed off-chain for a given struct
    function getTypedRequestHash(
        TransferRequest calldata req
    ) external view returns (bytes32) {
        return _hashRequest(req);
    }

    /// @notice Query the current nonce for an address
    function getNonce(address account) external view returns (uint256) {
        return nonces[account];
    }

    function getFeesAccount() external view returns (address) {
        return feesAccount;
    }

    /// @notice Owner can update the fees account if needed
    function setFeesAccount(address _feesAccount) external onlyOwner {
        if (_feesAccount == address(0)) revert InvalidFeesAccount();
        feesAccount = _feesAccount;
        emit FeesAccountUpdated(feesAccount, _feesAccount);
    }

    /// @notice Pause/unpause relayer execution (emergency stop)
    function pause() external onlyOwner {
        _pause();
    }
    function unpause() external onlyOwner {
        _unpause();
    }

    /// @notice Owner can recover tokens mistakenly sent to contract (only surplus when paused).
    function sweep(
        address erc20,
        address to,
        uint256 amount
    ) external onlyOwner whenPaused nonReentrant {
        if (to == address(0)) revert InvalidReceiver();
        IERC20 erc = IERC20(erc20);
        if (erc20 == address(token)) {
            uint256 balance = erc.balanceOf(address(this));
            if (amount > balance) revert InsufficientBalance();
            erc.safeTransfer(to, amount);
        } else {
            erc.safeTransfer(to, amount);
        }
    }

    /// @dev Compute EIP-712 digest for a request (struct-based)
    function _hashRequest(
        TransferRequest calldata req
    ) internal view returns (bytes32) {
        bytes32 structHash = keccak256(
            abi.encode(
                TRANSFER_REQUEST_TYPEHASH,
                req.sender,
                req.receiver,
                req.amount,
                req.fee,
                req.nonce,
                req.deadline
            )
        );
        return _hashTypedDataV4(structHash);
    }

    /// @dev Validates request fields, deadline, nonce, signature; then consumes nonce.
    function _verifyAndConsumeNonce(
        TransferRequest calldata req,
        bytes calldata signature
    ) internal {
        // Basic validations
        if (req.sender == address(0)) revert InvalidSender();
        if (req.receiver == address(0)) revert InvalidReceiver();
        if (req.amount == 0) revert InvalidAmount();

        // Deadline check (0 means no deadline)
        if (req.deadline != 0 && block.timestamp > req.deadline)
            revert SignatureExpired();

        // Nonce must match current value for sender
        uint256 current = nonces[req.sender];
        if (req.nonce != current) {
            // emit forensics event before revert
            emit TransferFailed(
                req.sender,
                req.receiver,
                msg.sender,
                req.amount,
                req.fee,
                req.nonce,
                "Bad nonce"
            );
            revert InvalidSignature();
        }

        // Verify signature over typed struct
        address recovered = ECDSA.recover(_hashRequest(req), signature);
        if (recovered != req.sender) {
            emit TransferFailed(
                req.sender,
                req.receiver,
                msg.sender,
                req.amount,
                req.fee,
                req.nonce,
                "Bad signature"
            );
            revert InvalidSignature();
        }

        // Consume nonce (effects before interactions)
        unchecked {
            nonces[req.sender] = current + 1;
        }
    }

    /// @dev Pulls tokens from sender then forwards amount to receiver and fee to feesAccount.
    function _pullAndDistribute(
        address sender,
        address receiver,
        uint256 amount,
        uint256 fee
    ) internal {
        IERC20 t = IERC20(token);

        // Total needed from sender
        uint256 total = amount + fee;

        // Pre-checks for better UX (not strictly required because SafeERC20 would revert anyway)
        if (t.allowance(sender, address(this)) < total) {
            emit TransferFailed(
                sender,
                receiver,
                msg.sender,
                amount,
                fee,
                nonces[sender] - 1,
                "Insufficient allowance"
            );
            revert InsufficientAllowance();
        }

        if (t.balanceOf(sender) < total) {
            emit TransferFailed(
                sender,
                receiver,
                msg.sender,
                amount,
                fee,
                nonces[sender] - 1,
                "Insufficient balance"
            );
            revert InsufficientBalance();
        }

        // Interactions
        t.safeTransferFrom(sender, receiver, amount);

        if (fee > 0) {
            t.safeTransferFrom(sender, feesAccount, fee);
        }
    }
}
