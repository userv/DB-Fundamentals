CREATE DATABASE CarRental
COLLATE Cyrillic_General_100_CI_AI
GO
USE CarRental
GO
CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName VARCHAR(30) NOT NULL,
	DailyRate FLOAT NOT NULL, 
	WeeklyRate FLOAT NOT NULL,
	MonthlyRate FLOAT NOT NULL,
	WeekendRate FLOAT NOT NULL
)

INSERT INTO Categories VALUES
('Daily',20,0,0,0),
('Weekly',120,0,0,0),
('Monthly',190,0,0,0)

CREATE TABLE Cars(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	PlateNumber INT UNIQUE NOT NULL,
	Manufacturer VARCHAR(30),
	Model VARCHAR(30),
	CarYear INT,
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Doors INT NOT NULL,
	Picture VARBINARY(MAX),
    Condition VARCHAR(20),
    Available BIT DEFAULT 1
)

INSERT INTO Cars VALUES
(1223456,'Opel', 'Corsa', 1998,2,3,NULL,'Good',1),
(2523486,'BMW', '530i', 2012,1,5,NULL,'Perfect',1),
(7233456,'Ford', 'Focus', 2008,3,5,NULL,'Good',1)

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	FirstName VARCHAR(30) NOT NULL, 
	LastName VARCHAR(30) NOT NULL, 
	Title VARCHAR(30), 
	Notes VARCHAR(MAX)
)

INSERT INTO Employees VALUES
('Rosen', 'Angelov',NULL,NULL),
('Stavri', 'Stavriev',NULL,NULL),
('Gosho', 'Georgiev',NULL,NULL)


CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DriverLicenceNumber INT NOT NULL, 
	FullName VARCHAR(50) NOT NULL, 
	Address VARCHAR(50), 
	City VARCHAR(30), 
	ZIPCode INT, 
	Notes VARCHAR(MAX)
)

INSERT INTO Customers VALUES
(12345678,'Gosho Petrov',NULL,NULL,NULL,NULL),
(12346678,'Stavri Mihailov',NULL,NULL,NULL,NULL),
(12343678,'Pesho Lefterov',NULL,NULL,NULL,NULL)


CREATE TABLE RentalOrders(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id), 
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id), 
	CarId INT FOREIGN KEY REFERENCES Cars(Id), 
	TankLevel INT , 
	KilometrageStart INT NOT NULL, 
	KilometrageEnd INT NOT NULL, 
	TotalKilometrage AS KilometrageEnd-KilometrageStart, 
	StartDate DATETIME NOT NULL, 
	EndDate DATETIME NOT NULL, 
	TotalDays AS EndDate-StartDate, 
	RateApplied FLOAT NOT NULL, 
	TaxRate FLOAT NOT NULL, 
	OrderStatus VARCHAR(30) NOT NULL, 
	Notes VARCHAR(MAX)
)

INSERT INTO  RentalOrders (EmployeeId,CustomerId,CarId,TankLevel,KilometrageStart,KilometrageEnd,StartDate,EndDate,RateApplied,TaxRate,OrderStatus)
VALUES 
(2,2,2,50,180000,223000,'1/12/2017','1/16/2017',20,40,'Pending'),
(1,1,2,60,120000,123000,'1/12/2017','1/16/2017',20,40,'Pending'),
(3,2,3,80,180000,223000,'2/18/2017','2/19/2017',30,70,'Pending')