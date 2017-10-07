
SELECT DepartmentID,
       Salary
FROM
(
    SELECT DepartmentID,
           Salary,
           DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Rank
    FROM Employees
    GROUP BY DepartmentID,Salary
) AS Empl
WHERE Rank = 3;