Use walletdb

----CREATE TABLE UserStepsTransaction
----(
----    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
----	UserWalletId BIGINT NOT NULL,
----	Steps BIGINT NOT NULL,
----	Amount DECIMAL(38,4) NULL,
----	--BlockchainStatus BIT NOT NULL Default 0,
----	--FinalStatus BIT NOT NULL Default 0,
----	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE() 
----)
----GO

----CREATE TABLE BatchTransactionDetail
----(
----    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
----	BatchId VARCHAR(255) NOT NULL,
----	PickedUpByProcessId VARCHAR(255) NOT NULL,
----	TokenTransactionIds VARCHAR(MAX) NULL,
----	TransactionHash NVARCHAR(MAX) NULL,
----	AddressCount BIGINT NOT NULL DEFAULT 0,
----	BlockchainTransactionStatus INT NOT NULL DEFAULT 0,
----	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	IsActive BIT NOT NULL DEFAULT 1
----)
----GO

	--CREATE TABLE WebSocketTransactionDetail
	--(
	--	Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	--	TransactionHash NVARCHAR(250) NOT NULL,
	--	FromAddress VARCHAR(250) NULL,
	--	ToAddress VARCHAR(250) NULL,
	--	BlockchainTransactionStatus INT NOT NULL DEFAULT 0,
	--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
	--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
	--	IsActive BIT NOT NULL DEFAULT 1
	--)
	--GO

--CREATE TABLE TransactionPoolDetail
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	PoolName VARCHAR(255) NOT NULL,
--	[Description] VARCHAR(MAX) NULL,
--	DailyLimit  DECIMAL(38,4) NULL,
--	PerUserDailyLimit DECIMAL(38,4) NULL,
--	PerTokenValue BIGINT NULL,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO


--CREATE TABLE AdminNotification
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	NotificationType VARCHAR(255) NOT NULL,
--	[Description] VARCHAR(MAX) NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsRead BIT NOT NULL DEFAULT 1,
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO

--CREATE TABLE TransactionThresholdDetail
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	TransferType VARCHAR(255) NOT NULL,
--	[Description] VARCHAR(MAX) NULL,
--	TotalLimit DECIMAL(38,4) NOT NULL DEFAULT 0,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO

select top 1 * from OneToOneTransactionLimit

--CREATE TABLE OneToOneTransactionLimit
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	TransferType VARCHAR(255) NOT NULL,
--	[Description] VARCHAR(MAX) NULL,
--	MaxLimit DECIMAL(38,4) NOT NULL DEFAULT 0,
--	MinLimit DECIMAL(38,4) NOT NULL DEFAULT 0,
--	TransferUnlockLimit DECIMAL(38,4) NOT NULL DEFAULT 0,
--	PerDayTransactionCountLimit INT NOT NULL DEFAULT 0,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO

--INSERT INTO OneToOneTransactionLimit (TransferType, [Description], MaxLimit, MinLimit, TransferUnlockLimit, PerDayTransactionCountLimit, CreatedBy, UpdatedBy)
--VALUES ('One To One', 'This contains all the limits of one to one transfer.', 10.0000, 1.0000, 5.0000, 10, 1, 1)


--CREATE TABLE QuizDetail
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	DailyRewardId BIGINT NOT NULL,
--	CategoryName VARCHAR(255) NOT NULL,
--	[Description] VARCHAR(MAX) NULL,
--	QuestionCount BIGINT NOT NULL DEFAULT 0,
--	RewardAmount DECIMAL(38,4) NOT NULL DEFAULT 0,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO


----CREATE TABLE QuizQuestion
----(
----    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
----	QuizCategoryId BIGINT NOT NULL,
----	Question NVARCHAR(MAX) NOT NULL,
----	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	IsActive BIT NOT NULL DEFAULT 1
----)
----GO

----CREATE TABLE QuizOptions
----(
----    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
----	QuestionId BIGINT NOT NULL,
----	[Option] NVARCHAR(MAX) NOT NULL,
----	Result BIT NOT NULL DEFAULT 0,
----	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	IsActive BIT NOT NULL DEFAULT 1
----)
----GO

--CREATE TABLE QuizResult
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	UserWalletId BIGINT NOT NULL,
--	QuizCategoryId BIGINT NOT NULL,
--	Result BIT NOT NULL DEFAULT 0,
--	RewardAmount DECIMAL(38,4) NOT NULL DEFAULT 0,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO


----CREATE TABLE MaticTransactionDetail
----(
----    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
----	UserWalletId BIGINT NOT NULL,
----	MaticAmount DECIMAL(38,4) NOT NULL DEFAULT 0,
----	IsProcessing BIT NOT NULL DEFAULT 0,
----	PickedUpByProcessId VARCHAR(50) NULL,
----	DateTimeProcessStarted DATETIME NULL,
----	DateTimeProcessCompleted DATETIME NULL,
----	BatchId VARCHAR(255) NULL,
----	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
----	IsActive BIT NOT NULL DEFAULT 1
----)
----GO

select top 1 * from SupportChatGroup

--CREATE TABLE SupportChatGroup
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	UserWalletId BIGINT NOT NULL,
--	GroupName VARCHAR(1000) NOT NULL,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO

select top 1 * from GroupMessage

--CREATE TABLE GroupMessage
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	GroupId BIGINT NOT NULL,
--	FromUserWalletId BIGINT NOT NULL,
--	GroupMessage NTEXT NULL,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO
select top 1 * from GroupMessageToUser

--CREATE TABLE GroupMessageToUser
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	ToUserWalletId BIGINT NOT NULL,
--	GroupId BIGINT NOT NULL,
--	GroupMessageId BIGINT NOT NULL,
--	IsRead BIT NOT NULL DEFAULT 0,
--	CreatedBy BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO

select top 1 * from DevicesInfo where UserWalletId = 1227

select * from UserWallet where Id=8

select top 1000 * from UserWallet order by createddate desc



--CREATE TABLE DevicesInfo(
--	Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	UserWalletId bigint NOT NULL,
--	DeviceId NVARCHAR(255) NULL,
--	DeviceType NVARCHAR(100) NULL,
--	DeviceVersion NVARCHAR(255) NULL,
--	AppVersion NVARCHAR(150) NULL,
--	BuildVersion VARCHAR(250) NULL,
--	APIVersion NVARCHAR(100) NULL,
--	Latitude FLOAT NULL,
--	Longitude FLOAT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	CreatedBy BIGINT NOT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NOT NULL,
--	IsActive BIT NOT NULL DEFAULT 1
--	)
--GO

--CREATE TABLE AppVersion(
--	Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	AppVersion VARCHAR(150) NULL,
--	BuildVersion VARCHAR(100) NULL,
--	Feature VARCHAR(MAX) NULL,
--	DeviceType varchar(100) NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--	)
--GO

--CREATE TABLE UserNonce(
--	Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	UserWalletId BIGINT NOT NULL,
--	Nonce BIGINT NOT NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--	)
--GO







--CREATE TABLE FAQ
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	FAQTypeId BIGINT NOT NULL,
--	Question NVARCHAR(MAX) NULL,
--	Answer NVARCHAR(MAX) NULL,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO
--truncate table FAQ

----insert into FAQ(FAQTypeId, Question, Answer)
----VALUES(1, 'Where is sharp token available?', 'The Sharp Token is available to be earned through engaging and participating with online communities where the Sharp Token is used. CSharp Corner is the first online community to feature the token and is retroactively rewarding existing users and reputation points through this reward campaign.'),
----(1, 'Which exchanges support the Sharp Token?', 'Sharp Token will be available through our exchange partners. The current exchanges supporting our token are Coinstore and Bitmart starting on June 19th.'),
----(1, 'When will I be able to convert my points into tokens?', 'You can convert your points into tokens now by creating your Sharp Rewards app in your account dashboard, or through the Android or iOS app. Links are provided below. If you already have an existing CSharp Corner account, you will need to take steps to link your CSharp Corner account with the wallet.'),
----(1, 'Where can I get the latest updates on the Sharp token?', 'All the latest updates about the Sharp Token are shared on our social media accounts, as well as our newsletter available through https://www.thesharptoken.com. Be sure to subscribe to get access to the latest bonus campaigns and new communities onboarding the Sharp Token economy.'),
----(1, 'When is the cutoff date and time of the bonus 1.5x launch rewards bonus?', 'Exclusive to the CSharp Corner community, all engagement and activity in the online community completed before August 31, 2024 will receive the launch rewards bonus multiplying existing reputation points into Sharp Tokens. This includes activities such as creating posts, engaging with posts, and creating content in the online community. This is a limited time offer. All points accrued after August 31, 2024 will no longer benefit from the launch rewards bonus.')

--insert into FAQ(FAQTypeId, Question, Answer)
--VALUES(1, 'How do I become an active contributor?',
--'To be an active contributor you must have made a contribution on CSharpCorner within the last 6 months. Becoming an active contributor can include publishing articles, participating as a speaker in our conference series, publishing an eBook, and event participating in our hackathon series. If you have questions regarding your active contributor status or what activities will qualify you as an active contributor, you can reach message an administrator.'
--)


select * from FAQ
--alter table UserReferral Add IsUsed BIT NULL

--update FAQ SET Answer = 'We appreciate each and every contribution made by our users. To reward people who have done exceptional work towards the community, we are not giving tokens to users who fall under the following category:
--1. Users who have not contributed in terms of article, blogs, videos, events & speaking in last 6 months.
--2. Users who have been part of C# Corner internal team.'
--where Id =6

SELECT TOP 1000 * FROM UserReferral ORDER BY CreatedDate DESC

--ALTER TABLE UserReferral
--ADD FromUserId BIGINT NULL;

--ALTER TABLE UserReferral
--ADD ToUserWalletId BIGINT NULL;

select SUM(TokenAllocation) from TokenTransaction where TransactionTypeId=3


select * from TokenTransaction where TransactionTypeId IN (1,3)
AND IsProcessing=0 AND DateTimeProcessCompleted IS NULL
--CREATE TABLE UserRedeemPointsTransaction
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	UserWalletId BIGINT NOT NULL,
--	Tokens DECIMAL(38,4) NOT NULL DEFAULT 0,
--	Points BIGINT NOT NULL DEFAULT 0,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO


--CREATE TABLE WalletServiceDetail
--(
--    Id BIGINT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	ServiceName VARCHAR(500) NOT NULL,
--	[Description] VARCHAR(500) NULL,
--	[Enable] BIT NOT NULL DEFAULT 1,
--	CreatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	CreatedBy BIGINT NULL,
--	UpdatedDate DATETIME NOT NULL DEFAULT GETUTCDATE(),
--	UpdatedBy BIGINT NULL,
--	IsActive BIT NOT NULL DEFAULT 1
--)
--GO


--insert into WalletServiceDetail(ServiceName,[Description], [Enable],CreatedBy, UpdatedBy)
--values('Steps Transaction','Service used to transfer steps tokens in batch.', 1,1,1),
--('Point Redeem Transaction','Service used to transfer redeem point tokens in batch.', 1,1,1)

--insert into WalletServiceDetail(ServiceName,[Description], [Enable],CreatedBy, UpdatedBy)
--values('Claim Button Show','This is used to check and update the claim button hide and show status.', 0,1,1)


select * from UserWallet where WalletAddress='0x2deF06733e7c8718880da01c6d3c3393E46edF8B'

select * from UserNonce

select * from WalletServiceDetail


--update UserNonce Set Nonce = 'hgfhdg364536'

