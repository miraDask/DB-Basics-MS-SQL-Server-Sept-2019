  SELECT TownID,
         [Name]
    FROM Towns
   WHERE NOT [Name] LIKE '[R, B, D]%'
ORDER BY [Name] 