CREATE TRIGGER  tr_newSumOfBalance ON Accounts FOR UPDATE
            AS
   INSERT INTO Logs (AccountId, OldSum, NewSum) 
		SELECT d.Id,
		       d.Balance,
			   i.Balance
		  FROM deleted AS d
		  JOIN inserted AS i ON i.AccountHolderId = d.AccountHolderId