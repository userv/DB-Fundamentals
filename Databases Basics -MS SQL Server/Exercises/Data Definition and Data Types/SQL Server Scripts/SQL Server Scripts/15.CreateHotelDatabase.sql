CREATE DATABASE Hotel
COLLATE Cyrillic_General_100_CI_AI
GO
USE Hotel
GO

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Title VARCHAR(30),
	Notes VARCHAR(MAX)
) 

CREATE TABLE Customers(
	AccountNumber INT PRIMARY KEY NOT NULL, 
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR(30), 
	EmergencyName VARCHAR(30), 
	EmergencyNumber VARCHAR(30), 
	Notes VARCHAR(MAX)
)

CREATE TABLE RoomStatus(
	RoomStatus BIT DEFAULT 1,
	Notes VARCHAR(MAX)
	CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus)
)

CREATE TABLE RoomTypes(
	RoomType VARCHAR(30),
	Notes VARCHAR(MAX)
	CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes(
	BedType VARCHAR(30),
	Notes VARCHAR(MAX)
	CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms(
	RoomNumber INT, 
	RoomType VARCHAR(30) FOREIGN KEY REFERENCES RoomTypes(RoomType), 
	BedType VARCHAR(30) FOREIGN KEY REFERENCES BedTypes(BedType), 
	Rate FLOAT, 
	RoomStatus BIT FOREIGN KEY REFERENCES RoomStatus(RoomStatus), 
	Notes VARCHAR(MAX)
)

CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY, 
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id), 
	PaymentDate DATE NOT NULL, 
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber), 
	FirstDateOccupied, 
	LastDateOccupied, 
	TotalDays, 
	AmountCharged, 
	TaxRate, 
	TaxAmount, 
	PaymentTotal, 
	Notes
)