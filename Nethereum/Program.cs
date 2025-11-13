using Nethereum;
using Nethereum.ABI;
using Nethereum.ABI.EIP712;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.ABI.FunctionEncoding.Attributes;
using Nethereum.ABI.Model;
using Nethereum.BlockchainProcessing.BlockStorage.Entities;
using Nethereum.Contracts;
using Nethereum.Hex.HexConvertors.Extensions;
using Nethereum.Hex.HexTypes;
using Nethereum.Model;
using Nethereum.RPC.Eth.DTOs;
using Nethereum.Signer;
using Nethereum.Signer.EIP712;
using Nethereum.Util;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Asn1.X509;
using Org.BouncyCastle.Utilities.Encoders;
using System;
using System.Net.Http.Headers;
using System.Net.NetworkInformation;
using System.Numerics;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using System.Transactions;
using static System.Runtime.InteropServices.JavaScript.JSType;
using DotNetEnv;

class Program
{
    [Function("getFeesAccount", "address")]
    public class GetFees : FunctionMessage
    { }

    //this is the function message that will be used to transfer tokens
    [Function("transfer", "bool")]
    public class TransferFunction : FunctionMessage
    {
        [Parameter("address", "_to", 1)]
        public string To { get; set; }
        [Parameter("uint256", "_value", 2)]
        public BigInteger TokenAmount { get; set; }
    }

    [Function("getNonce", "uint256")]
    public class GetNonceFunction : FunctionMessage
    {
        [Parameter("address", "from", 1)]
        public string From { get; set; }
    }


    static async Task Main(string[] args)
    {
        //// Load environment variables from .env file
        //Env.Load();

        GasLessTransactions _gasLessTxn = new GasLessTransactions();
        //_ = await _gasLessTxn.StartTransfer();

         await _gasLessTxn.ExecuteSignedTransferAsync();
    }
    static async Task CallGetFunction()
    {
        // Replace these with your details
        string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a"; // Replace with your RPC provider
        string contractAddress = "0x186BD6a4335534057c97125d5F0bc196cA29cbD8"; // Replace with your contract address
        string ownerPrivateKey = "ae27a096dace75bbce1c3bbcee1661a3d6b6e70dfb5d41d51581acf282bd087f"; // Replace with the owner's private key

        try
        {
            // Create an account object using the owner's private key
            var account = new Nethereum.Web3.Accounts.Account(ownerPrivateKey);
            var web3 = new Web3(account, rpcUrl);

            var nonce = await web3.Eth.Transactions.GetTransactionCount.SendRequestAsync("0xD9F6DedAC12a1E360b4887C644d5a4fbeB8a9cF5");

            //var balanceOfFunctionMessage = new GetFees();

            //var balanceHandler = web3.Eth.GetContractQueryHandler<GetFees>();
            //var feesAccountAddress = await balanceHandler.QueryAsync<string>(contractAddress, balanceOfFunctionMessage);


            // Decode the result
            //Console.WriteLine("Fees Account Address: " + feesAccountAddress);
            Console.ReadLine();
        }
        catch (Exception ex)
        {
            Console.WriteLine("An error occurred: " + ex.Message);
        }
    }

    [Event("Transfer")]
    public class TransferEventDTO : IEventDTO
    {
        [Parameter("address", "from", 1, true)]
        public string From { get; set; }

        [Parameter("address", "to", 2, true)]
        public string To { get; set; }

        [Parameter("uint256", "tokenId", 3, true)]
        public BigInteger TokenId { get; set; }
    }

