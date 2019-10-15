CREATE PROC usp_AssignProject(@emloyeeId INT, @projectID INT)
AS
BEGIN TRANSACTION
		INSERT INTO EmployeesProjects
		VALUES (@emloyeeId, @projectID)

        IF(( SELECT COUNT(ep.ProjectID) 
	           FROM EmployeesProjects AS ep 
		      WHERE ep.EmployeeID = @emloyeeId ) > 3) 
		BEGIN
			ROLLBACK
			RAISERROR('The employee has too many projects!', 16, 1)
			RETURN 
		END
COMMIT 