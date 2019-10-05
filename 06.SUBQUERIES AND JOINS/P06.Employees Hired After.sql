	SELECT e.FirstName,
		   e.LastName,
		   e.HireDate,
		   d.[Name] AS DeptName
	  FROM Employees AS e
	  JOIN Departments AS d ON e.DepartmentID = d.DepartmentID 
	   AND d.[Name] IN ('Finance', 'Sales')
	 WHERE e.HireDate > '1999-01-01'
  ORDER BY e.HireDate