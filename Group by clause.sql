use sakila;
show tables;
select customer_id from payment group by customer_id;
-- jis column per group by karege usi ka group banega with unique values 
-- used to group similer type value in a single group 
--  used with aggrigate functiuon 
-- column use with group by is also written in with 

-- group based on staff Id showing amount for each staff 
select staff_id , sum(amount) , count(customer_id) from payment group by staff_id;
-- group bbased on customer Id 
select customer_id , count(payment_id) , sum(amount)  from payment group by customer_id;

-- you have to find how many times each amount is value visible  
-- try to get the total amount the maximum amount value and the total tranasextion done by each customer 
select amount, count(payment_id)  from payment group by amount;
select  customer_id , sum(amount) AS total , max(amount) As max  , sum(payment_id) from payment group by customer_id;

-- you have to find out the total amount spend by each staff along with the number of customer they have served  only after the payment 9
select  staff_id , sum(amount) , count(customer_id) from payment  where payment_id>9  group by staff_id ;

-- you have to find the total amound sepen avg amount spend and the total transection done in each month
select month(payment_date) ,sum(amount) , avg(amount) ,  count(payment_id)  from payment group by month(payment_date);



select * from payment;
-- get me total am avg am max am done for the first weak of each month for may=5 june=6 and july 
select  month(payment_date) ,sum(amount) , avg(amount) , max(amount) from payment where month(payment_date) in (5,6,7) and extract(day from payment_date) between 1 and 7  group by month(payment_date);
select extract(day from payment_date) from payment;