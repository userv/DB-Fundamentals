USE Geography
GO
SELECT * FROM MountainsCountries
SELECT * FROM Peaks
SELECT * FROM Mountains
GO
SELECT mc.CountryCode,  COUNT(*) AS MountainRanges  FROM MountainsCountries AS mc
JOIN Mountains AS m ON mc.MountainId=m.Id
GROUP BY mc.CountryCode
HAVING mc.CountryCode IN ('BG','US','RU')