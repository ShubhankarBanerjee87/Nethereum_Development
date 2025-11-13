SELECT * FROM AdminUser

-- insert into admin table
--INSERT INTO AdminUser(AdminWalletId, FullName, Email, CreatedDate ,UserName, IsActive, MobileNumber, IsMFAEnable) VALUES
--(16, 'Gautam Singh', 'gautam.singh@csharp.com', GETUTCDATE(),'gautam.singh@csharp.com', 1, '<Phone Number>', 0 )

-- Set Password for Admin
DECLARE @Password VARBINARY(255)
SET @Password= (SELECT ENCRYPTBYPASSPHRASE('4765byrivbytrb465','Gautam@123'))
SELECT @Password

DECLARE @VALUE VARCHAR(MAX);
DECLARE @Pwd VARCHAR(55);

SET @VALUE=0x02000000AC54270915E482A04F9BFD019EED6027D424D35E190142558F2E32BBEB576D85797A18E463047591CF167055F2531E27

SET @Pwd = (SELECT DECRYPTBYPASSPHRASE('4765byrivbytrb465',@VALUE))
SELECT @Pwd

--Update the password
UPDATE AdminUser SET EPassword = @Password WHERE Id=24