--ALTER TABLE UserNonce
--ADD Nonces NVARCHAR(MAX) NULL;

--update UserNonce SET Nonces=Nonce

--ALTER TABLE UserNonce
--DROP COLUMN Nonce;
				
--EXEC sp_rename 'UserNonce.Nonces', 'Nonce', 'COLUMN';



--SELECT * FROM sys.database_ledger_transactions

--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--     values (1,0,'2022/05/01',100)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--     values (2,0,'2022/05/01',200)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--     values (3,0,'2022/05/01',300)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--     values (2,0,'2022/05/02',50)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--      values (3,1,'2022/05/02',80)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--      values (1,1,'2022/05/02',30)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--      values (3,0,'2022/05/03',20)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--      values (2,1,'2022/05/03',40)
--INSERT INTO Wallets (UserId,Operation,[Timestamp],Amount)
--      values (1,1,'2022/05/03',20)

--	  SELECT * FROM Wallets

--	 CREATE VIEW [Transactions].[Wallets_Ledger] AS
--   SELECT [UserId], [Operation], [Timestamp], [Amount],
--       [ledger_start_transaction_id] AS [ledger_transaction_id],
--       [ledger_start_sequence_number] AS [ledger_sequence_number],
--       1 AS [ledger_operation_type], N'INSERT' AS [ledger_operation_type_desc]
--   FROM Wallets

--   update Wallets set Amount=200 where UserId=1 AND Amount=30




--   CREATE SCHEMA [PartTracking]
--go
--CREATE TABLE CardDetails
--(
--     [ID] INT NOT NULL PRIMARY KEY CLUSTERED,
--     [CCNumber] VARCHAR (100) NOT NULL,
--     [EncryptCCNumber] varbinary(250) NULL
--)
--WITH (
--     SYSTEM_VERSIONING = ON,
--     LEDGER = ON 
--)


----INSERT INTO [PartTracking].[Parts]
----     VALUES (1, '123-333-444', '01-02-2019', 1, NULL)

----	 INSERT INTO [PartTracking].[Parts]
----     VALUES (2, '123-444-333', '01-03-2019', 1, NULL)
--   --   INSERT INTO MasterTransactionType(TransactionName, [Description])
--	  --VALUES('Steps', 'These are the tokens transfered due to steps of a user.'),
--	  --    ('Admin Transfer', 'These are the token transfered by the admin in user wallet.')


--	 --main table
--	 SELECT [ID], [SerialNum], [ManufDate], [BatchID], [CarID],[CreditCardNumber],
--      [ledger_start_transaction_id], [ledger_end_transaction_id],
--      [ledger_start_sequence_number], [ledger_end_sequence_number]
--     FROM [PartTracking].[Parts]

--	 --view table
--	SELECT * FROM [PartTracking].[PartsLedgerView]
--       order by ledger_transaction_id,ledger_sequence_number
--	  --history table
--    SELECT * FROM PartTracking.MSSQL_LedgerHistoryFor_901578250

----UPDATE [PartTracking].[Parts] SET [CarID] = 4 WHERE id=2

----UPDATE [PartTracking].[Parts] SET [CarID] = 4

----Create master key encryption by password ='vijay@123'  

----Create certificate C1 with subject = 'Credit Card Data' 

----Create symmetric key SK1 with algorithm = AES_256 encryption by certificate C1


----INSERT INTO [PartTracking].[Parts](ID, SerialNum, ManufDate, BatchID, CarID, CreditCardNumber)
----     VALUES (1, '123-333-444', '01-02-2019', 1, NULL, ENCRYPTBYKEY(key_guid('SK1'),'23555555000'))

----insert into TestEncryption(Id, EncryptedCCNumber, CCNumber) values (1, ENCRYPTBYKEY(key_guid('SK1'),'5000'), '5000')


--SELECT * FROM AdminUser
-- --main table
--	 SELECT ID, Email, WalletId, CreatedDate,
--      [ledger_start_transaction_id], [ledger_end_transaction_id],
--      [ledger_start_sequence_number], [ledger_end_sequence_number]
--     FROM AdminUser

select * from TokenTransactionStatus
	
   --ALTER TABLE TokenTransactionStatus 
   --ADD GasFeesReceivedInToken DECIMAL(38,4) NULL;

   -- ALTER TABLE TokenTransactionStatus 
   --ADD GivenGasFees BIGINT NULL;

   -- ALTER TABLE BatchTransactionDetail 
   --ADD BatchTransactionTypeId BIGINT NULL;

   --update BatchTransactionDetail SET BatchTransactionTypeId=1

--      ALTER TABLE WalletWhiteLabelling 
--   ADD UpdatedDate DATETIME NULL;

--         ALTER TABLE TransactionPoolDetail 
--   ADD PerUserDailyLimit DECIMAL(38,4) NULL;

--   ALTER TABLE GroupMessage
--   ADD GroupMessage NTEXT NULL;


select * from [User]

--ALTER TABLE [User] ALTER COLUMN FullName VARCHAR(500) NULL;

			--ALTER TABLE [User]
			--ADD TimeZoneOffset VARCHAR(150) NULL;

			--ALTER TABLE [User]
			--ADD OffsetInMinute INT NULL;

			--ALTER TABLE [User]
			--ADD TimeZoneOffsetName VARCHAR(500) NULL;

			--ALTER TABLE [User]
			--ADD DLSOffsetInMinute INT NULL;

			--ALTER TABLE [User]
			--ADD IsDLS BIT NULL;

   --           ALTER TABLE TokenTransaction
   --ADD Note NTEXT NULL;


   --			ALTER TABLE TokenTransaction
			--ADD RedeemedPoints BIGINT NULL;


--    Update GroupMessage SET GroupMessage = [Message]

--    --ALTER TABLE TokenTransaction 
--    --ADD DateTimeProcessCompleted Datetime NULL;
--	--update TokenTransaction SET IsProcessing=0

--	--ALTER TABLE TokenTransaction 
-- --   ADD BatchId VARCHAR(255) NULL;

-- 	  ALTER TABLE QuizOptions 
--      ADD CorrectAnswer VARCHAR(400) NULL;

 	  --ALTER TABLE DevicesInfo 
    --  ADD BuildVersion VARCHAR(250) NULL;

	 	  --ALTER TABLE DevicesInfo 
     --     ADD DeviceModel VARCHAR(250) NULL;

	select top 100 * from UserWallet
		   --ALTER TABLE UserWallet 
     --      ADD IsReceivePushNotification BIT NULL;

		--ALTER TABLE MaticTransactionDetail
		--ADD MaticTransferCount BIGINT NULL

		--ALTER TABLE TokenTransactionStatus
		--ADD MaticSentWithRapidGas DECIMAL(38,38) NULL

		
		-------------------------------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------------------------------------------

		--ALTER TABLE TokenHolder
		--ADD TotalToken DECIMAL(38,8) NULL;

		--ALTER TABLE TokenHolder
		--ADD ReleasedToken DECIMAL(38,8) NULL;

		select * from MasterTransactionType



		   select top 100 * from TokenHolder ORDER BY CreatedDate DESC
			

			    SELECT UserWalletId,  SUM(TokenAllocation) AS TotalToken
				INTO #Temp
                FROM TokenTransaction(NOLOCK) 
                WHERE TransactionTypeId IN (1) AND TransactionStatus=1
				GROUP By UserWalletId

			  UPDATE TokenHolder 
			  SET TokenHolder.TotalToken = CT.TotalToken
			  FROM TokenHolder
			  JOIN  #Temp CT
			  ON CT.UserWalletId=TokenHolder.UserWalletId

			  DROP TABLE #Temp
			  update TokenHolder SET TotalToken =0 WHERE TotalToken IS NULL


			  --now subtract all the sent tokens
			  	SELECT AllocatedBy,  SUM(TokenAllocation) AS TotalToken
				INTO #Temp
                FROM TokenTransaction(NOLOCK) 
                WHERE TransactionTypeId IN (4) AND TransactionStatus=1 
				GROUP By AllocatedBy

			  UPDATE TokenHolder 
			  SET TokenHolder.TotalToken = TokenHolder.TotalToken-CT.TotalToken
			  FROM TokenHolder
			  JOIN  #Temp CT
			  ON CT.AllocatedBy=TokenHolder.AllocatedBy

			  DROP TABLE #Temp

				-------------------------------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------------------------------------------
		        select top 100 * from MaticTransactionDetail ORDER BY CreatedDate DESC

				--ALTER TABLE MaticTransactionDetail
				--ADD MaticAmounts DECIMAL(38,28) NULL;

				--update MaticTransactionDetail SET MaticAmounts=MaticAmount

				--ALTER TABLE MaticTransactionDetail
				--DROP COLUMN MaticAmount;
				
				--EXEC sp_rename 'MaticTransactionDetail.MaticAmounts', 'MaticAmount', 'COLUMN';
		

		-------------------------------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------------------------------------------
		        select * from TokenHolder ORDER BY CreatedDate DESC

				select top 100 * from UserWallet

				select  top 100 * from TokenTransaction order by CreatedDate DESC

				select top 10 * from BatchTransactionDetail order by CreatedDate desc

				select top 100 * from UserStepsTransaction order by CreatedDate

				--ALTER TABLE TokenHolder
				--ADD TokenAllocations DECIMAL(38,8) NULL;

				--update TokenHolder SET TokenAllocations=TokenAllocation

				--ALTER TABLE TokenHolder
				--DROP COLUMN TokenAllocation;
				
				--EXEC sp_rename 'TokenHolder.TokenAllocations', 'TokenAllocation', 'COLUMN';
		   -------------------------------------------------------------------------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------------------------------------------------------------------------

				select * from TokenTransaction
				where BatchId = '688641f1-fa23-474d-ba13-15aaef06dfaa'
				--PickedUpByProcessId = '7565de8c-87e3-48ba-848c-ae37c109f56e'
				--TokenAllocation = 200000.00000000
				
				select * from UserWallet where Id=5835

				select * from MasterTransactionType

				select SUM(TokenAllocation) from TokenTransaction 
				where IsProcessing=0 AND			
				 TransactionStatus=1 AND TokenAllocation>0 AND
                 TransactionTypeId =3
				 -- Id IN (849871)
				--AND CreatedDate>'2024-07-09 03:39:52.640'
				ORDER BY CreatedDate DESC

				select * from UserReferral where FromUserId = 1225
				select * from MasterTransactionType

				select * from TokenTransaction where Id IN (835961,835962)

				--update TokenTransaction set 
				--ApprovedBy=NULL,
				--ApprovedCount=0,
				--ApprovedDates=NULL
				--where --BatchId = 'fc9d72e8-7550-44f4-87f1-3d6208c8e5fe'
				
				--Id = 835961

				select TOP 1000 Nonce, BlockchainTransactionStatus, * from BatchTransactionDetail 
				--where IsProcessing=0
				ORDER BY CreatedDate DESC


				select top 1000 * from Error order by CreatedDate DESC

				select * from BatchTransactionDetail 
				where BlockchainTransactionStatus=0

				Update BatchTransactionDetail 
				set Nonce=2304
				where Id = 2386
				

							select * from BatchTransactionDetail 
				ORDER BY CreatedDate DESC

				update BatchTransactionDetail set BlockchainTransactionStatus=0
				where BlockchainTransactionStatus=1 


				--with status 2 total count 223


				--1759

				select top 1000 * from Error Order By CreatedDate DESC 

				select SUM(TokenAllocation) from TokenTransaction
				where --BatchId = 'fb7d6e19-7e1a-4d67-a1a8-ff3bfee8671c'
				--PickedUpByProcessId = '7565de8c-87e3-48ba-848c-ae37c109f56e'
				TransactionTypeId = 3


				--ALTER TABLE TokenTransaction
				--ADD TokenAllocations DECIMAL(38,8) NULL;

				--update TokenTransaction SET TokenAllocations=TokenAllocation

				--ALTER TABLE TokenTransaction
				--DROP COLUMN TokenAllocation;
				
				--EXEC sp_rename 'TokenTransaction.TokenAllocations', 'TokenAllocation', 'COLUMN';
		   -------------------------------------------------------------------------------------------------------------------------------------------------------------
		   -------------------------------------------------------------------------------------------------------------------------------------------------------------


