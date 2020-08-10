SELECT c.FirstName + ' ' + c.LastName AS Client,
	   DATEDIFF(DAY, j.IssueDate, CAST('24 April 2017' AS DATE)) AS [Days going],
	   j.Status
FROM Jobs AS j
JOIN Clients AS c ON c.ClientId = j.ClientId
WHERE [Status] != 'Finished'
ORDER BY [Days going] DESC, c.ClientId ASC