SELECT p.Name AS PlanetName,
	   COUNT(j.Id) AS JourneysCount
  FROM Planets AS p
  JOIN Spaceports AS sr ON p.Id = sr.PlanetId
  JOIN Journeys AS j ON j.DestinationSpaceportId = sr.Id
  GROUP BY p.Name
  ORDER BY JourneysCount DESC, p.Name
