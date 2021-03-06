CREATE FUNCTION dbo.udf_GetColonistsCount(@PlanetName VARCHAR(30))
RETURNS INT 
AS 
BEGIN 
	RETURN(
		SELECT COUNT(*) AS Count
          FROM Planets AS p
          JOIN Spaceports AS sp ON sp.PlanetId = p.Id
          JOIN Journeys AS j ON j.DestinationSpaceportId = sp.Id
          JOIN TravelCards AS t ON t.JourneyId = j.Id
          JOIN Colonists AS c ON c.Id = t.ColonistId
          WHERE p.Name = @PlanetName
	)
END


