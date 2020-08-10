 SELECT  FirstName + ' ' + LastName AS FullName 
   FROM Mechanics
  WHERE MechanicId NOT IN 
       (SELECT m.MechanicId
       FROM Mechanics AS m
       LEFT JOIN Jobs AS j ON j.MechanicId = m.MechanicId
       WHERE j.Status != 'Finished'   
       GROUP BY m.MechanicId, m.FirstName, m.LastName)
ORDER BY MechanicId