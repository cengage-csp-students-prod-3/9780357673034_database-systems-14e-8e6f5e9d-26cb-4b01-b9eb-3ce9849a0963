DELIMITER //

CREATE TRIGGER trg_line_prod
AFTER INSERT ON LINE
FOR EACH ROW
BEGIN
    -- Decrease the product's quantity on hand (P_QOH)
    -- by the number of units sold (LINE_UNITS) in the new line item.
    UPDATE PRODUCT
    SET P_QOH = P_QOH - NEW.LINE_UNITS
    WHERE P_CODE = NEW.P_CODE;
END;
//

DELIMITER ;
