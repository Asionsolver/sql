/*show all database*/
SHOW DATABASES;

/*create new database*/
create database Course;

use Course;


-- 1. Create a student table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    enrollment_year YEAR,
    major VARCHAR(50)
);

-- 2. Create a timetable
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(10) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department VARCHAR(50)
);

-- 3. Create a course selection record table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade DECIMAL(3, 1), -- Grade, for example, 85.5
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 4. Create a transaction record table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    transaction_type ENUM('Tuition', 'Scholarship', 'Fee'), -- Transaction type
    amount DECIMAL(10, 2),
    transaction_date DATE,
    description TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert student data
INSERT INTO Students (first_name, last_name, email, enrollment_year, major) VALUES
('Abdul', 'Karim', 'abdul.k@email.com', 2022, 'Computer Science'),
('Fatima', 'Begum', 'fatima.b@email.com', 2021, 'Electrical Engineering'),
('Rahim', 'Islam', 'rahim.i@email.com', 2023, 'Business Administration'),
('Ayesha', 'Siddiqa', 'ayesha.s@email.com', 2022, 'Computer Science'),
('Imran', 'Hossain', 'imran.h@email.com', 2021, 'Mathematics'),
('Tania', 'Akter', 'tania.a@email.com', 2023, 'Physics');

-- Insert course data
INSERT INTO Courses (course_code, course_name, credits, department) VALUES
('CS101', 'Introduction to Programming', 3, 'Computer Science'),
('CS201', 'Data Structures', 4, 'Computer Science'),
('EE101', 'Basic Circuit Theory', 3, 'Electrical Engineering'),
('MATH101', 'Calculus I', 4, 'Mathematics'),
('BUS101', 'Principles of Management', 3, 'Business Administration'),
('PHY101', 'Mechanics', 4, 'Physics');

-- Insert course selection record
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-01-15', 85.5),
(1, 2, '2023-01-15', 92.0),
(2, 3, '2023-01-10', 78.0),
(3, 5, '2023-01-20', 88.5),
(4, 1, '2023-01-12', 90.0),
(4, 2, '2023-01-12', 86.5),
(5, 4, '2023-01-18', 95.0),
(6, 6, '2023-01-22', 82.5);

-- Insert transaction record
INSERT INTO Transactions (student_id, transaction_type, amount, transaction_date, description) VALUES
(1, 'Tuition', -5000.00, '2023-01-05', 'Spring 2023 Tuition Fee'),
(1, 'Scholarship', 1500.00, '2023-01-10', 'Merit Scholarship'),
(2, 'Tuition', -5000.00, '2023-01-05', 'Spring 2023 Tuition Fee'),
(3, 'Tuition', -4500.00, '2023-01-06', 'Spring 2023 Tuition Fee'),
(4, 'Tuition', -5000.00, '2023-01-05', 'Spring 2023 Tuition Fee'),
(4, 'Scholarship', 2000.00, '2023-01-12', 'Need-Based Scholarship'),
(5, 'Tuition', -4800.00, '2023-01-07', 'Spring 2023 Tuition Fee'),
(6, 'Tuition', -4700.00, '2023-01-08', 'Spring 2023 Tuition Fee');

select * from Students;

select * from Courses;

select * from Enrollments;

select * from Transactions;

-- Questions

-- A. WHERE, AND, OR, NOT

-- (WHERE, AND) 
-- 1. Search the Students table for all students who enrolled in 2022 with a major in 'Computer Science'.
select * from Students where enrollment_year=2022 and major = 'Computer Science';

-- (OR)
-- 2. Search for all students whose major is 'Computer Science' or 'Mathematics'.
select * from Students where major = 'Mathematics' or major = 'Computer Science';

-- (NOT)
-- 3. Find all students who did not enroll in 2023.
select * from Students where enrollment_year != 2023;
 
-- (AND, OR combination)
-- 4. Search for students who enrolled in 2021 or 2022 and whose major is 'Computer Science'.
select * from Students where (enrollment_year = 2021 OR enrollment_year = 2022) and major = 'Computer Science';

