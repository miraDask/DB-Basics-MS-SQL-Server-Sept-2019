SELECT p.FirstName,
       p.LastName,
	   p.Age
  FROM Passengers AS p
  LEFT JOIN Tickets AS t ON t.PassengerId = p.Id
  LEFT JOIN Flights AS f ON f.Id = t.FlightId
 WHERE t.PassengerId IS NULL
 ORDER BY p.Age DESC, p.FirstName, p.LastName