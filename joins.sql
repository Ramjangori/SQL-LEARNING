-- ==========================================
--              DATABASE : testdb
-- ==========================================

USE testdb;

-- View all records from orders table
SELECT * FROM orders;

-- View all records from customers table
SELECT * FROM customers;

-- Select only customer name and city
SELECT customers.name, customers.city 
FROM customers;

-- ==========================================
-- INNER JOIN
-- Select customer name who bought a product
-- ==========================================

SELECT customers.name, 
       customers.city,  
       orders.customerid, 
       orders.pname, 
       orders.price
FROM orders
JOIN customers 
ON customers.customerid = orders.customerid;

-- Explanation:
-- This is INNER JOIN (default JOIN = INNER JOIN)
-- It returns only matching records from both tables.


-- ==========================================
--              DATABASE : world
-- ==========================================

USE world;

SHOW TABLES;

-- View city table
SELECT * FROM city;

-- Get city id, city name, and country code
SELECT id, name, countrycode 
FROM city;

-- View country table
SELECT * FROM country;

-- Get country code, name, continent, population
SELECT code, name, continent, population 
FROM country;

-- ==========================================
-- JOIN city and country table
-- Get city id, city name and country name
-- ==========================================

SELECT city.id,
       city.name AS city_name,
       country.name AS country_name
FROM city
JOIN country
ON city.countrycode = country.code;

-- Explanation:
-- city.countrycode is Foreign Key
-- country.code is Primary Key
-- This returns all matching cities with their country name.


-- ==========================================
-- Find cities of India in continent Asia
-- ==========================================

SELECT city.id,
       city.name AS city,
       country.name AS country,
       country.continent
FROM city
JOIN country
ON city.countrycode = country.code
WHERE country.name = 'India'
AND country.continent = 'Asia';

-- Explanation:
-- JOIN connects tables
-- WHERE filters only India and Asia


-- ==========================================
-- countrylanguage table
-- ==========================================

SELECT * FROM countrylanguage;

-- ==========================================
-- Get country name and languages spoken in that country
-- ==========================================

SELECT country.name,
       countrylanguage.language
FROM country
JOIN countrylanguage
ON country.code = countrylanguage.countrycode;

-- Explanation:
-- This returns all countries with all their languages.


-- ==========================================
-- Find only countries where language is Hindi
-- ==========================================

SELECT country.name,
       countrylanguage.language
FROM country
JOIN countrylanguage
ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = 'Hindi';

-- Explanation:
-- JOIN connects country and countrylanguage
-- WHERE filters only Hindi language


-- ==========================================
-- TYPES OF JOIN (Assignment Notes)
-- ==========================================

-- 1. INNER JOIN
-- Returns only matching rows.

-- 2. LEFT JOIN
-- Returns all rows from left table and matching from right table.

-- 3. RIGHT JOIN
-- Returns all rows from right table and matching from left table.

-- 4. FULL OUTER JOIN
-- Returns all rows from both tables (Not supported directly in MySQL).

-- 5. SELF JOIN
-- A table joined with itself.

-- ==========================================
-- END OF NOTES
-- ==========================================