--	--update TokenTransaction SET ApprovedCount=0 where TransactionStatus=0

--   --ALTER TABLE ContactUs
--   --DROP COLUMN [Description];

--ALTER TABLE WalletWhiteLabelling
--ADD UniqueDeviceId VARCHAR(255) NULL;

--update WWL SET WWL.UniqueDeviceId = UW.UniqueDeviceId
--from WalletWhiteLabelling WWL
--JOIN UserWallet UW ON UW.Id = WWL.UserWalletId

select top 100 * from WalletWhiteLabelling order by CreatedDate DESC



--   DECLARE @char VARCHAR(500)= '+91-9452627655'

--    SELECT LEFT(@char, Charindex('-', @char) - 1),
--       Substring(@char, Charindex('-', @char) + 1, Len(@char)) 


--SELECT SUBSTRING('+91-9452627655',5,10)
--SELECT SUBSTRING('+91-9452627655',CHARINDEX('-', '+91-9452627655'),3)


SELECT * FROM MasterTransactionType

--update MasterTransactionType set TransactionName = 'C#CornerPoint' where Id=3


--INSERT INTO MasterTransactionType(TransactionName, Description)
--VALUES
--('Steps', 'These are the tokens transfered due to steps of a user.'),
--('Admin Transfer','These are the token transfered by the admin in user wallet.'),
--('Onboarding','These are the tokens transfered because of onboarding completion.'),
--('OneToOne', 'These are the tokens transfered because of one to one token transfer completion.'),
--('Quiz', 'These are the tokens transfered due to passed quiz attempted by the user.'),
--('Matic Transfer', 'This denotes the transaction type for transferring Matic to users addresses.'),
--('Released Tokens', 'During a specific time frame, the administrator has distributed tokens to all users.')

SELECT TOP 100 * FROM AdminNotification ORDER BY CreatedDate DESC

SELECT TOP 1000 * FROm MaticTransactionDetail ORDER BY CreatedDate DESC

----update MaticTransactionDetail SET MaticAmount=0.01
use walletdbDev
SELECT COUNT(UserWalletId) FROM MaticTransactionDetail

select * from TokenTransaction where UserWalletId =1057
and IsProcessing=0
order by CreatedDate desc

select * from TokenTransaction where UserWalletId NOT IN (
select UserWalletId
from DevicesInfo where IsActive=1 
group by UserWalletId
)
AND TransactionTypeId=1
order by CreatedDate desc

select * from UserWallet where Id = 1339

select COUNT(UserWalletId) from DevicesInfo 

select * from UserWallet 
where Id NOT IN(
select Count(UserWalletId) from DevicesInfo 
where IsActive=1
--where UserWalletId IN (1078)
)

select * from [User] where UserWalletId IN (1019, 1078,1020)

select * from [User] where FullName LIKE '%Keshav%'

select * from TokenTransaction where UserWalletId = 1020
order by CreatedDate desc

WHERE UserWalletId IN(
SELECT Id FROM UserWallet
)
AND CAST(CreatedDate AS DATE) = CAST(GETUTCDATE() AS DATE)
group by DeviceType


SELECT COUNT(Id) FROM UserWallet 
INSERT INTO MaticTransactionDetail(UserWalletId)
SELECT Id FROM UserWallet WHERE Id NOT IN(SELECT UserWalletId FROM MaticTransactionDetail)

----INSERT INTO MaticTransactionDetail(UserWalletId)
----SELECT Id FROM UserWallet ORDER BY CreatedDate ASC


SELECT top 1000 * FROM BatchTransactionDetail  where BatchTransactionTypeId=1 order by CreatedDate DESC

use walletdbDev
SELECT top 1000 Nonce,* FROM BatchTransactionDetail 
where --BlockchainTransactionStatus=2 AND 
AddressCount=500
order by CreatedDate DESC

--select * from UserWallet WHERE Id IN
--(
--select UserWalletId, SUM(TokenAllocation) from TokenTransaction Where Id IN
--(
--387689,387690,387691,387692,387693,387694,387695,387696,387697,387698,387699,387700,387701,387702,387703,387704,387705,387706,387707,387708,387709,387710,387711,387712,387713,387714,387715,387716,387717,387718,387719,387720,387721,387722,387723,387724,387725,387726,387727,387728,387729,387730,387731,387732,387733,387734,387735,387736,387737,387738,387739,387740,387741,387742,387743,387744,387745,387746,387747,387748,387749,387750,387751,387752,387753,387754,387755,387756,387757,387758,387759,387760,387761,387762,387763,387764,387765,387766,387767,387768,387769,387770,387771,387772,387773,387774,387775,387776,387777,387778,387779,387780,387781,387782,387783,387784,387785,387786,387787,387788,387789,387790,387791,387792,387793,387794,387795,387796,387797,387798,387799,387800,387801,387802,387803,387804,387805,387806,387807,387808,387809,387810,387811,387812,387813,387814,387815,387816,387817,387818,387819,387820,387821,387822,387823,387824,387825,387826,387827,387828,387829,387830,387831,387832,387833,387834,387835,387836,387837,387838,387839,387840,387841,387842,387843,387844,387845,387846,387847,387848,387849,387850,387851,387852,387853,387854,387855,387856,387857,387858,387859,387860,387861,387862,387863,387864,387865,387866,387867,387868,387869,387870,387871,387872,387873,387874,387875,387876,387877,387878,387879,387880,387881,387882,387883,387884,387885,387886,387887,387888,387889,387890,387891,387892,387893,387894,387895,387896,387897,387898,387899,387900,387901,387902,387903,387904,387905,387906,387907,387908,387909,387910,387911,387912,387913,387914,387915,387916,387917,387918,387919,387920,387921,387922,387923,387924,387925,387926,387927,387928,387929,387930,387931,387932,387933,387934,387935,387936,387937,387938,387939,387940,387941,387942,387943,387944,387945,387946,387947,387948,387949,387950,387951,387952,387953,387954,387955,387956,387957,387958,387959,387960,387961,387962,387963,387964,387965,387966,387967,387968,387969,387970,387971,387972,387973,387974,387975,387976,387977,387978,387979,387980,387981,387982,387983,387984,387985,387986,387987,387988,387989,387990,387991,387992,387993,387994,387995,387996,387997,387998,387999,388000,388001,388002,388003,388004,388005,388006,388007,388008,388009,388010,388011,388012,388013,388014,388015,388016,388017,388018,388019,388020,388021,388022,388023,388024,388025,388026,388027,388028,388029,388030,388031,388032,388033,388034,388035,388036,388037,388038,388039,388040,388041,388042,388043,388044,388045,388046,388047,388048,388049,388050,388051,388052,388053,388054,388055,388056,388057,388058,388059,388060,388061,388062,388063,388064,388065,388066,388067,388068,388069,388070,388071,388072,388073,388074,388075,388076,388077,388078,388079,388080,388081,388082,388083,388084,388085,388086,388087,388088,388089,388090,388091,388092,388093,388094,388095,388096,388097,388098,388099,388100,388101,388102,388103,388104,388105,388106,388107,388108,388109,388110,388111,388112,388113,388114,388115,388116,388117,388118,388119,388120,388121,388122,388123,388124,388125,388126,388127,388128,388129,388130,388131,388132,388133,388134,388135,388136,388137,388138,388139,388140,388141,388142,388143,388144,388145,388146,388147,388148,388149,388150,388151,388152,388153,388154,388155,388156,388157,388158,388159,388160,388161,388162,388163,388164,388165,388166,388167,388168,388169,388170,388171,388172,388173,388174,388175,388176,388177,388178,388179,388180,388181,388182,388183,388184,388185,388186,388187,388188
--,384189,384190,384191,384192,384193,384194,384195,384196,384197,384198,384199,384200,384201,384202,384203,384204,384205,384206,384207,384208,384209,384210,384211,384212,384213,384214,384215,384216,384217,384218,384219,384220,384221,384222,384223,384224,384225,384226,384227,384228,384229,384230,384231,384232,384233,384234,384235,384236,384237,384238,384239,384240,384241,384242,384243,384244,384245,384246,384247,384248,384249,384250,384251,384252,384253,384254,384255,384256,384257,384258,384259,384260,384261,384262,384263,384264,384265,384266,384267,384268,384269,384270,384271,384272,384273,384274,384275,384276,384277,384278,384279,384280,384281,384282,384283,384284,384285,384286,384287,384288,384289,384290,384291,384292,384293,384294,384295,384296,384297,384298,384299,384300,384301,384302,384303,384304,384305,384306,384307,384308,384309,384310,384311,384312,384313,384314,384315,384316,384317,384318,384319,384320,384321,384322,384323,384324,384325,384326,384327,384328,384329,384330,384331,384332,384333,384334,384335,384336,384337,384338,384339,384340,384341,384342,384343,384344,384345,384346,384347,384348,384349,384350,384351,384352,384353,384354,384355,384356,384357,384358,384359,384360,384361,384362,384363,384364,384365,384366,384367,384368,384369,384370,384371,384372,384373,384374,384375,384376,384377,384378,384379,384380,384381,384382,384383,384384,384385,384386,384387,384388,384389,384390,384391,384392,384393,384394,384395,384396,384397,384398,384399,384400,384401,384402,384403,384404,384405,384406,384407,384408,384409,384410,384411,384412,384413,384414,384415,384416,384417,384418,384419,384420,384421,384422,384423,384424,384425,384426,384427,384428,384429,384430,384431,384432,384433,384434,384435,384436,384437,384438,384439,384440,384441,384442,384443,384444,384445,384446,384447,384448,384449,384450,384451,384452,384453,384454,384455,384456,384457,384458,384459,384460,384461,384462,384463,384464,384465,384466,384467,384468,384469,384470,384471,384472,384473,384474,384475,384476,384477,384478,384479,384480,384481,384482,384483,384484,384485,384486,384487,384488,384489,384490,384491,384492,384493,384494,384495,384496,384497,384498,384499,384500,384501,384502,384503,384504,384505,384506,384507,384508,384509,384510,384511,384512,384513,384514,384515,384516,384517,384518,384519,384520,384521,384522,384523,384524,384525,384526,384527,384528,384529,384530,384531,384532,384533,384534,384535,384536,384537,384538,384539,384540,384541,384542,384543,384544,384545,384546,384547,384548,384549,384550,384551,384552,384553,384554,384555,384556,384557,384558,384559,384560,384561,384562,384563,384564,384565,384566,384567,384568,384569,384570,384571,384572,384573,384574,384575,384576,384577,384578,384579,384580,384581,384582,384583,384584,384585,384586,384587,384588,384589,384590,384591,384592,384593,384594,384595,384596,384597,384598,384599,384600,384601,384602,384603,384604,384605,384606,384607,384608,384609,384610,384611,384612,384613,384614,384615,384616,384617,384618,384619,384620,384621,384622,384623,384624,384625,384626,384627,384628,384629,384630,384631,384632,384633,384634,384635,384636,384637,384638,384639,384640,384641,384642,384643,384644,384645,384646,384647,384648,384649,384650,384651,384652,384653,384654,384655,384656,384657,384658,384659,384660,384661,384662,384663,384664,384665,384666,384667,384668,384669,384670,384671,384672,384673,384674,384675,384676,384677,384678,384679,384680,384681,384682,384683,384684,384685,384686,384687,384688
--)
--group by UserWalletId
--)

