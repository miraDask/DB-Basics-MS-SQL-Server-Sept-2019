--CREATE DATABASE University

CREATE TABLE Majors(
             MajorID INT PRIMARY KEY IDENTITY,
			 [Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Students(
             StudentID INT PRIMARY KEY IDENTITY,
			 StudentNumber INT NOT NULL,
			 StudentName NVARCHAR(50) NOT NULL,
			 MajorID INT NOT NULL FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
			 PaymentID INT PRIMARY KEY IDENTITY,
			 PaymentDate DATE NOT NULL,
			 PaymentAmount DEC(7, 2) NOT NULL,
			 StudentID INT NOT NULL FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects(
             SubjectID INT PRIMARY KEY IDENTITY,
			 SubjectName NVARCHAR(50) NOT NULL
)

CREATE TABLE Agenda(
             StudentID INT NOT NULL FOREIGN KEY REFERENCES Students(StudentID),
             SubjectID INT NOT NULL FOREIGN KEY REFERENCES Subjects(SubjectID)

			 CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)