CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(50))
        RETURNS TABLE
		     AS
		 RETURN (
		 SELECT SUM(t.Cash) AS SumCash
		   FROM (
		         SELECT g.Id,
				        g.[Name] AS GameName,
	        	        ug.Cash AS Cash,
	        			DENSE_RANK() OVER (PARTITION BY g.Id ORDER BY ug.Cash DESC ) AS [Rank]
	        	   FROM Games AS g
	        	   JOIN UsersGames AS ug ON ug.GameId = g.Id
	           GROUP BY g.Id,g.[Name], ug.Cash) AS t 
	      WHERE @gameName = t.GameName AND t.[Rank] % 2 = 1 ) 
		    