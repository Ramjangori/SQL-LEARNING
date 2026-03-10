-- foerigin key 
-- use to create relationship bitween two table child table key reg=fer to the primary key of parent table 
-- Example 
use testdb;
create table depttb( id int primary key ,name varchar(20)); 
insert into depttb values(1 , 'HR'),(2,'IT'),(3,'Marketing');

create table emptb(
 id int ,
 name varchar(30),
 dept_id int ,
 foreign key(dept_id)
 references depttb(id)
 );
 
 insert into emptb values (1,'Ramjan',4); -- error 4 dept_id not exists 