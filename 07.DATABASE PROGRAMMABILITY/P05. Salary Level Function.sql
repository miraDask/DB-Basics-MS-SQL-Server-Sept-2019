CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
        RETURNS NVARCHAR(10)
		     AS
		  BEGIN
		        DECLARE @levelOfSalary NVARCHAR(10)
				     IF ( @salary < 30000)
				        BEGIN
				        		SET @levelOfSalary = 'Low' 
				          END
			    ELSE IF (@salary > 50000)
			            BEGIN
						      SET @levelOfSalary = 'High'
						  END
				   ELSE 
				        BEGIN
						      SET @levelOfSalary = 'Average'
						  END

				RETURN @levelOfSalary
		    END