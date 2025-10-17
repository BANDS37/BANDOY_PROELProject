CREATE DATABASE BANDOY_DB

USE BANDOY_DB

CREATE TABLE Roles(
    RoleID INT PRIMARY KEY IDENTITY (1,1),
    RoleName VARCHAR(50) NOT NULL
);


CREATE TABLE Profiles(
    ProfileID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(20),
    Address VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Status VARCHAR(20)
);

CREATE TABLE Users(
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(64) NOT NULL,
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID),
    ProfileID INT FOREIGN KEY REFERENCES Profiles(ProfileID)
);

CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(50)
);

CREATE TABLE Semesters(
    SemesterID INT PRIMARY KEY IDENTITY(1,1),
    AcademicYear VARCHAR(50),
    TermName VARCHAR(50)
);

CREATE TABLE Instructors(
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    ProfileID INT FOREIGN KEY REFERENCES Profiles(ProfileID),
    HireDate DATE,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);



CREATE TABLE Courses(
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(150),
    CourseCode VARCHAR(32) UNIQUE NOT NULL,
    Description TEXT,
    Credits INT,
    InstructorID INT FOREIGN KEY REFERENCES Instructors(InstructorID),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
	Status VARCHAR(20)

);

CREATE TABLE Students(
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    ProfileID INT FOREIGN KEY REFERENCES Profiles(ProfileID),
    EnrollmentDate DATE
);

CREATE TABLE Enrollment(
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    SemesterID INT FOREIGN KEY REFERENCES Semesters(SemesterID),
    Grade DECIMAL(5,2),
    DateRecorded DATE
);


CREATE TABLE Logs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
	Name VARCHAR (50),
    Action NVARCHAR(50),
    Date DATE DEFAULT CONVERT(DATE, GETDATE()),
    Time TIME DEFAULT CONVERT(TIME, GETDATE()),
    Description NVARCHAR(255)
);


INSERT INTO Departments(DepartmentName) VALUES ('College of Computer Studies');
INSERT INTO Departments(DepartmentName) VALUES ('College of Business and Management');
INSERT INTO Departments(DepartmentName) VALUES ('College of Arts, Sciences, and Pedagogy');
INSERT INTO Departments(DepartmentName) VALUES ('College of Nursing');



INSERT INTO Roles (RoleName) VALUES ('Admin');
INSERT INTO Roles (RoleName) VALUES ('Instructor');
INSERT INTO Roles (RoleName) VALUES ('Student');

INSERT INTO Profiles
VALUES ('Ann Shirley', 'Navasca', '21', 'Female', '09627271449', 'Cebu City', 'shirley@gmail.com', 'Active');

INSERT INTO Users
VALUES ('admin', 'admin123', '1', '1');

UPDATE Users
SET Password = '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9'
WHERE Username = 'admin'

UPDATE Profiles
SET Status = 'Pending'
WHERE FirstName = 'mama'

UPDATE Profiles
SET Status = 'Active'
WHERE FirstName = 'Karms'


UPDATE Courses
SET Status = 'Active'
WHERE CourseCode = 'COMPRO1'

SELECT * FROM Profiles
SELECT * FROM Users
SELECT * FROM Students
SELECT * FROM Departments
SELECT * FROM Logs
SELECT * FROM Instructors
SELECT * FROM Courses
