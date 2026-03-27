/*
 * 🔹 CTE (Common Table Expression)
 * -> Temporary result set used within a query
 * -> Improves readability and query optimization
 * -> Created using WITH keyword
 */

/*
 * 🔹 NON-RECURSIVE CTE
 * 
 * with completed_orders as 
 * (select * from orders where status='Completed')
 * 
 * -> Filters completed orders
 * -> Works like a temporary table
 */

/*
 * 🔹 MULTIPLE CTEs
 * 
 * cte3 as (
 *   select oi.quantity * oi.unit_price as total_price,
 *          day(co.order_date) as day
 *   from completed_orders co
 *   join order_items oi
 *   on co.order_id = oi.order_id
 * )
 * 
 * -> Uses previous CTE (completed_orders)
 * -> Calculates total_price
 * -> Extracts day from order_date
 */

/*
 * 🔹 FINAL QUERY
 * select * from cte3 where day between 1 and 10;
 * 
 * -> Filters data for first 10 days of month
 */

/*
 * 🔹 IMPORTANT POINTS
 * -> CTE exists only during query execution
 * -> Can reference previous CTEs
 * -> Improves readability compared to subqueries
 */


/*
 * 🔹 RECURSIVE CTE
 * -> Used for hierarchical / repeated data
 * -> Has base case + recursive part
 */

/*
 * 🔹 EXAMPLE
 * with recursive cte as (
 *   select 20 as n          -- base case
 *   union all
 *   select n+1 from cte     -- recursive step
 *   where n < 30
 * )
 * select n from cte;
 * 
 * -> Starts from 20
 * -> Increases n by 1
 * -> Stops when n = 30
 */

/*
 * 🔹 OUTPUT
 * 20, 21, 22, ..., 30
 */