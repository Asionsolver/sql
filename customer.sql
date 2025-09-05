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

INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
	VALUES 	
		(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
		(1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
		(245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
		(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
		(500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

INSERT INTO Customer 
VALUES (121, 'Ashis Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

REPLACE INTO Customer(id, cname, Address, Gender, City, Pincode)
	VALUES (122, 'Ashis ', 'Dilbagh Nagar', 'M', 'Jalandhar', 141002);

REPLACE INTO Customer(id, City)
	VALUES (122, 'Baliaghatta');
    
REPLACE INTO Customer(id, cname,city)
	SELECT id,cname,city
    FROM Customer WHERE id = 500;

INSERT INTO Customer (id, cname) 
	VALUES 	
		(1221, 'Joy Kumar');

-- UPDATE DATA
UPDATE Customer SET Address='Kolkata', Gender='M', City='Puri', Pincode=152333 WHERE ID = 1221;

-- UPDATE MULTIPLE ROW

-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

UPDATE Customer SET Pincode = Pincode + 1;

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

-- DELETE
DELETE FROM Customer WHERE ID = 1221;

-- DELETE
DELETE FROM Customer;

SELECT * FROM Customer;

CREATE TABLE Order_details (
    Order_id INTEGER PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES Customer(id) ON DELETE SET NULL
    -- PARMANENTLY DELETE ALL REFERENCE DATA
    -- FOREIGN KEY (cust_id) REFERENCES Customer(id) ON DELETE CASCADE
);

INSERT INTO Order_details 
	VALUES 	
		(1, '2019-03-11',121),
        (2, '2019-03-12',121),
		(3, '2019-03-13',121);
        
DELETE FROM Customer WHERE ID = 121;

SELECT * FROM Order_details;


CREATE TABLE Account(
	ID INT PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE,
    BALANCE INT NOT NULL DEFAULT 0
    
    -- CONSTRAINT ACCOUNT_BALANCE_CHK CHECK(BALANCE>100)
);

INSERT INTO Account(ID, NAME)
	VALUE(1, 'Ashis');
    
-- ADD NEW COLUMN
ALTER TABLE Account ADD INTEREST FLOAT NOT NULL DEFAULT 0;

-- MODIFY 
ALTER TABLE Account MODIFY INTEREST DOUBLE NOT NULL DEFAULT 0;
 
SELECT * FROM Account_Details;

-- DESCRIBE ACCOUNT
DESC Account;

-- CHANGE COLUMN - RENAME THE COLUMN
ALTER TABLE Account CHANGE COLUMN INTEREST SAVING_INTEREST DOUBLE NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE Account DROP COLUMN SAVING_INTEREST;

-- RENAME THE TABLE
ALTER TABLE Account RENAME TO Account_Details;

-- DROP TABLE
DROP TABLE Account;
