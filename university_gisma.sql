USE university_gisma;

CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    registration_date DATE,
    date_of_birth DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    semester VARCHAR(20),
    level VARCHAR(50),
    credits INT
);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    department VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    year INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Course_Instructors (
    course_id INT,
    instructor_id INT,
    semester VARCHAR(20),
    year INT,
    PRIMARY KEY (course_id, instructor_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);
show tables;
INSERT INTO Students VALUES (
    1040349, 'Palak', 'Roy', 'Roy@example.com',
    '1234567890', '2024-01-15', '2005-09-10'
);
INSERT INTO Students VALUES
(1040350, 'Aman', 'Sharma', 'aman@email.com', '1345678111', '2024-02-01', '2003-05-12'),
(1040351, 'Neha', 'Verma', 'neha@email.com', '2479234109', '2024-03-10', '2002-08-20');
INSERT INTO Students VALUES
(1040353, 'Fatima', 'Khan', 'fatima.khan@gisma.edu', '4915205566778', '2024-02-01', '2004-12-30'),
(1040354, 'Carlos', 'Rivera', 'carlos.rivera@gisma.edu', '4915208899001', '2024-02-01', '2003-06-14'),
(1040355, 'Priya', 'Nair', 'priya.nair@gisma.edu', '4915203344556', '2024-02-10', '2005-01-25'),
(1040356, 'Jonas', 'Becker', 'jonas.becker@gisma.edu', '4915206677889', '2024-02-10', '2004-08-09'),
(1040357, 'Mia', 'Hoffmann', 'mia.hoffmann@gisma.edu', '4915202233445', '2024-02-28', '2003-04-17'),
(1040358, 'Omar', 'Hassan', 'omar.hassan@gisma.edu', '4915207788990', '2024-03-01', '2005-02-28');


SELECT * FROM Students;


INSERT INTO Courses VALUES
(101, 'Database Systems', 'Spring', 'Undergraduate', 3);
INSERT INTO Courses VALUES
(102, 'Python Programming', 'Winter', 'Undergraduate', 8);
INSERT INTO Courses VALUES
(304, 'Financial Management', 'Postgraduate', 5),
(305, 'Digital Marketing', 'Undergraduate', 4),
(306, 'Machine Learning Fundamentals', 'Postgraduate', 6),
(307, 'Project Management', 'Postgraduate', 4),
(308, 'Data Structures & Algorithms', 'Undergraduate', 6);
SELECT * FROM Courses;




INSERT INTO Instructors 
(instructor_id, first_name, last_name, email, phone_number,  department)
VALUES
(1, 'John', 'Smith', 'john@uni.com', '9671492564', 'Computer Science');
INSERT INTO Instructors 
(instructor_id, first_name, last_name, email, phone_number,  department)
VALUES
(2, 'Dhara', 'Singh', 'singh@uni.com', '7826100536', 'Computer Science');
INSERT INTO Instructors (instructor_id, first_name, last_name, email, phone_number,  department) VALUES
(201, 'Anna', 'Schmidt', 'a.schmidt@gisma.edu', '4930111001',  'Computer Science'),
(202, 'James', 'Whitfield', 'j.whitfield@gisma.edu', '4930111002',  'Business'),
(203, 'Neha', 'Gupta', 'n.gupta@gisma.edu', '4930111003',  'Data Science'),
(204, 'Marc', 'Dupont', 'm.dupont@gisma.edu', '4930111004',  'Finance'),
(205, 'Layla', 'Ibrahim', 'l.ibrahim@gisma.edu', '4930111005', 'Marketing');
SELECT * FROM Instructors;

INSERT INTO Course_Instructors (course_id, instructor_id,semester, year) VALUES
(101, 1, 'Spring', 2024),
(102, 1, 'Spring', 2025),
(304, 2, 'Spring', 2026),
(304, 2,  'Spring',2023),
(305, 2, 'Fall', 2024),
(306, 1,  'Spring',2022),
(307, 1, 'Spring',2020),
(308, 1,'Spring', 2021);
SELECT * FROM Course_Instructors;



SELECT * FROM Students WHERE student_id = 1040354;   
UPDATE Students
SET email = 'rivera_new@email.com'
WHERE student_id = 1040354;
SELECT * FROM Students WHERE student_id = 1040354;
SHOW TABLES;


SELECT * FROM Students WHERE student_id = 1040355;
DELETE FROM Enrollments
WHERE student_id = 1040355;
DELETE FROM Students WHERE student_id = 1040355;
SELECT * FROM Students WHERE student_id = 1040355;
DELETE FROM Students
WHERE student_id = 1040349;

SELECT * FROM Courses
WHERE course_id = 101;

DELETE FROM Enrollments
WHERE student_id = 1040349 AND course_id = 102
 AND year = 2024;

SELECT * FROM Courses ORDER BY credits DESC;

SELECT instructor_id, CONCAT(first_name, ' ', last_name) AS instructor_name, department
FROM Instructors;

SELECT e.enrollment_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    c.course_name, e.year, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY e.year, student_name;

 
 
UPDATE Enrollments
SET grade = 'A'
WHERE student_id = 1040349 AND course_id = 101
 AND year = 2024;
 
 DELETE FROM Enrollments
WHERE student_id = 1040350 AND course_id = 303  AND year = 2024;

SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;



SELECT s.student_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    SUM(c.credits) AS total_credits
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.year = 2024
GROUP BY s.student_id
ORDER BY total_credits DESC;


















