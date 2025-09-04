CREATE DATABASE ORG;

SHOW DATABASES;

USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'Hr'),
        (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Divan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin'),
		(009, 'Rahul', 'Sharma', 85000, '14-02-20 09.00.00', 'Admin'),
		(010, 'Priya', 'Patel', 95000, '14-02-20 09.00.00', 'Hr'),
		(011, 'Vikram', 'Singh', 120000, '14-02-20 09.00.00', 'IT'),
		(012, 'Sneha', 'Gupta', 78000, '14-02-20 09.00.00', 'Admin'),
		(013, 'Amit', 'Kumar', 110000, '14-02-20 09.00.00', 'IT'),
		(014, 'Neha', 'Desai', 90000, '14-02-20 09.00.00', 'Hr'),
		(015, 'Rajesh', 'Mehta', 105000, '14-02-20 09.00.00', 'Finance'),
		(016, 'Anjali', 'Joshi', 88000, '14-02-20 09.00.00', 'Admin');
        
SELECT  * FROM Worker;

SELECT SALARY FROM Worker;

SELECT FIRST_NAME, SALARY FROM Worker;   

SELECT 55 + 11;

SELECT now();

SELECT lcase('ASHIS');

SELECT * FROM Worker WHERE SALARY > 200000;

SELECT * FROM Worker WHERE DEPARTMENT = 'IT';

-- SALARY [80000,100000]
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 100000;

-- REDUCE OR STATEMENT
-- HR, ADMIN

SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN' OR DEPARTMENT = 'IT';

-- BETTER WAY: IN
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'ADMIN', 'IT');

-- NOT
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'ADMIN', 'IT');

-- WILDCARD

-- Worker টেবিল থেকে সেই সব কর্মীদের সকল তথ্য দেখাবে, যাদের প্রথম নামের মাঝে যেকোনো জায়গায় "a" অক্ষরটি আছে
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

-- Worker টেবিল থেকে সেই সব কর্মীদের তথ্য দেখাবে, যাদের প্রথম নাম "a" দিয়ে শুরু হয়
SELECT * FROM Worker WHERE FIRST_NAME LIKE 'a%';

-- Worker টেবিল থেকে সেই সব কর্মীদের তথ্য দেখাবে, যাদের প্রথম নাম "a" দিয়ে শেষ হয়
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

-- Worker টেবিল থেকে সেই সব কর্মীদের তথ্য দেখাবে, যাদের প্রথম নামের শেষের আগের অক্ষরটি "a"
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a_';

-- Worker টেবিল থেকে সেই সব কর্মীদের তথ্য দেখাবে, যাদের প্রথম নামের দ্বিতীয় অক্ষরটি "a"
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_a%';

-- SORTING USING ORDER BY
SELECT * FROM Worker ORDER BY SALARY;

SELECT * FROM Worker ORDER BY SALARY DESC;

-- DISTINCT
-- Remove duplicate rows or values ​​from a table and show only unique values.
SELECT DISTINCT DEPARTMENT FROM Worker;

-- DATA GROUPING
-- Group rows with the same value into a group and then perform an aggregate calculation for each group.
-- If you want to know the total salary of each department:

SELECT DEPARTMENT, SUM(SALARY) 
FROM Worker 
GROUP BY DEPARTMENT;

-- WORKIER COUNT OF EACH DEPARTMENT
SELECT DEPARTMENT, COUNT(*) 
FROM Worker 
GROUP BY DEPARTMENT;

-- Show the unique/distinct values of the DEPARTMENT column from the Worker table. Even if there are multiple entries of the same department, it will show each department only once.This will actually work the same as SELECT DISTINCT DEPARTMENT FROM Worker; , because GROUP BY automatically removes duplicate values.
SELECT DEPARTMENT 
FROM Worker 
GROUP BY DEPARTMENT;


CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
SELECT  * FROM Bonus;   

CREATE TABLE Title(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);    
        
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(001, 'Manager', '2016-02-20 00:00:00'),
		(002, 'Executive', '2016-06-11 00:00:00'),
		(008, 'Executive', '2016-06-11 00:00:00'),
		(005, 'Manager', '2016-06-11 00:00:00'),
		(004, 'Asst. Manager', '2016-06-11 00:00:00'),
		(007, 'Executive', '2016-06-11 00:00:00'),
		(006, 'Lead', '2016-06-11 00:00:00'),
		(003, 'Lead', '2016-06-11 00:00:00'),
        (009, 'Executive', '2014-02-20 00:00:00'),
		(010, 'Manager', '2014-02-20 00:00:00'),
		(011, 'Lead', '2014-02-20 00:00:00'),
		(012, 'Executive', '2014-02-20 00:00:00'),
		(013, 'Developer', '2014-02-20 00:00:00'),
		(014, 'Executive', '2014-02-20 00:00:00'),
		(015, 'Finance Manager', '2014-02-20 00:00:00'),
		(016, 'Admin Executive', '2014-02-20 00:00:00');
				
SELECT  * FROM Title;        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        