--select * from BlockchainBalanceDetail
--where BlockchainBalance <> TotalToken






select * from UserWallet WHERE WalletAddress='0x53C004D4189599f59CE55d3b2F1d494D25Da0E09'

select DISTINCT PickedUpByProcessID from TokenTransaction Where --UserWalletId = 1057 AND
 IsProcessing=1 AND DateTimeProcessCompleted IS NULL
and TransactionTypeId =1
AND CAST(CreatedDate AS Date) IN ('2024-08-05', '2024-08-06')
order by CreatedDate desc

select * from BatchTransactionDetail where CAST(CreatedDate AS Date) IN ('2024-08-04','2024-08-05', '2024-08-06', '2024-08-07')

select * from BatchTransactionDetail where CAST(CreatedDate AS Date) IN ('2024-08-04','2024-08-05', '2024-08-06', '2024-08-07')


select STRING_AGG(Id, ',') from TokenTransaction Where PickedUpByProcessId IN (
'0643cd44-472a-4a5b-aaa0-4bf105f1cdee'
)
select * from BatchTransactionDetail where TransactionHash='0xfdaf8d5f27965597339b17dd52ec5137387b3c63ff8f5d3abcadf25133379cac'
                                                                   

select COUNT(Id) from BatchTransactionDetail where TokenTransactionIds LIKE '%573959%'





--INSERT INTO BatchTransactionDetail (BatchId, PickedUpByProcessId,TokenTransactionIds,   
--				TransactionHash,  AddressCount,BlockChainTransactionStatus,  
--				GivenGasFees,  CodeTransactionStatus,BatchTransactionTypeId ,
--				CreatedDate,UpdatedDate,IsActive,Nonce
--				)  
--VALUES ('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x16ff5cf3b8b0b49ccfbe80cd84f562af7d72697b6ca8febc56aca958913881c3',500,1,  
--				 193,  1,  1  , '2024-08-05 07:57','2024-08-05 07:57:00:000',1, 1656
--					  ),
--	   ('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0xa44d0321860c715c5bf6d21fa8f7e0f8b7ace32b785f976d7bebda8271fd386e',500,1,  
--				 193,  1,  1  , '2024-08-05 08:28:00:000','2024-08-05 08:28:00:000',1, 1657
--					  ),
--	   ('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x46a94569a4dd5b73b1d91d4019deca985000b8e8809dc7999b8c81be1b21b569',500,1,  
--				 193,  1,  1  , '2024-08-05 10:57:00:000','2024-08-05 10:57:00:000',1, 1659
--					  ),
--	 	   ('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x45eb47fb7e1b27c0aaeb90cb300e27fdeb8ebfc9b89b52afb09ef79c9aae9eda',500,1,  
--				 193,  1,  1  , '2024-08-06 03:38:00:000','2024-08-06 03:38:00:000',1, 1671
--					  ),
--		('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0xfb66f8f8f14accf9a30973e732c68a964c036f5de8da116ab225bbd7cddd55f4',500,1,  
--				 193,  1,  1  , '2024-08-06 04:06:00:000','2024-08-06 04:06:00:000',1, 1672
--					  ),
--			('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x73323255e529da9017f7d4f0f7fd2adc8931470f0f68a43238b69d45cb8c4a56',500,1,  
--				 193,  1,  1  , '2024-08-06 06:36:00:000','2024-08-06 06:36:00:000',1, 1675
--					  ),		  
--			('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0xbd123cba04f14c1483b192222bbfe863888a2bb85ec4612614fc5646fac20fb5',500,1,  
--				 193,  1,  1  , '2024-08-06 07:28:00:000','2024-08-06 07:28:00:000',1, 1676
--					  ),
--			('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x0c765bf609e5b4bf261d3b62f68a42f464a03fcb67d0cf18471ea0906782596e',500,1,  
--				 193,  1,  1  , '2024-08-06 07:56:00:000','2024-08-06 07:56:00:000',1, 1677
--					  ),
--			('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0x54dead29d70f5371ff18c1ffc2b51835b0cb4a9db5dda009dd944c264ee1e6cb',500,1,  
--				 193,  1,  1  , '2024-08-06 08:28:00:000','2024-08-06 08:28:00:000',1, 1678
--					  ),

--			('b63ca92e-0326-47d5-9dc6','8d03-4010-9457',null, '0xfdaf8d5f27965597339b17dd52ec5137387b3c63ff8f5d3abcadf25133379cac',500,1,  
--				 193,  1,  1  , '2024-08-06 09:08:00:000','2024-08-06 09:08:00:000',1, 1679
--					  )




select SUM(TokenAllocation) from TokenTransaction Where UserWalletId = 1057 AND
 IsProcessing=0
and TransactionTypeId IN (1,8,9,10,11)
order by CreatedDate desc

23000785.51100000-----total allocation

0.20900000--isprocessing=0

select * from TokenHolder where UserWalletId=1057

SELECT * FROM TokenTransaction
where Id = 562428 
order by CreatedDate DESC


SELECT * FROM TokenTransaction
WHERE BatchId IN ('fd14d0e3-879e-4355-b881-52b5d2cc60a8', '6989c551-6e4e-4434-b84b-ad7811936215', 'f12f9099-9a9b-4b67-8020-5114ee56a63a')
order by CreatedDate DESC

SELECT * FROM TokenTransaction
WHERE BatchId IN ('6989c551-6e4e-4434-b84b-ad7811936215', 'f12f9099-9a9b-4b67-8020-5114ee56a63a')
order by CreatedDate DESC


--UPDATE BatchTransactionDetail SET TransactionHash=NULL WHERE TransactionHash='One or more errors occurred.' AND BatchTransactionTypeId=2
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--SELECT * FROM QuizDetail
--Update QuizDetail SET Description='Time-travel through the ages with this history-themed quiz, exploring historical events and notable figures.' Where Id=4

--INSERT INTO QuizDetail(DailyRewardId, CategoryName, [Description], QuestionCount, RewardAmount)
--VALUES(1, 'General Knowledge', 'Diverse quiz testing your broad range of general knowledge topics.', 0,1),
--(1, 'Entertainment: Books', 'Delve into literary realms with this intriguing entertainment and books-themed quiz challenge,', 0,2),
--(1, 'Entertainment: Film', 'Immerse yourself in a cinematic journey with this film-themed trivia challenge for movie enthusiasts.',0,4),
--(1, 'History', 'Time-travel through the ages with this history-themed quiz, exploring historical events and notable figures.,', 0,3),
--(1, 'Politics', 'Navigate the world of politics with this challenging quiz that explores political systems, events, and figures.',0,4)


--SELECT * FROM QuizQuestion

--INSERT INTO QuizQuestion(QuizCategoryId, Question)
--VALUES(2, 'What character was once considered to be the 27th letter of the alphabet?'),
--(1, 'Which of the following blood component forms a plug at the site of injuries?'),
--(1, 'Which item of clothing is usually worn by a Scotsman at a wedding?'),
--(1, 'Earl Grey tea is black tea flavoured with what?'),
--(1, 'The new One World Trade Center in Manhattan, New York City was designed by which architect?'),
--(1, 'Which American-owned brewery led the country in sales by volume in 2015?'),
--(1,'Which country, not including Japan, has the most people of japanese decent?'),
--(1,'How tall is the Burj Khalifa?'),
--(1,'Earth is located in which galaxy?'),
--(1,'What alcoholic drink is made from molasses?'),
--(1,'In past times, what would a gentleman keep in his fob pocket?')

--SELECT * FROM QuizOptions
--update QuizOptions set CorrectAnswer='Pink' where Id=192
--delete from QuizOptions where Id IN (182,184,186)


--INSERT INTO QuizOptions(QuestionId, [Option],Result)
--VALUES(5, 'David Childs', 1),
--(5, 'John Snow', 0),
--(5, 'Chris Patt', 0),
--(5, 'Randon', 0),
--(2, 'thrombocytes', 0),
--(2, 'red blood cells', 0),
--(2, 'platelets', 1),
--(2, 'plasma', 0),
--(3, 'skirt', 0),
--(3, 'kilt ', 1),
--(3, 'platelets', 0),
--(3, 'plasma', 0)


--SELECT * FROM QuizResult

--Update QuizOptions SET CorrectAnswer=[Option] WHERE Result=1


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----INSERT INTO TransactionPoolDetail (PoolName, [Description], DailyLimit, PerUserDailyLimit, PerTokenValue, CreatedBy, UpdatedBy)
----VALUES
----('Steps', 'This is steps reward pool limit detail.', 50.0000,10.0000,1000,1,1),
----('Quiz', 'This is quiz reward pool limit detail.', 1000.0000,10.0000,NULL,1,1)

----INSERT INTO TransactionThresholdDetail (TransferType, [Description], TotalLimit, CreatedBy, UpdatedBy)
----VALUES
----('Blockchain Transfer', 'This is total threshold blockchain transaction limit detail.', 1000.0000,1,1),
----('Admin Transfer', 'This is total threshold admin transaction limit detail.', 1000.0000,1,1)

----INSERT INTO OneToOneTransactionLimit (TransferType, [Description], MaxLimit, MinLimit, TransferUnlockLimit, PerDayTransactionCountLimit, CreatedBy, UpdatedBy)
----VALUES ('One To One', 'This contains all the limits of one to one transfer.', 10.0000, 1.0000, 5.0000, 10, 1, 1)


--use walletdbDev

 --   ALTER TABLE UserWallet
	--ADD DeviceType VARCHAR(255) NULL
select * from AppVersion


--INSERT INTO AppVersion (AppVersion, BuildVersion, DeviceType, IsActive)
--VALUES('0.1.4','1','iOS', 1)

--UPDATE AppVersion SET IsActive=0 WHERE Id=4

select Distinct TransactionTypeId from TokenTransaction 
select * from MasterTransactionType

select top 10  * from GroupMessage order by CreatedDate DESC

--use walletdbDev
select * from UserWallet 
WHERE Id IN
(
SELECT * FROm DevicesInfo 
where DeviceType = 'Android' AND DeviceVersion='8'
--Order BY UpdatedDate DESc
)
AND UniqueDeviceId IS NULL

select 1000 * FROM UserWallet order by CreatedDate DESC

----update DevicesInfo SET DeviceId='5f357a6056413b0118ef6a2b0833507908db9bdde63c9e92741bb260a83b51a2'
--update DevicesInfo SET IsActive=0 WHERE UserWalletId =2844 AND Id<>162

select * from DevicesInfo where UserWalletId = 
(
select Id from UserWallet where WalletAddress = '0x29E0B5f99518400f31FeE2b349cBBA94F3d05Ba7'
)

select top 1000 *  from [User] where UserWalletId = 1221
and TimeZoneOffsetName ='Gulf Standard Time' 

