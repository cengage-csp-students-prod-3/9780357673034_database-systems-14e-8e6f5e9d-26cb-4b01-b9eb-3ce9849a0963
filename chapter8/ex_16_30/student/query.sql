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