CREATE DATABASE EnterpriseHub;
USE EnterpriseHub;

-- employees
CREATE TABLE project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT
);

INSERT INTO project (id, empID, name, startdate, clientID) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

SELECT * FROM project;

-- employee
CREATE TABLE employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50)
);

INSERT INTO employee (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Halpur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

SELECT * FROM employee;

-- clients
CREATE TABLE clients (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    empID INT
);

INSERT INTO clients (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

SELECT * FROM clients;

-- QUESTION

-- INNER JOIN
-- Enlist all the employees ID's, names along with the Project allocated to them.
SELECT e.id, e.fname, e.lname, p.id, p.name from employee as e INNER JOIN project as p on e.id = p.empID;

-- Fetch out all the employee ID's and their contract detail who have been working
-- from Jaipur with the clients name working in Hyderabad.
SELECT e.id,e.fname, e.emailID, e.PhoneNo, e.city, c.id,c.first_name, c.City from employee as e INNER JOIN  clients as c on e.id =  c.empID where e.City ='Jaipur' AND c.City ='Hyderabad'; 

-- LEFT JOIN
-- Fetch out each project allocated to each employee.alter
SELECT * from employee as e LEFT JOIN project as p ON e.id = p.empID;

-- RIGHT JOIN
-- lIST out all the projects along with the employee's name and their respective allocated email ID.
SELECT p.id, p.name, e.fname, e.lname, e.emailID FROM employee as e RIGHT JOIN project as p on e.id = p.empID;

-- CROSS JOIN
-- List out all the combinations possible forthe employee's nsame and projects that cna exist.
select e.fname, e.lname,p.id, p.name FROM employee as e CROSS JOIN project as p;

