select UW.WalletAddress,
       USR.FullName,
       TT.TokenAllocation,
	   TT.CreatedDate,
	   USR.TimeZoneOffsetName
	from TokenTransaction TT
JOIN UserWallet UW ON TT.UserWalletId = UW.Id
JOIN [User] USR ON UW.Id = USR.UserWalletId
WHERE TT.UserWalletId IN (1167,4768)
order BY CreatedDate DESC

select USR.FullName, UW.WalletAddress, DI.AppVersion, DI.BuildVersion, DI.DeviceType from DevicesInfo DI
JOIN UserWallet UW ON UW.Id=DI.UserWalletId
LEFT JOIN [User] USR ON DI.UserWalletId=USR.UserWalletId
where IsActive=1 AND AppVersion<>'0.1.1'
AND DI.DeviceType='iOS'
 

--Alter table UserWallet add UniqueDeviceId NVARCHAR(255) NULL

select top 10 * from UserWallet order by id desc

select top 10 * from TokenTransaction order by CreatedDate DESC

select dateadd(minute, 330, '2024-07-21 17:33:59.270')

select * from UserReferral 

select FullName,* from UserWallet 
LEFT join [User] ON UserWallet.Id=[User].UserWalletId
where UserWallet.Id IN(
select UserWalletId,SUM(TokenAllocation) from TokenTransaction where TransactionTypeId = 3
AND IsProcessing=1
group by UserWalletId
)

select top 100 * from Error order by CreatedDate deSC

35125

SELECT top 100 * FROM TokenTransaction where UserWalletId=1221 ORDER BY CreatedDate DESC
select * from UserStepsTransaction where UserWalletId=1020 order by CreatedDate desc

select top 10000 * from [walletdb].[dbo].[MSSQL_LedgerHistoryFor_2142630676]
order by CreatedDate desc


SELECT top 1000 * FROM TokenTransaction 
where TransactionTypeId IN (8,9)
ORDER BY CreatedDate DESC

select top 100 * from TokenTransaction

select SUM(TokenAllocation) from TokenTransaction
where CAST(CreatedDate AS Date) = '2024-06-11'

select * from TransactionPoolDetail

select top 1000 * from UserStepsTransaction
where UserWalletId = 7
order by CreatedDate desc



select (DATEADD(MINUTE, 330, GETUTCDATE()))  

SELECT   
SUM(Amount)  
FROM UserStepsTransaction(NOLOCK)  
WHERE
CAST(CreatedDate AS DATE)=CAST(GETUTCDATE() AS DATE)

SELECT   
ISNULL(SUM(Amount),0)   
FROM UserStepsTransaction(NOLOCK)   
WHERE
CAST(DATEADD(MINUTE, 330,CreatedDate) AS DATE)='2024-06-11'

select top 10 * from [User] where FullName Like '%Mayank%'

SELECT TOP 100 * FROM TransactionPoolDetail
----update TransactionPoolDetail SET DailyLimit=100 where Id=1

----update TransactionPoolDetail SET DailyLimit=40 where Id=1

use walletdbDev
select * from MasterTransactionType 
--SET IDENTITY_INSERT MasterTransactionType  ON
--GO

--insert into MasterTransactionType(Id, TransactionName, Description)
--values
--	  (8,'Hackathon', 'During hackathon, the administrator has distributed tokens to all users.'),
--	  (9,'Event', 'During event, the administrator has distributed tokens to all users.'),
--	  (10,'Promotion', 'During app promotion, the administrator has distributed tokens to all users.')
--SET IDENTITY_INSERT MasterTransactionType  OFF
--GO



SELECT * FROM MasterUserType WHERE IsActive=1

--truncate table MasterUserType

--INSERT INTO MasterUserType(UserType, IsActive)
--VALUES('Admin', 1),
--('Simple User', 1),
--('Investor', 1),
--('Advisor', 1),
--('Support User', 1)


----UPDATE MasterUserType SET IsActive=1 WHERE Id=2

SELECT * FROM TransactionThresholdDetail

select SUM(TokenAllocation) from TokenTransaction where CAST(CreatedDate AS date)='2024-05-27' AND TransactionTypeId=1

----update BatchTransactionDetail SET GivenGasFees = NULL
select * from UserWallet where Id=1305

SELECT * FROM TokenTransaction WHERE --BatchId='1b23d0ee-4157-4734-b928-449d87157bc0' AND 
--PickedUpByProcessId='71cc288a-5d54-4cc3-aa30-ba5ec7bb71dd' and 
UserWalletId=1378
order by CreatedDate DESC

select * from UserWallet WHERE WalletAddress='0x205bdbC99Ce51Dc6bfa18BF3624DB520CADaf4eF'
SELECT top 1000 * FROM TokenTransaction ORDER BY CreatedDate DESC

update TokenTransaction SET IsProcessing=0, DateTimeProcessCompleted=NULL
WHERE IsProcessing=1 AND TransactionTypeId=1 AND DateTimeProcessCompleted<='2024-03-05 10:26:00.127'

SELECT top 100 * FROM TokenTransaction where UserWalletId=5553 ORDER BY CreatedDate DESC
select * from UserStepsTransaction where UserWalletId=2207 order by CreatedDate desc

select MONTH('2024-01-30 19:56:36.830')
SELECT * FROM TokenTransaction WHERE UserWalletId=1047 AND YEAR(CreatedDate)=2024
						AND MONTH(CreatedDate)=01
						AND TransactionStatus=1
						AND TransactionTypeId<>1
----update TokenTransaction SET TransactionTypeId=1  where Id=307
SELECT TOP 100 * FROM TokenTransactionStatus ORDER BY CreatedDate DESC

SELECT TOP 1000 * FROM UserStepsTransaction WHERE UserWalletId = 34 ORDER BY CreatedDate DESC
AND CAST(CreatedDate AS DATE)='2024-04-13'
Order By CreatedDate DESC
   
             SELECT Steps, CreatedDate   
             FROM UserStepsTransaction(NOLOCK)   
             WHERE UserWalletId=1268
			 Order by CreatedDate desc
             AND CAST(CreatedDate AS DATE)=CAST(GETUTCDATE() AS DATE) 

--SELECT TOP 100 * FROM UserTokenTransaction ORDER BY CreatedDate DESC
----UPDATE TokenTransaction SET UpdatedDate = GETUTCDATE() WHERE UpdatedDate IS NULL

select top 100  * from 
UserWallet uw
order By uw.CreatedDate desc


SELECT top 100 * FROM BatchTransactionDetail  where BlockchainTransactionStatus=2 order by CreatedDate DESC

SELECT top 100 * FROM BatchTransactionDetail --WHERE BatchTransactionTypeId=2 
order by CreatedDate DESC

--186

SELECT TOP 100 * FROm MaticTransactionDetail 
where IsProcessing=1
ORDER BY CreatedDate DESC

update MaticTransactionDetail SET IsProcessing=0
WHERE IsProcessing=1 AND BatchId IS NULL
----update MaticTransactionDetail SET MaticAmount=0.01

SELECT COUNT(UserWalletId) FROM MaticTransactionDetail
SELECT COUNT(Id) FROM UserWallet 

SELECT top 100 * FROM BatchTransactionDetail
WHERE BatchId IN ('7221fbf4-673a-4f88-9f2a-293e512572d1')
order by CreatedDate DESC

select top 100 * from Error order by CreatedDate DESC

use walletdbDev
SELECT TOP 1000 * FROM BatchTransactionDetail
--where --BlockchainTransactionStatus=2
--BatchId='a97ea041-dd35-4e44-982d-eea757e03dd5'
--TokenTransactionIds='4224,4225,4226,4227,4228,4229,4230,4231,4232,4233,4234,4235,4236,4237,4238,4239,4240,4241,4242,4243,4244,4245,4246,4247,4248,4249,4250,4251,4252,4253,4254,4255,4256,4257,4258,4259,4260,4261,4262,4263,4264,4265,4266,4267,4268,'
--TransactionHash='0xd52b11640cd221db5337d66489608358ff551c9ed4f4a5431db39db2480ff01c'
order by CreatedDate DESC

--update BatchTransactionDetail set Nonce = 590 where Id=751


SELECT TOP 1000 * FROM BatchTransactionDetail
--where BlockchainTransactionStatus=0
order by CreatedDate DESC


SELECT TOP 1000 * FROM BatchTransactionDetail
--where BatchId='505e1454-2ca0-8578-1b1e85f2f23c'
order by CreatedDate DESC

select * from TokenTransaction 
where BatchId = '10ed3ccc-3813-456e-94c6-053ecb9014e2'

 --   ALTER TABLE BatchTransactionDetail
	--ADD Nonce bigint NULL


select top 1000
SUM(TokenAllocation),
UserWalletId
from TokenTransaction 
where --UserWalletId = 1275        --AND CAST(CreatedDate AS DATE) = '2024-05-16'
BatchId='194c894a-6188-40d4-abff-769ef774e8d8'
AND TransactionTypeId=1
group by UserWalletId
order by createddate desc


select * from TokenTransaction
where PickedUpByProcessID IS NOT NULL AND DateTimeProcessCompleted IS NULL
and IsProcessing=1
order by CreatedDate desc

select top 1000
UserWallet.WalletAddress,
UserWalletId,
TokenAllocation
from TokenTransaction
join UserWallet on TokenTransaction.UserWalletId=UserWallet.Id
where 
IsProcessing=0 AND TransactionTypeId=1
--Id In
--(4224,4225,4226,4227,4228,4229,4230,4231,4232,4233,4234,4235,4236,4237,4238,4239,4240,4241,4242,4243,4244,4245,
--4246,4247,4248,4249,4250,4251,4252,4253,4254,4255,4256,4257,4258,4259,4260,4261,4262,4263,4264,4265,4266,4267,4268)
--(2963,2964,2965,2966,2967,2968,2969,2970,2971,2972)
order by TokenTransaction.CreatedDate desc

SELECT Count(UserWalletId) FROM DevicesInfo(NOLOCK) WHERE DeviceType ='Android' AND IsActive=1
order by createddate desc

select * from TokenTransaction
where Id >=
2963 and IsProcessing=1 AND CAST(DateTimeProcessStarted AS Date)='2024-05-17'
order by CreatedDate desc

SELECT TOP 1000 * FROM BatchTransactionDetail
where TransactionHash='0x946f868d71fe511778b849690bf60662b9edf40b2ec8cf6e75e7fa8a448873d9'
order by CreatedDate DESC

;with cte as(
select 
TokenTransactionIds,
Count(TokenTransactionIds) AS ExecutionCount
from BatchTransactionDetail
group By TokenTransactionIds
)
SELECT TOP 1000 * FROM BatchTransactionDetail
where --BlockchainTransactionStatus=2 AND
--BatchId='24dfd520-6da8-4430-a972-607975fa0897'
TokenTransactionIds =  '1479,1480,1481,1482,1483,1484,1485,1486,1487,1488'
--TransactionHash='0xd52b11640cd221db5337d66489608358ff551c9ed4f4a5431db39db2480ff01c'
order by CreatedDate DESC




    ALTER TABLE UserWallet
	ADD DeviceType VARCHAR(255) NULL




