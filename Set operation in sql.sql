-- ===============================
-- SQL SET OPERATIONS PRACTICE
-- ===============================

-- Set Operations
-- Used to combine results of multiple SELECT queries vertically

-- UNION      -> Combine rows and remove duplicates
-- UNION ALL  -> Combine rows and keep duplicates
-- INTERSECT  -> Return common rows (not supported directly in MySQL)
-- EXCEPT     -> Return rows from first query not in second (not supported in MySQL)


-- ===============================
-- Create Database
-- ===============================
CREATE DATABASE Unions;
USE Unions;


-- ===============================
-- Table 1 : Students_2023
-- ===============================
CREATE TABLE Students_2023 (
    id INT,
    name VARCHAR(50)
);

-- Insert data
INSERT INTO Students_2023 VALUES
(1,'Ram'),
(2,'Aman'),
(3,'Sita'),
(4,'Rahul'),
(5,'Neha');


-- ===============================
-- Table 2 : Students_2024
-- ===============================
CREATE TABLE Students_2024 (
    id INT,
    name VARCHAR(50)
);

-- Insert data
INSERT INTO Students_2024 VALUES
(3,'Sita'),
(4,'Rahul'),
(5,'Neha'),
(6,'Pooja'),
(7,'Karan');


-- ===============================
-- UNION Example
-- Combine both tables and remove duplicates
-- ===============================
SELECT * 
FROM Students_2023
UNION
SELECT * 
FROM Students_2024;


-- ===============================
-- Find Common Students
-- ===============================
SELECT name
FROM Students_2023
WHERE name IN (
    SELECT name FROM Students_2024
);


-- ===============================
-- Students present in 2024 but not in 2023
-- ===============================
SELECT name
FROM Students_2024
WHERE name NOT IN (
    SELECT name FROM Students_2023
);


-- ===============================
-- Count students in each table
-- UNION shows counts as separate rows
-- ===============================
SELECT COUNT(name) 
FROM Students_2023
UNION
SELECT COUNT(name) 
FROM Students_2024;


-- ===============================
-- Count total unique students
-- ===============================
SELECT COUNT(*) 
FROM (
    SELECT name FROM Students_2023
    UNION
    SELECT name FROM Students_2024
) t;


-- ===============================
-- Find students appearing in both tables
-- Using UNION ALL + GROUP BY
-- ===============================
SELECT COUNT(*)
FROM (
    SELECT name
    FROM (
        SELECT name FROM Students_2023
        UNION ALL
        SELECT name FROM Students_2024
    ) t1
    GROUP BY name
    HAVING COUNT(*) > 1
) t2;