CREATE TABLE Persons(
			 PersonID INT PRIMARY KEY IDENTITY(1,1),
			 FirstName NVARCHAR(30) NOT NULL,
			 Salary DEC(7,2) NOT NULL,
			 PassportID INT
)

CREATE TABLE Passports(
			 PassportID INT PRIMARY KEY IDENTITY(101, 1),
			 PassportNumber CHAR(8)
)

ALTER TABLE Persons
  ADD CONSTRAINT FK_Persons_PasportId
  FOREIGN KEY (PassportID) 
  REFERENCES Passports(PassportID)  

INSERT INTO Passports(PassportNumber) VALUES
            ('N34FG21B'),
			('K65LO4R7'),
			('ZE657QP2')

INSERT INTO Persons(FirstName, Salary, PassportID) VALUES
            ('Roberto', 43300.00, 102),
            ('Tom', 56100.00, 103),
            ('Yana', 60200.00, 101)