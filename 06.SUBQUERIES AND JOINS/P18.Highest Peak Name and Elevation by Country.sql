    SELECT TOP(5)
	       c.CountryName AS Country,
	       COALESCE(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
		   COALESCE(p.Elevation, 0) AS [Highest Peak Elevation],
		   COALESCE(m.MountainRange, '(no mountain)') AS Mountain
	  FROM Countries AS c
	  LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	  LEFT JOIN Mountains AS m oN m.Id = mc.MountainId
	  LEFT JOIN Peaks AS p ON p.MountainId = m.Id
     ORDER BY c.CountryName, p.PeakName DESC