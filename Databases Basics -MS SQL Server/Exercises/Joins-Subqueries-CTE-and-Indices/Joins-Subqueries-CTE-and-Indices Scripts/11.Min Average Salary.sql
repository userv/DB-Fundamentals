WITH CTE_AverageSalary
     AS (
     SELECT AVG(Salary) AS AverageSalary
     FROM Employees
     GROUP BY DepartmentID)

 SELECT MIN(AverageSalary) AS MinAverageSalary
     FROM CTE_AverageSalary;