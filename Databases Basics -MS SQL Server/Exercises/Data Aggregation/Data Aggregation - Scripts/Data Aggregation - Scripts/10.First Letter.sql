USE Gringotts
GO
SELECT * FROM WizzardDeposits
GO
SELECT DISTINCT LEFT(FirstName,1) AS FirstLetter
 FROM WizzardDeposits
 WHERE DepositGroup='Troll Chest'
 GROUP BY  LEFT(FirstName,1)