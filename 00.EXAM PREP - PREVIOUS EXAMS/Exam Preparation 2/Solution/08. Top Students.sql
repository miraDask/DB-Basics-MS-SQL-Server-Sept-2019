  SELECT TOP(10)
         s.FirstName,
         s.LastName,
	     CAST(AVG(st.Grade) AS DEC(3,2)) AS Grade
    FROM Students AS s
    JOIN StudentsExams AS st ON sT.StudentId = s.Id
GROUP BY s.FirstName, s.LastName
ORDER BY Grade DESC, s.FirstName, s.LastName