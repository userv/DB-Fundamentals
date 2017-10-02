USE Diablo
GO

SELECT * FROM Users

SELECT Username,
	  IpAddress AS [IP Address]
 FROM Users
 WHERE IpAddress LIKE '___.1%.%.___'
 ORDER BY Username
 --WHERE IpAddress LIKE '***.1^.^.***'