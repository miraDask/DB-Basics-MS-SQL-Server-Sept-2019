CREATE TRIGGER tr_DeleteProducts
ON Products 
INSTEAD OF DELETE
AS
DECLARE @deletedId INT= (SELECT Id FROM deleted);
 
DELETE FROM ProductsIngredients WHERE ProductId = @deletedId
DELETE FROM Feedbacks WHERE ProductId = @deletedId
DELETE FROM Products WHERE Id = @deletedId
