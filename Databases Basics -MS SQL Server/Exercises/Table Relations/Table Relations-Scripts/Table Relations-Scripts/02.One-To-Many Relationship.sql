USE TableRelations;
GO
CREATE TABLE Manufacturers
(
    ManufacturerID INT IDENTITY,
	Name           NVARCHAR(30) NOT NULL,
	EstablishedOn  DATE,
	CONSTRAINT PK_Manufacturers PRIMARY KEY(ManufacturerID)
);

CREATE TABLE Models
(
	ModelID        INT IDENTITY(101, 1),
	Name           NVARCHAR(30) NOT NULL,
	ManufacturerID INT NOT NULL,
	CONSTRAINT PK_Models PRIMARY KEY (ModelID), 
	CONSTRAINT FK_Manufacturers FOREIGN KEY(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)
);

INSERT INTO Manufacturers VALUES
('BMW','1916-03-07'),
('Tesla','2003-01-01'),
('Lada','1966-05-01')


INSERT INTO  Models VALUES
('X1',1),('i6',1),
('Model S',2),('Model X',2),('Model 3',2),
('Nova',3)


SELECT * FROM Models
--DROP TABLE Models
GO
SELECT *
FROM Manufacturers;