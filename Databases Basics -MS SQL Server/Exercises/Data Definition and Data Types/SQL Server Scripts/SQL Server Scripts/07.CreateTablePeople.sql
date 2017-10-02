USE Minions
GO
CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Name NVARCHAR(200) UNIQUE NOT NULL,
	Picture VARBINARY(MAX),
	Height NUMERIC(10,2),
	Weight NUMERIC(15,2),
	Gender VARCHAR(1)  NOT NULL,
	CONSTRAINT CHK_PictureSize CHECK (DATALENGTH(Picture) <= 2048),
	CONSTRAINT CHK_GenderType CHECK (Gender IN ('m','f'))
)
GO
INSERT INTO People 
VALUES
('Rosen Traykov',NULL,180,87,'m'),
('Iliana Angelova',NULL,165,60,'f'),
('Darin Angelov',NULL,120,22,'m'),
('Stefan Dimitrov',NULL,182,83,'m'),
('Ivan Georgiev',NULL,180,87,'m')