
SELECT TOP(10) e.FirstName,e.LastName,e.DepartmentID
FROM Employees AS e
WHERE e.Salary >
(
    SELECT AVG(em.Salary)
    FROM Employees AS em
    WHERE e.DepartmentID = em.DepartmentID
)
ORDER BY DepartmentID; 