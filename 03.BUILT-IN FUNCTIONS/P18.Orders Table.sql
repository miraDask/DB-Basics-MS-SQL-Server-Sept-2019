SELECT ProductName,
	   OrderDate,
	   DATEADD(DAY, 3, OrderDate) AS [Deliver Due],
	   DATEADD(MONTH, 1, OrderDate) AS [Pay Due]
  FROM Orders