SELECT p.FirstName,
       p.LastName,
	   COUNT(t.PassengerId) AS [Total Trips]
  FROM Passengers AS p
  LEFT JOIN Tickets AS t ON t.PassengerId = p.Id
 GROUP BY p.FirstName, p.LastName
 ORDER BY [Total Trips] DESC, p.FirstName, p.LastName