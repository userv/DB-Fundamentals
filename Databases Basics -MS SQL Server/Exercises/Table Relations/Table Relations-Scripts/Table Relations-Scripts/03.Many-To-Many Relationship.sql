CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(30) NOT NULL,
)

CREATE TABLE Exams(
    ExamID INT PRIMARY KEY IDENTITY(101,1),
    Name NVARCHAR(30) NOT NULL
)

CREATE TABLE StudentsExams(
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    ExamID INT FOREIGN KEY REFERENCES Exams(ExamID),
    CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID,ExamID)
)

INSERT INTO Students VALUES
('Mila'),('Toni'),('Ron')

INSERT INTO Exams VALUES 
('SpringMVC'),('Neo4j'),('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1,101),(1,102),(2,101),
(3,103),(2,102),(2,103)



DROP TABLE Students
DROP TABLE Exams
DROP TABLE StudentsExams

SELECT * FROM Students

SELECT * FROM StudentsExams