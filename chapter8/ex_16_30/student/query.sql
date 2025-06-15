-- Initial setup to ensure a clean slate and consistent starting data
DROP DATABASE IF EXISTS Ch08_SimpleCo;
CREATE DATABASE Ch08_SimpleCo;
USE Ch08_SimpleCo;

-- Create CUSTOMER table
CREATE TABLE CUSTOMER(
    CUST_NUM INT AUTO_INCREMENT,
    CUST_LNAME VARCHAR(30),
    CUST_FNAME VARCHAR(30),
    CUST_BALANCE DECIMAL(10, 2),
    PRIMARY KEY (CUST_NUM)
);

-- Insert initial CUSTOMER data
INSERT INTO
    CUSTOMER (CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES
    (1000, 'Smith', 'Jeanne', 1050.11),
    (1001, 'Ortega', 'Juan', 840.92);

-- Create INVOICE table
CREATE TABLE INVOICE(
    INV_NUM INT AUTO_INCREMENT,
    CUST_NUM INT,
    INV_DATE DATE,
    INV_AMOUNT DECIMAL(10, 2),
    PRIMARY KEY (INV_NUM),
    FOREIGN KEY (CUST_NUM) REFERENCES CUSTOMER(CUST_NUM)
);

-- Insert initial INVOICE data (8000-8004)
INSERT INTO
    INVOICE
VALUES
    (8000, 1000, '2022/03/23', 235.89),
    (8001, 1001, '2022/03/23', 312.82),
    (8002, 1001, '2022/03/30', 528.10),
    (8003, 1000, '2022/04/16', 194.78),
    (8004, 1000, '2022/04/23', 619.44);

-- Insert specific invoices 8005 and 8006 for deletion test, before auto-increment change
INSERT INTO
    INVOICE (INV_NUM, CUST_NUM, INV_DATE, INV_AMOUNT)
VALUES
    (8005, 1000, '2022/05/01', 150.00),
    (8006, 1001, '2022/05/02', 200.00);

-- Alter AUTO_INCREMENT for CUSTOMER and INVOICE tables
ALTER TABLE
    CUSTOMER AUTO_INCREMENT = 2000;
ALTER TABLE
    INVOICE AUTO_INCREMENT = 9000;

-- Insert a new customer using direct INSERT (for initial setup consistency)
INSERT INTO
    CUSTOMER(CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES
    ('Powers', 'Ruth', 500);

-- Add CUST_DOB column and update existing customer DOBS
ALTER TABLE
    CUSTOMER
ADD
    COLUMN CUST_DOB DATE;
UPDATE
    CUSTOMER
SET
    CUST_DOB = '1989/03/15'
WHERE
    CUST_NUM = 1000;
UPDATE
    CUSTOMER
SET
    CUST_DOB = '1988/12/22'
WHERE
    CUST_NUM = 1001;


-- --- TRIGGERS ---

-- Drop the trigger if it already exists to avoid errors on recreation
DROP TRIGGER IF EXISTS trg_updatecustbalance;

-- Create the trigger named trg_updatecustbalance (AFTER INSERT on INVOICE)
DELIMITER $$
CREATE TRIGGER trg_updatecustbalance
AFTER INSERT ON INVOICE
FOR EACH ROW
BEGIN
    -- This trigger updates the CUST_BALANCE in the CUSTOMER table.
    -- It adds the new invoice's INV_AMOUNT to the customer's balance.
    UPDATE CUSTOMER
    SET CUST_BALANCE = CUST_BALANCE + NEW.INV_AMOUNT
    WHERE CUST_NUM = NEW.CUST_NUM;
END$$
DELIMITER ;

-- Drop the trigger if it already exists to avoid errors on recreation
DROP TRIGGER IF EXISTS trg_updatecustbalance2;

-- Create a new trigger named trg_updatecustbalance2 (AFTER DELETE on INVOICE)
-- This trigger updates the CUST_BALANCE in the CUSTOMER table when an invoice is deleted.
-- It subtracts the deleted invoice's INV_AMOUNT from the customer's balance.
DELIMITER $$
CREATE TRIGGER trg_updatecustbalance2
AFTER DELETE ON INVOICE
FOR EACH ROW
BEGIN
    UPDATE CUSTOMER
    SET CUST_BALANCE = CUST_BALANCE - OLD.INV_AMOUNT
    WHERE CUST_NUM = OLD.CUST_NUM;
END$$
DELIMITER ;


-- --- PROCEDURES ---

-- Drop the procedure if it already exists to avoid errors on recreation
DROP PROCEDURE IF EXISTS prc_cust_add;

-- Create a procedure named prc_cust_add to add a new customer
DELIMITER $$
CREATE PROCEDURE prc_cust_add(
    IN p_cust_lname VARCHAR(30),
    IN p_cust_fname VARCHAR(30),
    IN p_cust_balance DECIMAL(10, 2)
)
BEGIN
    -- Inserts a new customer record into the CUSTOMER table.
    -- CUST_NUM is auto-incremented.
    INSERT INTO CUSTOMER (CUST_LNAME, CUST_FNAME, CUST_BALANCE)
    VALUES (p_cust_lname, p_cust_fname, p_cust_balance);
END$$
DELIMITER ;

-- Drop the procedure if it already exists to avoid errors on recreation
DROP PROCEDURE IF EXISTS prc_invoice_add;

-- Create a procedure named prc_invoice_add to add a new invoice record
DELIMITER $$
CREATE PROCEDURE prc_invoice_add(
    IN p_inv_num INT,           -- Added invoice number parameter
    IN p_cust_num INT,
    IN p_inv_date DATE,
    IN p_inv_amount DECIMAL(10, 2)
)
BEGIN
    -- Inserts a new invoice record into the INVOICE table, using the provided INV_NUM.
    INSERT INTO INVOICE (INV_NUM, CUST_NUM, INV_DATE, INV_AMOUNT)
    VALUES (p_inv_num, p_cust_num, p_inv_date, p_inv_amount);
END$$
DELIMITER ;

-- Drop the procedure if it already exists to avoid errors on recreation
DROP PROCEDURE IF EXISTS prc_inv_delete;

-- Create a procedure named prc_inv_delete to delete an invoice by INV_NUM
DELIMITER $$
CREATE PROCEDURE prc_inv_delete(
    IN p_inv_num INT
)
BEGIN
    -- Deletes an invoice record from the INVOICE table based on the given INV_NUM.
    -- This will trigger trg_updatecustbalance2 to update the customer's balance.
    DELETE FROM INVOICE
    WHERE INV_NUM = p_inv_num;
END$$
DELIMITER ;


-- --- TEST SECTION ---

-- Display initial state of CUSTOMER and INVOICE tables (including 8005 and 8006)
SELECT '--- Initial CUSTOMER Data ---' AS Status;
SELECT * FROM CUSTOMER;
SELECT '--- Initial INVOICE Data (including 8005 & 8006) ---' AS Status;
SELECT * FROM INVOICE;

-- Test prc_cust_add: Add a new customer: Rauthor Peter, Balance 0.00
CALL prc_cust_add('Rauthor', 'Peter', 0.00);
SELECT '--- After adding new customer Rauthor Peter ---' AS Status;
SELECT * FROM CUSTOMER WHERE CUST_LNAME = 'Rauthor';


-- Test trg_updatecustbalance (INSERT trigger) using direct insert
-- This should add 225.40 to the balance of customer 1001
-- This will be INV_NUM 9000
INSERT INTO INVOICE (CUST_NUM, INV_DATE, INV_AMOUNT)
VALUES (1001, '2022/05/07', 225.40);
SELECT '--- After direct INVOICE INSERT for CUST 1001 (INV_NUM 9000) ---' AS Status;
SELECT CUST_NUM, CUST_FNAME, CUST_BALANCE FROM CUSTOMER WHERE CUST_NUM = 1001;
SELECT INV_NUM, CUST_NUM, INV_DATE, INV_AMOUNT FROM INVOICE ORDER BY INV_NUM DESC LIMIT 1;


-- Test prc_invoice_add procedure (which also triggers trg_updatecustbalance)
-- This will add 301.72 to customer 1000's balance
-- Using INV_NUM 9000 (as per AUTO_INCREMENT setup, or a new distinct number if 9000 is taken by previous direct insert)
-- Note: if 9000 is already used by the direct insert, adjust this INV_NUM to the next available (e.g., 9001)
CALL prc_invoice_add(9000, 1000, '2022-04-30', 301.72);
SELECT '--- After CALL prc_invoice_add for CUST 1000 (INV_NUM 9000) ---' AS Status;
SELECT CUST_NUM, CUST_FNAME, CUST_BALANCE FROM CUSTOMER WHERE CUST_NUM = 1000;
SELECT INV_NUM, CUST_NUM, INV_DATE, INV_AMOUNT FROM INVOICE ORDER BY INV_NUM DESC LIMIT 1;


-- --- Test for trg_updatecustbalance2 (AFTER DELETE trigger) ---
-- Insert a temporary invoice to be deleted (e.g., for customer 1001)
-- This will be INV_NUM 9001 (assuming 9000 was used by prc_invoice_add)
INSERT INTO INVOICE (CUST_NUM, INV_DATE, INV_AMOUNT)
VALUES (1001, '2022/06/15', 50.00);

-- Get the INV_NUM of the last inserted invoice for customer 1001 (which is 9001)
SET @last_inv_num = LAST_INSERT_ID();

-- Get the current balance of customer 1001 before deletion of 9001
SELECT CUST_BALANCE INTO @balance_before_delete_9001 FROM CUSTOMER WHERE CUST_NUM = 1001;

SELECT CONCAT('--- Balance for CUST 1001 before deleting INV ', @last_inv_num, ': ', @balance_before_delete_9001, ' ---') AS Status;

-- Delete the temporary invoice (9001). This should trigger trg_updatecustbalance2
DELETE FROM INVOICE
WHERE INV_NUM = @last_inv_num;

SELECT CONCAT('--- Balance for CUST 1001 after deleting INV ', @last_inv_num, ' (expected ', @balance_before_delete_9001 - 50.00, ') ---') AS Status;
SELECT CUST_NUM, CUST_FNAME, CUST_BALANCE FROM CUSTOMER WHERE CUST_NUM = 1001;


-- --- Test for prc_inv_delete procedure ---
-- Get balances before deleting 8005 and 8006
SELECT CUST_BALANCE INTO @balance_before_delete_8005 FROM CUSTOMER WHERE CUST_NUM = 1000;
SELECT CUST_BALANCE INTO @balance_before_delete_8006 FROM CUSTOMER WHERE CUST_NUM = 1001;

SELECT CONCAT('--- Balances before deleting INV 8005 (CUST 1000): ', @balance_before_delete_8005, ' ---') AS Status;
SELECT CONCAT('--- Balances before deleting INV 8006 (CUST 1001): ', @balance_before_delete_8006, ' ---') AS Status;


-- Test the prc_inv_delete procedure by deleting invoice 8005
CALL prc_inv_delete(8005);

-- Test the prc_inv_delete procedure by deleting invoice 8006
CALL prc_inv_delete(8006);

SELECT '--- After CALL prc_inv_delete for INV 8005 and 8006 ---' AS Status;
SELECT CUST_NUM, CUST_FNAME, CUST_BALANCE FROM CUSTOMER WHERE CUST_NUM IN (1000, 1001);


-- Final verification of CUSTOMER and INVOICE tables
SELECT '--- Final CUSTOMER Data ---' AS Status;
SELECT * FROM CUSTOMER;
SELECT '--- Final INVOICE Data ---' AS Status;
SELECT * FROM INVOICE;