    static async Task GetTransactionStatus()
    {
        try
        {
            //string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a";
            //string rpcUrl = "https://base-mainnet.g.alchemy.com/v2/P6wcxYtaV7LwIcMLVhdQQa6D-wqFayFO";
            string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/P6wcxYtaV7LwIcMLVhdQQa6D-wqFayFO";
            Web3 web3 = new Web3(rpcUrl);

            var receipt = await web3.Eth.Transactions.GetTransactionByHash.SendRequestAsync("0x27d1ebdad8832bc3bbae9a75499c0ddb6e0451795d124ea0b3d038aa6f1a0aca");
            //var receipt = await web3.Eth.Transactions.GetTransactionReceipt.SendRequestAsync("0xb62add45beb12a58dd6d4bcd09865323d17561568ffb21f84ac7ec7a397fabbd ");
            if (receipt == null)
            {
                Console.WriteLine("Status = 0  -> Pending ");
            }


            var eventHandler = web3.Eth.GetEvent<TransferEventDTO>();
            //var events = eventHandler.DecodeAllEventsForEvent(receipt.Logs);

            //foreach (var evt in events)
            //{
            //    // Assuming this is a mint, from is zero address
            //    if (evt.Event.From == "0x0000000000000000000000000000000000000000")
            //    {
            //        Console.WriteLine(evt.Event.TokenId);
            //    }
            //}


            //// Step 3: Search for Transfer event in logs
            //foreach (var log in receipt.Logs)
            //{
            //    var decoded = transferEvent.DecodeEventDefaultTopics(log);
            //    if (decoded != null)
            //    {
            //        var tokenId = (BigInteger)decoded.Event.FirstOrDefault(e => e.Parameter.Name == "tokenId")?.Result;
            //        return tokenId;
            //    }
            //}

            //throw new Exception("Transfer event with tokenId not found in the logs.");

            //else if (receipt.)
            //{
            //    Console.WriteLine("Status = 1 -> Success");
            //}
            //else if (receipt.Status.Value == 0)
            //{
            //    Console.WriteLine("Status = 2 -> Fail");
            //}

            Console.ReadLine();
        }
        catch (Exception ex)
        {
            Console.WriteLine("An error occurred: " + ex.Message);
        }

    }

    static async Task GetGasPriceInGwei()
    {
        //var apikey = _configuration["PolygonConnections:APIKey"];
        //var rpcurl = string.Format("{0}{1}", _configuration["PolygonConnections:rpcUrl"], apikey);

        var apikey = "YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a";
        var rpcurl = string.Format("{0}{1}", "https://polygon-mainnet.g.alchemy.com/v2/", apikey);

        HttpClient client = new HttpClient();
        HttpRequestMessage request = new HttpRequestMessage()
        {
            Method = HttpMethod.Post,
            RequestUri = new Uri(rpcurl),
            Headers =
                            {
                                { "accept", "application/json" },
                            },
            Content = new StringContent("{\"id\":1,\"jsonrpc\":\"2.0\",\"method\":\"eth_gasPrice\"}")
            {
                Headers =
                                {
                                    ContentType = new MediaTypeHeaderValue("application/json")
                                }
            }
        };
        HttpResponseMessage response = await client.SendAsync(request);
        response.EnsureSuccessStatusCode();
        string body = await response.Content.ReadAsStringAsync();

        GasPriceResponse gasPriceResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<GasPriceResponse>(body);

        //Remove the "0x" prefix and parse as BigInteger
        System.Numerics.BigInteger gasPrice = System.Numerics.BigInteger.Parse(gasPriceResponse.result.Substring(2), System.Globalization.NumberStyles.HexNumber);

        decimal decValue = Convert.ToInt64(gasPriceResponse.result, 16); ;

        // Convert BigInteger to decimal (considering the token's decimal places)
        int gasPriceInGwei = (int)((decimal)gasPrice / (decimal)Math.Pow(10, 9));

        Console.WriteLine("Gas Price in Gwei: " + gasPriceInGwei);

    }