-- B. BETWEEN, IN

-- (BETWEEN)
-- 5. From the Enrollments table, retrieve all records registered between '2023-01-15' and '2023-01-20' (inclusive).
select * from Enrollments where enrollment_date between '2023-01-15' and '2023-01-20';

-- (IN) 
-- 6. Retrieve courses from the Courses table that have 3 or 4 credits.
select * from Courses WHERE credits IN (3, 4);

-- (NOT IN)
-- 7. Inquire about all students whose major is not 'Physics' or 'Business Administration'.
SELECT * FROM Students WHERE major NOT IN ('Physics', 'Business Administration');


-- C. Pattern Searching / Wildcard (‘%’, ‘_’)

-- (LIKE 'A%') 
-- 8. Query all students whose names (first_name) begin with 'A'.
SELECT * FROM Students WHERE first_name LIKE 'A%';

-- (LIKE '%a') 
-- 9. Retrieves all students whose names end with 'a'.
SELECT * FROM Students WHERE first_name LIKE '%a';

-- (LIKE '%im%') 
-- 10. Query all students whose names contain the substring 'im'.
SELECT * FROM Students WHERE first_name LIKE '%im%';

-- (LIKE 'T_nia') 
-- 11. Query students whose names match the pattern 'T_nia' (e.g., Tania).
SELECT * FROM Students WHERE first_name LIKE 'T_nia';

-- D. ORDER BY

-- (ORDER BY ASC) 
-- 12. Sorts all students in ascending order by their last name (last_name).
select * from Students order by last_name asc;

--  (ORDER BY DESC)
-- 13. Sort all students in descending order by enrollment year (enrollment_year).
select * from Students order by enrollment_year desc;

-- (ORDER BY multiple columns)
-- 14. First sort by major in ascending order, then sort by last name in ascending order if the majors are the same.
SELECT * FROM Students ORDER BY major ASC, last_name ASC;


-- E. (DISTINCT)

-- 15. From the Students table, find a list of all unique majors.
SELECT DISTINCT major FROM Students;

-- 16. From the Enrollments table, find all course IDs that have students enrolled (each course ID appears only once).
SELECT DISTINCT course_id FROM Enrollments;

-- F. GROUP BY
-- 17. (GROUP BY, COUNT) Count how many students are in each major.
SELECT major, COUNT(*) AS student_count
FROM Students
GROUP BY major;

-- 18. (GROUP BY, AVG) Calculate the average grade for each course (requires joining the Enrollments and Courses tables).
SELECT 
    c.course_name, AVG(e.grade) AS average_grade
FROM
    Enrollments e
        JOIN
    Courses c ON e.course_id = c.course_id
GROUP BY e.course_id , c.course_name;

-- 19. GROUP BY, SUM) calculates the total transaction amount for each student (the amount in the Transactions table).
SELECT s.first_name, s.last_name, SUM(t.amount) AS net_amount
FROM Transactions t
JOIN Students s ON t.student_id = s.student_id
GROUP BY t.student_id, s.first_name, s.last_name;
-- GROUP BY HAVING

-- 20. (HAVING with COUNT) Identify majors with more than 1 student.
SELECT major, COUNT(*) AS student_count
FROM Students
GROUP BY major
HAVING COUNT(*) > 1;

-- 21. (HAVING with AVG) Identify courses with an average grade higher than 88.0.
SELECT c.course_name, AVG(e.grade) AS average_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY e.course_id, c.course_name
HAVING AVG(e.grade) > 88.0;

-- 22. (HAVING with SUM) Identify students whose total scholarship (transaction_type = 'Scholarship') exceeds 1500 yuan.
SELECT s.student_id, s.first_name, s.last_name, SUM(t.amount) AS total_scholarship
FROM Transactions t
JOIN Students s ON t.student_id = s.student_id
WHERE t.transaction_type = 'Scholarship'
GROUP BY t.student_id, s.student_id, s.first_name, s.last_name
HAVING SUM(t.amount) > 1500;

-- 

-- 

-- 