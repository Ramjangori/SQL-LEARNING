-- =====================================================
-- DATABASE: testdb
-- TABLES: department, employee
-- =====================================================

-- department table:
-- Contains department details.
-- Primary Key: dept_id

-- employee table:
-- Contains employee details.
-- Primary Key: emp_id
-- Foreign Key: dept_id (references department table)

-- Some employees have NULL dept_id → means no department assigned.
-- Some departments have no employees → dept_id 5 and 6.


-- =====================================================
-- 1️⃣ INNER JOIN
-- =====================================================
-- Returns only matching records from both tables.
-- If dept_id matches in both employee and department,
-- then record will be shown.
-- Employees with NULL dept_id will NOT appear.
-- Departments without employees will NOT appear.

-- Example:
-- SELECT ...
-- FROM employee e
-- INNER JOIN department d
-- ON e.dept_id = d.dept_id;



-- =====================================================
-- 2️⃣ LEFT JOIN
-- =====================================================
-- Returns ALL records from LEFT table (employee).
-- Returns matching records from department.
-- If no match found, department columns become NULL.
-- Employees with NULL dept_id WILL appear.

-- Example:
-- SELECT ...
-- FROM employee e
-- LEFT JOIN department d
-- ON e.dept_id = d.dept_id;



-- =====================================================
-- 3️⃣ RIGHT JOIN
-- =====================================================
-- Returns ALL records from RIGHT table (department).
-- Returns matching records from employee.
-- If no employee found in department,
-- employee columns become NULL.
-- Departments without employees WILL appear.

-- Example:
-- SELECT ...
-- FROM employee e
-- RIGHT JOIN department d
-- ON e.dept_id = d.dept_id;



-- =====================================================
-- 4️⃣ FULL JOIN (FULL OUTER JOIN)
-- =====================================================
-- Returns ALL records from BOTH tables.
-- Matching records are combined.
-- Non-matching rows from both sides also included.
-- If no match → NULL values shown.

-- ⚠ IMPORTANT:
-- MySQL does NOT support FULL JOIN directly.
-- You must use:
-- LEFT JOIN
-- UNION
-- RIGHT JOIN

-- Example in MySQL:
-- SELECT ...
-- FROM employee e
-- LEFT JOIN department d ON e.dept_id = d.dept_id
-- UNION
-- SELECT ...
-- FROM employee e
-- RIGHT JOIN department d ON e.dept_id = d.dept_id;



-- =====================================================
-- 5️⃣ COUNT Employees in Each Department
-- =====================================================
-- GROUP BY is used with aggregate functions.
-- COUNT(e.emp_id) counts number of employees in each department.
-- INNER JOIN used → only departments that have employees appear.

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;



-- =====================================================
-- 6️⃣ Show ALL Departments With Total Employees
-- =====================================================
-- If you want departments with 0 employees also,
-- use LEFT JOIN instead of INNER JOIN.

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM department d
LEFT JOIN employee e
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Departments with no employees will show 0.
-- COUNT does not count NULL values.
