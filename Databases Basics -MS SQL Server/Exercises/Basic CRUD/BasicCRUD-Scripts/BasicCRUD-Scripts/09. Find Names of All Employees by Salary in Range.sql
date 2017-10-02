SELECT FirstName,LastName,JobTitle FROM Employees
WHERE Salary BETWEEN 20000 AND 30000
GO

SELECT FirstName+' '+ISNULL(MiddleName,'')+' '+LastName AS [Full Name]
FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600)
GO

SELECT FirstName,LastName  FROM Employees 
WHERE ManagerID IS NULL
GO

SELECT FirstName,LastName,Salary FROM Employees
WHERE Salary>50000
ORDER BY Salary DESC

SELECT TOP(5) FirstName,LastName FROM Employees
ORDER BY Salary DESC

SELECT FirstName,LastName FROM Employees
WHERE DepartmentID !=4