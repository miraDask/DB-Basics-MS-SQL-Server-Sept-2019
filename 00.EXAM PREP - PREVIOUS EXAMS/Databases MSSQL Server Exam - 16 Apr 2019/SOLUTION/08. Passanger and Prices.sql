SELECT TOP(10)
       p.FirstName,
       p.LastName,
	   t.Price 
  FROM Passengers AS p
  LEFT JOIN Tickets AS t ON t.PassengerId = p.Id  
 ORDER BY t.Price DESC, p.FirstName, p.LastName