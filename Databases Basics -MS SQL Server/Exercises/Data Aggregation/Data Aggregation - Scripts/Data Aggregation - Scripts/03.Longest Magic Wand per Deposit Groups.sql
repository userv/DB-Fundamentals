SELECT * FROM WizzardDeposits
GO
SELECT DepositGroup,
	  MAX(MagicWandSize) AS LongestMagicWand  
FROM WizzardDeposits
GROUP BY DepositGroup
