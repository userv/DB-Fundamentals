USE SoftUni;
GO
SELECT FirstName,
       LastName
FROM Employees
WHERE FirstName LIKE 'SA%';
GO

SELECT FirstName,
       LastName
FROM Employees
WHERE LastName LIKE '%ei%';