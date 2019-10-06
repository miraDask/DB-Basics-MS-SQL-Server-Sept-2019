  WITH CTE_CurrencyUsage (ContinentCode, CurrencyCode, CurrencyUsage, [Rank])
   AS 
     (
       SELECT c.ContinentCode,
              c.CurrencyCode, 
		      COUNT(c.CountryCode) AS CurrencyUsage,
			  DENSE_RANK() OVER (PARTITION BY c.ContinentCode ORDER BY COUNT(c.CountryCode) DESC) AS [Rank]
         FROM Countries AS c
        GROUP BY c.ContinentCode, c.CurrencyCode 
       HAVING COUNT(c.CountryCode) > 1
      )

SELECT ContinentCode,
       CurrencyCode,
	   CurrencyUsage
FROM CTE_CurrencyUsage
WHERE CTE_CurrencyUsage.[Rank] = 1
ORDER BY ContinentCode