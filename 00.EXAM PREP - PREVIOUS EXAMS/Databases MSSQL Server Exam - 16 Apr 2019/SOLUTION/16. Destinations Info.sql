   SELECT f.Destination, 
          COUNT(t.Id) AS FilesCount
     FROM Flights AS f
LEFT JOIN Tickets AS t ON t.FlightId = f.Id
 GROUP BY f.Destination
 ORDER BY FilesCount DESC, f.Destination
  

 