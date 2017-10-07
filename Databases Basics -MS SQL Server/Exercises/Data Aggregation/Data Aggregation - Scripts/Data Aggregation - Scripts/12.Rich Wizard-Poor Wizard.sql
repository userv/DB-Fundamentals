USE Gringotts;
GO
SELECT *
FROM WizzardDeposits;
GO
SELECT FirstName AS HostWizard,
       DepositAmount AS [HostWizard Deposit],
       LEAD(DepositAmount) OVER(ORDER BY Id) AS [GuestWizard Deposit]
FROM WizzardDeposits;
GO

SELECT SUM([HostWizard Deposit] - [GuestWizard Deposit]) AS SumDifference
FROM
(
    SELECT FirstName AS HostWizard,
           DepositAmount AS [HostWizard Deposit],
           LEAD(DepositAmount) OVER(ORDER BY Id) AS [GuestWizard Deposit]
    FROM WizzardDeposits
) AS Diff;