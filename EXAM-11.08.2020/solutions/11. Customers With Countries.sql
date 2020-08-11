CREATE VIEW  v_UserWithCountries AS
SELECT c.FirstName + ISNULL(' ' + c.LastName, '' ) AS CustomerName,
       c.Age AS Age,
	   c.Gender AS Gender,
	   ct.Name AS CountryName
FROM Customers AS c
JOIN Countries AS ct ON ct.Id = c.CountryId
