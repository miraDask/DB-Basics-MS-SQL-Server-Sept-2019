CREATE PROCEDURE usp_ExcludeFromSchool(@StudentId INT)
              AS
		   BEGIN
		        BEGIN TRANSACTION
				   IF ((SELECT Id FROM Students WHERE Id = @StudentId) IS NULL)
				   BEGIN
				      ROLLBACK
					  RAISERROR ('This school has no student with the provided id!', 16, 1)
					  RETURN
				   END

				   DELETE FROM StudentsExams
				    WHERE StudentId = @StudentId

				   DELETE FROM StudentsSubjects
				    WHERE StudentId = @StudentId

				   DELETE FROM StudentsTeachers
				    WHERE StudentId = @StudentId

				    DELETE FROM Students
				    WHERE Id = @StudentId
				 COMMIT  
				
		     END


			 