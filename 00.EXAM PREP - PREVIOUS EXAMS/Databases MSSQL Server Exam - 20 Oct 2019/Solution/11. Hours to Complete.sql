CREATE FUNCTION udf_HoursToComplete(@StartDate DATETIME2, @EndDate DATETIME2) 
        RETURNS INT
		     AS
		  BEGIN
		 IF(@StartDate IS NULL OR @EndDate IS NULL)
		 RETURN 0
		 
		 RETURN DATEDIFF(HOUR, @StartDate, @EndDate)
		 END

--TEST
--SELECT dbo.udf_HoursToComplete(OpenDate, CloseDate) AS TotalHours FROM Reports