--insert into TokenTransaction
--values(1228,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)
--,(1224,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)
--,(1229,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.50000000)
--,(1234,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)
--,(1249,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)
--,(1233,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,3.0000000)
--,(1228,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.40000000)
--,(1224,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)
--,(1234,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.20000000)
--,(1234,0,'2024-05-16 03:35:33.557',1,NULL,0,0,NULL,'2024-05-16 03:50:04.223',NULL,NULL,1,'0c181d5b-d121-4aaf-bdbc-a30839ccf2cb','2024-05-16 03:50:04.747',	'2024-05-16 03:50:05.220',1	,'194c894a-6188-40d4-abff-769ef774e8d8',NULL,0.10000000)

--update TokenHolder
--SET TotalToken=TotalToken+0.30000000,
--     TokenAllocation=TokenAllocation+0.30000000
--	 where UserWalletId IN (1224,1234)

--update TokenHolder
--SET TotalToken=TotalToken+0.50000000,
--     TokenAllocation=TokenAllocation+0.50000000
--	 where UserWalletId IN (1228,1229)

--update TokenHolder
--SET TotalToken=TotalToken+3.00000000,
--     TokenAllocation=TokenAllocation+3.00000000
--	 where UserWalletId=1233

--	 update TokenHolder
--SET TotalToken=TotalToken+0.10000000,
--     TokenAllocation=TokenAllocation+0.10000000
--	 where UserWalletId=1249


SELECT TOP 100 * FROM TokenTransactionStatus
order by CreatedDate DESC

select * from TokenTransaction where 
Id = 12937

;with cte as (
select UserWalletId, SUM(TokenAllocation) AS TokenAllocation, CreatedDate from TokenTransaction 
where (IsProcessing=0 OR
 BatchId IN ('7ab6527f-1146-49d9-bcdf-a184c49be3bc'
,'d78e0fd9-a050-49cb-9535-7d5756b9f477'
,'fe28b127-9cd1-4809-814b-0ee4f06ba010'
,'81aa9c62-5aab-45b6-9bf3-e0006e33bbde'
,'c0a92113-e8ec-4409-bd24-06f2f5c92237'
,'8b53ccb1-9e8d-441d-85ca-56598f2ece78'
,'806bdc62-c92f-4ad3-aacd-ac58840f53ec'))
AND TransactionTypeId = 1
group by UserWalletId, CreatedDate
)

select cte.UserWalletId, UW.WalletAddress, cte.TokenAllocation, cte.CreatedDate from cte
join UserWallet UW ON UW.Id = UserWalletId
order by cte.CreatedDate desc


select * from BatchTransactionDetail
where AddressCount=50

select * from [User]
where UserWalletId IN
(1228
,1224
,1229
,1234
,1249
,1233
,1228
,1224
,1234
,1224)

use walletdbDev

select top 100 * from UserWallet order by CreatedDate desc
select top 1 * from tokenholder 
where UserWalletId = 801
order by CreatedDate desc

select SUM(TokenAllocation) from TokenTransaction where TransactionTypeId IN (1,8,9,10,11)
and TransactionStatus=1 

select SUM(TokenAllocation) from TokenTransaction where UserWalletId = 801 and TransactionTypeId = 1
--and TransactionStatus=1

select * from TokenTransaction where UserWalletId = 3991 --and TransactionTypeId = 1

--update TokenTransaction SET
--TransactionStatus=1, ApprovedBy = '2,3', ApprovedCount=2, UpdatedDate = '2023-09-15 16:40:12.333'
--where Id=114


--and TransactionStatus=1

-31730000.00000000

230302330.00000000

 --   ALTER TABLE BatchTransactionDetail
	--ADD CodeTransactionStatus INT NULL


 --   ALTER TABLE BatchTransactionDetail
	--ADD BatchTransactionTypeId INT NULL

 --   ALTER TABLE TokenTransaction
	--ADD LockingPeriod INT NULL 

	    --ALTER TABLE TokenTransaction
	    --ADD LockExpiryDatetime DATETIME  NULL 


	--update BatchTransactionDetail SET BatchTransactionTypeId=1


--Update BatchTransactionDetail SET BlockchainTransactionStatus=0, WebSocketStatus=NULL



select * from TokenTransaction WHERE BatchId IN ('65fef489-b757-4a11-ae42-6c553032d955')

 --   ALTER TABLE TokenTransactionStatus 
	--ADD WebSocketStatus INT NULL;

	select * from UserWallet
	where Id IN
	(1221
,1164
,1221
,1221
,1164
,1221
,1164
,1164
,1229
,1164)


        SELECT 
          *  
        FROM    
            TokenTransaction 
        WHERE    
             --IsProcessing = 0 AND 
			 --(DateTimeProcessCompleted IS NULL)  AND  
			 TransactionStatus=1 AND TokenAllocation>0
			AND TransactionTypeId=1
			AND UserWalletId IN(1224)


select * from MasterTransactionType

use walletdbDev
Update TokenTransaction SET TransactionTypeId=2
WHERE UserWalletId IN (

SELECT * FROM TokenTransaction 
where AllocatedBy>0 AND TransactionStatus=1 AND TransactionTypeId IS NULL
)
AND AllocatedBy=0

select top 100 * from Error order by CreatedDate desc

SELECT * FROM TokenTransaction 
where TransactionTypeId =2 AND TransactionStatus=1
order by CreatedDate desc


select 
SUM(TokenAllocation)
from TokenTransaction
where CAST(CreatedDate AS DATE) = '2024-05-21'

SELECT * FROM TokenHolder 
where UserWalletId=11679
order by CreatedDate desc

select top 100 * from TokenTransaction 
Order By CreatedDate DESC

SELECT top 1000 * FROM BatchTransactionDetail WHERE 
BatchId IN ('f12f9099-9a9b-4b67-8020-5114ee56a63a')

	--ALTER TABLE TokenHolder
	--ADD OverallRank BIGINT NULL;


--update TokenHolder SET ReleasedToken=0 WHERE ReleasedToken IS NULL

--update TokenHolder SET TotalToken = 2.30000000 where UserWalletId = 7

--ALTER TABLE TokenHolder
--ADD TotalToken DECIMAL(38,8) NULL;

--ALTER TABLE TokenHolder
--ADD ReleasedToken DECIMAL(38,8) NULL;

select * from UserStepsTransaction where UserWalletId=3991 order by CreatedDate DESC

select top 100 * from TokenHolder order by TokenAllocation DESC

select * from UserWallet where WalletUniqueName='bdyjafucae2151'

  select TT.UserWalletId, USR.FullName, SUM(TokenAllocation) from TokenTransaction TT 
  LEFT JOIN [User] USR ON USR.UserWalletId= TT.UserWalletId
  where CAST(TT.CreatedDate AS DATE) BETWEEN '2024-03-13' AND '2024-03-14'
  AND TT.TransactionTypeId=1 
  AND TT.TransactionStatus=1
  GROUP BY TT.UserWalletId, USR.FullName

--  update TokenTransaction SET TransactionStatus=0,
--  UpdatedDate=GETUTCDATE()
--  WHERE UserWalletId IN (2952
--,2900
--,1948
--,1977
--,2895
--,1988
--,1954
--,2737)
--AND CAST(CreatedDate AS DATE) BETWEEN '2024-03-13' AND '2024-03-14'
--AND TransactionTypeId=1
--address 0x10c181b730B02f0702849c9F5233ac2063Ac01Dc

--UPDATE TokenTransaction SET TokenAllocation = AllocatedToken

	--INSERT INTO TokenHolder(UserWalletId, UserTypeId, AllocatedBy, TokenAllocation)
 --   VALUES(1626,2,0, 0)
SELECT top 100 * FROM Error order by CreatedDate desc 

SELECT COUNT(UW.Id) FROM UserWallet UW 
JOIN TokenHolder TH ON TH.UserWalletId=UW.Id
WHERE UW.WalletUniqueName IS NULL
AND TH.TokenAllocation>0

use walletdbDev
select top 1000 * from UserWallet order by CreatedDate desc

select * from UserWallet WHERE IsReceivePushNotification IS NULL




SELECT * FROM UserWallet WHERE Id IN (SELECT UserWalletId FROM TokenHolder
Where UserTypeId=3)

SELECT * FROM UserWallet WHERE WalletAddress='0xa7224a2B6cCc9Ba6dd3a659A3462F36d6FBe5AC6'
SELECT * FROM UserWallet WHERE WalletAddress='0x3332f0468348dF6529338EbAEe992522e91b1288'
SELECT * FROM UserWallet WHERE WalletAddress='0x97E3EcB8DAAA97D3d79fd6BC535bdA7eE6A02305'
--pravesh sir
SELECT * FROM UserWallet WHERE WalletAddress='0x819A44750189852E727f2d17702Ea71cbF043083'

use walletdbDev
SELECT * FROM UserWallet WHERE WalletAddress='0xEB2494F5F2dF5af9799F458D97625139384e1bA3'

--Ivan
SELECT * FROM UserWallet WHERE WalletAddress='0xb841C34a95bcC82e372AfCb0Bc986a3f65bcF12a'
--Michael Barb
SELECT * FROM UserWallet WHERE WalletAddress='0x86dbc756e2f1541e4D9ADbA91B2F54088bB490E8'
--lisa
SELECT * FROM UserWallet WHERE WalletAddress='0xB5bAE08c8AaA7e7C74c0f2D09Dce6F76E1B63eE7'
--deepak
SELECT * FROM UserWallet WHERE WalletAddress='0x3B6Dd2A5BE6B569DCcDe32291f87D07e9B29466f'

--bhasker sir
SELECT * FROM UserWallet WHERE WalletAddress='0xcf2C716d68F2cAB2d03b1dfB31e6810Ce9836896'


SELECT * FROM UserWallet WHERE WalletAddress='0xCDE70EbA204Dc65A29685774cEE3F13ae053Cd81'

SELECT * FROM UserWallet WHERE WalletAddress='0x1dDAC949C6185C61b75959461B7842917E5689Fb'

SELECT * FROM UserWallet WHERE WalletAddress='0x5834A2E86aEAe4BBAD8f1e65F4742C9B27c24f33'

--delete from UserWallet WHERE Id=3171

SELECT * FROM UserWallet WHERE Id=1103

--UPDATE UserWallet SET WalletUniqueName='gvsytytygnu1377' WHERE Id=1841


select * from UserWallet
where Id NOT IN(
select UserWalletId from TokenHolder
)
SELECT * FROM UserWallet WHERE WalletUniqueName='Kampydiv@sharp'
SELECT TOP 100 * FROM UserWallet 
WHERE WalletAddress LIke '%950%'
Order By CreatedDate desc

SELECT * FROM UserOTP
select * from AdminOTP
select * from AdminUser

select top 100 * from Error order by CreatedDate DESC

--update AdminUser set MobileNumber='+91' + MobileNumber where MobileNumber IS NOT NULL



Select * from TokenHolder WHERE UserWalletId IN(
11793
)
order By TokenAllocation desc

SELECT TOP 100 * FROM [User] order by CreatedDate desc
SELECT TOP 100 * FROM [User] WHERE UserWalletId IN (13263)


--update [User] set IsDLS=0 WHERE UserWalletId=1841

SELECT top 100 * FROM UserWallet ORDER BY CreatedDate DESC
SELECT TOP 100 * FROM TokenHolder ORDER BY CreatedDate DESC
SELECT TOP 100 * FROM MaticTransactionDetail ORDER BY CreatedDate DESC


SELECT TOP 100 * FROM QuizDetail ORDER BY CreatedDate DESC

--update QuizDetail SET IsActive=0 WHERE Id<>1
 --update QuizDetail SET RewardAmount=5 WHERE Id=1

