SELECT * INTO UpdatedEmployees
FROM Employees
WHERE Salary > 30000 -- AND ManagerID != 42

DELETE FROM  UpdatedEmployees
WHERE ManagerID=42

UPDATE UpdatedEmployees
SET Salary+=5000
WHERE DepartmentID=1

SELECT DepartmentID,
       AVG(Salary) AS AverageSalary
FROM UpdatedEmployees
GROUP BY DepartmentID