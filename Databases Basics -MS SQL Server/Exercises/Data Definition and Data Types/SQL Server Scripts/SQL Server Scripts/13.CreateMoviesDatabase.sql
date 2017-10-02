CREATE DATABASE Movies
COLLATE Cyrillic_General_100_CI_AI
GO
USE Movies
CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)	
)
GO
CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)	
)
GO
CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)	
)
GO
CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Title NVARCHAR(60) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear INT NOT NULL,
	Length FLOAT ,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating FLOAT,
	Notes NVARCHAR(MAX)
)
GO
INSERT INTO Directors
VALUES
('Rosen Angelov',NULL),('Stavri',NULL),('Darin',NULL),
('Gosho',NULL),('Stamat',NULL)

GO
INSERT INTO Genres VALUES
('Drama',NULL),('Horror',NULL),('Action',NULL),('Sci-Fi',NULL),('Comedy',NULL)
GO
INSERT INTO Categories VALUES
('TV Episodes',NULL),('Films',NULL),('Documentary',NULL),('Boxset',NULL),('Anime',NULL)

INSERT INTO Movies VALUES
('IT',1,2016,2.16,1,2,6.1,NULL),
('Mummy',3,2017,2.21,1,4,7.1,NULL),
('Spider-Man',5,2012,2.16,1,2,6.1,NULL),
('Fargo',2,2017,0.48,1,2,6.1,NULL),
('IT Crowd',4,2010,2.16,1,2,8.1,NULL)