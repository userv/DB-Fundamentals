USE Bank
GO
SELECT * FROM AccountHolders
SELECT * FROM Accounts
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
GO

CREATE PROC usp_GetHoldersFullName 
AS
SELECT FirstName + ' ' + LastName AS [Full Name] FROM AccountHolders

GO
EXEC usp_GetHoldersFullName