SELECT * FROM QuizQuestion ORDER BY CreatedDate DESC

--update QuizQuestion SET IsActive=0 WHERE Id=1
SELECT TOP 100 * FROM QuizOptions WHERE QuestionId=1 ORDER BY CreatedDate DESC
SELECT TOP 100 * FROM QuizResult ORDER BY CreatedDate DESC

select * from DevicesInfo where UserWalletId = 1306
select * from UserWallet where Id = 1570

SELECT * FROM WalletWhiteLabelling WHERE UserWalletId=5553
SELECT * FROM WalletWhiteLabelling WHERE LinkedEmail='theonlystephensimon@gmail.com'
SELECT * FROM WalletWhiteLabelling 
WHERE LinkedEmail='shvmpayasi@gmail.com'
ORDER BY CreatedDate DESC

SELECT * FROM WalletWhiteLabelling where UniqueDeviceId IS NULL AND IsActive=1



;with cte as 
(
select 
Row_Number() OVER (Partition BY LinkedEmail, UserWalletId Order BY Id DESC) AS RowNumber,
*
from WalletWhiteLabelling
where IsActive=1
)
select * from cte

--delete from WalletWhiteLabelling
--where Id IN (46
--,48
--,93)


SELECT top 100 * FROM ContactUs order by CreatedDate DESC 
----update WalletWhiteLabelling SET IsActive=1

--	--DELETE FROM WalletWhiteLabelling
--	--		WHERE UserWalletId=1067
--	--		AND LinkedEmail='vijaypratapsingh12121999@gmail.com'


--SELECT * FROM UserAddress
--SELECT * FROM ERROR

--SELECT Id,UserWalletId,UserTypeId,AllocatedToken,AllocatedBy,CreatedDate FROM TokenHolder where UserWalletId=7
--SELECT Id,UserWalletId,UserTypeId,AllocatedToken,AllocatedBy,CreatedDate FROM MSSQL_LedgerHistoryFor_1925581898 where UserWalletId=10 order by CreatedDate asc
----update TokenHolder SET AllocatedToken=1000, AllocatedBy=1 Where UserWalletId=22

----ALTER TABLE TokenHolder ALTER COLUMN AllocatedToken DECIMAL(38,4)


--   --ALTER TABLE AdminUser
--   -- DROP COLUMN [Password];

SELECT * FROM UserWallet UW Left JOIN [User] On UW.Id=[User].UserWalletId


DECLARE @Password VARBINARY(255)
SET @Password= (SELECT ENCRYPTBYPASSPHRASE('4765byrivbytrb465','Test@123'))
SELECT @Password

DECLARE @VALUE VARCHAR(MAX);
DECLARE @Pwd VARCHAR(55);

SET @VALUE=0x02000000B99DDC331252A74A1F70F08906B7D57854D97F989A659C590AB1E23C3F14690D86ADD50DF0A78033EE2DF1ABB1835F9E

SET @Pwd = (SELECT DECRYPTBYPASSPHRASE('4765byrivbytrb465',@VALUE))
SELECT @Pwd

----UPDATE AdminUser SET EPassword = @Password WHERE Id=1


select * from UserStepsTransaction where UserWalletId IN (1070
,1078
,3309) 

select * from DevicesInfo where UserWalletId IN (1304
)


 SELECT   
      SUM(Steps) AS CurrentDaySteps,  
   SUM(Amount+0) AS TokenValue  
   --CAST(CreatedDate AS DATE) AS CurrentDate  
 FROM UserStepsTransaction(NOLOCK)   
 WHERE UserWalletId=1025   AND CAST(CreatedDate AS date)=CAST('2023-11-23T14:39:50.905' AS DATE) 

 SELECT * FROM UserWallet (NOLOCK) WHERE WalletAddress='0xCDE70EbA204Dc65A29685774cEE3F13ae053Cd81'

  SELECT * FROM UserWallet (NOLOCK) WHERE WalletAddress='0xb14cD85D416663b1C4219b7d2F73e3121BA26da6'

SELECT * FROM WalletWhiteLabelling where LinkedEmail='lalit@eiysys.com'
----delete FROM WalletWhiteLabelling WHERE LinkedEmail='praveshdubey99@gmail.com'
----update WalletWhiteLabelling SET LinkedEmail=''

use walletdb

select RAND()
SELECT ABS(CHECKSUM(NEWID())) % 10 + 1 AS RandomNumber;
select top 10 * from UserWallet order by id desc

SELECT * FROM AdminWallet


select top 1000* from TokenTransaction 
--where UserWalletId = 1070        --AND CAST(CreatedDate AS DATE) = '2024-05-16'
order by createddate desc






--update AdminWallet SET TokenAllocation=AllocatedToken,
--                       TokenRemaining =RemainingToken 





SELECT * FROM AdminUser




--update AdminUser set MobileNumber='8800576467'
--where Id=3


 --   ALTER TABLE AdminUser
	--ADD IsActive BIT NULL

	--ALTER TABLE AdminUser
	--ADD UniqueMFAKey NVARCHAR(500) NULL

	--ALTER TABLE AdminUser
	--ADD IsMFAEnable BIT NULL

	--update AdminUser SET IsMFAEnable=0 where Id = 2

	--update AdminUser SET IsActive=0 WHERE UserName NOT IN('manishd','bhaskerd','praveen.kumar@csharp.com')





--update AdminUser SET UserName = 'vijay.pratap@csharp.com' where Id=2

 --Update AdminWallet SET   TokenAllocation = 100000000000,
 --                         TokenRemaining=   95989418810.223
 --                         WHERE Id=1


--SELECT SUM(AllocatedToken) FROM TokenHolder
----update AdminWallet SET RemainingToken= 999964500 WHERE Id=1


----update AdminWallet SET RemainingToken=90000

SELECT * FROM MasterUserType

SELECT * FROM MasterTransactionType 

--Added a new column in TokenTransaction tbale

select top 1 * from TokenTransaction
             -- ALTER TABLE TokenTransaction
             --ADD Note NTEXT NULL;


----Update MasterUserType SET IsActive=1 Where Id=2

--select * from MSSQL_LedgerHistoryFor_1925581898

--Update MasterUserType SET UserType='Simple User' WHERE UserType='SimpleUser' 


--	SELECT GETUTCDATE()



-----update AdminUser SET Password='adm1n@2o23' where Id=5

----INSERT INTO MasterUserType (UserType)VALUES('Investor'),('Advisor')

--INSERT INTO AdminUser(AdminWalletId,FullName, Email,UserName,EPassword)VALUES 
--(4,'Rohit Gupta','rohit.gupta@mcnsolutions.net','rohitg123','Rohit@123'),
--(5,'Mahesh','mahesh.chand@csharp.com','admin','adm1n@2o23'),
--(6,'Deepak Tewatia','deepak.tewatia@csharp.com','deepak.tewatia@csharp.com','V3O&>Z50=x[~s{%m'),
--(7,'Bhasker Das','bhasker.das@csharp.com','bhaskerd','bhasker@321'),
--(8,'Praveen Kumar','praveen.kumar@csharp.com','praveen.kumar@csharp.com','Uhjih$#@nj434')

--INSERT INTO AdminUser(AdminWalletId, FullName, Email, UserName, CreatedDate, EPassword, MobileNumber)
--VALUES(10, 'Ivan Kan', 'ivan.kan@csharp.com', 'ivan.kan@csharp.com', GETUTCDATE(),
--0x0200000099CD8B55EF2A459EC7B7CCFF31B46B93E46274B7114550001C56BC1D7283B5C945CFED45BD0B567181F446B185A04280, '+13108720054')

select * from AdminUser where IsActive=1

update AdminUser set IsActive=1,
                     MobileNumber='+919910701948'
				 where Id=4

----INSERT INTO AdminWallet(UserTypeId,WalletAddress,AllocatedToken,RemainingToken)VALUES (1,'0xB1aA22f598b90C207BADe296d5D9c90c108AAC97',1000000000,1000000000)



----query to create non clustered indexing on tables

--CREATE INDEX CI__TokenHolder_UserTypeId
--ON TokenHolder(UserTypeId);

CREATE NONCLUSTERED INDEX IX_TokenHolder
ON TokenHolder (CreatedDate, AllocatedBy)
INCLUDE (UserWalletId)

use walletdbDev

CREATE NONCLUSTERED INDEX IX_AdminUser
ON AdminUser ([UserName],[EPassword])
INCLUDE ([AdminWalletId])

CREATE NONCLUSTERED INDEX IX_DevicesInfo
ON DevicesInfo ([DeviceId],[DeviceType],[IsActive])
INCLUDE ([UserWalletId])

CREATE NONCLUSTERED INDEX IX_GroupMessage
ON GroupMessage ([FromUserWalletId],[CreatedBy],[IsActive])
INCLUDE ([GroupId])

CREATE NONCLUSTERED INDEX IX_GroupMessageToUser
ON GroupMessageToUser ([GroupId],[IsRead],[IsActive], [GroupMessageId])
INCLUDE ([ToUserWalletId])

CREATE NONCLUSTERED INDEX IX_SupportChatGroup
ON SupportChatGroup ([IsActive])
INCLUDE ([UserWalletId])

CREATE NONCLUSTERED INDEX IX_TokenHolder
ON TokenHolder ([AllocatedBy],[UserTypeId],[TokenAllocation])
INCLUDE ([UserWalletId])

CREATE NONCLUSTERED INDEX IX_TokenTransaction
ON TokenTransaction ([AllocatedBy],[TransactionTypeId], [TransactionStatus], [TokenAllocation])
INCLUDE ([UserWalletId])


CREATE NONCLUSTERED INDEX IX_UserWallet
ON UserWallet ([IsReceivePushNotification])
INCLUDE ([WalletAddress])

CREATE NONCLUSTERED INDEX IX_User
ON [User] ([OffsetInMinute],[IsDLS])
INCLUDE ([UserWalletId])

CREATE NONCLUSTERED INDEX IX_UserUserWalletId
ON [User] ([UserWalletId])

CREATE NONCLUSTERED INDEX NC_TokenHolder
ON [TokenHolder] ([UserWalletId])

CREATE NONCLUSTERED INDEX NC_DevicesInfo
ON [DevicesInfo] ([UserWalletId], [IsActive])

CREATE NONCLUSTERED INDEX NC_UserStepsTransactionSteps
ON [UserStepsTransaction] ([UserWalletId])
INCLUDE ([Steps],[Amount], [CreatedDate])


CREATE NONCLUSTERED INDEX IX_QuizOptions
ON QuizOptions ([IsActive])
INCLUDE ([QuestionId])

CREATE NONCLUSTERED INDEX IX_QuizQuestion
ON QuizQuestion ([IsActive])
INCLUDE ([QuizCategoryId])








--INSERT INTO TransactionPoolDetail (PoolName, [Description], DailyLimit, OneTimeLimit, CreatedBy, UpdatedBy)
--VALUES('Quiz', 'This is quiz reward pool limit detail.', 1000.0000,NULL,1,1)

--INSERT INTO TransactionThresholdDetail (TransferType, [Description], TotalLimit, CreatedBy, UpdatedBy)
--VALUES('Admin Transfer', 'This is total threshold admin transaction limit detail.', 1000.0000,1,1)

select * from OneToOneTransactionLimit
--INSERT INTO OneToOneTransactionLimit (TransferType, [Description], MaxLimit, MinLimit, TransferUnlockLimit, PerDayTransactionCountLimit, CreatedBy, UpdatedBy)
--VALUES ('One To One', 'This contains all the limits of one to one transfer.', 10.0000, 1.0000, 5.0000, 10, 1, 1)

