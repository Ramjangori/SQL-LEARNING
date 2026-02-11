-- ==================================
-- DATABASE NORMALIZATION (NOTES)
-- ==================================

-- Normalization is a database design technique used to:
-- 1. Reduce data redundancy (duplicate data)
-- 2. Improve data consistency
-- 3. Avoid insert, update, and delete anomalies
-- 4. Organize data efficiently into multiple tables

-- ==================================
-- FIRST NORMAL FORM (1NF)
-- ==================================
-- Rules of 1NF:
-- 1. Each column must contain atomic (single) values
-- 2. No column should contain multiple values in a single cell
-- 3. Each record must be uniquely identifiable using a primary key

-- Example:
-- Correct  : name = 'Alice'
-- Incorrect: phone = '123, 456' (multiple values in one column)

-- ==================================
-- SECOND NORMAL FORM (2NF)
-- ==================================
-- Rules of 2NF:
-- 1. Table must already be in 1NF
-- 2. There should be no partial dependency
--    (Every non-key column must depend on the full primary key)

-- Partial Dependency:
-- Occurs when a table has a composite primary key
-- and a non-key column depends only on part of that key

-- ==================================
-- DATABASE CREATION
-- ==================================
CREATE DATABASE testdb;
USE testdb;

-- ==================================
-- CUSTOMERS TABLE
-- ==================================
CREATE TABLE customers (
    customerid INT PRIMARY KEY,   -- Primary Key uniquely identifies each customer
    name VARCHAR(50),              -- Customer name
    city VARCHAR(50)               -- Customer city
);

-- This table is in 2NF because:
-- All non-key columns (name, city) depend only on the primary key (customerid)

-- ==================================
-- ORDERS TABLE
-- ==================================
CREATE TABLE orders (
    orderid INT PRIMARY KEY,       -- Primary Key for orders
    productid INT,                 -- Product identifier
    pname VARCHAR(50),             -- Product name
    price DECIMAL(10,2),            -- Product price
    customerid INT                 -- Foreign Key referencing customers table
);

-- customerid is a Foreign Key
-- It references customerid in the customers table

-- ==================================
-- INSERT DATA
-- ==================================
INSERT INTO customers (customerid, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Mumbai'),
(4, 'Diana', 'Sydney'),
(5, 'Ethan', 'Toronto');

INSERT INTO orders (orderid, productid, pname, price, customerid) VALUES
(101, 201, 'Laptop', 800.00, 1),
(102, 202, 'Mouse', 25.00, 1),
(103, 203, 'Keyboard', 45.00, 2),
(104, 204, 'Monitor', 200.00, 2),
(105, 205, 'Printer', 150.00, 3),
(106, 206, 'Tablet', 300.00, 3),
(107, 207, 'Mobile', 500.00, 4),
(108, 208, 'Headphones', 75.00, 4),
(109, 209, 'Camera', 600.00, 5),
(110, 210, 'Speaker', 120.00, 5);

-- ==================================
-- DATA RETRIEVAL
-- ==================================
SELECT * FROM orders;

-- orderid is the Primary Key
-- customerid is the Foreign Key

-- ==================================
-- RELATIONSHIPS
-- ==================================
-- Orders → Customers : Many-to-One relationship
-- (Many orders can belong to one customer)

-- Customers → Orders : One-to-Many relationship
-- (One customer can place many orders)

-- ==================================
-- BASIC SELECT QUERY
-- ==================================
SELECT orderid, pname, customerid 
FROM orders AS o;

-- ==================================
-- JOIN WITH NORMALIZED TABLES
-- ==================================
-- JOIN is required in normalized databases
-- to fetch related data from multiple tables

SELECT 
    o.orderid,
    o.pname,
    o.customerid,
    c.customerid
FROM orders o
JOIN customers c
ON o.customerid = c.customerid;

-- ==================================
-- FINAL SUMMARY
-- ==================================
-- 1NF ensures atomic values
-- 2NF removes partial dependency
-- Data redundancy is minimized
-- Data integrity and consistency are improved
-- Normalized tables require JOIN for data retrieval

show databases;
use testdb;
show tables;
select o.orderid , o.pname , o.price , c.name  from orders as o join customers c on o.customerid=c.customerid;
select * from customers;
select * from orders;
