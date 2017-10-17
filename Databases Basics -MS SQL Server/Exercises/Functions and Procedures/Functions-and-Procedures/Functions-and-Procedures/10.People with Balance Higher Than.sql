SELECT * FROM AccountHolders
SELECT * FROM Accounts

GO 
CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan (@balanceLevel MONEY)
AS
    SELECT FirstName,LastName FROM AccountHolders 
    WHERE Id IN
    (
	   SELECT AccountHolderId FROM Accounts
	   GROUP BY AccountHolderId
	   HAVING SUM(Balance) >= @balanceLevel
    ) 
    ORDER BY LastName
GO
EXEC dbo.usp_GetHoldersWithBalanceHigherThan 50000

