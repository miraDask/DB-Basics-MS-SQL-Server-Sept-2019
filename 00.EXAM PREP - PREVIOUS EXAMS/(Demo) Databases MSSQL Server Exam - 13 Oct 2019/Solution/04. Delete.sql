DELETE FROM RepositoriesContributors
WHERE RepositoryId = (SELECT r.Id
                        FROM Repositories AS r
                       WHERE r.Name = 'Softuni-Teamwork')

---

DELETE FROM Issues
WHERE RepositoryId = (SELECT r.Id
                        FROM Repositories AS r
                       WHERE r.Name = 'Softuni-Teamwork')
  