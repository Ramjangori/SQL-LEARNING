-- Use database
use testdb;

-- show all tables in current database
show tables;

-- show all databases present in MySQL
show databases;


-- view data from emptb table
select * from emptb;

-- insert new record in depttb table
insert into depttb values(4,"dsa");

-- view all records from depttb
select * from depttb;


-- create new database
create database test2;

-- switch to database
use test;


-- =====================================================
-- ON DELETE CASCADE
-- =====================================================
-- If we delete a record from parent table,
-- then related records in child table are automatically deleted.

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- inserting records into customer table
INSERT INTO Customer VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Aman', 'Jaipur'),
(3, 'Neha', 'Mumbai');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount INT,
    customer_id INT,
    
    -- foreign key linking with parent table
    FOREIGN KEY (customer_id) 
    REFERENCES Customer(customer_id) 
    ON DELETE CASCADE
);

-- inserting records in orders table
INSERT INTO Orders VALUES
(101, '2026-03-10', 5000, 1),
(102, '2026-03-11', 3000, 2),
(103, '2026-03-12', 7000, 1),
(104, '2026-03-13', 2500, 3);

-- display data
select * from orders;
select * from customer;


-- =====================================================
-- ON DELETE SET NULL
-- =====================================================
-- If parent record is deleted,
-- then foreign key value in child table becomes NULL

drop table orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount INT,
    customer_id INT,
    
    FOREIGN KEY (customer_id) 
    REFERENCES Customer(customer_id) 
    ON DELETE SET NULL
);

INSERT INTO Orders VALUES
(101, '2026-03-10', 5000, 1),
(102, '2026-03-11', 3000, 2),
(103, '2026-03-12', 7000, 1),
(104, '2026-03-13', 2500, 3);

select * from orders;

-- delete customer id 1
-- related customer_id in orders table becomes NULL
delete from customer where customer_id = 1;



-- =====================================================
-- ON UPDATE CASCADE
-- =====================================================
-- If primary key value is updated in parent table,
-- the same change automatically reflects in child table.

drop table orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount INT,
    customer_id INT,
    
    FOREIGN KEY (customer_id) 
    REFERENCES Customer(customer_id) 
    ON DELETE SET NULL 
    ON UPDATE CASCADE
);


-- =====================================================
-- DELETE COMMAND
-- =====================================================
-- DELETE is used to remove records from table.

select * from customer;

-- delete record with customer id 2
delete from customer where customer_id = 2;

-- If WHERE condition is not used,
-- all records from the table will be deleted.


-- =====================================================
-- DUPLICATE RECORD FIND AND DELETE
-- =====================================================

create table cust3(id int , name varchar(20));

insert into cust3 values
(1,"Tiger"),
(2,"Yash"),
(3,"Tiger");

select * from cust3;


-- find duplicate records using self join
select c1.id , c1.name , c2.id as dupid , c2.name  
from cust3 as c1 
join cust3 as c2 
on c1.name = c2.name and c1.id < c2.id;


-- delete duplicate records
delete c2 
from cust3 as c1 
join cust3 as c2 
on c1.name = c2.name and c1.id < c2.id;



-- =====================================================
-- UPDATE COMMAND
-- =====================================================
-- UPDATE is used to modify existing records in a table.

select * from cust3;

UPDATE cust3 
SET name = "Ramjan" 
WHERE id = 1;
 -- assignment 
--  On Monday i need 4 star completed on hackerrank 
  -- what is transection control language 
  -- what are the rolls of commit and rollback 
  -- normilazation 1nf 2nf 3nf 