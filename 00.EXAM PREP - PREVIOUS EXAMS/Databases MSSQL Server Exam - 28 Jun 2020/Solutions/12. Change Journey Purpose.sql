CREATE PROC usp_ChangeJourneyPurpose(@JourneyId INT, @NewPurpose VARCHAR(11))
AS 
BEGIN
	DECLARE @jurneyPurpouse VARCHAR(11) = (SELECT Purpose from Journeys WHERE Id = @JourneyId)
	IF(@jurneyPurpouse IS NULL)
	THROW 50001, 'The journey does not exist!', 1
	
	IF(@jurneyPurpouse = @NewPurpose)
	THROW 50001, 'You cannot change the purpose!', 1

	UPDATE Journeys 
	SET Purpose = @NewPurpose
	WHERE Id = @JourneyId
END
