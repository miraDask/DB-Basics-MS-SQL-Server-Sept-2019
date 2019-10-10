CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(50) , @word NVARCHAR(50))
                RETURNS BIT
              AS 
		   BEGIN
			     DECLARE @index INT = 1
			     DECLARE @pattern NVARCHAR(MAX) 
				   WHILE (@index <= LEN(@word))
				   BEGIN
				     SET  @pattern = '%' + SUBSTRING(@word, @index, 1) + '%'
				     
					 IF @setOfLetters NOT LIKE @pattern 
				  BEGIN
			     RETURN 0
					END
				    SET @index += 1
					 END
		  RETURN 1
             END