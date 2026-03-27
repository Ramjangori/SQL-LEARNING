-- 🔐 DCL (Data Control Language)
-- DCL is used to control access/permissions on database objects
-- Mainly used by DBA (Database Administrator)

-- ============================================
-- 🔹 DCL COMMANDS
-- ============================================
-- 1. GRANT  -> To give permissions
-- 2. REVOKE -> To take back permissions

-- ============================================
-- 🔹 BASIC DATABASE COMMANDS
-- ============================================
SHOW DATABASES;         -- Show all databases
USE CTEDB;              -- Select database
SHOW TABLES;            -- Show all tables in selected DB

-- ============================================
-- 🔹 CHECK CURRENT USER
-- ============================================
SELECT CURRENT_USER();  -- Shows current logged-in user

-- ============================================
-- 🔹 CHECK PERMISSIONS (GRANTS)
-- ============================================
SHOW GRANTS FOR 'root'@'localhost';  -- Check root permissions

-- ============================================
-- 🔹 CREATE USER
-- ============================================
-- Syntax:
-- CREATE USER 'username'@'host' IDENTIFIED BY 'password';

CREATE USER 'RAMJAN'@'localhost' IDENTIFIED BY 'Ramjan';

-- Check user permissions (default minimal permissions)
SHOW GRANTS FOR 'RAMJAN'@'localhost';

-- ============================================
-- 🔹 GRANT PERMISSIONS
-- ============================================

-- 1. Give SELECT permission on specific database
GRANT SELECT ON regex2.* TO 'RAMJAN'@'localhost';

-- 2. Give ALL permissions on specific database
GRANT ALL PRIVILEGES ON sakila.* TO 'RAMJAN'@'localhost';

-- 3. Give multiple permissions
GRANT SELECT, INSERT, UPDATE ON sakila.* TO 'RAMJAN'@'localhost';

-- ============================================
-- 🔹 CHECK UPDATED PERMISSIONS
-- ============================================
SHOW GRANTS FOR 'RAMJAN'@'localhost';

-- ============================================
-- 🔹 REVOKE PERMISSIONS
-- ============================================

-- 1. Revoke specific permission
REVOKE SELECT ON sakila.* FROM 'RAMJAN'@'localhost';

-- 2. Revoke multiple permissions
REVOKE INSERT, UPDATE ON sakila.* FROM 'RAMJAN'@'localhost';

-- 3. Revoke ALL permissions
REVOKE ALL PRIVILEGES ON sakila.* FROM 'RAMJAN'@'localhost';

-- ============================================
-- 🔹 APPLY CHANGES (optional but safe)
-- ============================================
FLUSH PRIVILEGES;

-- ============================================
-- 🔹 IMPORTANT CONCEPTS (INTERVIEW POINTS)
-- ============================================

-- 🔸 MySQL user format:
-- 'username'@'host'
-- Example:
-- 'RAMJAN'@'localhost'
-- 'RAMJAN'@'%'

-- 🔸 localhost vs %
-- localhost → only local machine access
-- %         → access from any host

-- 🔸 database.* means:
-- all tables inside that database

-- 🔸 GRANT OPTION:
-- allows user to give permissions to others

-- Example:
-- GRANT ALL PRIVILEGES ON sakila.* TO 'RAMJAN'@'localhost' WITH GRANT OPTION;

-- ============================================
-- 🔹 DELETE USER
-- ============================================
DROP USER 'RAMJAN'@'localhost';

-- ============================================
-- 🔹 DEBUG / CHECK USERS
-- ============================================
SELECT user, host FROM mysql.user;

-- ============================================
-- 🔹 FINAL CHECK
-- ============================================
SELECT CURRENT_USER();
SHOW GRANTS FOR 'RAMJAN'@'localhost';