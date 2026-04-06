## University Management System Database
### Project Overview

This project is a relational database system designed to manage a university environment. It handles students, courses, instructors, enrollments, and grades, demonstrating proper database design, normalization, and SQL query implementation.

### Features
Student Management: Stores unique student details (ID, name, email).
Course Management: Organizes courses and links them to instructors.
Instructor Management: Stores instructor details and assigns courses.
Enrollment System: Handles many-to-many relationships between students and courses.
Grade Management: Tracks grades per student per course for performance analysis.
## Database Design
Tables: Students, Courses, Instructors, Enrollments
Relationships:
Students ↔ Enrollments ↔ Courses (Many-to-Many)
Courses ↔ Course_Instructors ↔ Instructors (Many-to-Many with semester/year)
Constraints include primary keys, foreign keys, unique emails, and proper data types for dates and grades.

## Sample Queries
1.Fetch student details by ID and update email
2.Delete a student and related enrollments
3.List courses ordered by credits
4.Show instructor names with departments
5.Join students, courses, and enrollments to see grades
6.Update grades for students
7.Find students with no enrollments
8.Calculate total credits per student for a year
## How to Run
Open a SQL environment (MySQL, SQLite, PostgreSQL, etc.)
Run database.sql to create tables and insert sample data
Execute the included example queries to test functionality
Project Files
