-- How to store image in mysql 
-- Blob data types is used to store image in mysql 
 use testdb;
 create  table imgtb(id int , image BLOB);
 insert into imgtb values 
 (1 , load_file('C:\Users\ramja\Pictures\Screenshots'));
 INSERT INTO imgtb VALUES
(1 , LOAD_FILE('D:/JAVA FULL STACK/HTML/logo2.webp'));
 select * from imgtb;
 
 SHOW VARIABLES LIKE 'secure_file_priv';