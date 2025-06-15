-- Drop the database if it exists to start fresh
DROP DATABASE IF EXISTS Ch08_SimpleCo;

-- Create the new database
CREATE DATABASE Ch08_SimpleCo;

-- Use the newly created database
USE Ch08_SimpleCo;

-- Create the CUSTOMER table with CUST_NUM as an AUTO_INCREMENT primary key
CREATE TABLE CUSTOMER(
    CUST_NUM INT AUTO_INCREMENT,
    CUST_LNAME VARCHAR(30),
    CUST_FNAME VARCHAR(30),
    CUST_BALANCE DECIMAL(10,2),
    PRIMARY KEY (CUST_NUM)
);

-- Insert initial data into CUSTOMER table
-- CUST_NUM values are explicitly provided here, but for subsequent inserts
-- where CUST_NUM is omitted, AUTO_INCREMENT will take over.
INSERT INTO CUSTOMER (CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES (1000,'Smith', 'Jeanne', 1050.11),
       (1001,'Ortega', 'Juan', 840.92);

-- Create the INVOICE table with INV_NUM as an AUTO_INCREMENT primary key
CREATE TABLE INVOICE(
    INV_NUM INT AUTO_INCREMENT,
    CUST_NUM INT,
    INV_DATE DATE,
    INV_AMOUNT DECIMAL(10,2),
    PRIMARY KEY (INV_NUM),
    FOREIGN KEY (CUST_NUM) REFERENCES CUSTOMER(CUST_NUM)
);

-- Insert initial data into INVOICE table
INSERT INTO INVOICE
VALUES
(8000, 1000, '2022/03/23', 235.89),
(8001, 1001, '2022/03/23', 312.82),
(8002, 1001, '2022/03/30', 528.10),
(8003, 1000, '2022/04/16', 194.78),
(8004, 1000, '2022/04/23', 619.44);

-- Set the starting value for the AUTO_INCREMENT on CUSTOMER to 2000
ALTER TABLE CUSTOMER AUTO_INCREMENT = 2000;

-- Set the starting value for the AUTO_INCREMENT on INVOICE to 9000
ALTER TABLE INVOICE AUTO_INCREMENT = 9000;

-- Insert a new customer 'Powers', 'Ruth'
-- CUST_NUM will be auto-generated starting from 2000 (as per ALTER TABLE above)
INSERT INTO CUSTOMER(CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES ('Powers', 'Ruth', 500.00);

-- Add a new column CUST_DOB (Date of Birth) to the CUSTOMER table
ALTER TABLE CUSTOMER
ADD COLUMN CUST_DOB DATE;

-- Update the CUST_DOB for existing customers
UPDATE CUSTOMER
SET CUST_DOB = '1989/03/15'
WHERE CUST_NUM = 1000;

UPDATE CUSTOMER
SET CUST_DOB = '1988/12/22'
WHERE CUST_NUM = 1001;

-- Change the delimiter for defining the trigger and procedure
DELIMITER //

-- Create a trigger to update CUST_BALANCE after a new invoice is added
DROP TRIGGER IF EXISTS trg_updatecustbalance //
CREATE TRIGGER trg_updatecustbalance
AFTER INSERT ON INVOICE
FOR EACH ROW
BEGIN
    UPDATE CUSTOMER
    SET CUST_BALANCE = CUST_BALANCE + NEW.INV_AMOUNT
    WHERE CUST_NUM = NEW.CUST_NUM;
END //

-- Create a stored procedure to add a new customer
DROP PROCEDURE IF EXISTS prc_cust_add //
CREATE PROCEDURE prc_cust_add(
    IN p_cust_num INT,
    IN p_cust_lname VARCHAR(30),
    IN p_cust_fname VARCHAR(30),
    IN p_cust_balance DECIMAL(10,2)
)
BEGIN
    INSERT INTO CUSTOMER (CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE)
    VALUES (p_cust_num, p_cust_lname, p_cust_fname, p_cust_balance);
END //

-- Reset the delimiter back to the default semicolon
DELIMITER ;

-- Test the prc_cust_add procedure by adding customer 1002
CALL prc_cust_add(1002, 'Rauthor', 'Peter', 0.00);

-- Select all data from CUSTOMER before trigger test to see current state
SELECT 'CUSTOMER Table before trigger test:' AS Status, CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE, CUST_DOB
FROM CUSTOMER;


-- Test the trigger by inserting a new INVOICE record AFTER the trigger is defined
-- This invoice for customer 1001 has an amount of 225.40, which will update balance from 840.92 to 1066.32
INSERT INTO INVOICE (INV_NUM, CUST_NUM, INV_DATE, INV_AMOUNT)
VALUES (9000, 1001, '2023/05/01', 225.40); -- Updated INV_AMOUNT to match expected balance

-- Select all data from CUSTOMER AFTER trigger test to verify the updated balance
SELECT 'CUSTOMER Table after trigger test:' AS Status, CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE, CUST_DOB
FROM CUSTOMER;

-- Optional: Select the newly added invoice to confirm it was recorded
SELECT * FROM INVOICE WHERE INV_NUM = 9000;
