SELECT lt.[Type],
       COUNT(p.Id)
  FROM LuggageTypes AS lt
  JOIN Luggages AS l ON l.LuggageTypeId = lt.Id
  JOIN Passengers AS p ON p.Id = l.PassengerId
 GROUP BY lt.[Type]
 ORDER BY COUNT(p.Id) DESC, lt.[Type]
