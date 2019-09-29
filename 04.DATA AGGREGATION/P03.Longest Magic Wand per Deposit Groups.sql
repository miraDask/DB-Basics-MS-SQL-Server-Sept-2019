  SELECT DepositGroup,
		 MAX(w.MagicWandSize) AS LongestMagicWand
    FROM WizzardDeposits AS w
GROUP BY DepositGroup