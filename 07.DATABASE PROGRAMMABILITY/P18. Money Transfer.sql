CREATE PROC usp_TransferMoney(@SenderId INT, @ReceiverId INT, @Amount DEC(16,4))
         AS
	  BEGIN
	          BEGIN TRANSACTION
			DECLARE @sender INT = (SELECT a.Id FROM Accounts AS a WHERE a.Id = @SenderId)
			DECLARE @receiver INT = (SELECT a.Id FROM Accounts AS a WHERE a.Id = @ReceiverId)

			     IF (@sender IS NULL OR @receiver IS NULL )
			  BEGIN
			         ROLLBACK
					 RAISERROR('Invalid Amount of money', 16, 1)
					 RETURN
			    END
			    
				EXEC dbo.usp_WithdrawMoney @SenderId, @Amount
				EXEC dbo.usp_DepositMoney @ReceiverId, @Amount
				COMMIT
	    END 