  SELECT TOP(10)
         e.FirstName,
         e.LastName,
		 e.DepartmentID
    FROM Employees AS e
   WHERE Salary > (  SELECT AVG(emp.Salary)
                       FROM Employees AS emp
					  WHERE e.DepartmentID = emp.DepartmentID
				   GROUP BY emp.DepartmentID
				   )
  ORDER BY e.DepartmentID
