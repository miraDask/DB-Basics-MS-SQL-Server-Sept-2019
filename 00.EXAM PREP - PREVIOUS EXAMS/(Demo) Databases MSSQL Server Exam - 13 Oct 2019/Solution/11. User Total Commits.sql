CREATE FUNCTION udf_UserTotalCommits(@username NVARCHAR(30)) 
        RETURNS INT
             AS
		  BEGIN
		DECLARE @countOfCommits INT = CAST((
			           SELECT COUNT(c.Id)
			             FROM Users AS u
				         LEFT JOIN Commits AS c ON c.ContributorId = u.Id
			            WHERE u.Username = @username
				        GROUP BY u.Id ) AS INT)

			    IF (@countOfCommits IS NULL)
			    BEGIN
			    SET @countOfCommits = 0
			    END
		        RETURN @countOfCommits
		    END 
