using NBitcoin.Secp256k1;
using Nethereum.ABI;
using Nethereum.ABI.EIP712;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.ABI.Model;
using Nethereum.Contracts;
using Nethereum.Hex.HexConvertors.Extensions;
using Nethereum.Signer;
using Nethereum.Signer.EIP712;
using Nethereum.Util;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using System;
using System.Globalization;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace Nethereum
{
    public class GasLessTransactions
    {
        [Function("transfer", "bool")]
        public class TransferFunction : FunctionMessage
        {
            [Parameter("address", "_to", 1)]
            public string To { get; set; }

            [Parameter("uint256", "_value", 2)]
            public BigInteger TokenAmount { get; set; }
        }

        [Struct("ForwardRequest")]
        public class ForwardRequest
        {
            [Parameter("address", "from", 1)]
            public string From { get; set; }

            [Parameter("address", "to", 2)]
            public string To { get; set; }

            [Parameter("uint256", "value", 3)]
            public BigInteger Value { get; set; }

            [Parameter("uint256", "gas", 4)]
            public BigInteger Gas { get; set; }

            [Parameter("uint256", "nonce", 5)]
            public BigInteger Nonce { get; set; }

            [Parameter("bytes", "data", 6)]
            public byte[] Data { get; set; }
        }

        [Function("getNonce", "uint256")]
        //public class GetNonceFunction : FunctionMessage
        //{
        //    [Parameter("address", "from", 1)]
        //    public string From { get; set; }
        //}

        //[Function("verify", "bool")]
        //public class VerifyFunction : FunctionMessage
        //{
        //    [Parameter("tuple", "req", 1)]
        //    public ForwardRequest Request { get; set; }

        //    [Parameter("bytes", "signature", 2)]
        //    public byte[] Signature { get; set; }
        //}

        //[Function("execute", typeof(ExecuteOutputDTO))]
        //public class ExecuteFunction : FunctionMessage
        //{
        //    [Parameter("tuple", "req", 1)]
        //    public ForwardRequest Request { get; set; }

        //    [Parameter("bytes", "signature", 2)]
        //    public byte[] Signature { get; set; }
        //}

        [FunctionOutput]
        public class ExecuteOutputDTO : IFunctionOutputDTO
        {
            [Parameter("bool", "success", 1)]
            public bool Success { get; set; }

            [Parameter("bytes", "returndata", 2)]
            public byte[] ReturnData { get; set; }
        }

        private readonly string _rpcUrl;
        private readonly string _forwarderAddress;
        private readonly string _tokenContractAddress;
        private readonly string _recipientAddress;
        private readonly string _userPrivateKey;
        private readonly string _relayerPrivateKey;
        private readonly BigInteger _transferAmountWei;

        private static readonly byte[] ForwardRequestTypeHash = Sha3Keccack.Current.CalculateHash(Encoding.UTF8.GetBytes("ForwardRequest(address from,address to,uint256 value,uint256 gas,uint256 nonce,bytes data)"));
        private static readonly byte[] DomainTypeHash = Sha3Keccack.Current.CalculateHash(Encoding.UTF8.GetBytes("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"));
        private static readonly ABIEncode AbiEncoder = new ABIEncode();

        public GasLessTransactions()
        {
            _rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a";
            _forwarderAddress = "0xcb2F86B2153338972588DCD94015d4629dFbbCa0";
            _tokenContractAddress = "0x186BD6a4335534057c97125d5F0bc196cA29cbD8";
            _recipientAddress = "0x25dE5EE53486080262c1BCf3A26442327bf00A5A";
            _userPrivateKey = "33109845add9461c0d76f2c4186ea12bfd7cbb37cbaec6f090e3a69c070f30ba";
            _relayerPrivateKey = "e9aa580f91d7bc2578bc8980b49ac6dfb529947d88f5e3d523918e29845ac6c2";

            var amountValue = Environment.GetEnvironmentVariable("TOKEN_TRANSFER_AMOUNT_WEI");
            _transferAmountWei = string.IsNullOrWhiteSpace(amountValue)
                ? BigInteger.Parse("10000000000000000000", CultureInfo.InvariantCulture)
                : BigInteger.Parse(amountValue, CultureInfo.InvariantCulture);
        }

        //public async Task<string> StartTransfer()
        //{
        //    var relayerAccount = new Nethereum.Web3.Accounts.Account(_relayerPrivateKey);
        //    var web3 = new Nethereum.Web3.Web3(relayerAccount, _rpcUrl);
        //    var userAccount = new Nethereum.Web3.Accounts.Account(_userPrivateKey);

        //    var getNonceHandler = web3.Eth.GetContractQueryHandler<GetNonceFunction>();
        //    var userNonce = await getNonceHandler.QueryAsync<BigInteger>(
        //        _forwarderAddress,
        //        new GetNonceFunction { From = userAccount.Address });

        //    Console.WriteLine(string.Format("Nonce for user: {0}", userNonce));

        //    var transfer = new TransferFunction
        //    {
        //        To = _recipientAddress,
        //        TokenAmount = _transferAmountWei
        //    };

        //    var builder = new FunctionBuilder<TransferFunction>(_tokenContractAddress);
        //    var encodedData = builder.GetData(transfer);

        //    var forwardRequest = new ForwardRequest
        //    {
        //        From = userAccount.Address,
        //        To = _tokenContractAddress,
        //        Value = 0,
        //        Gas = 500000,
        //        Nonce = userNonce,
        //        Data = encodedData.HexToByteArray()
        //    };

        //    var chainId = int.Parse(await web3.Net.Version.SendRequestAsync(), CultureInfo.InvariantCulture);
        //    var signature = SignForwardRequest(_userPrivateKey, _forwarderAddress, chainId, forwardRequest);

        //    Console.WriteLine(string.Format("Signature: {0}", signature));

        //    var verifyHandler = web3.Eth.GetContractQueryHandler<VerifyFunction>();
        //    var isValidSignature = await verifyHandler.QueryAsync<bool>(_forwarderAddress, new VerifyFunction
        //    {
        //        Request = forwardRequest,
        //        Signature = signature.HexToByteArray()
        //    });

        //    if (!isValidSignature)
        //    {
        //        throw new InvalidOperationException("Forwarder signature verification failed for the constructed request.");
        //    }

        //    var executeHandler = web3.Eth.GetContractTransactionHandler<ExecuteFunction>();
        //    var executeFunction = new ExecuteFunction
        //    {
        //        Request = forwardRequest,
        //        Signature = signature.HexToByteArray(),
        //        Gas = 500000
        //    };

        //    var receipt = await executeHandler.SendRequestAndWaitForReceiptAsync(_forwarderAddress, executeFunction);
        //    Console.WriteLine(string.Format("? Transaction mined! Hash: {0}", receipt.TransactionHash));

        //    return receipt.TransactionHash;
        //}

        private static string SignForwardRequest(string userPrivateKey, string forwarderAddress, int chainId, ForwardRequest request)
        {
            var domain = new Domain
            {
                Name = "MinimalForwarder",
                Version = "0.0.1",
                ChainId = chainId,
                VerifyingContract = forwarderAddress
            };

            var typedDataHash = CalculateTypedDataHash(domain, request);
            var key = new EthECKey(userPrivateKey);
            var signature = key.SignAndCalculateV(typedDataHash);
            return EthECDSASignature.CreateStringSignature(signature);
        }

        private static byte[] CalculateTypedDataHash(Domain domain, ForwardRequest request)
        {
            var domainSeparator = CalculateDomainSeparator(domain);
            var structHash = CalculateStructHash(request);

            var buffer = new byte[2 + domainSeparator.Length + structHash.Length];
            buffer[0] = 0x19;
            buffer[1] = 0x01;
            Array.Copy(domainSeparator, 0, buffer, 2, domainSeparator.Length);
            Array.Copy(structHash, 0, buffer, 2 + domainSeparator.Length, structHash.Length);

            return Sha3Keccack.Current.CalculateHash(buffer);
        }

        private static byte[] CalculateDomainSeparator(Domain domain)
        {
            var nameHash = Sha3Keccack.Current.CalculateHash(Encoding.UTF8.GetBytes(domain.Name ?? string.Empty));
            var versionHash = Sha3Keccack.Current.CalculateHash(Encoding.UTF8.GetBytes(domain.Version ?? string.Empty));

            return Sha3Keccack.Current.CalculateHash(
                AbiEncoder.GetABIEncoded(
                    new ABIValue("bytes32", DomainTypeHash),
                    new ABIValue("bytes32", nameHash),
                    new ABIValue("bytes32", versionHash),
                    new ABIValue("uint256", domain.ChainId),
                    new ABIValue("address", domain.VerifyingContract)
                ));
        }

        private static byte[] CalculateStructHash(ForwardRequest request)
        {
            var dataBytes = request.Data ?? Array.Empty<byte>();
            var dataHash = Sha3Keccack.Current.CalculateHash(dataBytes);

            return Sha3Keccack.Current.CalculateHash(
                AbiEncoder.GetABIEncoded(
                    new ABIValue("bytes32", ForwardRequestTypeHash),
                    new ABIValue("address", request.From),
                    new ABIValue("address", request.To),
                    new ABIValue("uint256", request.Value),
                    new ABIValue("uint256", request.Gas),
                    new ABIValue("uint256", request.Nonce),
                    new ABIValue("bytes32", dataHash)
                ));
        }

        private static string RequireEnv(string variableName)
        {
            var value = Environment.GetEnvironmentVariable(variableName);
            if (string.IsNullOrWhiteSpace(value))
            {
                throw new InvalidOperationException(string.Format("Environment variable '{0}' is not configured.", variableName));
            }

            return value;
        }

        public void CheckSignature()
        {
            // private key for signer (example only)
            var privateKey = "e9aa580f91d7bc2578bc8980b49ac6dfb529947d88f5e3d523918e29845ac6c2";
            var signer = new EthereumMessageSigner();

            var sender = "0x0A25550Fa2195705F34271832db1E4399B1dEeaf";
            var receiver = "0x25dE5EE53486080262c1BCf3A26442327bf00A5A";
            BigInteger amount = 100;
            var contractAddress = "0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005";

            // 1) abi.encodePacked(sender, receiver, amount, contractAddress)
            var sha3 = new Sha3Keccack();

            // Build the same packed bytes as Solidity's abi.encodePacked:
            var messageBytes = (
                sender.RemoveHexPrefix() +
                receiver.RemoveHexPrefix() +
                amount.ToString("x").PadLeft(64, '0') +   // uint256 = 32 bytes (hex padded)
                contractAddress.RemoveHexPrefix()
            ).HexToByteArray();

            // 2) keccak256(abi.encodePacked(...)) -> 32 bytes
            var messageHash = sha3.CalculateHash(messageBytes); // byte[]

            Console.WriteLine("messageHash: 0x" + messageHash.ToHex());

            // 3) Sign the raw 32-byte hash, but Nethereum's Sign(...) will apply the Ethereum prefix
            //    and produce a signature compatible with solidity's toEthSignedMessageHash + ECDSA.recover
            var ecKey = new EthECKey(privateKey);
            string signature = signer.Sign(messageHash, ecKey); // IMPORTANT: signs the raw hash with prefix
            Console.WriteLine("signature: " + signature);

            // 4) Recover the address from the same raw 32-byte hash + signature
            string recovered = signer.EcRecover(messageHash, signature);
            Console.WriteLine("recovered: " + recovered);

            // Normalize checks (case-insensitive)
            if (string.Equals(recovered, sender, StringComparison.OrdinalIgnoreCase))
                Console.WriteLine("✅ Verified");
            else
                Console.WriteLine("❌ MISMATCH");
        }


        // New Function
        public async Task ExecuteSignedTransferAsync()
        {
            try
            {
                //---------------------------------------------------------------------
                // CONFIGURATION
                //---------------------------------------------------------------------
               // var privateKey = "33109845add9461c0d76f2c4186ea12bfd7cbb37cbaec6f090e3a69c070f30ba";
                var privateKey = "0xa8aaea93811a8ef12649cafab8b1b4c2af53d57b1e4fcc4d258afe916c3ec6fc";
                //var privateKey = "5c4717515235787622fb8854094e0606809775d454e91e06336991383c4a040c";
                var adminPrivateKey = "5c4717515235787622fb8854094e0606809775d454e91e06336991383c4a040c";
                var sender = "0xCDE70EbA204Dc65A29685774cEE3F13ae053Cd81";
                //var sender = "0x22Cc0344c7b89d424d8d2Fd62C795770a7485dA2";
                //var receiver = "0x0E46A8BF9d56B2987A19aD61A1bf8be76f45B03d";
                var receiver = "0x819A44750189852E727f2d17702Ea71cbF043083";
                //var receiver = "0x25dE5EE53486080262c1BCf3A26442327bf00A5A";
                // Fix for CS1021: Use the BigInteger.Parse method to handle large integral constants
                BigInteger amount = BigInteger.Parse("1000000000000000000");
                BigInteger fees = 1000000000000000;
                BigInteger deadline = 0;
                //var forwarderAddress = "0xDf8d492a53D7edA91F3063FDe9b166C2db94A22e";
                var forwarderAddress = "0x733355E4F6BbD52069f716AF5f05ae44eD8D794E";

                var account = new Account(privateKey);
                var adminAccount = new Account(adminPrivateKey);
                var web3 = new Nethereum.Web3.Web3(account, _rpcUrl);
                var adminWeb3 = new Nethereum.Web3.Web3(adminAccount, _rpcUrl);

                //---------------------------------------------------------------------
                // 1️⃣  GET CURRENT NONCE FROM CONTRACT
                //---------------------------------------------------------------------
                var nonceFunction = new GetNonceFunction { Account = sender };
                var nonceHandler = web3.Eth.GetContractQueryHandler<GetNonceFunction>();
                BigInteger nonce = await nonceHandler
                    .QueryAsync<BigInteger>(forwarderAddress, nonceFunction);

                Console.WriteLine($"Nonce for {sender}: {nonce}");

                //---------------------------------------------------------------------
                // 2️⃣  BUILD EIP-712 STRUCT + DOMAIN
                //---------------------------------------------------------------------
                var chainId = (long)(await web3.Eth.ChainId.SendRequestAsync()).Value;

                var domain = new Domain
                {
                    Name = "SignatureForwarder",
                    Version = "1",
                    ChainId = chainId,
                    VerifyingContract = forwarderAddress
                };

                // Build type map manually (TypedDataTypes no longer exists)
                var types = new Dictionary<string, MemberDescription[]>
                {
                    ["EIP712Domain"] = new[]
                    {
                new MemberDescription { Name = "name", Type = "string" },
                new MemberDescription { Name = "version", Type = "string" },
                new MemberDescription { Name = "chainId", Type = "uint256" },
                new MemberDescription { Name = "verifyingContract", Type = "address" }
            },
                    ["TransferRequest"] = new[]
                    {
                new MemberDescription { Name = "sender", Type = "address" },
                new MemberDescription { Name = "receiver", Type = "address" },
                new MemberDescription { Name = "amount", Type = "uint256" },
                new MemberDescription { Name = "fee", Type = "uint256" },
                new MemberDescription { Name = "nonce", Type = "uint256" },
                new MemberDescription { Name = "deadline", Type = "uint256" }
            }
                };

                // Provide field values for the struct
                var message = new MemberValue[]
                {
            new MemberValue { TypeName = "address", Value = sender },
            new MemberValue { TypeName = "address", Value = receiver },
            new MemberValue { TypeName = "uint256", Value = amount },
            new MemberValue { TypeName = "uint256", Value = fees },
            new MemberValue { TypeName = "uint256", Value = nonce },
            new MemberValue { TypeName = "uint256", Value = deadline }
                };

                // --- 3️⃣ Create typed data and sign ---
                var typedData = new TypedData<Domain>
                {
                    Domain = domain,
                    PrimaryType = "TransferRequest",
                    Types = types,
                    Message = message
                };


                var eip712Signer = new Eip712TypedDataSigner();
                var signature = eip712Signer.SignTypedDataV4(typedData, new EthECKey(privateKey));
                Console.WriteLine($"EIP712 Signature: {signature}");

                //---------------------------------------------------------------------
                // 4️⃣  CALL executeSignedTransfer ON CONTRACT
                //---------------------------------------------------------------------
                var executeFunction = new ExecuteSignedTransferFunction()
                {
                    Req = new TransferRequest
                    {
                        Sender = sender,
                        Receiver = receiver,
                        Amount = amount,
                        Fee = fees,
                        Nonce = nonce,
                        Deadline = deadline
                    },
                    Signature = signature.HexToByteArray()
                };

                var txHandler = adminWeb3.Eth.GetContractTransactionHandler<ExecuteSignedTransferFunction>();
                var gas = await txHandler.EstimateGasAsync(forwarderAddress, executeFunction);
                executeFunction.Gas = gas;
                var txHash = await txHandler.SendRequestAsync(forwarderAddress, executeFunction);
                Console.WriteLine($"Transaction sent: {txHash}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }

        // ------------------------------------------------------------------------
        // CONTRACT DTOs
        // ------------------------------------------------------------------------
        [Function("getNonce", "uint256")]
        public class GetNonceFunction : FunctionMessage
        {
            [Parameter("address", "account", 1)]
            public string Account { get; set; }
        }

        [Function("executeSignedTransfer")]
        public class ExecuteSignedTransferFunction : FunctionMessage
        {
            [Parameter("tuple", "req", 1)]
            public TransferRequest Req { get; set; }

            [Parameter("bytes", "signature", 2)]
            public byte[] Signature { get; set; }  
        }

        [Struct("TransferRequest")]
        public class TransferRequest
        {
            [Parameter("address", "sender", 1)]
            public string Sender { get; set; }

            [Parameter("address", "receiver", 2)]
            public string Receiver { get; set; }

            [Parameter("uint256", "amount", 3)]
            public BigInteger Amount { get; set; }

            [Parameter("uint256", "fee", 4)]
            public BigInteger Fee { get; set; }

            [Parameter("uint256", "nonce", 5)]
            public BigInteger Nonce { get; set; }

            [Parameter("uint256", "deadline", 6)]
            public BigInteger Deadline { get; set; }
        }   

    }
}





