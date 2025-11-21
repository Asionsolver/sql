create database Online_Store;

use Online_Store;

-- 1. Customer Form
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);

-- 2. Product List
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

-- 3. Order Form
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Details Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert customer data
INSERT INTO customers (first_name, last_name, email, phone, city, registration_date) VALUES
('Raj', 'Sharma', 'raj.sharma@email.com', '9876543210', 'Delhi', '2023-01-15'),
('Priya', 'Patel', 'priya.patel@email.com', '9876543211', 'Mumbai', '2023-02-20'),
('Amit', 'Kumar', 'amit.kumar@email.com', '9876543212', 'Bangalore', '2023-03-10'),
('Neha', 'Singh', 'neha.singh@email.com', '9876543213', 'Delhi', '2023-01-25'),
('Sanjay', 'Gupta', 'sanjay.gupta@email.com', '9876543214', 'Kolkata', '2023-04-05');

-- Insert product data
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('iPhone 14', 'Electronics', 79999.00, 50),
('Samsung Galaxy S23', 'Electronics', 69999.00, 30),
('Nike Air Max', 'Footwear', 8999.00, 100),
('Adidas Ultraboost', 'Footwear', 12999.00, 75),
('MacBook Pro', 'Electronics', 199999.00, 20),
('Levi''s Jeans', 'Clothing', 2999.00, 150);

-- Insert order data
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2023-05-01', 79999.00, 'Delivered'),
(2, '2023-05-02', 169998.00, 'Processing'),
(3, '2023-05-03', 21997.00, 'Delivered'),
(1, '2023-05-04', 12999.00, 'Shipped'),
(4, '2023-05-05', 2999.00, 'Delivered');

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(2, '2023-03-05', 299.00, 'Shipped'),
(3, '2023-02-05', 299.00, 'Processing'),
(4, '2023-01-05', 299.00, 'Processing'),
(3, '2023-03-05', 299.00, 'Shipped'),
(2, '2023-04-05', 299.00, 'Delivered'),
(4, '2023-04-05', 299.00, 'Delivered'),
(1, '2023-03-05', 299.00, 'Processing'),
(1, '2023-02-05', 289.00, 'Delivered');

-- Insert order details data
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 79999.00),
(2, 5, 1, 199999.00),
(3, 3, 1, 8999.00),
(3, 6, 1, 2999.00),
(4, 4, 1, 12999.00),
(5, 6, 1, 2999.00);

select * from customers;
select * from products;
select * from orders;
select * from order_items;



-- ************************************************************************************Basic WHERE Clause Practice************************************************************************************
-- Find all customers from the city of Delhi.
select * from customers where city = 'Delhi';

-- Find all products with a price greater than 50,000.
select * from products where price > 50000;

-- Find all customers who registered after March 2023.
select * from customers where registration_date > '2023-03-31';

-- ************************************************************************************Advanced WHERE Condition Exercises************************************************************************************
-- Find products priced between 10,000 and 50,000 with an inventory of more than 25.
select * from products where price between 10000 and 50000 and stock_quantity > 25;


-- Find customers who are not from Delhi or Mumbai.
select * from customers where city not in ('Delhi', 'Mumbai');

-- Find customers who registered in the first quarter of 2023 (January–March).
select * from customers where registration_date  between '2023-01-01' and '2023-03-31';

-- or

select * from customers where registration_date >= '2023-01-01' and registration_date <= '2023-03-31';


-- ************************************************************************************BETWEEN Practice************************************************************************************
-- Find products with a price between 5,000 and 20,000 (inclusive).
select * from products where price between 5000 and 20000;

-- Find orders placed between February 2023 and April 2023 (inclusive).
select * from orders where order_date between  '2023-02-01' and '2023-03-31';


-- ************************************************************************************Complex BETWEEN Practice************************************************************************************
-- Find orders with a total amount between 10,000 and 100,000and status equal to 'Delivered'.
select * from orders where total_amount between  10000 and 100000 and status = 'Delivered';

