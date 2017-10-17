USE Diablo
--GO
--SELECT * FROM Games
--SELECT * FROM UsersGames
--GO
GO
CREATE FUNCTION ufn_CashInUsersGames(@gameName VARCHAR(MAX))
RETURNS TABLE
AS 
    RETURN (
		  SELECT SUM (cr.Cash) AS SumCash 
		  FROM 
			 (
			 SELECT ug.Cash,ROW_NUMBER() OVER (ORDER BY Cash DESC) AS RowNumber
			 FROM UsersGames AS ug
			 JOIN Games AS g ON ug.GameId=g.Id
			 WHERE g.Name = @gameName
			 ) AS cr
		  WHERE cr.RowNumber % 2 <> 0
		  )

GO

SELECT * FROM dbo.ufn_CashInUsersGames ('Lily Stargazer')