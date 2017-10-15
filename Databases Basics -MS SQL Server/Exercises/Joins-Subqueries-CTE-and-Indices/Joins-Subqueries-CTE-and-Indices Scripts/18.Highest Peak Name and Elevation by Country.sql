USE [Geography]
GO
SELECT TOP 5
	result.Country,
	result.HighestPeakName,
	result.HighestPeakElevation,
	result.Mountain 
FROM (
	SELECT
		c.CountryName AS Country,
		ISNULL(p.PeakName, '(no highest peak)') AS HighestPeakName,
		MAX(ISNULL(p.Elevation, 0)) AS HighestPeakElevation,
		ISNULL(m.MountainRange, '(no mountain)') AS Mountain,
		DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY MAX(ISNULL(p.Elevation, 0)) DESC) AS [PeakNameRank]
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc
	ON mc.CountryCode = c.CountryCode
	LEFT JOIN Mountains AS m
	ON mc.MountainId = m.Id
	LEFT JOIN Peaks AS p
	ON p.MountainId = m.Id
	GROUP BY c.CountryName, p.PeakName, m.MountainRange
) AS result
WHERE PeakNameRank = 1
ORDER BY result.Country ASC, result.HighestPeakName ASC
