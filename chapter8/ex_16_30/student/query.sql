-- Create the trigger named trg_updatecustbalance
DELIMITER $$
CREATE TRIGGER trg_updatecustbalance
AFTER INSERT ON INVOICE
FOR EACH ROW
BEGIN
    -- IMPORTANT: Ensure 'Ch08_SimpleCo' database is selected (e.g., via 'USE Ch08_SimpleCo;' at the top)
    -- and that the CUSTOMER and INVOICE tables exist in the selected database.
    -- This trigger updates the CUST_BALANCE in the CUSTOMER table.
    -- It adds the new invoice's INV_AMOUNT to the customer's balance.
    UPDATE CUSTOMER
    SET CUST_BALANCE = CUST_BALANCE + NEW.INV_AMOUNT
    WHERE CUST_NUM = NEW.CUST_NUM;
END$$
DELIMITER ;