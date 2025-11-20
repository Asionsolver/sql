CREATE DATABASE ECOMMERCE;

SHOW DATABASES;

USE ECOMMERCE;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(255)
);

INSERT INTO Products VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags'),
(2, 'Chang', 1, 1, '24 - 12 oz bottles'),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles'),
(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars'),
(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes'),
(6, 'Grandma''s Boysenberry', 3, 2, '12 - 8 oz jars'),
(11, 'Blican',1,2,'10 boxes x 20 bags'),
(14, 'Samiro',1,1,'20 - 10 oz bottles'),
(41, 'Lorika',3,1,'8 - 9 oz jars'),
(42, 'Tefton',3,2,'90 boxes x 20 bags'),
(51, 'Lylon',1,2,'65 boxes x 20 bags'),
(65, 'Jemiron',3,2,'30 boxes x 9 bags'),
(72, 'Hot Showk',2,2,'30 boxes');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT
);

INSERT INTO Orders VALUES
(10248, 90, 5, '1996-07-04', 3),
(10249, 81, 6, '1996-07-05', 1),
(10250, 34, 4, '1996-07-08', 2),
(10251, 84, 3, '1996-07-08', 1),
(10252, 76, 4, '1996-07-09', 2),
(10253, 34, 3, '1996-07-10', 2),
(10254, 14, 5, '1996-07-11', 2),
(10255, 68, 9, '1996-07-12', 3);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO OrderDetails VALUES
(1, 10248, 11, 12),
(2, 10248, 42, 10),
(3, 10248, 72, 5),
(4, 10249, 14, 9),
(5, 10249, 51, 40),
(6, 10250, 41, 10),
(7, 10250, 51, 35),
(8, 10250, 65, 15);

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

-- Find products than were never order
SELECT ProductID, ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM OrderDetails od
    WHERE od.ProductID = p.ProductID
);
