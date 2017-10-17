GO
CREATE FUNCTION ufn_GetSalaryLevel (@Salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS 
BEGIN
    DECLARE @SalaryLevel VARCHAR(10);
    SET @SalaryLevel=
	    CASE
		  WHEN @Salary < 30000 THEN 'Low'  
		  WHEN @Salary BETWEEN 30000 AND 50000 THEN 'Average' 
		  ELSE 'High'
	   END 
   RETURN @SalaryLevel;
END

GO
SELECT Salary,
	   dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level] 
FROM Employees
ORDER BY [Salary Level] 