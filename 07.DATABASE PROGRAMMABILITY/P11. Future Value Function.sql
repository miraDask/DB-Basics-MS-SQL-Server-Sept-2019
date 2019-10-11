CREATE FUNCTION ufn_CalculateFutureValue (@sum DEC(10,4), @yearlyInterestRate FLOAT, @numberOfYears INT)
        RETURNS DEC(10,4)
		     AS
		  BEGIN
		        RETURN ROUND(@sum * POWER(1 + @yearlyInterestRate, @numberOfYears), 4)
		    END

