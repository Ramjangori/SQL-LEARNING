use windowdb;
-- calculating running total of sell for each customer 
select * from orders;
select * , sum(amount) over(partition by customer_id order by  order_id asc) from orders;
select * , lag(amount,1) over(partition by customer_id order by order_id asc ) from orders;

select distinct  category ,avg(amount) over(partition by category) from orders;

select * , sum(amount) over() , concat(((amount)/sum(amount) over())*100 , '%') as percent from orders ;

select * from (select * , dense_rank() over(partition by customer_id order by order_id) as first_order from orders) as t where first_order=1 ;

select  distinct city , customer_id , sum(amount) over(partition by city ) as spend from orders;


