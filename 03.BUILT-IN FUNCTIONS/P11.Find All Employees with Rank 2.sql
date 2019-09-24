  SELECT * 
    FROM 
	   (
		SELECT EmployeeID,
	           FirstName,
	           LastName,
	           Salary,
	           DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
          FROM Employees 
         WHERE Salary BETWEEN 10000 AND 50000 
	   ) 
	  AS  RankedEmployees
   WHERE RankedEmployees.[Rank] = 2
ORDER BY Salary DESC

