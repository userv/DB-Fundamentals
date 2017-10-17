CREATE PROC usp_GetTownsStartingWith @StartWithStr VARCHAR(MAX)
AS
SELECT Name FROM Towns
WHERE LEFT(Name,LEN(@StartWithStr))=@StartWithStr

GO
EXEC dbo.usp_GetTownsStartingWith 'b'