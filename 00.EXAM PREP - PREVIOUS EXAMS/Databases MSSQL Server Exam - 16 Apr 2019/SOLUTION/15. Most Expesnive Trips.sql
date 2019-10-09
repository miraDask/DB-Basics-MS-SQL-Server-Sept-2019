 SELECT FirstName AS [First Name],
        LastName AS [Last Name],
	    Destination,
	    Price
   FROM   
        (
			SELECT p.Id,
			       p.FirstName,
				   p.LastName,
				   f.Destination,
				   t.Price,
                   DENSE_RANK() OVER(PARTITION BY p.Id ORDER BY t.Price DESC)  AS [Rank]
              FROM Passengers AS p
              JOIN Tickets AS t ON t.PassengerId = p.Id
              JOIN Flights AS f ON f.Id = t.FlightId
	    ) 
	 AS MostExpensiveTrip
  WHERE MostExpensiveTrip.[Rank] = 1
  ORDER BY Price DESC, FirstName, LastName, Destination
  