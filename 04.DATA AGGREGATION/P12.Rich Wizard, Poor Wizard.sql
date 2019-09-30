SELECT SUM(DiffTable.[Difference]) AS SumDifference
  FROM (
       SELECT w.FirstName AS [Host Wizard],
	          w.DepositAmount AS [Host Wizard Deposit],
	          LEAD(w.FirstName) OVER(ORDER BY w.Id ) AS [Guest Wizard],
	          LEAD(w.DepositAmount) OVER(ORDER BY w.Id) AS [Guest Wizard Deposit],
	          w.DepositAmount - LEAD(w.DepositAmount) OVER(ORDER BY w.Id) AS [Difference]
       FROM WizzardDeposits AS w 
	   ) AS DiffTable


