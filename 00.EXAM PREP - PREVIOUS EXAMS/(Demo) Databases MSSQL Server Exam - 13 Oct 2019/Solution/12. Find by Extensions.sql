  CREATE PROC usp_FindByExtension(@extension NVARCHAR(30))
           AS
		BEGIN
		      SELECT Id,
                     Name,
		             CONCAT(Size, 'KB') AS Size
                FROM Files
               WHERE Name LIKE '%' + @extension
            ORDER BY Id, Name, Size DESC
		RETURN
		  END