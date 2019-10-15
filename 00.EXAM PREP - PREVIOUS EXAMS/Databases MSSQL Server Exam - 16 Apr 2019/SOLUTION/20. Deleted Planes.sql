CREATE TABLE DeletedPlanes (
             Id INT NOT NULL,
			 [Name] NVARCHAR(30) NOT NULL,
			 Seats INT NOT NULL,
			 [Range] INT NOT NULL)

GO

CREATE TRIGGER tr_DeletedPlane 
            ON Planes FOR DELETE
            AS
		INSERT INTO DeletedPlanes
		SELECT *
		  FROM deleted 