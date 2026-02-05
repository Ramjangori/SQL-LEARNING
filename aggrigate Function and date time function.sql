-- ======================================
-- DATABASE SELECTION
-- ======================================

USE sakila;
-- Selects the sakila database so that queries can be executed on its tables


-- ======================================
-- DATE & TIME FUNCTIONS
-- ======================================

SELECT NOW();
-- Returns the current date and time
-- Example: 2026-02-05 14:20:30

SELECT CURDATE();
-- Returns only the current date
-- Example: 2026-02-05

SELECT CURRENT_TIME();
-- Returns only the current time
-- Example: 14:20:30

SELECT CURRENT_TIMESTAMP();
-- Same as NOW()
-- Returns current date and time


-- ======================================
-- ADDDATE FUNCTION
-- ======================================

SELECT NOW(), ADDDATE(NOW(), INTERVAL 2 DAY);
-- Adds 2 days to the current date and time


-- ======================================
-- MONTH & EXTRACT FUNCTIONS
-- ======================================

SELECT NOW(), MONTH(NOW());
-- Extracts the month number (1–12) from the current date

SELECT NOW(), EXTRACT(MONTH FROM NOW());
-- Same as MONTH()
-- EXTRACT is used to get specific parts of date/time

SELECT NOW(), EXTRACT(DAY FROM NOW());
-- Extracts the day (1–31) from the current date


-- ======================================
-- DATE_FORMAT FUNCTION
-- ======================================

SELECT DATE_FORMAT(payment_date, '');
-- DATE_FORMAT is used to display date in a custom format
-- Examples:
-- '%Y-%m-%d'  → 2026-02-05
-- '%d-%m-%Y'  → 05-02-2026
-- '%M %d %Y'  → February 05 2026


-- ======================================
-- FILTER BY MONTH
-- ======================================

SELECT payment_date
FROM payment
WHERE MONTH(payment_date) = 5;
-- Returns payment records made in the month of May


-- ======================================
-- AGGREGATE FUNCTIONS (Multi-row Functions)
-- ======================================

-- Aggregate functions work on multiple rows and return a single value
-- Examples: SUM(), COUNT(), AVG(), MIN(), MAX()


-- ======================================
-- DISTINCT KEYWORD
-- ======================================

SELECT * FROM payment;
-- Displays all records from the payment table

SELECT DISTINCT customer_id, amount
FROM payment;
-- Returns unique combinations of customer_id and amount

SELECT customer_id DISTINCT amount FROM payment;
-- ❌ Invalid syntax
-- DISTINCT must be written immediately after SELECT


-- ======================================
-- SUM AND COUNT FUNCTIONS
-- ======================================

SELECT SUM(amount) FROM payment;
-- Calculates the total sum of the amount column


SELECT SUM(amount), COUNT(payment_id)
FROM payment
WHERE MONTH(payment_date) > 3 AND amount > 5;
-- Calculates total amount and total number of payments
-- For payments after March and amount greater than 5


SELECT SUM(amount), payment_id
FROM payment
WHERE MONTH(payment_date) > 3 AND amount > 5;
-- ❌ Error
-- Aggregate functions cannot be used with normal columns
-- Unless GROUP BY is used


-- ======================================
-- LAST_DAY FUNCTION
-- ======================================

SELECT LAST_DAY(payment_date) FROM payment;
-- Returns the last date of the month for payment_date


SELECT *
FROM payment
WHERE amount > 0.5 AND LAST_DAY(payment_date);
-- ❌ Logical error
-- LAST_DAY() cannot be used directly as a condition


-- ======================================
-- PRACTICAL USE OF LAST_DAY
-- ======================================

SELECT COUNT(DISTINCT customer_id)
FROM payment
WHERE DATE(payment_date) = LAST_DAY(payment_date)
AND amount > 0.5;
-- Counts total unique customers
-- Who made payments on the last day of the month
-- And payment amount is greater than 0.5


-- ======================================
-- GROUP BY CLAUSE
-- ======================================

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;
-- Groups records by customer_id
-- Calculates total payment done by each customer


-- ======================================
-- DISTINCT vs GROUP BY
-- ======================================

-- DISTINCT:
-- Removes duplicate rows
-- Does not perform calculations

SELECT DISTINCT customer_id FROM payment;


-- GROUP BY:
-- Groups rows based on a column
-- Used with aggregate functions

SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id;


-- ======================================
-- INTERVIEW QUICK NOTES
-- ======================================

-- DISTINCT removes duplicate records
-- GROUP BY creates groups and works with aggregate functions
-- Aggregate functions cannot be mixed with normal columns without GROUP BY
-- LAST_DAY() returns the last date of a month
-- NOW() returns current date and time
-- CURDATE() returns only the current date
-- CURRENT_TIME() returns only the current time
