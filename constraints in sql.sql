-- Select database
-- use testdb database for executing queries
USE testdb;

-- =========================================================
-- DATE Data Type Example
-- DATE datatype stores values in format 'YYYY-MM-DD'
-- SQL automatically validates correct date values
-- =========================================================

CREATE TABLE test_date (
    dob DATE
);

-- inserting valid dates
INSERT INTO test_date VALUES('2023-12-29');
INSERT INTO test_date VALUES('2023-11-29');

-- invalid date example
-- month cannot be 13 so this will give error
INSERT INTO test_date VALUES('2023-13-29');

SELECT * FROM test_date;


-- =========================================================
-- CONSTRAINTS IN SQL
-- Constraints are rules applied on table columns
-- They prevent invalid data from entering the table
-- They maintain data consistency and accuracy
-- =========================================================


-- =========================================================
-- Example without constraint
-- Here salary column can store NULL values
-- =========================================================

CREATE TABLE test2 (
    salary INT,
    age INT
);

-- NULL is allowed here
INSERT INTO test2 VALUES(100,11),(200,21),(NULL , 30);

SELECT * FROM test2;



-- =========================================================
-- 1 NOT NULL CONSTRAINT
-- NOT NULL means column must contain value
-- NULL values are not allowed
-- =========================================================

CREATE TABLE test3 (
    salary INT NOT NULL,
    age INT
);

-- This will fail because salary cannot be NULL
INSERT INTO test3 VALUES(100,11),(200,21),(NULL , 30);

SELECT * FROM test3;



-- =========================================================
-- 2 DEFAULT CONSTRAINT
-- DEFAULT value is stored when user does not provide value
-- =========================================================

CREATE TABLE test4 (
    salary INT NOT NULL DEFAULT 100,
    age INT DEFAULT 18
);

-- salary inserted = 400
-- age automatically stored = 18
INSERT INTO test4 (salary) VALUES(400);

SELECT * FROM test4;



-- =========================================================
-- 3 UNIQUE CONSTRAINT
-- UNIQUE allows only distinct values
-- duplicate values are not allowed
-- but NULL values are allowed
-- =========================================================

CREATE TABLE un (
    salary INT UNIQUE DEFAULT 200,
    age INT DEFAULT 21
);

INSERT INTO un VALUES (100,23),(230,31);

-- duplicate salary will give error
-- INSERT INTO un VALUES (100,23),(230,31);

SELECT * FROM un;



-- =========================================================
-- 4 CHECK CONSTRAINT
-- CHECK ensures condition is satisfied before inserting data
-- if condition is TRUE -> insert
-- if condition is FALSE -> rejected
-- =========================================================

CREATE TABLE test100 (
    salary INT,
    age INT CHECK (age > 18)
);

-- valid records
INSERT INTO test100 VALUES(1000,23),(2000,22);

-- invalid because age < 18
INSERT INTO test100 VALUES(1000,12);



-- =========================================================
-- Giving custom name to constraint
-- useful for identifying constraint in database
-- =========================================================

CREATE TABLE test112 (
    salary INT,
    age INT 
    CONSTRAINT testdb_test111_age_chk_100 CHECK (age > 18)
);

-- this will fail because condition not satisfied
INSERT INTO test112 VALUES(1000,12);



-- =========================================================
-- 5 PRIMARY KEY CONSTRAINT
-- PRIMARY KEY = UNIQUE + NOT NULL
-- each record must have unique identifier
-- table can have only one primary key
-- =========================================================

CREATE TABLE test00(
    salary INT,
    id INT PRIMARY KEY
);

INSERT INTO test00 VALUES(200,20);

-- duplicate primary key not allowed
INSERT INTO test00 VALUES(220,20);



-- =========================================================
-- COMPOSITE PRIMARY KEY
-- Combination of multiple columns as primary key
-- duplicate combination not allowed
-- =========================================================

CREATE TABLE test600(
    a INT,
    b INT,
    PRIMARY KEY(a,b)
);

INSERT INTO test600 VALUES(20,30);
INSERT INTO test600 VALUES(30,30);

-- duplicate combination (20,30) not allowed
INSERT INTO test600 VALUES(20,30);



-- =========================================================
-- ASSIGNMENT : FOREIGN KEY
-- FOREIGN KEY creates relationship between two tables
-- Parent table must exist before child table
-- Child table references primary key of parent table
-- =========================================================


-- Parent Table
CREATE TABLE department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


-- Child Table
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    
    -- foreign key referencing department table
    CONSTRAINT fk_dept
    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);


-- inserting parent records
INSERT INTO department VALUES
(1,'HR'),
(2,'IT');


-- inserting child records
INSERT INTO employee VALUES
(101,'Ram',1),
(102,'Shyam',2);

-- this will fail because dept_id 5 does not exist
INSERT INTO employee VALUES
(103,'Mohan',5);