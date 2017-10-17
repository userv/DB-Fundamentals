CREATE OR ALTER PROC usp_GetEmployeesSalaryAboveNumber @SalaryAboveNumber DECIMAL(18,4)
AS
SELECT FirstName,LastName FROM Employees
WHERE Salary >= @SalaryAboveNumber

GO 
EXEC dbo.usp_GetEmployeesSalaryAboveNumber 48100