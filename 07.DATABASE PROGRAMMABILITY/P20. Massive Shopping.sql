DECLARE @firstItemsGroupStartId INT = 11
DECLARE @firstItemsGroupFinalId INT = 12
DECLARE @secondItemsGroupStartId INT = 19
DECLARE @secondItemsGroupFinalId INT = 21
DECLARE @userGameId INT = ( SELECT ug.Id
                            FROM Users AS u
						    JOIN UsersGames AS ug ON ug.UserId = u.Id
							JOIN Games AS g ON g.Id  = ug.GameId
						   WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower')  

DECLARE @userCash MONEY = ( SELECT ug.Cash
                            FROM Users AS u
						    JOIN UsersGames AS ug ON ug.UserId = u.Id
							JOIN Games AS g ON g.Id  = ug.GameId
						   WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower')
DECLARE @itemPrice MONEY

  BEGIN TRANSACTION
        WHILE (@firstItemsGroupStartId <= @firstItemsGroupFinalId)
		BEGIN

		     SET @itemPrice = (SELECT i.Price
		                         FROM Items AS i
				     		    WHERE i.Id = @firstItemsGroupStartId)

		      IF(@itemPrice <= @userCash)
			  BEGIN
		            INSERT INTO UserGameItems (ItemId, UserGameId) 
			        VALUES (@firstItemsGroupStartId, @userGameId)

		            UPDATE UsersGames
			           SET Cash -= @itemPrice
			         WHERE Id = @userGameId 
			 END
			ELSE
		   BEGIN
                 ROLLBACK
				 RAISERROR('Not enough cash', 16, 1)
				 RETURN
			END
			SET @firstItemsGroupStartId += 1
		END	
     COMMIT
  
  BEGIN TRANSACTION
        WHILE (@secondItemsGroupStartId <= @secondItemsGroupFinalId)
		BEGIN

		     SET @itemPrice = (SELECT i.Price
		                      FROM Items AS i
				     		 WHERE i.Id = @secondItemsGroupStartId)

		      IF(@itemPrice <= @userCash)
			  BEGIN
		            INSERT INTO UserGameItems (ItemId, UserGameId) 
			        VALUES (@secondItemsGroupStartId, @userGameId)

		            UPDATE UsersGames
			           SET Cash -= @itemPrice
			         WHERE Id = @userGameId 
			 END
			ELSE
		   BEGIN
                 ROLLBACK
				 RAISERROR('Not enough cash', 16, 1)
				 RETURN
			END
		    SET @secondItemsGroupStartId += 1
		END	
     COMMIT

    SELECT i.[Name]
      FROM Games g
      JOIN UsersGames ug ON ug.GameId = g.Id
      JOIN Users u ON u.Id = ug.UserId
      JOIN UserGameItems AS ugs ON ugs.UserGameId = ug.Id
      JOIN Items AS i ON i.Id = ugs.ItemId 
     WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower'
  ORDER BY i.[Name]
 