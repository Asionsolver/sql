CREATE DATABASE temp;

USE temp;

CREATE TABLE Customer (
    id INTEGER PRIMARY KEY,
    cname VARCHAR(225),
    Address VARCHAR(225),
    Gender CHAR(2),
    City VARCHAR(225),
    Pincode INTEGER
);

INSERT INTO Customer 
	(id, cname, Address, Gender, City, Pincode) VALUES 
		(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
		(1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
		(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
		(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
		(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

INSERT INTO Customer 
VALUES (121, 'Ashis Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

SELECT * FROM Customer WHERE pincode IS NULL;

CREATE TABLE Order_details (
    Order_id INTEGER,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(id)
);