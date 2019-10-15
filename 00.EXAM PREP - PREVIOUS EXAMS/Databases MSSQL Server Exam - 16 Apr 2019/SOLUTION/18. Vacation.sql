CREATE FUNCTION udf_CalculateTickets(@origin NVARCHAR(50), @destination NVARCHAR(50), @peopleCount INT) 
RETURNS VARCHAR(30)
AS
BEGIN
IF (@peopleCount <= 0)
RETURN 'Invalid people count!'
IF((SELECT Id
      FROM  Flights
	 WHERE Origin = @origin AND Destination = @destination) IS NULL)
RETURN 'Invalid flight!'

RETURN (SELECT  CONCAT('Total price ', t.Price * @peopleCount)
          FROM  Flights AS f
		  JOIN  Tickets AS t ON t.FlightId = f.Id
	     WHERE f.Origin = @origin AND f.Destination = @destination) 
END