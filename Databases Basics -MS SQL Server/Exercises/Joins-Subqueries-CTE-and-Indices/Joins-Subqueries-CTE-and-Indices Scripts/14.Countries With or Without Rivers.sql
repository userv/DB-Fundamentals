USE Geography
GO
SELECT * FROM CountriesRivers
SELECT * FROM Rivers
SELECT * FROM Continents
Go

SELECT TOP 5
		  af.CountryName,
		  r.RiverName
FROM CountriesRivers AS cr
    RIGHT OUTER JOIN (SELECT * FROM Countries WHERE ContinentCode='AF') AS af ON cr.CountryCode=af.CountryCode
    LEFT OUTER JOIN Rivers AS r ON r.Id=cr.RiverId
ORDER BY af.CountryName