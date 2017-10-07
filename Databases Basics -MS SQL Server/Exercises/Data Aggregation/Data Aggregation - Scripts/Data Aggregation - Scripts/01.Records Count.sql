USE Gringotts
GO
SELECT * FROM WizzardDeposits
GO
SELECT COUNT(*) AS Count FROM WizzardDeposits
GO
SELECT MAX(MagicWandSize) AS LongestMagicWand  FROM WizzardDeposits