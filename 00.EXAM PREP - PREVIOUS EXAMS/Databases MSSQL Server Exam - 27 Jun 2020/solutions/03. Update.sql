UPDATE Jobs
SET [Status] = 'In Progress',
    MechanicId = (SELECT m.MechanicId FROM Mechanics AS m 
	               WHERE  m.FirstName + ' ' + m.LastName = 'Ryan Harnos') 
WHERE [Status] = 'Pending'