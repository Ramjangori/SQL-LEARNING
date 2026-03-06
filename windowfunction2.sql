show databases;
use windowdb;

-- =====================================================
-- WINDOW FUNCTION IN SUBQUERY
-- Dense_rank() is used to assign ranking to rows.
-- Here ranking is based on amount in descending order.
-- Highest amount will get rank = 1
-- Subquery is used so that we can filter ranking outside.
-- =====================================================

select * 
from (
        select *,
               dense_rank() over(order by amount desc) as ranking
        from sales
     ) as tab
where ranking = 1;



-- =====================================================
-- LAG() FUNCTION
-- LAG() is used to access the previous row value.
-- Here it shows previous sale_date.
-- Also calculating difference between current date 
-- and previous sale date.
-- =====================================================

select *,
       lag(sale_date , 1) over() as previous_sale_date,
       sale_date - lag(sale_date , 1) over() as diff
from sales;



-- =====================================================
-- LEAD() FUNCTION
-- LEAD() is used to access the next row value.
-- Here it shows next sale_date.
-- datediff() calculates difference between current
-- date and next sale date.
-- =====================================================

select *,
       lead(sale_date , 1) over() as next_sale_date,
       datediff(sale_date , lead(sale_date , 1) over()) as diff
from sales;



-- =====================================================
-- ROWS BETWEEN CLAUSE
-- It defines a specific range of rows in window function
-- for performing calculations.
-- =====================================================



-- =====================================================
-- RUNNING SUM
-- Calculates cumulative sum from first row 
-- to the current row.
-- =====================================================

select *,
       sum(amount) over(order by amount 
       rows between unbounded preceding and current row) as running_sum
from sales;



-- =====================================================
-- RUNNING AVERAGE
-- Calculates cumulative average from first row 
-- to the current row.
-- =====================================================

select *,
       avg(amount) over(order by amount 
       rows between unbounded preceding and current row) as running_avg
from sales;



-- =====================================================
-- N PRECEDING ROWS
-- Creates a window of rows near the current row.
-- Here calculation is done using current row
-- and 1 previous row.
-- =====================================================

select *,
       sum(amount) over(order by amount 
       rows between 1 preceding and current row) as sum_last_two_rows
from sales;

-- learning assignment 

-- 1 antiles 
-- 2 about data types - int , tinyint  , smallint , bigint , varchar and char datatype 
-- how to create and insert into table 