CREATE TABLE Deleted_Employees(
             EmployeeId INT PRIMARY KEY IDENTITY, 
			 FirstName NVARCHAR(50) NOT NULL,
			 LastName NVARCHAR(50) NOT NULL, 
			 MiddleName NVARCHAR(50),
			 JobTitle NVARCHAR(50) NOT NULL, 
			 DepartmentId INT NOT NULL,
			 Salary MONEY NOT NULL)

GO

CREATE TRIGGER tr_DeleteEmplpyee 
            ON Employees FOR DELETE
            AS
   INSERT INTO Deleted_Employees
        SELECT FirstName, 
		        LastName, 
				MiddleName, 
				JobTitle, 
				DepartmentID, 
				Salary 
		  FROM deleted