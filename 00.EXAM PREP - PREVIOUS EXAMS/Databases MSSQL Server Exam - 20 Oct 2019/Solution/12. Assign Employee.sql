CREATE PROC usp_AssignEmployeeToReport(@EmployeeId INT, @ReportId INT)
        AS
     BEGIN
	       DECLARE @employeeDepartmentId INT = (SELECT DepartmentId
		                                          FROM Employees
												 WHERE Id = @EmployeeId)
		   
		   DECLARE @departmentId INT = (SELECT c.DepartmentId
		                                  FROM Reports AS r
										  JOIN Categories AS c ON c.Id = r.CategoryId
										 WHERE r.Id = @ReportId) 
		                                       
           BEGIN TRANSACTION

		   IF(@employeeDepartmentId <> @departmentId)
		   BEGIN
				   ROLLBACK
				   RAISERROR ('Employee doesn''t belong to the appropriate department!', 16, 1) 
				   RETURN
		     END

			 UPDATE Reports
			    SET EmployeeId = @EmployeeId
			  WHERE Id = @ReportId
		   COMMIT
	   END