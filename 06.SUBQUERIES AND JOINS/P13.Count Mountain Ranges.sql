SELECT c.CountryCode,
       COUNT(m.MountainRange)
  FROM Countries AS c
  JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
  JOIN Mountains AS m ON mc.MountainId = M.Id
 WHERE c.CountryCode IN ('BG', 'RU', 'US')
 GROUP BY c.CountryCode