    static async Task TransferMatic()
    {
        HttpClient PolygonclientFastGas = new HttpClient();

        // Send GET request to calculate fast gas price from polygonscan
        HttpResponseMessage Polygonclient_responseFast = await PolygonclientFastGas.GetAsync("https://api.polygonscan.com/api?module=gastracker&action=gasoracle&apikey=");
        Polygonclient_responseFast.EnsureSuccessStatusCode();
        string responseBodyFast = await Polygonclient_responseFast.Content.ReadAsStringAsync();
        PolygonScanGasPriceList polygonScanResponseGas = JsonConvert.DeserializeObject<PolygonScanGasPriceList>(responseBodyFast);
        decimal fasPrice = decimal.Parse(polygonScanResponseGas.result.FastGasPrice);

        decimal gasPriceFast = fasPrice * (decimal)1.04;

        Nethereum.Web3.Accounts.Account maticSenderAccount = new Nethereum.Web3.Accounts.Account("ae27a096dace75bbce1c3bbcee1661a3d6b6e70dfb5d41d51581acf282bd087f");
        //Initializing the web3 instance of the admin
        Web3 MaticSenderWeb3 = new Web3(maticSenderAccount, "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a");

        // Sending Matic to the user
        string maticReceipt = await MaticSenderWeb3.Eth.GetEtherTransferService().TransferEtherAsync("0x0E46A8BF9d56B2987A19aD61A1bf8be76f45B03d", 0.001m, fasPrice);
        await Task.Delay(6000);         // delay for 6 seconds after sending the matic transaction on blockchain
                                        // Loop to wait for matic receipt/waiting until matic receipt is under pending status


        var txnId = await MaticSenderWeb3.Eth.Transactions.GetTransactionByHash.SendRequestAsync(maticReceipt);
        Console.WriteLine("");
    }



