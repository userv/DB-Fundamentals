USE Orders;
GO
SELECT *
FROM Orders
GO

SELECT ProductName,OrderDate,
	   DATEADD(DAY,3,OrderDate) AS [Pay Due],
	   DATEADD(MONTH,1,OrderDate) AS [Delivery Due]
FROM Orders;

GO
CREATE TABLE People(
    Id INT IDENTITY ,
    Name NVARCHAR(30) NOT NULL,
    Birthdate DATETIME NOT NULL,
    CONSTRAINT PK_People PRIMARY KEY  (Id) 
)
GO
SELECT * FROM People

INSERT  INTO People(Name,Birthdate) VALUES
('Viktor','2000-09-10'),
('Steven','1992-09-10'),
('Jonh','1910-10-19'),
('Rosen','1971-01-08')
GO
SELECT Name, 
	   DATEDIFF(YEAR,Birthdate,GETDATE()) AS [Age in Years],
	   DATEDIFF(MONTH,Birthdate,GETDATE()) AS [Age in Months],
	   DATEDIFF(DAY,Birthdate,GETDATE()) AS [Age in Days],
	   DATEDIFF(MINUTE,Birthdate,GETDATE()) AS [Age in Minutes]
FROM People

