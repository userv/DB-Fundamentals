GO
CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
    DECLARE @currentChar CHAR;
    DECLARE @count INT  = 1;
	WHILE (LEN(@word)>= @count)
	BEGIN
	   SET @currentChar=SUBSTRING(@word,@count,1);
	   DECLARE @match INT = CHARINDEX(@currentChar,@setOfLetters);
	   IF (@match=0)
		  BEGIN
			 RETURN 0;
		  END 
	   SET @count=@count+1;
	END
    RETURN 1;
END 

GO
SELECT dbo.ufn_IsWordComprised('oistmiahf', 'halves')