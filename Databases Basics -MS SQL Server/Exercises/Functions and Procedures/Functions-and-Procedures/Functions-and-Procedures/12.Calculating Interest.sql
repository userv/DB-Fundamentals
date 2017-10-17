SELECT * FROM AccountHolders
SELECT * FROM Accounts
 GO

 CREATE PROC usp_CalculateFutureValueForAccount (@accountId INT,@interestRate FLOAT)
 AS
    SELECT acc.[Account Id],acc.FirstName ,acc.LastName,
		  acc.Balance AS [Current Balance],
		  dbo.ufn_CalculateFutureValue(acc.Balance,@interestRate,5) AS [Balance in 5 Years]
    FROM
    (
		  SELECT a.Id AS [Account Id],
			    ac.FirstName,
			    ac.LastName,
			    a.Balance
		  FROM AccountHolders AS ac 
		  JOIN Accounts AS a ON ac.Id=a.AccountHolderId
		  WHERE a.Id=@accountId
	) AS acc;

GO
EXEC dbo.usp_CalculateFutureValueForAccount 1 , 0.4