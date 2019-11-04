   SELECT u.Username,
          c.[Name] AS CategoryName
     FROM Reports AS r
	 JOIN Users AS u ON u.Id = r.UserId
	 JOIN Categories AS c ON c.Id = r.CategoryId 
    WHERE LEFT(FORMAT(u.Birthdate, 'dd-MM-yyyy'), 5) = LEFT(FORMAT(r.OpenDate, 'dd-MM-yyyy'), 5) 
 ORDER BY u.Username, CategoryName