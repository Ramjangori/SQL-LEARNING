-- ==========================================================
--                CORRELATED SUBQUERY NOTES
-- ==========================================================

-- Definition:
-- A Correlated Subquery is a subquery that depends on values
-- from the outer query. It cannot execute independently.
-- It runs once for every row processed by the outer query.

-- Key Characteristics:
-- 1. Executes once per row of outer query.
-- 2. Subquery references column(s) from outer query.
-- 3. Used for row-by-row comparison.
-- 4. Mostly used with WHERE clause.
-- 5. Can be used with EXISTS, IN, =, >, < operators.

-- Difference Between Simple & Correlated Subquery:
-- Simple Subquery:
--   -> Executes only once.
--   -> Does not depend on outer query.
--
-- Correlated Subquery:
--   -> Executes multiple times (once per row).
--   -> Depends on outer query values.

-- ==========================================================
-- Example 1:
-- Find employees whose salary is greater than
-- the average salary of their department.
-- ==========================================================

-- Logic:
-- Step 1: For each employee row (outer query),
-- Step 2: Calculate average salary of that employee's department.
-- Step 3: Compare employee salary with department average.
-- Step 4: If greater, return that row.

select * 
from employee as e
where salary > (
        select avg(salary) 
        from employee
        where dept = e.dept
);

-- Explanation:
-- "e.dept" refers to department of current row.
-- Subquery runs for each employee row.
-- This makes it a correlated subquery.

-- ==========================================================
-- Example 2:
-- Find highest paid employee in each department.
-- ==========================================================

select * 
from employee as e
where salary = (
        select max(salary) 
        from employee
        where dept = e.dept
);

-- Explanation:
-- For every employee row,
-- Subquery finds max salary of that department.
-- Only employee whose salary matches max is returned.

-- ==========================================================
-- Example 3:
-- Find employees whose salary is greater than
-- minimum salary of their department.
-- ==========================================================

select * 
from employee as e
where salary > (
        select min(salary) 
        from employee
        where dept = e.dept
);

-- Explanation:
-- Subquery finds minimum salary per department.
-- Outer query returns employees earning more than
-- the minimum in their department.

-- ==========================================================
-- Performance Note (Interview Important):
-- ----------------------------------------------------------
-- Since correlated subquery runs once per row,
-- it can be slow on large datasets.
--
-- In real-world applications, JOIN with GROUP BY
-- is often preferred for better performance.
--
-- Example using JOIN (Optimized approach):

select e.*
from employee e
join (
        select dept, avg(salary) as avg_sal
        from employee
        group by dept
     ) d
on e.dept = d.dept
where e.salary > d.avg_sal;

-- ==========================================================
-- Interview Tip:
-- If interviewer asks:
-- "Why correlated subquery is slower?"
--
-- Answer:
-- Because subquery executes once for each row
-- of outer query, increasing time complexity.
-- ==========================================================