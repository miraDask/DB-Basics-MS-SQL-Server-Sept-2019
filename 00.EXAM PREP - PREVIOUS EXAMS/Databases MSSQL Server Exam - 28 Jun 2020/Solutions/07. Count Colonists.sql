SELECT COUNT(*) as count
  FROM Colonists as c
  JOIN TravelCards AS t ON t.ColonistId = c.Id
  JOIN Journeys AS j ON j.Id = t.JourneyId
  WHERE j.Purpose = 'Technical'
  
   