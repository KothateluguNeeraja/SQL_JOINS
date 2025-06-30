create database JOINS
USE JOINS
CREATE TABLE students( StudentId int primary key,
StudentName varchar(30),
mobile_no int, 
Department varchar(30));
ALTER TABLE Students
MODIFY mobile_no VARCHAR(15);

Create table Courses ( courseID INT primary key,
Course_name varchar(40),
course_fee INT,
Duration varchar(40));

create table Enrollments( EnrollmentID INT PRIMARY key,
StudentID INT ,
CourseId int,
EnrollmentDate DATE,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
); 


INSERT INTO Students VALUES (1, 'Neeraja',9988998899 ,'Data Science'),
(2, 'keerthi',8899889988, 'Artificial Intalligence'),
(3, 'shruthi', 7785698745,'Mechanical'),
(4, 'krishna',8899889981, 'Computer Science'),
(5, 'Radha',9988775582, 'Information Technology');

INSERT INTO Students VALUES (6, 'Siri', '9787654321', 'IT');


insert into courses values(101, 'Python Programming',20000, '6 months'),
(102, 'Java fullstack',18000, '8 months'),
(103, 'Data analytics',18000, '5 months'),
(104, 'frontend devoloper',12000, '4 months'),
(105, 'Javascript',10000, '3 months');

INSERT INTO Enrollments VALUES (221, 1, 101, '2024-12-28'),
(222, 1, 102, '2024-12-10'),
(223, 1, 103, '2025-02-10'),
(224, 1, 104, '2025-03-15'),
(225, 1, 105, '2025-04-16');

UPDATE Enrollments SET StudentID = 2 WHERE EnrollmentID = 222;
UPDATE Enrollments SET StudentID = 3 WHERE EnrollmentID = 223;
UPDATE Enrollments SET StudentID = 4 WHERE EnrollmentID = 224;
UPDATE Enrollments SET StudentID = 5 WHERE EnrollmentID = 225;

--inner joins
SELECT Students.StudentName, Enrollments.CourseID
FROM Students
INNER JOIN Enrollments
ON Students.StudentID = Enrollments.StudentID;

--left joins

SELECT Students.StudentName, Enrollments.CourseID
FROM Students
LEFT JOIN Enrollments
ON Students.StudentID = Enrollments.StudentID;

--RIGHT JOINS
SELECT Students.StudentName, Enrollments.CourseID
FROM Students
RIGHT JOIN Enrollments
ON Students.StudentID = Enrollments.StudentID;

--FULL JOINS

SELECT Students.StudentName, Enrollments.CourseID
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID

UNION

SELECT Students.StudentName, Enrollments.CourseID
FROM Students
RIGHT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

SELECT * FROM ENROLLMENTS;
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;

CREATE TABLE merge_table AS
SELECT 
    Students.StudentName,
    Students.mobile_no,
    Students.Department,
    Courses.Course_name,
    Courses.Duration,
    Enrollments.EnrollmentDate
FROM Enrollments
INNER JOIN Students ON Enrollments.StudentID = Students.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

select * from merge_table