    static async Task OkLINKGasPrice()
    {
        try
        {
            string apiUrl = "https://www.oklink.com/api/v5/explorer/polygon/api?module=gastracker&action=gasoracle";

            using (HttpClient client = new HttpClient())
            {
                try
                {
                    client.DefaultRequestHeaders.Add("Ok-Access-Key", "b125b8a7-b708-4e66-8cf3-98807378e63d");
                    HttpResponseMessage response = await client.GetAsync(apiUrl);

                    response.EnsureSuccessStatusCode();

                    string responseBody = await response.Content.ReadAsStringAsync();

                    GasOracleResponse gasPriceResponse = Newtonsoft.Json.JsonConvert.DeserializeObject<GasOracleResponse>(responseBody);

                    Console.WriteLine("API Response =======> ");
                    Console.WriteLine($" Safe Gas price ===> {gasPriceResponse.Result.SafeGasPrice}");
                    Console.WriteLine($" Proposed Gas price ===> {gasPriceResponse.Result.ProposeGasPrice}");
                    Console.WriteLine($" Fast Gas price ===> {gasPriceResponse.Result.FastGasPrice}");
                    Console.ReadLine();
                }
                catch (HttpRequestException e)
                {
                    Console.WriteLine("Request error:");
                    Console.WriteLine(e.Message);
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
    }


    static async Task GenerateSignedMessage()
    {
        string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a"; // Replace with your RPC provider
        string contractAddress = "0x186BD6a4335534057c97125d5F0bc196cA29cbD8"; // Replace with your contract address
        
        string ownerPrivateKey = "0x33109845add9461c0d76f2c4186ea12bfd7cbb37cbaec6f090e3a69c070f30ba"; // Replace with the owner's private key

        var account = new Nethereum.Web3.Accounts.Account(ownerPrivateKey);
        var web3 = new Web3(account, rpcUrl);

        var transferHandler = web3.Eth.GetContractTransactionHandler<TransferFunction>();
        var transferFunction = new TransferFunction()
        {
            To = "0x25dE5EE53486080262c1BCf3A26442327bf00A5A",
            TokenAmount = 5 * 1000000000000000000
        };

        var nonce = await web3.Eth.Transactions
    .GetTransactionCount
    .SendRequestAsync(account.Address, BlockParameter.CreatePending());

        transferFunction.Nonce = nonce;

        var signedTransaction = await transferHandler.SignTransactionAsync(contractAddress, transferFunction);

        await SendRawTxn(signedTransaction);
    }

    static async Task SendRawTxn(string data)
    {
        try
        {
            string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a"; // Replace with your RPC provider
            string adminPrivateKey = "e9aa580f91d7bc2578bc8980b49ac6dfb529947d88f5e3d523918e29845ac6c2"; // Replace with the owner's private key

            var account = new Nethereum.Web3.Accounts.Account(adminPrivateKey);
            var web3 = new Web3(account, rpcUrl);

            var txId = await web3.Eth.Transactions.SendRawTransaction.SendRequestAsync("0x" + data);
            Console.WriteLine(txId);
        }
        catch (Exception ex)
        {

        }
    }

    static async Task FetchIdNonce()
    {
        string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a"; // Replace with your RPC provider
        string ownerPrivateKey = "e9aa580f91d7bc2578bc8980b49ac6dfb529947d88f5e3d523918e29845ac6c2"; // Replace with the owner's private key

        var account = new Nethereum.Web3.Accounts.Account(ownerPrivateKey);
        var web3 = new Web3(account, rpcUrl);

        var currentNonce = await web3.Eth.Transactions.GetTransactionCount.SendRequestAsync("0xD9F6DedAC12a1E360b4887C644d5a4fbeB8a9cF5", BlockParameter.CreatePending());
        Console.WriteLine("CurrentNonce => " + currentNonce);
    }


    //static async Task GeneratePermitSignature()
    //{
    //    var ownerPrivateKey = "0xYourOwnerPrivateKey"; // Replace with owner's private key
    //    var ownerAddress = "0xYourOwnerAddress";      // Replace with owner's address
    //    var spenderAddress = "0xSpenderAddress";      // Replace with spender's address
    //    var tokenValue = Web3.Convert.ToWei(10);      // Approve 10 tokens (ERC20 decimals assumed 18)
    //    var nonce = 0;                                // Retrieve from contract's `nonces[owner]`
    //    var deadline = DateTimeOffset.UtcNow.ToUnixTimeSeconds() + 3600; // 1 hour from now

    //    // Replace with your DOMAIN_SEPARATOR and PERMIT_TYPEHASH
    //    var domainSeparator = "0xYourDomainSeparator";
    //    var permitTypeHash = new Sha3Keccack().CalculateHash(
    //        "Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

    //    // Encode Permit data
    //    var structHash = new Sha3Keccack().CalculateHash(
    //        new ABIEncode().GetABIParamsEncodedPacked(
    //            new ABIValue("bytes32", permitTypeHash),
    //            new ABIValue("address", ownerAddress),
    //            new ABIValue("address", spenderAddress),
    //            new ABIValue("uint256", tokenValue),
    //            new ABIValue("uint256", nonce),
    //            new ABIValue("uint256", deadline)));

    //    // Final EIP-712 digest
    //    var digest = new Sha3Keccack().CalculateHash(
    //        "\x19\x01" + domainSeparator.HexToByteArray().ToHex() + structHash.HexToByteArray().ToHex());

    //    // Sign the digest
    //    var signer = new EthereumMessageSigner();
    //    var signature = signer.Sign(digest.HexToByteArray(), ownerPrivateKey);

    //    // Extract v, r, s
    //    var r = signature.Substring(0, 66);
    //    var s = "0x" + signature.Substring(66, 64);
    //    var v = int.Parse(signature.Substring(130, 2), System.Globalization.NumberStyles.HexNumber);

    //    Console.WriteLine(new[] { v.ToString(), r, s });
    //}


    static async Task SignGasLessTransaction()
    {

        string _rpcUrl = "https://polygon-amoy.g.alchemy.com/v2/wYzYhRt0d3yMaH44Aw8Pvu9jc2JL5sPE"; // Replace with your RPC URL
        string _contractAddress = "0x81D7856ad87fFedA3Ac277839950C424f33bf2c3"; // Replace with your deployed contract address
        string _senderAddress = "0xb45738bA923415B4DabF016B3cefDF8a1ae71939"; // Replace with the sender address
        string _privateKey = "0xe9aa580f91d7bc2578bc8980b49ac6dfb529947d88f5e3d523918e29845ac6c2"; // Replace with the private key of the sender


        // Initialize Web3
        Web3 _web3 = new Web3(_rpcUrl);

        var abi = @"[
	{
		""inputs"": [
			{
				""internalType"": ""uint256"",
				""name"": ""_initialSupply"",
				""type"": ""uint256""
			}
		],
		""stateMutability"": ""nonpayable"",
		""type"": ""constructor""
	},
	{
		""anonymous"": false,
		""inputs"": [
			{
				""indexed"": true,
				""internalType"": ""address"",
				""name"": ""owner"",
				""type"": ""address""
			},
			{
				""indexed"": true,
				""internalType"": ""address"",
				""name"": ""spender"",
				""type"": ""address""
			},
			{
				""indexed"": false,
				""internalType"": ""uint256"",
				""name"": ""value"",
				""type"": ""uint256""
			}
		],
		""name"": ""Approval"",
		""type"": ""event""
	},
	{
		""anonymous"": false,
		""inputs"": [
			{
				""indexed"": true,
				""internalType"": ""address"",
				""name"": ""from"",
				""type"": ""address""
			},
			{
				""indexed"": true,
				""internalType"": ""address"",
				""name"": ""to"",
				""type"": ""address""
			},
			{
				""indexed"": false,
				""internalType"": ""uint256"",
				""name"": ""value"",
				""type"": ""uint256""
			}
		],
		""name"": ""Transfer"",
		""type"": ""event""
	},
	{
		""inputs"": [
			{
				""internalType"": ""address"",
				""name"": """",
				""type"": ""address""
			},
			{
				""internalType"": ""address"",
				""name"": """",
				""type"": ""address""
			}
		],
		""name"": ""allowance"",
		""outputs"": [
			{
				""internalType"": ""uint256"",
				""name"": """",
				""type"": ""uint256""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""address"",
				""name"": """",
				""type"": ""address""
			}
		],
		""name"": ""balanceOf"",
		""outputs"": [
			{
				""internalType"": ""uint256"",
				""name"": """",
				""type"": ""uint256""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [],
		""name"": ""decimals"",
		""outputs"": [
			{
				""internalType"": ""uint8"",
				""name"": """",
				""type"": ""uint8""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [],
		""name"": ""name"",
		""outputs"": [
			{
				""internalType"": ""string"",
				""name"": """",
				""type"": ""string""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""address"",
				""name"": """",
				""type"": ""address""
			}
		],
		""name"": ""nonces"",
		""outputs"": [
			{
				""internalType"": ""uint256"",
				""name"": """",
				""type"": ""uint256""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""bytes32"",
				""name"": ""_messageHash"",
				""type"": ""bytes32""
			},
			{
				""internalType"": ""bytes"",
				""name"": ""_signature"",
				""type"": ""bytes""
			}
		],
		""name"": ""recoverSigner"",
		""outputs"": [
			{
				""internalType"": ""address"",
				""name"": """",
				""type"": ""address""
			}
		],
		""stateMutability"": ""pure"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""bytes"",
				""name"": ""sig"",
				""type"": ""bytes""
			}
		],
		""name"": ""splitSignature"",
		""outputs"": [
			{
				""internalType"": ""bytes32"",
				""name"": ""r"",
				""type"": ""bytes32""
			},
			{
				""internalType"": ""bytes32"",
				""name"": ""s"",
				""type"": ""bytes32""
			},
			{
				""internalType"": ""uint8"",
				""name"": ""v"",
				""type"": ""uint8""
			}
		],
		""stateMutability"": ""pure"",
		""type"": ""function""
	},
	{
		""inputs"": [],
		""name"": ""symbol"",
		""outputs"": [
			{
				""internalType"": ""string"",
				""name"": """",
				""type"": ""string""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [],
		""name"": ""totalSupply"",
		""outputs"": [
			{
				""internalType"": ""uint256"",
				""name"": """",
				""type"": ""uint256""
			}
		],
		""stateMutability"": ""view"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""address"",
				""name"": ""to"",
				""type"": ""address""
			},
			{
				""internalType"": ""uint256"",
				""name"": ""amount"",
				""type"": ""uint256""
			}
		],
		""name"": ""transfer"",
		""outputs"": [
			{
				""internalType"": ""bool"",
				""name"": """",
				""type"": ""bool""
			}
		],
		""stateMutability"": ""nonpayable"",
		""type"": ""function""
	},
	{
		""inputs"": [
			{
				""internalType"": ""address"",
				""name"": ""from"",
				""type"": ""address""
			},
			{
				""internalType"": ""address"",
				""name"": ""to"",
				""type"": ""address""
			},
			{
				""internalType"": ""uint256"",
				""name"": ""amount"",
				""type"": ""uint256""
			},
			{
				""internalType"": ""uint256"",
				""name"": ""nonce"",
				""type"": ""uint256""
			},
			{
				""internalType"": ""bytes"",
				""name"": ""signature"",
				""type"": ""bytes""
			}
		],
		""name"": ""transferWithSignature"",
		""outputs"": [
			{
				""internalType"": ""bool"",
				""name"": """",
				""type"": ""bool""
			}
		],
		""stateMutability"": ""nonpayable"",
		""type"": ""function""
	}
]";

        // Create contract instance
        var contract = _web3.Eth.GetContract(abi, _contractAddress);

        // Create the transfer details
        var toAddress = "0x80adb983b710b8065180fAD032972ee3Ad3d5419"; // The receiver's address
        var amount = BigDecimal.Parse("10.0"); // The amount to send (in your token's smallest unit, e.g., wei for ETH)
        var nonce = 0; // The nonce for the sender

        // Generate the hash for the message to be signed by the sender
        string message = _senderAddress + toAddress + amount.ToString() + nonce.ToString(); // Concatenate the details
        // Convert message to bytes
        byte[] messageBytes = Encoding.UTF8.GetBytes(message); // Convert to bytes (UTF-8 encoding)

        var messageHash = new Sha3Keccack().CalculateHash(messageBytes);


        // Sign the message (this should be done off-chain ideally)
        var signer = new EthereumMessageSigner();
        var signature = signer.Sign(messageHash, new EthECKey(_privateKey));

        // Send the gasless transaction
        var gaslessTransferFunction = contract.GetFunction("transferWithSignature");
        var gaslessTransfer = await gaslessTransferFunction.SendTransactionAsync(
            _senderAddress,
            new HexBigInteger(0), // Set gas limit to 0 since the relayer pays for the gas
            new HexBigInteger(0), // No gas fee needed for the sender
            toAddress,
            amount,
            nonce,
            signature);

        var transactionHash = gaslessTransfer;

        Console.WriteLine("Transaction Hash: " + transactionHash);
    }

