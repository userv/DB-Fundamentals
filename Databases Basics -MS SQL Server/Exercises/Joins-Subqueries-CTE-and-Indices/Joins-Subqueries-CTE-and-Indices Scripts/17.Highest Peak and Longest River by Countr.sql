USE Geography;
GO
SELECT *
FROM CountriesRivers;
SELECT *
FROM Rivers;
SELECT *
FROM Countries;
SELECT *
FROM MountainsCountries;
SELECT *
FROM Peaks;
GO
SELECT TOP 5 P.CountryName,
             p.HighestPeakElevation,
             p.LongestRiverLength
FROM
(
    SELECT c.CountryName,
           MAX(p.Elevation) AS HighestPeakElevation,
           DENSE_RANK() OVER(PARTITION BY(c.CountryName) ORDER BY p.Elevation DESC) AS [Rank],
           r.[Length] AS [Length],
           DENSE_RANK() OVER(PARTITION BY(c.CountryName) ORDER BY r.[Length] DESC) AS [Rank2],
           MAX(r.[Length]) AS LongestRiverLength
    FROM Countries AS c
         LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
         LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
         LEFT JOIN Peaks AS p ON m.Id = p.MountainId
         LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
         LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
    GROUP BY c.CountryName,
             p.Elevation,
             r.[Length]
    HAVING MAX(p.Elevation) IS NOT NULL
           AND MAX(r.[Length]) IS NOT NULL
) AS p
WHERE p.Rank = 1
      AND p.Rank2 = 1
ORDER BY p.HighestPeakElevation DESC,
         p.LongestRiverLength DESC;
    

GO

SELECT TOP 5 *
FROM (
	SELECT
		ElevationsPerCountry.CountryName,
		MAX(ElevationsPerCountry.Elevation) AS HighestPeakElevation,
		MAX(ElevationsPerCountry.[Length]) AS LongestRiverLength
	FROM
		(
			SELECT
				c.CountryName,
				p.Elevation,
				r.[Length]
			FROM Countries AS c
			LEFT JOIN MountainsCountries AS mc
			ON mc.CountryCode = c.CountryCode
			LEFT JOIN Mountains AS m
			ON mc.MountainId = m.Id
			LEFT JOIN Peaks AS p
			ON p.MountainId = m.Id
			LEFT JOIN CountriesRivers AS cr
			ON cr.CountryCode = c.CountryCode
			LEFT JOIN Rivers AS r
			ON r.Id = cr.RiverId
		) AS ElevationsPerCountry
	GROUP BY ElevationsPerCountry.CountryName
) AS HighestElevations
ORDER BY HighestElevations.HighestPeakElevation DESC,
		 HighestElevations.LongestRiverLength DESC, 
		 HighestElevations.CountryName ASC

