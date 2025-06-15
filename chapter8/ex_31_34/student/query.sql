DELIMITER //

CREATE PROCEDURE prc_cus_balance_update (
    IN p_inv_number INT
)
BEGIN
    DECLARE v_tot_inv DECIMAL(10,2);
    DECLARE v_cus_code INT;

    -- Retrieve the invoice total and customer code for the given invoice number
    SELECT INV_TOTAL, CUS_CODE
    INTO v_tot_inv, v_cus_code
    FROM INVOICE
    WHERE INV_NUMBER = p_inv_number;

    -- Check if an invoice was found
    IF v_cus_code IS NOT NULL THEN
        -- Update the customer's balance by adding the invoice total
        UPDATE CUSTOMER
        SET CUS_BALANCE = CUS_BALANCE + v_tot_inv
        WHERE CUS_CODE = v_cus_code;
    END IF;

END;
//

DELIMITER ;
