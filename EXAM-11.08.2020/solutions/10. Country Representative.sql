SELECT CountryName, DisributorName
FROM (SELECT c.Name AS CountryName,
               d.Id,
			   d.Name AS DisributorName,
			   ING,
       RANK() OVER (PARTITION BY c.Name ORDER BY ING DESC) AS [RANK]
 FROM  Countries AS c 
 JOIN Distributors AS d ON d.CountryId = c.Id
 JOIN (SELECT d.Id,
       COUNT(i.Id) as ING
FROM Distributors AS d 
JOIN Ingredients AS i ON i.DistributorId = d.Id
GROUP BY d.Id) AS DC ON DC.Id = d.Id) as Ranked
WHERE Ranked.[RANK] = 1
ORDER BY CountryName, DisributorName
