-- ===============================
-- DATABASE SELECTION
-- ===============================

SHOW DATABASES;        -- show all databases
USE test2;             -- select database
SHOW TABLES;           -- show tables inside database


-- ===============================
-- CREATE TABLE
-- ===============================

-- create a table to practice TCL commands
CREATE TABLE trnasaction(
    id INT,
    money BIGINT,
    name VARCHAR(20)
);


-- =====================================================
-- TCL (Transaction Control Language)
-- =====================================================

-- TCL is used to manage transactions in a database
-- and control changes made by SQL statements.

-- Transaction = group of SQL operations that execute
-- as a single unit of work.

-- Important TCL Commands
-- 1. COMMIT
-- 2. ROLLBACK
-- 3. SAVEPOINT


-- =====================================================
-- START TRANSACTION
-- =====================================================

-- Before using TCL commands we start a transaction
START TRANSACTION;


-- =====================================================
-- 1. COMMIT
-- =====================================================

-- COMMIT is used to permanently save the changes
-- once commit is executed the changes cannot be undone

INSERT INTO trnasaction VALUES
(1,4809,"Ramjan"),
(2,47473,"Aman");

COMMIT;   -- changes saved permanently


-- =====================================================
-- 2. ROLLBACK
-- =====================================================

-- ROLLBACK is used to undo changes made in a transaction
-- it works only if the transaction is not committed

INSERT INTO trnasaction VALUES
(1,4809,"sofia"),
(2,47473,"shyam");

ROLLBACK;   -- undo last transaction

SELECT * FROM trnasaction;   -- check table data


-- =====================================================
-- ROLLBACK PRACTICE
-- =====================================================

INSERT INTO trnasaction VALUES
(1,4809,"Sumya"),
(2,47473,"Afreen");

ROLLBACK;

SELECT * FROM trnasaction;


INSERT INTO trnasaction VALUES
(1,4809,"Sameer"),
(2,47473,"Afreen");

ROLLBACK;

SELECT * FROM trnasaction;


-- =====================================================
-- AUTOCOMMIT CHECK
-- =====================================================

-- MySQL by default runs in AUTOCOMMIT mode
-- which means every query is automatically committed

SELECT @@autocommit;   -- 1 means autocommit is ON


-- =====================================================
-- DISABLE AUTOCOMMIT
-- =====================================================

-- to use transactions manually we can disable autocommit

SET autocommit = 0;

-- now INSERT, UPDATE, DELETE will not be saved
-- until COMMIT is executed


-- =====================================================
-- SUMMARY
-- =====================================================

-- COMMIT   -> permanently save changes
-- ROLLBACK -> undo changes
-- SAVEPOINT -> create checkpoint inside transaction
-- AUTOCOMMIT -> automatic commit after each query