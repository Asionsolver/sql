CREATE DATABASE SETOPERATION;
USE SETOPERATION;

-- Create Dep1 table
CREATE TABLE Dep1 (
    empid INT,
    name VARCHAR(50),
    role VARCHAR(50)
);

-- Insert data into Dep1
INSERT INTO Dep1 (empid, name, role) VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

SELECT * FROM Dep1;

-- Create Dep2 table
CREATE TABLE Dep2 (
    empid INT,
    name VARCHAR(50),
    role VARCHAR(50)
);

-- Insert data into Dep2
INSERT INTO Dep2 (empid, name, role) VALUES
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman');

SELECT * FROM Dep2;

-- SET OPERATIONS

-- List out all the employee in the company
SELECT * FROM Dep1 
UNION
SELECT * FROM Dep2;

-- List out all the employees in all departments who work as salesman
SELECT * FROM Dep1 WHERE role = 'salesman' 
UNION
SELECT * FROM Dep2 WHERE role = 'salesman';

-- List out all the employees who work for both the department.
SELECT Dep1.* FROM Dep1 INNER JOIN Dep2 using(empid);


-- List out all the employees working in dep1 but no in dep2
SELECT Dep1.* FROM Dep1 LEFT JOIN Dep2 USING(empid)
WHERE Dep2.empid IS NULL;

-- Find employees only in Dep2
















