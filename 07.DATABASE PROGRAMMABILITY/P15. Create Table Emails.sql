CREATE TABLE NotificationEmails(
            Id INT PRIMARY KEY IDENTITY,
			  Recipient INT FOREIGN KEY REFERENCES Accounts(Id) ,
			  [Subject] NVARCHAR(60),
			  Body NVARCHAR(60)) 

GO

CREATE TRIGGER tr_CreateEmail ON Logs FOR INSERT
            AS 
   INSERT INTO  NotificationEmails 
        SELECT i.AccountId,
		       CONCAT('Balance change for account: ', i.AccountId),
			   CONCAT('On ', GETDATE() ,' your balance was changed from ', i.OldSum, ' to ' , i.NewSum, ' .')
		  FROM Logs AS l
		  JOIN inserted AS i ON i.AccountId = l.AccountId


