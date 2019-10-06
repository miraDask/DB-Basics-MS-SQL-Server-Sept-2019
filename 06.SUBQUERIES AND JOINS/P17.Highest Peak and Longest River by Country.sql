	SELECT TOP(5)
	       c.CountryName,
	       MAX(p.Elevation) AS HighestPeakElevation,
		   MAX(r.[Length]) AS LongestRiverLength 
	  FROM Countries AS c
	  FULL JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
	  FULL JOIN Rivers AS r ON r.Id = cr.RiverId
	  FULL JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	  FULL JOIN Mountains AS m oN m.Id = mc.MountainId
	  FULL JOIN Peaks AS p ON p.MountainId = m.Id
     GROUP BY c.CountryName
     ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName