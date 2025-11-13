using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
class EncryptionDecryptionLogic
{
    public class MyData
    {
        public string? Email { get; set; }
        public string deviceType { get; set; }
        public string deviceId { get; set; }
    }

    public class CsharpCornerChallengeReward
    {
        public string? Email { get; set; }
        public string? Token { get; set; }
        public string? TransactionTypeId { get; set; }
    }


    public static async Task Main()
    {
        //for sharp rewards
        //byte[] key = Convert.FromBase64String("wgRujqKTF2pze2P9WBxpYRGe+ICQazzOs45xSoUAxq4=");
        //byte[] iv = Convert.FromBase64String("BOt1h8+Kov+o8CyCs9+JPQ==");

        //for sharp rewards shop coupon
        byte[] key = Convert.FromBase64String("sg078aRvbn2fjSt+MoDRSIsT53xJ2dQi+YhBRJoSOvE=");
        byte[] iv = Convert.FromBase64String("vLVbaz5GPlZDkwgQqhCiCQ==");

        //byte[] key = Convert.FromBase64String("sg078aRvbn2fjSt+MoDRSIsT53xJ2dQi+YhBRJoSOvE="); 
        //byte[] iv = Convert.FromBase64String("vLVbaz5GPlZDkwgQqhCiCQ==");


        //var Key = "lfLcWPmuqDSXHJ0Z7TDmUTs2JjV6cdybRSAwJDHBn04=";
        //var IV = "Kqr8WElGD5Fy6wgwli25Og==";

        //var obj = new MyData
        //{
        //    deviceType = "Android",
        //    deviceId = "abzshub168d552c06287677",
        //    Email = "shubh008@gmail.com"
        //};

        //{ "Email":"peterparker@gmail.com","Token":"100","TransactionTypeId":"19"}

        //var csharpObj = new CsharpCornerChallengeReward
        //{
        //    Email = "peterparker@gmail.com",
        //    Token = "100",
        //    TransactionTypeId = "23",
        //};

        string[] codes = new string[]
        {
           "PKRqCEBTZGBxs99i44HqZC71fhffGgL2Mk8sAPP5W2Y=",
            "5VsDuZmVDfBWOJJ4C3uHW7lNGXibDEXAWBVWZUvNIa4=",
            "1ozRTe+uxmr0r5FICUaB23cVlAWrS/frqfd4+zXfUyg=",
            "naMFdye44FS8vx61/kvMrhC49u/t0IVPGi0aJbu0wqo=",
            "WR9HAlviE6Fx6LGbrJjtcpqqYgx1uWptiGrykvc6fD8=",
            "yyePlJtUw+QEP9wENVHpfExkmKlqNKmYFy3hjOFHXBQ=",
            "eRWY2JM3n07awYG3niEH6VRzExB1yGUoc1SnCSIHuWU=",
            "GjkETtiqAKSy4kLex4s6tULRbDCfzh4yl3FOv+pBGcg=",
            "eX2886K1on39qpipho+sMiDzmLB1cKH/Tx95PoeqyKU=",
            "8nZuPQGXtazR1c9ibV7lvclAMz8E5h89PG3xChzpK4M=",
            "CILCikWZTEqdoJ0Sr73egAYQJxMC1XLX9phmJ3fAmp8=",
            "yzBQfJIcV8F3Px3Z1CnIB8edpmdweryYP1RYPHWKywk=",
            "ozYNn6PVwsCc1GInh01qofiNpIVRmtvq2v2Bm3c4ApI="
        };

        int i = 1;

        foreach (string coupon in codes)
        {
            //string output = Convert.ToBase64String(EncryptStringToBytes_Aes(coupon, key, iv));
            string output = DecryptStringFromBytes_Aes(coupon, key, iv);
            Console.WriteLine($"{i} Coupon {coupon} => " + output);
            i++;
        }

        //string json = JsonSerializer.Serialize(obj);
        //string json = JsonSerializer.Serialize(csharpObj);
        //var plainText = "0";

        //Encryption

        // string output = Convert.ToBase64String(EncryptStringToBytes_Aes(plainText, key, iv));
        //string output = Encrypting(plainText);

        //Decryption

        //string output = DecryptStringFromBytes_Aes(plainText, key, iv);

        //Console.WriteLine("Output => " + output);
        Console.ReadLine();
    }

    static byte[] EncryptStringToBytes_Aes(string plainText, byte[] key, byte[] iv)
    {
        using Aes aesAlg = Aes.Create();
        aesAlg.Key = key;
        aesAlg.IV = iv;

        ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

        using MemoryStream msEncrypt = new();
        using (CryptoStream csEncrypt = new(msEncrypt, encryptor, CryptoStreamMode.Write))
        {
            using StreamWriter swEncrypt = new(csEncrypt);
            swEncrypt.Write(plainText);
        }
        return msEncrypt.ToArray();
    }

    private static string DecryptStringFromBytes_Aes(string plainText, byte[] key, byte[] iv)
    {
        byte[] cipherText = Convert.FromBase64String(plainText);
        using (Aes aesAlg = Aes.Create())
        {
            aesAlg.Key = key;
            aesAlg.IV = iv;
            aesAlg.Padding = PaddingMode.PKCS7;

            ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

            using (MemoryStream msDecrypt = new MemoryStream(cipherText))
            {
                using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                {
                    using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                    {
                        return srDecrypt.ReadToEnd();
                    }
                }
            }
        }
    }

    public static string Encrypting(string PlainText, string strKey24 = "sharpwallet232323wallet")
    {
        var crp = new TripleDESCryptoServiceProvider();
        var uencode = new UnicodeEncoding();
        var aencode = new ASCIIEncoding();
        //Store plain text as  a byte array
        var bytPlainText = uencode.GetBytes(PlainText);
        //Create a memory stream for holding encrypted text
        var stmCipherText = new MemoryStream();
        //Private key
        var slt = Encoding.ASCII.GetBytes("0");
        var pdb = new PasswordDeriveBytes(strKey24, slt);
        var bytDerivedKey = pdb.GetBytes(24);
        crp.Key = bytDerivedKey;
        //Initialization vector is the encryption seed
        crp.IV = pdb.GetBytes(8);
        //Create a crypto-writer to encrypt a bytearray inta a stream
        var csEncrypted = new CryptoStream(stmCipherText, crp.CreateEncryptor(), CryptoStreamMode.Write);
        csEncrypted.Write(bytPlainText, 0, bytPlainText.Length);
        csEncrypted.FlushFinalBlock();
        //return result as a base64 encoded string
        return Convert.ToBase64String(stmCipherText.ToArray());
    }


}