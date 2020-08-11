SELECT d.Name AS DistributorName,
	   ing.Name AS IngredientName,
	   prd.Name AS ProductName,
	   Pr_AV.AverageRate AS AverageRate
FROM Products AS prd
JOIN ProductsIngredients AS pri ON pri.ProductId = prd.Id
JOIN Ingredients AS ing ON ing.Id = pri.IngredientId
JOIN Distributors AS d ON d.Id = ing.DistributorId
JOIN (SELECT p.Id, AVG(f.Rate) AS AverageRate
FROM Products AS p
JOIN ProductsIngredients AS pr ON pr.ProductId = p.Id
JOIN Ingredients AS i ON i.Id = pr.IngredientId
JOIN Feedbacks AS f ON f.ProductId = p.Id
GROUP BY p.Id ) AS Pr_AV on Pr_AV.Id = prd.Id
WHERE Pr_AV.AverageRate BETWEEN 5 AND 8
ORDER BY DistributorName, IngredientName, ProductName
