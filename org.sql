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

SELECT FIRST_NAME, SALARY FROM Worker;
        
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

CREATE TABLE Customer (
id integer PRIMARY KEY,
cname varchar(225),
Address varchar(225),
Gender char(2),
City varchar(225),
Pincode integer
);

INSERT INTO Customer
VALUES (1251,'Ram Kumar','Dilbagh Nagar','M','Jalandhar', 144002),
(1300,'Shayam Singh','Ludhiana H.O','M','Ludhiana', 141001),
(245,'Neelabh Shukla','Ashok Nagar','M','Jalandhar', 144003),
(210,'Barkha Singh','Dilbagh Nagar','F','Jalandhar', 144002),
(500,'Rohan Arora','Ludhiana H.O','M','Ludhiana', 141001);
     
INSERT INTO Customer
VALUES (1252,'Swan Kumar','Dilbagh Nagar','M','Jalandhar', NULL);


INSERT INTO Customer
VALUES (1253,'Pawn Kumar','Dilbagh Nagar','M','Jalandhar', 123542),
       (1254,'Pawn Sing','Dilbagh Nagar','M','Jalandhar', 123542);
select * from Customer;

--  CREATE TABLE Order_details (
-- Order_id integer PRIMARY KEY,
-- Delevery_date date,
-- Cust_id int,
-- foreign key(Cust_id) references Customer(id)
-- );  

--  CREATE TABLE Order_details (
-- Order_id integer PRIMARY KEY,
-- Delevery_date date,
-- Cust_id int,
-- foreign key(Cust_id) references Customer(id) on delete cascade
-- );   

 CREATE TABLE Order_details (
Order_id integer PRIMARY KEY,
Delevery_date date,
Cust_id int,
foreign key(Cust_id) references Customer(id) on delete set null
);       
        
insert into Order_details
values (1,'2019-03-11',500),
	   (2,'2019-03-12',500),
       (3,'2019-03-13',245),
       (4,'2019-03-11',210),
       (5,'2012-03-11',1300);        
        
        
select * from Order_details;
        
-- integrity constrains
-- Cannot delete or update a parent row: a foreign key constraint fails (`ORG`.`Order_details`, CONSTRAINT `Order_details_ibfk_1` FOREIGN KEY (`Cust_id`) REFERENCES `Customer` (`id`))
delete from Customer where id = 500;        
        
-- Replace --> Data already present, then replace. But data not present then insert new        

replace into Customer
values(21,'Pritom','Ashok Nagar','M','Jalandhar', 150002 );

replace into Customer set id=13, cname='Prithijit', address='Pabna', gender='M', city='Rajshahi', pincode=145241;
        

-- inner join        
        
        








        
        
        
        
-- create table account(
-- id int primary key,
-- name varchar(255) unique,
-- balance int,
-- constraint acc_balance_check check(balance>1000)
-- );


    
select 44+11;

select now();

select lcase('Ashis');

select * from Worker where SALARY > 80000;        
	
select * from Worker where DEPARTMENT = "HR";

-- salary [80000,300000]
select * from Worker where SALARY between 80000 AND 300000;

-- reduce OR statement
-- HR, ADMIN, Finance
select * from Worker where DEPARTMENT = 'HR' or DEPARTMENT = 'Admin' or DEPARTMENT = 'Finance';

-- better way: insert
select * from Worker where DEPARTMENT in ('HR', 'Admin', 'finance');
        
select * from Worker where DEPARTMENT not in ('HR', 'Admin', 'finance');    
        
        
select * from Customer where Pincode is NULL;        
        
-- pattern match
select * from Worker where first_name like '%i%'; 
select * from Worker where first_name like '_i%';     
select * from Worker where first_name like '__i%';     
        
-- sorting using order by
-- by default asc
select * from Worker order by salary; 

select * from Worker order by salary desc;       
        
-- Distinct Values
select distinct department from Worker;    

-- Data Grouping  

-- Find no. of employee working in different department.
-- group by
select department from Worker group by department;   

select department, count(*) from Worker group by department;         
	
select department, count(Department) from Worker group by department;

-- Avg salary per department
select department, avg(Salary) from Worker group by department;

-- min        
select department, min(Salary) from Worker group by department;        

-- max
select department, max(Salary) from Worker group by department;       
   
-- sum
select department, sum(Salary) from Worker group by department;     
 
-- group by <--> having
select department, count(Department) from Worker group by department having count(Department) > 4; 
        

        
create table account(
id int primary key,
name varchar(255) unique,
balance int not null default 0
);
insert into account(id,name)
values(1, 'Ashis');

-- less than 1000 so can not insert this balance and name must be unique
insert into account
values(2, 'Asis', 2000);

-- add new column
alter table account add interest float not null default 0;
alter table account add abc int not null default 0;

-- modify column data type
alter table account modify interest double not null default 0;

-- rename column
alter table account change interest saving_interest float not null default 0;

-- drop column 
alter table account drop abc;

-- rename table name
alter table account rename to account_details;

-- previous name
-- select * from account;

-- new name
select * from account_details;

-- describe account

desc account;

drop table account;
        
        
-- DML--> Data Modification Language    

insert into account_details(id,name)
values(5, 'Avisek'),
      (6, 'Niloy'),
      (7, 'Pritom');
      
insert into account_details
values(3, 'Asion', 2000,0.5),
	  (4, 'Tripti', 2000,0.5);
                
-- update --> if row is not present, Replace will add a new row while update will do nothing
update account_details set balance=3000 where id = 3;       
        
update account_details set balance=4000, saving_interest=0.8 where id = 4;          
        
-- update multiple row
set SQL_SAFE_UPDATE=1;  
      
update account_details set saving_interest=0.9;        
      
update account_details set balance= balance + 100;        
        
-- delete
delete from account_details where id =1;        
        
-- delete table
delete from account_details;
        
select * from account_details;        