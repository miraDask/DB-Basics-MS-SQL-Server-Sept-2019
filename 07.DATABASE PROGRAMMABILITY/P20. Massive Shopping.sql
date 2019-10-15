DECLARE @firstItemsGroupStartLevel INT = 11
DECLARE @firstItemsGroupFinalLevel INT = 12
DECLARE @secondItemsGroupStartLevel INT = 19
DECLARE @secondItemsGroupFinalLevel INT = 21
DECLARE @userGameId INT = ( SELECT ug.Id
                            FROM Users AS u
						    JOIN UsersGames AS ug ON ug.UserId = u.Id
							JOIN Games AS g ON g.Id  = ug.GameId
						   WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower')  

DECLARE @userCash MONEY 
DECLARE @itemsPrice MONEY
DECLARE @itemId INT

  BEGIN TRANSACTION
		     SET @itemsPrice = (SELECT SUM(i.Price)
		                         FROM Items AS i
				     		    WHERE i.MinLevel BETWEEN @firstItemsGroupStartLevel AND @firstItemsGroupFinalLevel)

			 SET  @userCash = ( SELECT ug.Cash
                                  FROM Users AS u
						          JOIN UsersGames AS ug ON ug.UserId = u.Id
							      JOIN Games AS g ON g.Id  = ug.GameId
						         WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower')


		      IF(@itemsPrice <= @userCash)
			  BEGIN
		            INSERT INTO UserGameItems (ItemId, UserGameId) 
			        SELECT i.Id,
					       @userGameId
					  FROM Items AS i
					 WHERE i.MinLevel BETWEEN @firstItemsGroupStartLevel AND @firstItemsGroupFinalLevel

		            UPDATE UsersGames
			           SET Cash -= @itemsPrice
			         WHERE Id = @userGameId 
			 END
     COMMIT
  
   BEGIN TRANSACTION
		     SET @itemsPrice = (SELECT SUM(i.Price)
		                         FROM Items AS i
				     		    WHERE i.MinLevel BETWEEN @secondItemsGroupStartLevel AND @secondItemsGroupFinalLevel)

			 SET  @userCash = ( SELECT ug.Cash
                                  FROM Users AS u
						          JOIN UsersGames AS ug ON ug.UserId = u.Id
							      JOIN Games AS g ON g.Id  = ug.GameId
						         WHERE u.Username = 'Stamat' AND g.[Name] = 'Safflower')


		      IF(@itemsPrice <= @userCash)
			  BEGIN
		            INSERT INTO UserGameItems (ItemId, UserGameId) 
			        SELECT i.Id,
					       @userGameId
					  FROM Items AS i
					 WHERE i.MinLevel BETWEEN @secondItemsGroupStartLevel AND @secondItemsGroupFinalLevel

		            UPDATE UsersGames
			           SET Cash -= @itemsPrice
			         WHERE Id = @userGameId 
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
 