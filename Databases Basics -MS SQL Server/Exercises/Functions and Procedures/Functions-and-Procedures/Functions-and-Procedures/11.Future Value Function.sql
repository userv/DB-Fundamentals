CREATE FUNCTION ufn_CalculateFutureValue
(@initialSum         MONEY,
 @yearlyInterestRate FLOAT,
 @years              INT
)
RETURNS MONEY
AS
     BEGIN
         DECLARE @FutureValue MONEY;
         SET @FutureValue = @initialSum * (POWER((1 + @yearlyInterestRate), @years));
         RETURN @FutureValue;
     END;
GO
SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5);