    static async Task GenerateMetaTxn()
    {
        string rpcUrl = "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a"; // Replace with your RPC provider
        string contractAddress = "0x186BD6a4335534057c97125d5F0bc196cA29cbD8"; // Replace with your contract address
        string ownerPrivateKey = "0xae27a096dace75bbce1c3bbcee1661a3d6b6e70dfb5d41d51581acf282bd087f"; // Replace with the owner's private key

        // Instantiate Web3 with account
        var account = new Nethereum.Web3.Accounts.Account(ownerPrivateKey);
        var web3 = new Web3(account, rpcUrl);

        // Prepare call data for TransferFunction
        var transferHandler = web3.Eth.GetContractTransactionHandler<TransferFunction>();
        var transferFunction = new TransferFunction()
        {
            To = "0x80adb983b710b8065180fAD032972ee3Ad3d5419",
            TokenAmount = 1000000000000000000
        };
        string callData = $"0x{Nethereum.Contracts.FunctionMessageExtensions.GetCallData(transferFunction).ToHex()}";

        // Construct message hash
        var targetBytes = contractAddress.HexToByteArray();
        var valueBytes = BitConverter.IsLittleEndian
            ? BitConverter.GetBytes(0).Reverse().ToArray()
            : BitConverter.GetBytes(0);
        var dataBytes = callData.HexToByteArray();
        var message = targetBytes.Concat(valueBytes).Concat(dataBytes).ToArray();

        // Add Ethereum Signed Message prefix
        var prefix = $"\x19Ethereum Signed Message:\n{message.Length}";
        var prefixBytes = System.Text.Encoding.UTF8.GetBytes(prefix);

        // Concatenate prefix and message, then hash
        var ethPrefixedMessage = prefixBytes.Concat(message).ToArray();
        var ethSignedMessageHash = new Sha3Keccack().CalculateHash(ethPrefixedMessage);

        // Sign the prefixed hash
        var signer = new EthECKey(ownerPrivateKey);
        var signature = signer.SignAndCalculateV(ethSignedMessageHash);

        // Extract `r`, `s`, `v`
        Console.WriteLine($"Call Data: {callData}");
        Console.WriteLine($"r: {signature.R.ToHex()}");
        Console.WriteLine($"s: {signature.S.ToHex()}");
        Console.WriteLine($"v: {signature.V}");

        // Verify the recovered signer (optional debug)
        var recoveredSigner = EthECKey.RecoverFromSignature(signature, ethSignedMessageHash);
        Console.WriteLine($"Recovered Signer: {recoveredSigner.GetPublicAddress()}");
    }


