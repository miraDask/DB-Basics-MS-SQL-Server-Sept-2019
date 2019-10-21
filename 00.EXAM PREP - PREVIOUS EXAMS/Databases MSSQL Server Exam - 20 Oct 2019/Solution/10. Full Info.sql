   SELECT CASE
             WHEN e.FirstName IS NULL
			 THEN 'None'
			 ELSE CONCAT(e.FirstName, ' ', e.LastName) 
		  END AS Employee,
          d.[Name] AS Department,
		  c.[Name] AS Category,
		  r.[Description],
		  FORMAT(r.OpenDate, 'dd.MM.yyyy') AS OpenDate,
		  s.Label AS [Status],
		  u.[Name] AS [User]
     FROM Reports AS r
LEFT JOIN Employees AS e ON e.Id = r.EmployeeId
LEFT JOIN Categories AS c ON c.Id = r.CategoryId
LEFT JOIN Departments AS d ON d.Id = c.DepartmentId
LEFT JOIN Users AS u ON u.Id = r.UserId
LEFT JOIN [Status] AS s ON s.Id = r.StatusId
 ORDER BY e.FirstName DESC, 
          e.LastName DESC,
		  Department, Category, r.[Description], OpenDate, [Status], [User]