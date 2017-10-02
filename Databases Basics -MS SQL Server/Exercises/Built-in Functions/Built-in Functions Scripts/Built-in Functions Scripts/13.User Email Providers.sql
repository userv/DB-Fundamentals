
SELECT TOP (1000) [Id],
                  [Username],
                  [FirstName],
                  [LastName],
                  [Email],
                  [RegistrationDate],
                  [IsDeleted],
                  [IpAddress]
FROM [Diablo].[dbo].[Users];
GO

SELECT CHARINDEX('@',Email) FROM Users
GO

SELECT Username,
       RIGHT(Email, LEN(Email)-CHARINDEX('@',Email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider],UserName