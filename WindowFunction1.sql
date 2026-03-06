-- Windows Function --

-- A Window Function performs a calculation across a set of table rows that are related to the current row —
-- without collapsing the rows (unlike GROUP BY).

-- 👉 Key Point:

-- GROUP BY → Collapses rows (1 row per group)

-- WINDOW FUNCTION → Keeps all rows + adds calculated result

-- 🔹 Syntax
-- SELECT column1,
      --  window_function() OVER (
           -- PARTITION BY column
           -- ORDER BY column
     --   )
-- FROM table;
--  Components:

-- window_function() → SUM, AVG, ROW_NUMBER, RANK etc.

-- OVER() → Defines the window

-- PARTITION BY → Like GROUP BY but doesn't collapse

--  ORDER BY → Defines row order inside partition

create database windowdb;
use windowdb;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO Sales (sale_id, customer_name, sale_date, amount) VALUES
(1, 'Alice',   '2024-01-05', 250.00),
(2, 'Bob',     '2024-01-06', 180.50),
(3, 'Charlie', '2024-01-07', 320.75),
(4, 'Alice',   '2024-01-10', 150.00),
(5, 'Bob',     '2024-01-12', 400.00),
(6, 'David',   '2024-01-15', 275.25),
(7, 'Eve',     '2024-01-18', 500.00),
(8, 'Charlie', '2024-01-20', 220.00),
(9, 'Alice',   '2024-01-22', 330.40),
(10, 'David',  '2024-01-25', 145.75),
(11, 'Eve',    '2024-02-01', 600.00),
(12, 'Bob',    '2024-02-03', 210.30),
(13, 'Charlie','2024-02-05', 390.60),
(14, 'Alice',  '2024-02-07', 120.00),
(15, 'David',  '2024-02-10', 310.00),
(16, 'Eve',    '2024-02-12', 450.00),
(17, 'Bob',    '2024-02-15', 275.00),
(18, 'Charlie','2024-02-18', 500.00),
(19, 'Alice',  '2024-02-20', 200.00),
(20, 'David',  '2024-02-22', 350.00),
(21, 'Eve',    '2024-02-25', 700.00),
(22, 'Bob',    '2024-02-27', 150.00),
(23, 'Charlie','2024-03-01', 425.50),
(24, 'Alice',  '2024-03-03', 275.75),
(25, 'David',  '2024-03-05', 500.00);


select * from sales;

SELECT *,
       SUM(amount) OVER (PARTITION BY sale_date) AS perDayTotal
FROM sales
ORDER BY perDayTotal;

CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    region VARCHAR(50),
    name VARCHAR(50),
    sale INT
);

INSERT INTO sales_data (id, region, name, sale) VALUES
(1, 'North', 'Amit', 5000),
(2, 'North', 'Rohit', 7000),
(3, 'North', 'Neha', 6000),

(4, 'South', 'Karan', 8000),
(5, 'South', 'Priya', 7500),
(6, 'South', 'Anjali', 8200),

(7, 'East', 'Vikas', 4000),
(8, 'East', 'Riya', 4500),
(9, 'East', 'Suresh', 4200),

(10, 'West', 'Arjun', 9000),
(11, 'West', 'Meena', 8800),
(12, 'West', 'Rahul', 9200);

select * from sales_data;
select region , sum(sale) from sales_data group by region;
select * , sum(sale) over (partition by region ) as region_total from sales_data order by  region_total asc ;

select * , sum(sale) over (partition by region order by sale ) as region_total from sales_data;
-- row_number assign row number to the row 
select * ,
row_number() over() from sales;

select * ,
row_number() over(partition by customer_name) from sales;

select * ,
rank() over(order by amount ) from sales;

select * ,
rank() over(order by amount ) , dense_rank() over(order by amount )  from sales;