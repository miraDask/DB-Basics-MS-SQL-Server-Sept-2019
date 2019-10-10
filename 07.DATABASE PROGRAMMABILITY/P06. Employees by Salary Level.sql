CREATE PROC usp_EmployeesBySalaryLevel (@LevelOfSalary NVARCHAR(10))
         AS
	 SELECT e.FirstName,
	        e.LastName
	   FROM Employees AS e
	  WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @LevelOfSalary 