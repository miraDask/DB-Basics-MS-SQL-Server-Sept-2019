  SELECT p.PeakName AS PeakName,
		 r.RiverName AS RiverName,
		 CONCAT(LOWER(PeakName), LOWER(RIGHT(RiverName, LEN(RiverName) - 1)) ) AS Mix
    FROM Peaks AS p, Rivers AS r
   WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix
