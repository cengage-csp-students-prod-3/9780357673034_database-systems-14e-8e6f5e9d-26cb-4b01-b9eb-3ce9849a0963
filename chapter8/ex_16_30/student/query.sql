DROP PROCEDURE IF EXISTS prc_invoice_add;

-- Create a procedure named prc_invoice_add to add a new invoice record
DELIMITER $$
CREATE PROCEDURE prc_invoice_add(
    IN p_cust_num INT,
    IN p_inv_date DATE,
    IN p_inv_amount DECIMAL(10, 2)
)
BEGIN
    -- Inserts a new invoice record into the INVOICE table.
    -- INV_NUM is auto-incremented.
    INSERT INTO INVOICE (CUST_NUM, INV_DATE, INV_AMOUNT)
    VALUES (p_cust_num, p_inv_date, p_inv_amount);
END$$
DELIMITER ;

-- Test the new prc_invoice_add procedure by adding a new invoice record
-- This will automatically trigger trg_updatecustbalance and update customer 1000's balance
CALL prc_invoice_add(1000, '2022-04-30', 301.72);
