-- ================================
-- ACID Properties (Transaction)
-- ================================

-- ACID Properties are the foundation of transactions in SQL
-- Every transaction must follow ACID to ensure data is safe and correct

-- --------------------------------
-- A -> Atomicity (All or Nothing)
-- --------------------------------
-- Ensures that a transaction is fully completed or fully rolled back
-- If any step fails, the entire transaction will be undone

-- Example:
-- Either all queries execute OR none of them

-- --------------------------------
-- C -> Consistency (Valid State)
-- --------------------------------
-- Ensures database always moves from one valid state to another
-- No rules (constraints, keys) should be violated

-- Example:
-- Cannot insert NULL in NOT NULL column

-- --------------------------------
-- I -> Isolation (Transaction Separation)
-- --------------------------------
-- Each transaction is independent
-- One transaction cannot see uncommitted changes of another transaction

-- Example:
-- Transaction A changes data but not committed
-- Transaction B cannot see those changes

-- --------------------------------
-- D -> Durability (Permanent Save)
-- --------------------------------
-- Once transaction is committed, data is permanently saved
-- Even after server crash or power failure

-- ================================
-- Transaction Control Commands
-- ================================

-- Check autocommit mode
SELECT @@autocommit;

-- Disable autocommit
SET autocommit = 0;

-- Start transaction
START TRANSACTION;

-- Commit changes
COMMIT;

-- Rollback changes
ROLLBACK;

-- --------------------------------
-- Important Note
-- --------------------------------
-- DDL queries (CREATE, ALTER, DROP) auto commit
-- Even if you don't manually commit

-- ================================
-- Savepoint (Checkpoint)
-- ================================

-- Savepoint is used to create a checkpoint inside a transaction
-- So we can rollback to a specific point instead of full rollback

-- Create savepoint
SAVEPOINT check1;

-- Rollback to savepoint
ROLLBACK TO check1;

-- Release savepoint
RELEASE SAVEPOINT check1;

-- ================================
-- Example Flow
-- ================================

-- START TRANSACTION;
-- INSERT INTO test VALUES('Ramjan');
-- SAVEPOINT sp1;
-- UPDATE test SET name = 'Aman';
-- ROLLBACK TO sp1;  -- only update will rollback
-- COMMIT;

-- ================================
-- Key Points
-- ================================
-- ACID ensures data reliability
-- Atomicity = All or Nothing
-- Consistency = Valid State
-- Isolation = No Interference
-- Durability = Permanent Save
-- Savepoint = Partial rollback control