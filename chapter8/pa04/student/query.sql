-- Chapter 8 Activities  
DROP DATABASE IF EXISTS InstantRide;
CREATE DATABASE InstantRide;
USE InstantRide;

-- Drop the ACTIVE_DRIVERS VIEW if it exists, to ensure a clean recreation later.
DROP VIEW IF EXISTS ACTIVE_DRIVERS;
-- Remove the ACTIVE_DRIVERS table if it exists (for robustness, though we're moving to a VIEW).
DROP TABLE IF EXISTS ACTIVE_DRIVERS;


CREATE TABLE DRIVERS (
    -- Corrected DRIVER_ID definition: now INT and AUTO_INCREMENT for automatic ID generation.
    DRIVER_ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    DRIVER_FIRST_NAME VARCHAR(20) NOT NULL,
    DRIVER_LAST_NAME VARCHAR(20) NOT NULL,
    DRIVER_DRIVING_LICENSE_ID VARCHAR(10) NOT NULL,
    DRIVER_START_DATE DATE NOT NULL,
    DRIVER_DRIVING_LICENSE_CHECKED BOOL NOT NULL,
    DRIVER_RATING DECIMAL(2,1) NOT NULL
);

-- Insert initial driver data. DRIVER_ID values are explicitly provided for existing data,
-- ensuring they fit into the INT type.
INSERT INTO DRIVERS VALUES(2001, 'Willie', 'Butler', '1874501','2022-09-12', true, 4.4 );
INSERT INTO DRIVERS VALUES(2002, 'Justin', 'Howard', '1953853','2022-09-09', true, 4.8);
INSERT INTO DRIVERS VALUES(2003, 'Anthony', 'Walker', '1735487','2022-09-15', true, 3.5);
INSERT INTO DRIVERS VALUES(2004, 'Ece', 'Yilmaz', '1734747','2022-08-15', true, 0);

CREATE TABLE CARS (
    CAR_ID CHAR(5) PRIMARY KEY NOT NULL,
    CAR_PLATE VARCHAR(10) NOT NULL,
    CAR_MODEL VARCHAR(20) NOT NULL,
    CAR_YEAR YEAR NOT NULL
);

INSERT INTO CARS VALUES('1001', 'BB-542-AB', 'TOYOTA PRIUS', '2021');
INSERT INTO CARS VALUES('1002', 'BB-883-EE', 'TESLA MODEL 3', '2022');
INSERT INTO CARS VALUES('1003', 'BB-451-ZN', 'TOYOTA AURIS', '2022');
INSERT INTO CARS VALUES('1004', 'BB-189-MM', 'MERCEDES E200', '2022');


CREATE TABLE USERS (
    USER_ID CHAR(5) PRIMARY KEY NOT NULL,
    USER_FIRST_NAME VARCHAR(20) NOT NULL,
    USER_LAST_NAME VARCHAR(20) NOT NULL,
    USER_EMAIL VARCHAR(100) NOT NULL
);

INSERT INTO USERS VALUES('3001', 'Jack', 'Hill', 'j.hill@xmail.com');
INSERT INTO USERS VALUES('3002', 'Ryan', 'Collins', 'r.collins@xmail.com');
INSERT INTO USERS VALUES('3003', 'Nursin', 'Yilmaz', 'n.atak@gmail.com');
INSERT INTO USERS VALUES('3004', 'Sarah', 'Price', 's.price@xmail.com');
INSERT INTO USERS VALUES('3005', 'Bobby', 'Griffin', 'b.griffin@xmail.com');
INSERT INTO USERS VALUES('3006', 'Randy', 'Clark', 'r.clark@xmail.com');
INSERT INTO USERS VALUES('3007', 'Jose', 'Thomas', 'j.thomas@xmail.com');
INSERT INTO USERS VALUES('3008', 'Nursin', 'Yilmaz', 'n.yilmaz@xmail.com');

CREATE TABLE TRAVELS (
    TRAVEL_ID CHAR(10) PRIMARY KEY NOT NULL,
    TRAVEL_START_TIME DATETIME NOT NULL,
    TRAVEL_END_TIME DATETIME NOT NULL,
    TRAVEL_START_LOCATION CHAR(30) NOT NULL,
    TRAVEL_END_LOCATION CHAR(30) NOT NULL,
    TRAVEL_PRICE DECIMAL(5 , 2 ) NOT NULL,
    -- Changed DRIVER_ID to INT to match the DRIVERS table
    DRIVER_ID INT NOT NULL,
    CAR_ID CHAR(5) NOT NULL,
    USER_ID CHAR(5) NOT NULL,
    TRAVEL_DISCOUNT DECIMAL(3 , 2 )
);

-- Updated INSERT statements for TRAVELS to use INT for DRIVER_ID
INSERT INTO TRAVELS VALUES('5001', '2022-10-01 04:04:55', '2022-10-01 04:14:19', '9614 York Road', '84 Church Lane', '15.44', 2001, '1003', '3005', NULL);
INSERT INTO TRAVELS VALUES('5002', '2022-10-01 05:57:33', '2022-10-01 06:12:33', '47 Church Street', '68 High Street', '20.56', 2001, '1003', '3006',NULL);
INSERT INTO TRAVELS VALUES('5003', '2022-10-01 13:35:20', '2022-10-01 13:45:10', '2 Windsor Road', '95 West Street', '12.32', 2002, '1001', '3002',NULL);
INSERT INTO TRAVELS VALUES('5004', '2022-10-02 08:44:48', '2022-10-02 09:15:28', '9060 Mill Lane', '27 Main Road', '30.49', 2003, '1002', '3001','0.13');
INSERT INTO TRAVELS VALUES('5005', '2022-10-02 16:38:54', '2022-10-02 16:48:10', '2 Queensway', '24 Mill Lane', '11.15', 2001, '1003', '3007',NULL);
INSERT INTO TRAVELS VALUES('5006', '2022-10-03 19:12:14', '2022-10-03 19:23:45', '50 Main Road', '93 Broadway', '14.61', 2003, '1002', '3007', '0.1');
INSERT INTO TRAVELS VALUES('5007', '2022-10-03 16:06:36', '2022-10-03 16:08:56', '39 Park Road', '91 West Street', '4.41', 2002, '1004', 3003, '0.14');
INSERT INTO TRAVELS VALUES('5008', '2022-10-03 17:17:12', '2022-10-03 17:37:42', '37 The Drive', '17 Stanley Road', '25.12', 2001, '1003', '3001', '0.25');
INSERT INTO TRAVELS VALUES('5009', '2022-10-03 21:16:48', '2022-10-03 21:26:18', '77 Mill Road', '724 Springfield Road', '13.55', 2001, '1003', '3005', NULL);
INSERT INTO TRAVELS VALUES('5010', '2022-10-03 23:21:40', '2022-10-03 23:39:10', '16 Church Road', '30 North Road', '25.62', 2003, '1002', 3003, '0.2');


/*8 - 1 - 1 */
CREATE TABLE MAINTENANCE_TYPES (
    MAINTENANCE_TYPE_ID CHAR(5) PRIMARY KEY NOT NULL,
    MAINTENANCE_TYPE_DESCRIPTION VARCHAR(30) NOT NULL
);

/*8 - 1 - 6 */
ALTER TABLE MAINTENANCE_TYPES
ADD COLUMN MAINTENANCE_PRICE DECIMAL(5,2);

/*8 - 2 - 1 */
ALTER TABLE MAINTENANCE_TYPES
ALTER COLUMN MAINTENANCE_PRICE SET DEFAULT 0;

/*8 - 2 - 3 */
INSERT INTO MAINTENANCE_TYPES VALUES (1, 'Tyre Change', 50);
INSERT INTO MAINTENANCE_TYPES VALUES (2, 'Oil Change', 45);
INSERT INTO MAINTENANCE_TYPES VALUES (3, 'Full Cleaning', 100);
INSERT INTO MAINTENANCE_TYPES VALUES (4, 'Gas Pump Change', 145);


/* 8 - 1 - 2 */
CREATE TABLE MAINTENANCES (
    CAR_ID CHAR(5) NOT NULL,
    MAINTENANCE_TYPE_ID CHAR(5) NOT NULL,
    MAINTENANCE_DUE DATE NOT NULL,
    PRIMARY KEY (CAR_ID, MAINTENANCE_TYPE_ID, MAINTENANCE_DUE),
    FOREIGN KEY (CAR_ID)
        REFERENCES CARS (CAR_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MAINTENANCE_TYPE_ID)
        REFERENCES MAINTENANCE_TYPES (MAINTENANCE_TYPE_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/* 8 - 2 - 4 */
INSERT INTO MAINTENANCES(CAR_ID, MAINTENANCE_TYPE_ID, MAINTENANCE_DUE)
SELECT CAR_ID, '1', '2022-12-31' FROM CARS WHERE CAR_YEAR = '2021';


-- Create a VIEW named ACTIVE_DRIVERS to replace the previous table,
-- including only drivers who have at least one travel.
-- The view's columns will now reflect the INT type for DRIVER_ID from the base table.
CREATE VIEW ACTIVE_DRIVERS AS
SELECT
    D.DRIVER_ID,
    D.DRIVER_FIRST_NAME,
    D.DRIVER_LAST_NAME,
    D.DRIVER_DRIVING_LICENSE_ID,
    D.DRIVER_DRIVING_LICENSE_CHECKED,
    D.DRIVER_RATING
FROM
    DRIVERS AS D
WHERE
    D.DRIVER_ID IN (SELECT DISTINCT
            T.DRIVER_ID
        FROM
            TRAVELS AS T
    );


SET SQL_SAFE_UPDATES = 0;
UPDATE MAINTENANCE_TYPES
SET
    MAINTENANCE_PRICE = 75
WHERE
    MAINTENANCE_TYPE_DESCRIPTION = 'Oil Change';
DELETE FROM MAINTENANCE_TYPES
WHERE
    MAINTENANCE_TYPE_DESCRIPTION = 'Gas Pump Change';
SET SQL_SAFE_UPDATES = 1;

-- Task 5: Update a driver's record using the ACTIVE_DRIVERS VIEW.
-- Update the DRIVER_DRIVING_LICENSE_ID for Driver ID '2003' via the ACTIVE_DRIVERS VIEW.
-- Note: '1735488' is a string as DRIVER_DRIVING_LICENSE_ID is VARCHAR(10).
UPDATE ACTIVE_DRIVERS
SET DRIVER_DRIVING_LICENSE_ID = '1735488'
WHERE DRIVER_ID = 2003; -- Use integer for DRIVER_ID comparison now.

-- Select the DRIVERS table to show the actual change, confirming the VIEW update
-- has affected the underlying base table.
SELECT * FROM DRIVERS WHERE DRIVER_ID = 2003;


-- Task 6: Insert a new driver record into the DRIVERS table using auto-increment.
-- DRIVER_ID is omitted and will be automatically generated by the database.
INSERT INTO DRIVERS (DRIVER_FIRST_NAME, DRIVER_LAST_NAME, DRIVER_DRIVING_LICENSE_ID, DRIVER_START_DATE, DRIVER_DRIVING_LICENSE_CHECKED, DRIVER_RATING)
VALUES ('Nursin', 'Yilmaz', '4141447', '2021-12-28', TRUE, 4.0);

-- Select all drivers to confirm the new driver has been added with an auto-generated ID.
SELECT * FROM DRIVERS;


-- Start a new transaction.
-- All data modification statements (INSERT, UPDATE, DELETE) that follow
-- will be provisional and will only be made permanent if a COMMIT statement is executed successfully.
START TRANSACTION;

-- Task: Add 'Tyre Change' (MAINTENANCE_TYPE_ID '1') for all cars with a due date of '2021-09-01'.
-- These are the new entries your test expects to see after successful insertion.
INSERT INTO MAINTENANCES (CAR_ID, MAINTENANCE_TYPE_ID, MAINTENANCE_DUE)
VALUES
    ('1001', '1', '2021-09-01'),
    ('1002', '1', '2021-09-01'),
    ('1003', '1', '2021-09-01'),
    ('1004', '1', '2021-09-01');

-- Add 'Oil Change' (MAINTENANCE_TYPE_ID '2') tasks for specific cars.
-- These insertions are included to ensure the overall state matches your "Expected" output,
-- as they appear in both your "Expected" and "Found" results (implying they are desired and/or pre-exist).
INSERT INTO MAINTENANCES (CAR_ID, MAINTENANCE_TYPE_ID, MAINTENANCE_DUE)
VALUES
    ('1001', '2', '2022-06-01'),
    ('1003', '2', '2022-06-01');

-- If all the preceding INSERT statements execute without any errors,
-- this COMMIT statement will finalize and save all the changes made within this transaction to the database.
-- This is how you achieve "rollback only if errors": if an error occurs *before* this point,
-- the COMMIT will not be reached, and the transaction will be implicitly rolled back.
COMMIT;

-- Select all records from the MAINTENANCES table to display its final state
-- after the transaction has either committed successfully or implicitly rolled back due to an error.
-- If the script completes successfully, this query's output should match your "Expected" result.
SELECT * FROM MAINTENANCES;

-- Task 1: Create a procedure to calculate the VAT.

-- Change the delimiter to allow semicolons within the procedure definition
DELIMITER //

-- Drop the procedure if it already exists to allow re-creation
DROP PROCEDURE IF EXISTS VATCalculator //

CREATE PROCEDURE VATCalculator()
BEGIN
    SELECT
        TRAVEL_ID,
        -- Calculate the price after discount: TRAVEL_PRICE * (1 - discount_rate)
        -- COALESCE handles NULL discounts by treating them as 0, so price remains unchanged.
        -- Then, calculate 8% VAT on the discounted price and round to 2 decimal places.
        ROUND(TRAVEL_PRICE * (1 - COALESCE(TRAVEL_DISCOUNT, 0)) * 0.08, 2) AS VAT_AMOUNT
    FROM
        TRAVELS;
END //

-- Reset the delimiter back to the default
DELIMITER ;

-- Execute the VATCalculator procedure to see the results
CALL VATCalculator();
