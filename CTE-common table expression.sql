-- ==========================================================
-- DATABASE & BASIC QUERY
-- ==========================================================

use world;
select * from country;

-- ==========================================================
-- CASE STATEMENT (CONDITIONAL LOGIC IN SQL)
-- ==========================================================

-- Case is used to apply conditional logic (like if-else in programming)

select name,
case 
    when name like 'a%' then 'Yes'   -- if name starts with 'a'
    else 'No'                        -- otherwise
end as Start_with_A
from country;

-- Key Points:
-- 1. CASE works row by row
-- 2. Used for conditional transformation
-- 3. Can be used in SELECT, WHERE, ORDER BY


-- ==========================================================
-- AGGREGATION FUNCTION (AVG) WITH GROUP BY
-- ==========================================================

use regex2;
show tables;

select * from employee;

-- Find average salary department-wise
select dept, avg(salary) 
from employee 
group by dept;

-- Key Points:
-- 1. GROUP BY groups similar values (dept)
-- 2. AVG(salary) calculates average per group
-- 3. All non-aggregated columns must be in GROUP BY


-- ==========================================================
-- CTE (COMMON TABLE EXPRESSION)
-- ==========================================================

-- Definition:
-- CTE is a temporary result set that can be referenced within a query

-- Syntax:
-- WITH cte_name AS (query)
-- SELECT * FROM cte_name;

-- Example:

with Test as 
(
    select dept, avg(salary) as AVG_SALARY 
    from employee 
    group by dept
)

-- Using CTE like a virtual table
select * 
from employee 
join Test 
on employee.dept = Test.dept;

-- ==========================================================
-- CTE IMPORTANT NOTES (INTERVIEW LEVEL)
-- ==========================================================

-- 1. CTE is temporary → exists only during query execution
-- 2. Improves readability of complex queries
-- 3. Can be reused multiple times in same query
-- 4. Cannot be used outside the query block
-- 5. Helps break complex queries into smaller parts
-- 6. Alternative to subqueries (more readable)

-- ==========================================================
-- CTE vs SUBQUERY
-- ==========================================================

-- CTE:
-- ✔ Better readability
-- ✔ Reusable in same query
-- ✔ Good for complex logic

-- Subquery:
-- ✔ Simple use cases
-- ❌ Hard to read when nested deeply

-- ==========================================================
-- REAL USE CASES OF CTE
-- ==========================================================

-- 1. Data transformation
-- 2. Recursive queries (hierarchy like employee-manager)
-- 3. Breaking complex joins
-- 4. Ranking / filtering aggregated data

-- ==========================================================
-- END OF NOTES
-- ==========================================================
 
