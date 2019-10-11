  CREATE PROC usp_GetHoldersWithBalanceHigherThan (@minBalance DEC(9,2))
           AS
       SELECT FirstName,
  	   	      LastName
  	     FROM ( SELECT ah.Id,
                       ah.FirstName,
		               ah.LastName,
                       SUM(a.Balance) AS TotalBalance
                  FROM AccountHolders AS ah
                  JOIN Accounts AS a ON a.AccountHolderId = ah.Id
              GROUP BY ah.Id, ah.FirstName, ah.LastName) AS t
        WHERE t.TotalBalance > @minBalance
     ORDER BY t.FirstName, t.LastName
