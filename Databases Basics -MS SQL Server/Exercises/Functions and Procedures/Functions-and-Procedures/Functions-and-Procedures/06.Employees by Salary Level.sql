CREATE PROCEDURE usp_EmployeesBySalaryLevel @SalaryLevel VARCHAR(10)
AS
SELECT FirstName,LastName
FROM Employees
WHERE  dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel

GO

EXEC dbo.usp_EmployeesBySalaryLevel 'High'