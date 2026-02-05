-- Use Sakila database
USE sakila;

-- Show all tables
SHOW TABLES;

-- Display all records from actor table
SELECT * FROM actor;

-- Find length of a string
SELECT LENGTH('Moh Ramjan');

-- Find length of first_name column
SELECT LENGTH(first_name) 
FROM actor;

-- Convert first_name to lowercase
SELECT LOWER(first_name) 
FROM actor;

-- Concatenate first_name and last_name as full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name 
FROM actor;

-- Extract first 4 characters from first_name
SELECT SUBSTR(first_name, 1, 4) 
FROM actor;

-- Remove extra spaces from string
SELECT TRIM('  Ramjan  ');

-- Replace word in a string
SELECT REPLACE('Ramjan gori', 'gori', 'Sharma');

-- Find position of character 'a' in first_name
SELECT INSTR(first_name, 'a') 
FROM actor;

-- Reverse the first_name
SELECT REVERSE(first_name) 
FROM actor;
