CREATE OR ALTER PROC  usp_GetEmployeesFromTown @TownName VARCHAR(50)
AS
SELECT FirstName,LastName FROM Employees AS e
JOIN Addresses AS a ON e.AddressID=a.AddressID
JOIN Towns AS t ON a.TownID=t.TownID
WHERE t.Name=@TownName

GO
EXEC dbo.usp_GetEmployeesFromTown 'Sofia'

GO
SELECT * FROM Employees
SELECT * FROM Addresses
SELECT * FROM Towns
GO
SELECT FirstName,LastName FROM Employees AS e
JOIN Addresses AS a ON e.AddressID=a.AddressID
JOIN Towns AS t ON a.TownID=t.TownID
WHERE t.Name='Sofia'