-- Find customers from Delhi who registered between January and March 2023.
select * from customers where registration_date between  '2023-01-01' and '2023-03-31';


-- ************************************************************************************IN Practice************************************************************************************
-- Find customers from Delhi or Mumbai.
select * from customers where city = 'Delhi' or city = 'Mumbai';

-- Find products in the 'Electronics' or 'Footwear' categories.
select * from products where category = 'Electronics' or category = 'Footwear';

-- ************************************************************************************AND / OR / NOT Practice************************************************************************************
-- Find customers who live in Delhi AND whose name starts with 'R'.
select * from customers where city = 'Delhi' and first_name like 'R%';

-- Find products with price > 10,000 AND stock/inventory < 50.
select * from products where price > 10000 and stock_quantity < 50;

-- Find orders with status 'Processing' OR 'Shipped'.
select * from orders where status = 'Processing' or status = 'Shipped';

-- ************************************************************************************Advanced AND/OR/NOT Combinations************************************************************************************

-- Find customers whose last name starts with 'S' or who live in 'Mumbai', but who did not register in January 2023.

-- Find products with price > 20,000 or stock < 40, and whose category is not 'Clothing'.

-- ************************************************************************************Multi-Condition IN Practice************************************************************************************

-- Find products that belong to the 'Electronics' category or have a price greater than 50,000.

-- Find customer orders from cities in ['Delhi', 'Bangalore', 'Kolkata'] and whose order status is not 'Processing'.

-- ************************************************************************************Pattern Matching / Wildcard (LIKE) Practice************************************************************************************
-- Find customers whose last name starts with 'S'.
select * from customers where last_name like 'S%';

-- Find products whose name contains the word 'Phone'.
select * from products where product_name like '%Phone%';

-- Find customers whose email ends with 'gmail.com'.
select * from customers where email like '%gmail.com';

-- Find customers whose phone numbers begin with '98765'.
select * from customers where phone like  '98765%';

-- *************************************************************************************Complex Pattern Matching (LIKE) Practice************************************************************************************
-- Find customers whose first name has 'a' as the second letter.
select * from customer where first_name like '_a%';

-- Find products whose name starts with 'i'or ends with 's'.
select * from products where product_name like 'i%' or product_name like '%s';

-- Find customers whose email contains 'gmail' or 'yahoo' but does not contain 'patel'.
select * from customers where (email like '%gmail%' or email like '%yahoo%') and  email not like '%patel%' ;

-- Find products whose name is exactly 11 characters long.
SELECT * FROM products WHERE LENGTH(product_name) = 11;

-- ************************************************************************************ORDER BY Practice************************************************************************************

-- List products in descending order of price.
SELECT * FROM products ORDER BY price DESC;

-- List customers in ascending order of registration date.
SELECT * FROM customers ORDER BY registration_date ASC;

-- List orders in descending order of total amount.
SELECT * FROM orders ORDER BY total_amount DESC;


-- ************************************************************************************DISTINCT Practice************************************************************************************

-- Find all unique city names.
SELECT DISTINCT city FROM customers;

-- Find all unique order statuses.
SELECT DISTINCT status FROM orders;

-- Find all unique product categories.
SELECT DISTINCT category FROM products;

-- ************************************************************************************GROUP BY Practice************************************************************************************

-- Count the number of customers per city.
SELECT city, COUNT(*) as customer_count 
FROM customers 
GROUP BY city;

-- Calculate the average price of products per category.
SELECT category, AVG(price) as avg_price 
FROM products 
GROUP BY category;

-- Count the total number of orders for each customer (grouped by customer ID).
SELECT customer_id, COUNT(*) as order_count 
FROM orders 
GROUP BY customer_id;

-- ************************************************************************************GROUP BY with HAVING Practice************************************************************************************

-- Find customers who have placed more than 1 order.
SELECT customer_id, COUNT(*) as order_count 
FROM orders 
GROUP BY customer_id 
HAVING COUNT(*) > 1;

