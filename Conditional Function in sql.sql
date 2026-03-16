-- =========================================================
-- SQL NOTES : CONDITIONAL FUNCTIONS (IF, CASE, COALESCE)
-- =========================================================

-- ---------------------------------------------------------
-- BASIC SQL COMMANDS
-- ---------------------------------------------------------
-- INSERT  : Add new records into a table
-- DELETE  : Remove records from a table
-- UPDATE  : Modify existing records
-- CREATE  : Create database or tables
-- ALTER   : Modify structure of table (add/modify columns)
-- DROP    : Delete database or table permanently
-- TRUNCATE: Remove all records from table quickly

show databases;      -- display all databases
use test2;           -- select database
show tables;         -- display tables in selected database


-- =========================================================
-- CONDITIONAL LOGIC IN SQL
-- =========================================================
-- SQL me conditions apply karne ke liye mainly 2 methods use hote hai
-- 1. IF() function
-- 2. CASE statement


-- =========================================================
-- HANDLE NULL VALUES
-- =========================================================

-- IFNULL() : Agar value NULL ho to usko replace kar deta hai

use world;

-- Count of actual values vs null replaced values
select count(indepyear) , count(ifnull(indepyear,0))
from country;


-- COALESCE() : First non-null value return karta hai
-- Syntax: COALESCE(value1 , value2 , value3 ...)

select code , coalesce(indepyear , gnpold , gnp)
from country;


-- =========================================================
-- IF() FUNCTION (SQL IF-ELSE)
-- =========================================================
-- Syntax:
-- IF(condition , value_if_true , value_if_false)

-- Example 1 : Population based condition

select name , population ,
if(population > 1000 , 'Large p' , 'Small p')
from country;


-- Example 2 : Multiple conditions using nested IF()

select name , population ,
if(population > 10000000 , 'Large p' ,
   if(population > 100000 , 'Medium p' , 'Small p')
) as status
from country;


-- Example 3 :
-- If population > 20000 AND name starts with 'A' → Very Large country
-- If population > 25000 → Small country

select name , population ,
if(population > 25000 , 'Small country' ,
   if(population > 20000 and name like 'a%' , 'Very Large country' , '')
)
from country;


-- =========================================================
-- CASE STATEMENT (Better for multiple conditions)
-- =========================================================
-- Syntax:

/*
SELECT column_name ,
CASE
    WHEN condition THEN result
    WHEN condition THEN result
    ELSE result
END
FROM table;
*/


-- Example : Categorize countries by population

select name , population ,
case
    when population > 10000000 then 'V Large'
    when population > 100000 then 'Large'
    when population > 10000 then 'Small'
    else 'Very Small'
end as population_category
from country;


-- =========================================================
-- INTERVIEW TIP
-- =========================================================
-- IF()   : Simple conditions ke liye use hota hai
-- CASE   : Multiple conditions aur readable queries ke liye better hota hai
-- COALESCE() : Multiple columns me se first non-null value return karta hai
-- IFNULL()   : Null value ko replace karta hai