    static async Task ReplaceMaticTransferTransaction()
    {
        try
        {
            HttpClient PolygonclientFastGas = new HttpClient();

            Nethereum.Web3.Accounts.Account maticSenderAccount = new Nethereum.Web3.Accounts.Account("ae27a096dace75bbce1c3bbcee1661a3d6b6e70dfb5d41d51581acf282bd087f");
            //Initializing the web3 instance of the admin
            Web3 MaticSenderWeb3 = new Web3(maticSenderAccount, "https://polygon-mainnet.g.alchemy.com/v2/YaA4_T_ALVvQvFrxzADDVeJ0fGuSc-6a");

            //Fetch Admin Wallet current nonce
            var currentNonce = await MaticSenderWeb3.Eth.Transactions.GetTransactionCount.SendRequestAsync(maticSenderAccount.Address, BlockParameter.CreatePending());


            // Sending Matic to the user
            string maticReceipt = await MaticSenderWeb3.Eth.GetEtherTransferService().TransferEtherAsync("0x80adb983b710b8065180fAD032972ee3Ad3d5419", 0.01m, 35, null, 2869);


            //var txnId = await MaticSenderWeb3.Eth.Transactions.GetTransactionByHash.SendRequestAsync(maticReceipt);
            Console.WriteLine("");


        }
        catch (Exception ex)
        {
            Console.WriteLine(ex);

        }
    }





