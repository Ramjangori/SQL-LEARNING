-- ============================================
-- Database: Sakila
-- Topic   : BETWEEN, IN, NOT IN, LIKE Operators
-- Table   : actor
-- ============================================

-- Use Sakila database
USE sakila;

-- ============================================
-- BETWEEN Operator
-- ============================================
-- Fetch actors whose actor_id is between 7 and 10 (inclusive)
SELECT *
FROM actor
WHERE actor_id BETWEEN 7 AND 10;

-- ============================================
-- IN Operator
-- ============================================
-- Fetch actors with specific actor_id values
SELECT *
FROM actor
WHERE actor_id IN (4, 5, 6, 7, 8);

-- Fetch actors whose first name is either NICK or ED
SELECT *
FROM actor
WHERE first_name IN ('NICK', 'ED');

-- ============================================
-- NOT IN Operator
-- ============================================
-- Fetch actors except NICK and ED
SELECT *
FROM actor
WHERE first_name NOT IN ('NICK', 'ED');

-- ============================================
-- LIKE Operator (Pattern Matching)
-- ============================================

-- First name starts with 'A'
SELECT *
FROM actor
WHERE first_name LIKE 'A%';

-- First name ends with 'A'
SELECT *
FROM actor
WHERE first_name LIKE '%A';

-- Second character is 'A'
SELECT *
FROM actor
WHERE first_name LIKE '_A%';

-- Second last character is 'A'
SELECT *
FROM actor
WHERE first_name LIKE '%A_';

-- 'A' appears anywhere in the name
SELECT *
FROM actor
WHERE first_name LIKE '%A%';

-- ============================================
-- Underscore (_) Examples
-- ============================================
-- Exactly one character name
SELECT *
FROM actor
WHERE first_name LIKE '_';

-- Second character is 'A'
SELECT *
FROM actor
WHERE first_name LIKE '_A%';

-- ============================================
-- Advanced LIKE Patterns
-- ============================================

-- First character 'A' and second last character 'N'
SELECT *
FROM actor
WHERE first_name LIKE 'A%N_';

-- Names containing at least three 'A' characters
SELECT *
FROM actor
WHERE first_name LIKE '%A%A%A%';

-- Third character from the end is 'D'
SELECT *
FROM actor
WHERE first_name LIKE '%D__';

-- Names containing 'AA'
SELECT *
FROM actor
WHERE first_name LIKE '%AA%';

-- Names with at least 5 characters
SELECT *
FROM actor
WHERE first_name LIKE '_____%';
