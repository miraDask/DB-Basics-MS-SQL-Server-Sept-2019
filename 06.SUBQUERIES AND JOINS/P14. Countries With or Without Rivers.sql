SELECT TOP(5)
       c.CountryName,
       r.RiverName 
  FROM Continents AS con
  JOIN Countries AS c ON c.ContinentCode = con.ContinentCode
  LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
  LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
 WHERE con.ContinentName = 'Africa'
 ORDER BY CountryName