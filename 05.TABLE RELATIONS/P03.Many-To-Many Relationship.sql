CREATE TABLE Students(
			 StudentID INT PRIMARY KEY IDENTITY(1, 1),
			 [Name] NVARCHAR(50) NOT NULL
)

INSERT INTO Students([Name]) VALUES
            ('Mila'),
			('Toni'),
			('Ron')

CREATE TABLE Exams(
			 ExamID INT PRIMARY KEY IDENTITY(101, 1),
			 [Name] NVARCHAR(50) NOT NULL
)

INSERT INTO Exams([Name]) VALUES
            ('SpringMVC'),
			('Neo4j'),
			('Oracle 11g')


CREATE TABLE StudentsExams(
             StudentID INT, 
			 ExamID INT 

			 CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID),
			 CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
			 CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)

)


INSERT INTO StudentsExams(StudentID, ExamID) VALUES
            (1, 101),
			(1, 102),
			(2, 101),
			(3, 103),
			(2, 102),
			(2, 103)