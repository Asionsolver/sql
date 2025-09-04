/*show all database*/
SHOW DATABASES;

/*create new database*/
CREATE DATABASE temp;

USE temp;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(255)
);

INSERT INTO student VALUES(1,'Ashis');
INSERT INTO student VALUES(2,'Asis');


SELECT * FROM student;

DROP DATABASE IF EXISTS temp;
DROP DATABASE IF EXISTS student;
DROP DATABASE IF EXISTS sys;