-- Find product categories where the average price is greater than 50,000.
SELECT category, AVG(price) as avg_price 
FROM products 
GROUP BY category 
HAVING AVG(price) > 50000;

-- Find customers whose total sales/spending exceed 100,000.
SELECT customer_id, SUM(total_amount) as total_spent 
FROM orders 
GROUP BY customer_id 
HAVING SUM(total_amount) > 100000;

-- ************************************************************************************Comprehensive / Mixed Practice************************************************************************************

-- Find customers who live in Delhi, have placed more than 1 order, AND have total spending greater than 50,000.
SELECT c.customer_id, c.first_name, c.last_name, 
       COUNT(o.order_id) as order_count, 
       SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Delhi'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1 AND SUM(o.total_amount) > 50000;

-- Find products in the 'Electronics' category with inventory less than 100, sorted by price in descending order.
SELECT * FROM products 
WHERE stock_quantity < 100 AND category = 'Electronics'
ORDER BY price DESC;

-- Calculate the number of customers registered in 2023 for each city.
SELECT city, COUNT(*) as customer_count 
FROM customers 
WHERE YEAR(registration_date) = 2023
GROUP BY city;


-- ************************************************************************************JOIN with Other Keywords – Comprehensive Practice************************************************************************************
-- Find all customers who have purchased products from the 'Electronics' category.
-- Calculate the total spending amount for each customer (requires joining customers and orders tables).
-- Find customers who have purchased products priced over 50,000, along with their order details.
-- Group by city and calculate the average order amount for each city.
-- Find order details where the purchased quantity of a product exceeds 1.


-- ************************************************************************************Date Functions Practice************************************************************************************
-- Find orders placed within the last 30 days.
-- Find customers who registered more than 3 months ago.
-- Calculate the total number of orders per month.
-- Group by quarter and count the number of registered customers.


-- ************************************************************************************Advanced Aggregate Functions Practice************************************************************************************
-- For each category, find the highest price, lowest price, and average price.
-- Calculate each customer's first order date and last order date.
-- Find the top 3 customers by total order amount.
-- Calculate total quantity sold and total revenue for each product.

-- ************************************************************************************Subquery Practice************************************************************************************
-- Find customers whose total spending is higher than the overall average order amount.
-- Find customers who have never placed an order.
-- Find products whose price is higher than the average price of their own category.
-- Find customers who have placed more orders than the average number of orders in their city.

-- ************************************************************************************CASE Statement Practice************************************************************************************
-- Classify products by price: 'Budget' (<10,000), 'Mid-range' (10,000–50,000), 'Premium' (>50,000).
-- Classify customers by total spending: 'Bronze' (<50,000), 'Silver' (50,000–100,000), 'Gold' (>100,000).
-- Classify customers by registration age: 'New' (<3 months), 'Regular' (3–6 months), 'Old' (>6 months).


-- ************************************************************************************Complex Business Logic Practice************************************************************************************
-- Find customers who have purchased at least one 'Electronics' product AND at least one 'Footwear' product.
-- Calculate inventory turnover rate for each product (assuming sales quantity is available).
-- Find customers who placed orders in two consecutive months.
-- Calculate Customer Lifetime Value (LTV) for each customer.
-- Find the most frequently purchased product combinations (products often bought together).

-- ************************************************************************************Performance Optimization-Related Practice************************************************************************************
-- Find products that need restocking (inventory less than half of the average inventory).
-- Identify high-value customers (top 20% by total spending).
-- Find the best-performing product category by sales.
-- Calculate repurchase rate for customers.
-- Find potentially churned customers (active customers who haven't ordered in over 60 days).

-- ************************************************************************************Data Quality Check Practice************************************************************************************
-- Find customers missing phone number or email.
-- Check for products with price equal to zero or negative.
-- Find products with abnormally high or low inventory quantities.
-- Check for orders where order date is earlier than the customer's registration date.
-- Find duplicate customer records (based on name and phone number).

