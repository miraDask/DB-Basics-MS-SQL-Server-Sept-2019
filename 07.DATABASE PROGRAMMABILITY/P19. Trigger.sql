CREATE OR ALTER TRIGGER tr_ItemRestricter ON UserGameItems FOR INSERT
            AS
			IF (EXISTS (SELECT * 
                          FROM UsersGames AS ug
                          JOIN inserted AS ins ON ug.Id = ins.UserGameId
                          JOIN Items AS i ON i.Id = ins.ItemId
						 WHERE i.MinLevel > ug.[Level]))
				BEGIN
				      ROLLBACK
					  RAISERROR('Item level cannot be higher than character level', 16, 1)
				      RETURN
				  END

GO


UPDATE UsersGames
   SET Cash += 50000
 WHERE UserId IN (
                 SELECT ug.UserId
                   FROM Games g
                   JOIN UsersGames ug ON ug.GameId = g.Id
                   JOIN Users u ON u.Id = ug.UserId
                  WHERE g.[Name] = 'Bali' 
                    AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))

GO

CREATE PROC usp_BuyItem (@itemId INT, @userGameId INT)
         AS 
	  BEGIN
	        INSERT INTO UserGameItems (ItemId, UserGameId) 
			     VALUES (@itemId, @userGameId)

		    UPDATE UsersGames
			   SET Cash -= (SELECT i.Price
			                  FROM Items i 
							 WHERE i.Id = @itemId)
			 WHERE Id = @userGameId  
	    END

GO


DECLARE @firstItemsGroupStartId INT = 251
DECLARE @firstItemsGroupFinalId INT = 299
DECLARE @secondItemsGroupStartId INT = 501
DECLARE @secondItemsGroupFinalId INT = 539
DECLARE @id INT
DECLARE @getid CURSOR
SET @getid  = CURSOR FOR
              SELECT DISTINCT ug.Id 
                FROM Users u 
                JOIN UsersGames ug ON ug.UserId = u.Id
                JOIN Games g ON g.Id = ug.GameId
			   JOIN UserGameItems AS ugs ON ugs.UserGameId = ug.Id
                JOIN Items AS i ON i.Id = ugs.ItemId 
               WHERE g.[Name] = 'Bali' 
                 AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')

  WHILE (@firstItemsGroupStartId <= @firstItemsGroupFinalId)
  BEGIN
         OPEN @getid
		 FETCH NEXT 
		  FROM @getid INTO @id 
         WHILE (@@FETCH_STATUS = 0) 
		 BEGIN
		       BEGIN TRY
                     EXEC dbo.usp_BuyItem @firstItemsGroupStartId, @id
		         END TRY
		       BEGIN CATCH
		         END CATCH
         FETCH NEXT 
		  FROM @getid INTO @id 
		   END
    	 CLOSE @getid
		   SET @firstItemsGroupStartId += 1
    END

	WHILE (@secondItemsGroupStartId <= @secondItemsGroupFinalId)
  BEGIN
         OPEN @getid
		 FETCH NEXT 
		  FROM @getid INTO @id 
         WHILE (@@FETCH_STATUS = 0) 
		 BEGIN
		       BEGIN TRY
                     EXEC dbo.usp_BuyItem @secondItemsGroupStartId, @id
		         END TRY
		       BEGIN CATCH
		         END CATCH
	     FETCH NEXT 
		  FROM @getid INTO @id 
		   END

         CLOSE @getid
	  	   SET @secondItemsGroupStartId += 1
    END

GO

 SELECT u.Username,
        g.[Name],
		ug.Cash,
		i.[Name] AS [Item Name]
   FROM Games g
   JOIN UsersGames ug ON ug.GameId = g.Id
   JOIN Users u ON u.Id = ug.UserId
   JOIN UserGameItems AS ugs ON ugs.UserGameId = ug.Id
   JOIN Items AS i ON i.Id = ugs.ItemId 
  WHERE g.[Name] = 'Bali' 
  ORDER BY u.Username, [Item Name]

	          
	      













 