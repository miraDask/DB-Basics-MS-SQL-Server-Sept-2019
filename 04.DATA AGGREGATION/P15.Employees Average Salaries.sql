 SELECT *
 INTO EmployeeWithSalaryOver30000
 FROM Employees AS e
 WHERE e.Salary > 30000

 DELETE 
   FROM EmployeeWithSalaryOver30000
  WHERE ManagerID = 42 

 UPDATE EmployeeWithSalaryOver30000
    SET Salary += 5000
  WHERE DepartmentID = 1

  SELECT DepartmentID,
         AVG(Salary) AS AverageSalary
    FROM EmployeeWithSalaryOver30000
GROUP BY DepartmentID