CREATE PROC usp_GetTownsStartingWith (@StartOfTownName VARCHAR(30))
         AS
	 DECLARE @CountOfLetters INT = LEN(@StartOfTownName)

	 SELECT [Name]
	   FROM Towns
	  WHERE LEFT([Name], @CountOfLetters) = @StartOfTownName