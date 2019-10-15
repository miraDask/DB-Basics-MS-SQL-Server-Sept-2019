CREATE PROC usp_CancelFlights
AS
UPDATE Flights
   SET DepartureTime = NULL, ArrivalTime = NULL
 WHERE DATEDIFF(HOUR, ArrivalTime, DepartureTime) < 0