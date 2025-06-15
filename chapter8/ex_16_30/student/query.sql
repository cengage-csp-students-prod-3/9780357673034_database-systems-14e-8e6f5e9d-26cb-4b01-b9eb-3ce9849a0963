-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.

DROP DATABASE IF EXISTS Ch08_SimpleCo;
CREATE DATABASE Ch08_SimpleCo;
USE Ch08_SimpleCo;

CREATE TABLE CUSTOMER(
 CUST_NUM INT AUTO_INCREMENT,
 CUST_LNAME VARCHAR(30),
 CUST_FNAME VARCHAR(30),
 CUST_BALANCE DECIMAL(10,2),
 PRIMARY KEY (CUST_NUM)   
);

INSERT INTO CUSTOMER (CUST_NUM,CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES (1000,'Smith', 'Jeanne', 1050.11),
(1001,'Ortega', 'Juan', 840.92);

SELECT *
FROM CUSTOMER; 

CREATE TABLE INVOICE(
    INV_NUM INT AUTO_INCREMENT,
    CUST_NUM INT,
    INV_DATE DATE,
    INV_AMOUNT DECIMAL(10,2),
    PRIMARY KEY (INV_NUM),
    FOREIGN KEY (CUST_NUM) REFERENCES CUSTOMER(CUST_NUM)
);

INSERT INTO INVOICE
VALUES
(8000, 1000, '2022/03/23', 235.89),
(8001, 1001, '2022/03/23', 312.82),
(8002, 1001, '2022/03/30', 528.10),
(8003, 1000, '2022/04/16', 194.78),
(8004, 1000, '2022/04/23', 619.44); 


ALTER TABLE CUSTOMER AUTO_INCREMENT=2000;
ALTER TABLE INVOICE AUTO_INCREMENT=9000;
 
INSERT INTO CUSTOMER(CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES ('Powers', 'Ruth', 500);  

ALTER TABLE CUSTOMER
ADD COLUMN CUST_DOB DATE;

UPDATE CUSTOMER
SET CUST_DOB = '1989/03/15'
WHERE CUST_NUM = 1000;

UPDATE CUSTOMER
SET CUST_DOB = '1988/12/22'
WHERE CUST_NUM = 1001;

DELIMITER //

-- CREATE TRIGGER trg_updatecustbalance
-- AFTER INSERT ON INVOICE
-- FOR EACH ROW

-- BEGIN
-- UPDATE CUSTOMER
-- SET CUST_BALANCE = CUST_BALANCE + NEW.INV_AMOUNT
-- WHERE CUST_NUM = NEW.CUST_NUM;
-- END//

-- CREATE PROCEDURE prc_cust_add(
--     IN p_cust_num INT,        -- Input parameter for CUST_NUM
--     IN p_cust_lname VARCHAR(30), -- Input parameter for CUST_LNAME
--     IN p_cust_fname VARCHAR(30), -- Input parameter for CUST_FNAME
--     IN p_cust_balance DECIMAL(10,2) -- Input parameter for CUST_BALANCE
-- )
-- BEGIN
--     -- Insert a new record into the CUSTOMER table using the provided parameters
--     INSERT INTO CUSTOMER (CUST_NUM, CUST_LNAME, CUST_FNAME, CUST_BALANCE)
--     VALUES (p_cust_num, p_cust_lname, p_cust_fname, p_cust_balance);
-- END //

DELIMITER ;
-- create trigger [trigger_name] 
-- [before | after]  
-- {insert | update | delete}  
-- on [table_name]  
-- FOR EACH ROW
-- BEGIN
-- END;

;
SELECT *
FROM CUSTOMER;