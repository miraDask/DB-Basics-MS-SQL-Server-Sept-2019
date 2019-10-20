CREATE FUNCTION udf_ExamGradesToUpdate (@studentId INT, @grade DEC(3,2))
        RETURNS NVARCHAR(70)
		     AS 
		  BEGIN
		DECLARE @count INT = ( SELECT COUNT(se.Grade) 
		                         FROM Students AS s
								 JOIN StudentsExams AS se ON se.StudentId = s.Id
								WHERE s.Id = @studentId 
								       AND se.Grade BETWEEN @grade AND @grade + 0.50 )  

	   DECLARE @studentFirstName NVARCHAR(30) = (SELECT s.FirstName 
		                                           FROM Students AS s
								                  WHERE s.Id = @studentId)

			 IF (@studentFirstName IS NULL)
		  BEGIN
		        RETURN 'The student with provided id does not exist in the school!'
		    END
		    
			 IF (@grade > 6.00)
		  BEGIN
		        RETURN 'Grade cannot be above 6.00!'
		    END
		  
		 RETURN CONCAT('You have to update ',@count , ' grades for the student ' ,@studentFirstName)
		   
			END