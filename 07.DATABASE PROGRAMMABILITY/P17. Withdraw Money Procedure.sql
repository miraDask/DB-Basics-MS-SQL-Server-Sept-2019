CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DEC(16, 4)) 
        AS
	 BEGIN 
			 BEGIN TRANSACTION 
			       IF(EXISTS(
				      SELECT * 
					    FROM Accounts AS a
					   WHERE a.Id IS NULL))
				   BEGIN
				         ROLLBACK
						 RAISERROR('Account does not exists.', 16, 1)
						 RETURN 
				     END
				  
				  IF (@MoneyAmount < 0)
				  BEGIN
				        ROLLBACK
						RAISERROR('Amount of money should be positiv.', 16, 1)
						RETURN
				    END

				UPDATE Accounts 
				   SET Balance -= @MoneyAmount
			 COMMIT
	   END