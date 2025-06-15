DELIMITER //

CREATE PROCEDURE prc_inv_amounts (
    IN p_inv_number INT
)
BEGIN
    DECLARE v_inv_subtotal DECIMAL(10,2);
    DECLARE v_inv_tax DECIMAL(10,2);
    DECLARE v_inv_total DECIMAL(10,2);
    DECLARE v_tax_rate DECIMAL(3,2) DEFAULT 0.08; -- 8 percent tax rate

    -- Calculate INV_SUBTOTAL by summing LINE_TOTAL for the given invoice
    SELECT SUM(LINE_TOTAL)
    INTO v_inv_subtotal
    FROM LINE
    WHERE INV_NUMBER = p_inv_number;

    -- If no lines exist for the invoice, set subtotal to 0
    IF v_inv_subtotal IS NULL THEN
        SET v_inv_subtotal = 0;
    END IF;

    -- Calculate INV_TAX
    SET v_inv_tax = v_inv_subtotal * v_tax_rate;

    -- Calculate INV_TOTAL
    SET v_inv_total = v_inv_subtotal + v_inv_tax;

    -- Update the INVOICE table with the calculated values
    UPDATE INVOICE
    SET
        INV_SUBTOTAL = v_inv_subtotal,
        INV_TAX = v_inv_tax,
        INV_TOTAL = v_inv_total
    WHERE
        INV_NUMBER = p_inv_number;

END;
//

DELIMITER ;