    public class GasOracleResponse
    {
        [JsonPropertyName("status")]
        public string Status { get; set; }

        [JsonPropertyName("message")]
        public string Message { get; set; }

        [JsonPropertyName("result")]
        public GasOracleResult Result { get; set; }
    }

    public class GasOracleResult
    {
        [JsonPropertyName("suggestBaseFee")]
        public string SuggestBaseFee { get; set; }

        [JsonPropertyName("gasUsedRatio")]
        public string GasUsedRatio { get; set; }

        [JsonPropertyName("LastBlock")]
        public string LastBlock { get; set; }

        [JsonPropertyName("SafeGasPrice")]
        public string SafeGasPrice { get; set; }

        [JsonPropertyName("ProposeGasPrice")]
        public string ProposeGasPrice { get; set; }

        [JsonPropertyName("FastGasPrice")]
        public string FastGasPrice { get; set; }
    }



    public class GasInfo
    {
        public string? LastBlock { get; set; }
        public string? SafeGasPrice { get; set; }
        public string? ProposeGasPrice { get; set; }
        public string? FastGasPrice { get; set; }
        public string? suggestBaseFee { get; set; }
        public string? UsdPrice { get; set; }
        public string? GasUsedRatio { get; set; }
    }

    public class PolygonScanGasPriceList
    {
        public string? status { get; set; }
        public string? message { get; set; }
        public GasInfo? result { get; set; }
    }


    public class GasPriceResponse
    {
        public int Id { get; set; }
        public string? JSONRPC { get; set; }
        public string? result { get; set; }
    }


    public class JsonRpcResponse
    {
        public string Jsonrpc { get; set; }
        public int Id { get; set; }
        public Result Result { get; set; }
    }

    public class Result
    {
        public string BlockHash { get; set; }
        public string BlockNumber { get; set; }
        public string Hash { get; set; }
        public string TransactionIndex { get; set; }
        public string Type { get; set; }
        public string Nonce { get; set; }
        public string Input { get; set; }
        // You can add more fields as necessary
    }
}

