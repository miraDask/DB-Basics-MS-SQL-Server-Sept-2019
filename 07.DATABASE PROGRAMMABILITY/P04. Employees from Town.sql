CREATE PROC usp_GetEmployeesFromTown (@TownName NVARCHAR(30))
         AS
     SELECT e.FirstName,
	        e.LastName 
       FROM Towns AS t
       JOIN Addresses AS a ON a.TownID = t.TownID
       JOIN Employees AS e ON e.AddressID = a.AddressID
      WHERE t.[Name] = @TownName 
