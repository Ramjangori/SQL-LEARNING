-- Select Sakila database
USE sakila;

-- Fetch all records from actor table
SELECT * FROM actor;

----------------------------------------------------
-- STRING FUNCTIONS
----------------------------------------------------

-- Simple string selection (for testing only)
SELECT 'Ramjan';

-- CHAR_LENGTH(): Counts number of characters including spaces
SELECT CHAR_LENGTH('Ramjan   ');

-- TRIM(): Removes spaces from left and right side
SELECT CHAR_LENGTH(TRIM('Ramjan   '));

-- TRIM with specific character
-- Removes 'a' from both left and right sides only
SELECT TRIM(BOTH 'a' FROM 'aaaanaman');

-- Remove 'E' character from both sides of first_name
SELECT 
    first_name,
    TRIM(BOTH 'E' FROM first_name) AS trimmed_name
FROM actor;

----------------------------------------------------
-- LPAD / RPAD FUNCTIONS
----------------------------------------------------

-- LPAD(): Adds padding characters to the LEFT side
SELECT LPAD('45674', 6, '@');

-- RPAD(): Adds padding characters to the RIGHT side
SELECT RPAD('45675', 8, '5');

----------------------------------------------------
-- NUMBER FUNCTIONS
----------------------------------------------------

-- ROUND(): Rounds number to nearest integer
SELECT ROUND(14.54);   -- Output: 15
SELECT ROUND(14.4);    -- Output: 14

-- ROUND(number, decimal_places)
SELECT ROUND(14.45, 1); -- Output: 14.5

-- ROUND with negative value (rounding tens place)
SELECT ROUND(3.43, -1);     -- Output: 0
SELECT ROUND(46.45, -1);    -- Output: 50
SELECT ROUND(44.45, -1);    -- Output: 40

-- ROUND to hundreds place
SELECT ROUND(456.43, -2);   -- Output: 500

-- TRUNCATE(): Cuts decimal without rounding
SELECT TRUNCATE(45.556, 2); -- Output: 45.55

-- FLOOR(): Always rounds DOWN
SELECT FLOOR(45.667);       -- Output: 45

-- CEIL(): Always rounds UP
SELECT CEIL(45.56);         -- Output: 46

----------------------------------------------------
-- COUNT FUNCTIONS
----------------------------------------------------

-- COUNT(): Counts non-null values
SELECT COUNT(first_name) FROM actor;

-- COUNT(DISTINCT): Counts unique values
SELECT COUNT(DISTINCT first_name) FROM actor;


   
   