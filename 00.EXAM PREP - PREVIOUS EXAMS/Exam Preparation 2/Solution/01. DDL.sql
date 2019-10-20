--CREATE DATABASE School

--USE School

CREATE TABLE Students(
             Id INT PRIMARY KEY IDENTITY,
             FirstName NVARCHAR(30) NOT NULL,
             MiddleName NVARCHAR(25),
             LastName NVARCHAR(30) NOT NULL,
             Age TINYINT,
             [Address] NVARCHAR(50),
             Phone NCHAR(10),
			 CONSTRAINT CHK_Age CHECK (Age > 0)
)

---

CREATE TABLE Subjects(
             Id INT PRIMARY KEY IDENTITY,
             [Name] NVARCHAR(20) NOT NULL,
             Lessons TINYINT NOT NULL
)

---

CREATE TABLE StudentsSubjects(
             Id INT PRIMARY KEY IDENTITY,
             StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
             SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL,
             Grade DEC(3,2) CHECK (Grade BETWEEN 2 AND 6) NOT NULL
)

---

CREATE TABLE Exams(
             Id INT PRIMARY KEY IDENTITY,
             [Date] DATETIME2,
             SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL,
)

---

CREATE TABLE StudentsExams(
             StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
             ExamId INT FOREIGN KEY REFERENCES Exams(Id) NOT NULL,
             Grade  DEC(3,2) CHECK (Grade BETWEEN 2 AND 6) NOT NULL, 
			 CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentId, ExamId)
)

---
CREATE TABLE Teachers(
              Id INT PRIMARY KEY IDENTITY,
              FirstName NVARCHAR(20) NOT NULL,
              LastName NVARCHAR(20) NOT NULL,
              [Address] NVARCHAR(20) NOT NULL,
              Phone NCHAR(10),
              SubjectId INT FOREIGN KEY REFERENCES Subjects(Id) NOT NULL
)

CREATE TABLE StudentsTeachers(
             StudentId INT FOREIGN KEY REFERENCES Students(Id) NOT NULL,
             TeacherId INT FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
			 CONSTRAINT PK_StudentsTeachers PRIMARY KEY (StudentId, TeacherId)
)