----------------------------------------------------------------------------------------------------------------------------------
select * from SupportChatGroup where IsActive=1 AND GroupName=NULL order by CreatedDate DESC
select top 10  * from GroupMessage where IsActive=1 AND GroupId=90
select top 100 * from GroupMessageToUser where GroupId=90


select * from SupportChatGroup --WHERE UserWalletId=3112

----ALTER TABLE TransactionPoolDetail
----DROP COLUMN OneTimeLimit;

select top 10 * from Error order by CreatedDate desc

35309

Transaction (Process ID 115) was deadlocked on lock resources with another process and 
has been chosen as the deadlock victim. Rerun the transaction.

----update GroupMessageToUser set GroupId=3 where Id IN (8,9)

----update SupportChatGroup SET GroupName=WalletAddress
----FROM UserWallet 
----WHERE SupportChatGroup.UserWalletId=UserWallet.Id

----update SupportChatGroup SET GroupName='0xCDE70EbA204Dc65A29685774cEE3F13ae053Cd81'
----where UserWalletId=1841

select * from UserWallet WHERE WalletUniqueName IS NOT NULL
----UPDATE UserWallet SET IsReceivePushNotification=1 WHERE IsReceivePushNotification IS NULL


SELECT DISTINCT 
    o.name AS 'Stored Procedure Name'
FROM 
    sys.objects o
INNER JOIN 
    sys.sql_modules m ON o.object_id = m.object_id
WHERE 
    m.definition LIKE '%AllocatedToken%' -- Replace YourColumnName with the name of the column
    AND o.type = 'P' -- Ensure it's a stored procedure
ORDER BY 
    o.name;


	select * from BatchTransactionDetail where CAST(CreatedDate AS DATE)='2024-06-14'

	select SUM(TokenAllocation) from TokenTransaction where 
	BatchId IN ('bd09f941-2e9c-4b57-8d6a-65549ba258dc'
,'6835c39d-5a27-4b9e-a1c7-9552d66afc3f')
	and IsProcessing=1
	select * from MasterTransactionType



;with cte as (
select 
UW.WalletAddress,
BTD.BatchId,
BTD.TransactionHash,
BTD.CreatedDate,
TokenAllocation,
ROW_NUMBER() OVER(Partition by TT.BatchId order by TokenAllocation DESC) AS RowNum
from TokenTransaction TT
join BatchTransactionDetail BTD ON TT.BatchId=BTD.BatchId
join UserWallet UW ON TT.UserWalletId=UW.Id
where BatchTransactionTypeId=1 AND
CAST(BTD.CreatedDate AS DATE)>'2024-05-01' AND BlockchainTransactionStatus=1
)
select * from cte where RowNum<=10


;with cte as( 
select UserWalletId, CreatedDate,
ROW_NUMBER() OVER(Partition By UserWalletId Order By CreatedDate DESC) as RowNum
from TokenTransaction
where UserWalletId IN
(
select 
UW.Id
from [User] DI
JOIN UserWallet UW ON DI.UserWalletId=UW.Id
JOIN DevicesInfo D ON DI.UserWalletId=D.UserWalletId
JOIN TokenHolder TH ON DI.UserWalletId = TH.UserWalletId
)
)

select * from cte where RowNum=1

select * from UserWallet
where CAST(DATEADD(Minute,330,CreatedDate) AS DATE) IN ('2024-08-06','2024-08-07')
order by CreatedDate ASC


select * from UserWallet WHERE WalletAddress='0x6408CC5Aa4e886D197D820C2A3b863a9113f985b'


select 
UW.WalletAddress,
TH.TotalToken,
DI.FullName,
DI.TimeZoneOffset,
DI.TimeZoneOffsetName,
UW.CreatedDate AS WalletCreatedDate,
UW.CreatedDate AS WalletCreatedDate,
DI.CreatedDate,
D.DeviceId,
D.DeviceType,
D.DeviceVersion,
D.BuildVersion,
D.AppVersion
from [User] DI
JOIN UserWallet UW ON DI.UserWalletId=UW.Id
JOIN DevicesInfo D ON DI.UserWalletId=D.UserWalletId
JOIN TokenHolder TH ON DI.UserWalletId = TH.UserWalletId
--where UW.WalletAddress='0x0CB295057ca5aa8F5f59B297bEF9fA085Fdb6bb0'
order by DI.CreatedDate 


--user got 10 tokens in last hour

select * from UserWallet WHERE Id IN (
1458
,3854
,1581
,2704
,4007
,2369
,2115
,4526
,1118
,4660
,1070
,2855
,3684
,1990
,4159
,4057
,4646
,1328
,4653
,1354
,1620
)
select UserWalletId, SUM(TokenAllocation) as token, CreatedDate from TokenTransaction
where CreatedDate >= DATEADD(hour, -7, GETUTCDATE())
group by UserWalletId, CreatedDate
having SUM(TokenAllocation)=10


select SUM(TokenAllocation), 
CAST(DATEADD(Minute,330,CreatedDate) AS DATE) from TokenTransaction
where TransactionTypeId=1 and TransactionStatus=1 and UserWalletId=4636
group by CAST(DATEADD(Minute,330,CreatedDate) AS DATE)
order by CAST(DATEADD(Minute,330,CreatedDate) AS DATE) DESC

select * from [User] where UserWalletId=1304
select top 10* from [User] ORDER BY CreatedDate DESC

select top 10 * from WalletWhiteLabelling ORDER BY CreatedDate DESC

--ALTER TABLE WalletWhiteLabelling
--ADD SiteProfileUrl VARCHAR(MAX) NULL;

--ALTER TABLE WalletWhiteLabelling
--ADD MobileNumber VARCHAR(50) NULL;

				--ALTER TABLE [User]
				--ADD TimeZoneOffsetNames NVARCHAR(500) NULL;

				--update [User] SET TimeZoneOffsetNames=TimeZoneOffsetName

				--ALTER TABLE [User]
				--DROP COLUMN TimeZoneOffsetName;
				
				--EXEC sp_rename 'User.TimeZoneOffsetNames', 'TimeZoneOffsetName', 'COLUMN';






				--INSERT INTO TokenTransaction(  
				--							UserWalletId,   
				--							TokenAllocation,   
				--							AllocatedBy,   
				--							TransactionStatus,  
				--							UpdatedDate, 
				--							CreatedDate,
				--							IsProcessing,  
				--							TransactionTypeId  
				--							)  
				--						VALUES(7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--						      (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 ),
				--							  (7, 200000, 0,1, GETUTCDATE(),GETUTCDATE(),0,3 )




--insert into FAQ(FAQTypeId, Question, Answer)
--VALUES(1, 'Where is sharp token available?', 'The Sharp Token is available to be earned through engaging and 
--              participating with online communities where the Sharp Token is used. 
--			  CSharp Corner is the first online community to feature the token and is retroactively 
--			  rewarding existing users and reputation points through this reward campaign.'),
--(1, 'Which exchanges support the Sharp Token?', 'Sharp Token will be available through our exchange partners.
--             The current exchanges supporting our token are Coinstore and Bitmart starting on June 19th.'),
--(1, 'When will I be able to convert my points into tokens?', 'You can convert your points into tokens now by creating your 
--       Sharp Rewards app in your account dashboard, or through the Android or iOS app. Links are provided below. 
--	   If you already have an existing CSharp Corner account, you will need to take steps to link your CSharp Corner 
--	   account with the wallet.'),
--(1, 'Where can I get the latest updates on the Sharp token?', 'All the latest updates about the Sharp Token are shared 
--     on our social media accounts, as well as our newsletter available through https://www.thesharptoken.com. 
--	  Be sure to subscribe to get access to the latest bonus campaigns and new communities onboarding the Sharp Token economy.'),
--(1, 'When is the cutoff date and time of the bonus 1.5x launch rewards bonus?', 'Exclusive to the CSharp Corner community, 
--     all engagement and activity in the online community completed before August 31, 2024 will receive the launch rewards 
--	 bonus multiplying existing reputation points into Sharp Tokens. This includes activities such as creating posts, 
--	 engaging with posts, and creating content in the online community. 
--This is a limited time offer. All points accrued after August 31, 2024 will no longer benefit from the launch rewards bonus.')

insert into MasterTransactionType(Id, TransactionName, Description) values (12,'Welcome Bonus','These Tokens are given to the user as Welcome Bonus')
SET IDENTITY_INSERT MasterTransactionType  OFF


select * from TokenTransaction where TransactionStatus NOT IN (1,0) order by createdDate DESC
select * from MasterTransactionType
select * from TokenHolder
select * from batchTransactionDetail
select * from AdminUser

select * from DevicesInfo 
select * from UserWallet where Id = 13295 and WalletAddress = '0x819A44750189852E727f2d17702Ea71cbF043083'

select * from UserStepsTransaction  order by CreatedDate DESC

select * from UserNonce
select * from UserRedeemPointsTransaction
select * from WalletWhiteLabelling
select * from BatchTransactionDetail where TransactionHash Like '%0x1b6569fb849210793609b67eb6a0e6832bc707c3792f52212c088d5d40ab2d6a%'

select *  from TransactionPoolDetail


select LinkedEmail from WalletWhiteLabelling where SiteProfileUrl IS NULL AND MobileNumber IS NULL
select SUM(TokenAllocation) from TokenTransaction where UserWalletId = 7

SELECT 
	UW.WalletAddress, 
    SUM(TT.TokenAllocation) AS TotalToken,
    SUM(CASE WHEN TT.TransactionTypeId = 1 THEN TT.TokenAllocation ELSE 0 END) AS Step,
	SUM(CASE WHEN TT.TransactionTypeId = 11 THEN TT.TokenAllocation ELSE 0 END) AS Referral
FROM 
    TokenTransaction AS TT
	LEFT JOIN UserWallet AS UW ON TT.UserWalletId = UW.Id
WHERE 
    TT.TransactionTypeId IN (1, 11)
GROUP BY 
    UW.WalletAddress
ORDER BY 
    TotalToken DESC;

select UW.WalletAddress, TT.TokenAllocation
from TokenTransaction AS TT
LEFT JOIN UserWallet AS UW ON TT.UserWalletId = UW.Id
where IsProcessing = 0 and TransactionStatus = 1

select * from UserWallet order by CreatedDate DESC 
select * from DevicesInfo where UserWalletId = 13276
select * from UserReferral 

select * from WalletWhiteLabelling where IsActive = 1
select UserWalletId from TokenTransaction where TransactionTypeId = 3
select * from TokenTransaction where Id = 12740

select TT.UserWalletId,WWL.LinkedEmail from TokenTransaction TT
LEFT JOIN WalletWhiteLabelling WWL ON TT.UserWalletID = WWL.UserWalletId 
where TransactionTypeId = 3 and IsActive = 1 


UPDATE TokenTransaction
SET ActiveWhiteLabellingId = WalletWhiteLabelling.Id
FROM TokenTransaction
JOIN WalletWhiteLabelling
ON TokenTransaction.UserWalletId = WalletWhiteLabelling.UserWalletId and IsActive = 1
where TransactionTypeId = 3

select top 100 * from Error order by CreatedDate DESC

select * from UserRedeemPointsTransaction

select top 1000 Nonce,BlockchainTransactionStatus, * from BatchTransactionDetail order by ID DESC