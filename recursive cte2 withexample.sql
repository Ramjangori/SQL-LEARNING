create database ctedb;
use ctedb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Team Lead A1', 2),
(5, 'Team Lead A2', 2),
(6, 'Developer A1', 4),
(7, 'Developer A2', 4),
(8, 'Developer B1', 3);



select * from employees;

-- select e.emp_id , e.emp_name , m.emp_name  , concat(e.emp_name,'->',m.emp_name) from employees as e join employees as m on e.manager_id = m.emp_id;

WITH cte AS (
  SELECT emp_id, emp_name, manager_id, emp_name AS hierarchy
  FROM employees 
  WHERE manager_id IS NULL
);

WITH RECURSIVE cte2 AS (
    -- Anchor
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        emp_name AS hierarchy
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        CONCAT(c.hierarchy, '->', e.emp_name)
    FROM employees e
    JOIN cte2 c 
    ON e.manager_id = c.emp_id
)

SELECT * FROM cte2;

