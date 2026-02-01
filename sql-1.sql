/*
====================================================
SQL PRACTICE – DAY 1
====================================================

What is Database?
A Database is an organized collection of data that is
stored and managed electronically for easy access.

What is DBMS?
DBMS (Database Management System) is software that
allows users to create, store, retrieve, update and
manage data in a database.

Examples: MySQL, Oracle, PostgreSQL

What is RDBMS?
RDBMS (Relational Database Management System) is a
type of DBMS where data is stored in tables (rows
and columns) and relationships are maintained using
keys.

Example: MySQL

What is SQL?
SQL (Structured Query Language) is a standard
language used to interact with RDBMS to create,
read, update and delete data.

----------------------------------------------------
Topics Covered in This File:
- Create Database
- Show Databases
- Use Database
- Show Tables
- Create Table
- SELECT Queries
- WHERE Clause with Operators
====================================================
*/

-- Create Database
CREATE DATABASE Students;

-- Show Databases
SHOW DATABASES;

-- Use Existing Database
USE sakila;

-- Show Tables
SHOW TABLES;

-- Create Table
CREATE TABLE actor_salary (
    salary CHAR(20)
);

-- Describe Table Structure
DESC actor;

-- Select All Columns from Table
SELECT * FROM actor;

-- Select Specific Column
SELECT first_name FROM actor;

-- Select with Comparison Operator
SELECT first_name, actor_id
FROM actor
WHERE actor_id > 7;

-- Select with Logical Operators
SELECT first_name, actor_id
FROM actor
WHERE actor_id > 20 AND actor_id != 30;


