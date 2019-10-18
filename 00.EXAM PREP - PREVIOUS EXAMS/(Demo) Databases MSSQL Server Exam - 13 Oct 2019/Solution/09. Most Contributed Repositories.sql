   SELECT TOP(5)
          r.Id,
          r.Name,
		  COUNT(c.Id) AS Commits
     FROM Repositories AS r
	 JOIN RepositoriesContributors AS rc ON rc.RepositoryId = r.Id
	 JOIN Users AS u ON u.Id = rc.ContributorId
	 JOIN Commits AS c ON c.RepositoryId = r.Id
 GROUP BY r.Id, r.Name
 ORDER BY Commits DESC, r.Id, r.Name