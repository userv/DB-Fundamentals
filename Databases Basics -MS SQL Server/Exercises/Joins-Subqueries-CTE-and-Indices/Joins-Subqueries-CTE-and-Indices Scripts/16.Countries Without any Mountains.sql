USE Geography
GO
SELECT * FROM Countries
SELECT * FROM MountainsCountries
GO

GO


    SELECT * FROM Countries AS c
    LEFT OUTER JOIN MountainsCountries AS mc  ON  c.CountryCode=mc.CountryCode
    WHERE MountainId IS NULL
GO 

SELECT COUNT(CountryCode) ASCountryCode FROM Countries
WHERE CountryCode NOT IN (SELECT CountryCode FROM MountainsCountries)
