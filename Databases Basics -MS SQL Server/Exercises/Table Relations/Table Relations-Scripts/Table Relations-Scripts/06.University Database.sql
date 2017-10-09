CREATE DATABASE Uni
GO
USE Uni
GO
CREATE TABLE Majors(
    MajorID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50)
)
CREATE TABLE Students(
    StudentID INT PRIMARY KEY IDENTITY,
    StudentNumber INT UNIQUE NOT NULL,
    StudentName VARCHAR(50) NOT NULL,
    MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)
CREATE TABLE Payments(
    PaymentID INT PRIMARY KEY IDENTITY,
    PaymentDate DATETIME NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects(
    SubjectID INT PRIMARY KEY IDENTITY,
    SubjectName VARCHAR(50) NOT NULL
)

CREATE TABLE Agenda(
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
    CONSTRAINT PK_StudentSubject PRIMARY KEY(StudentID,SubjectID) 
)