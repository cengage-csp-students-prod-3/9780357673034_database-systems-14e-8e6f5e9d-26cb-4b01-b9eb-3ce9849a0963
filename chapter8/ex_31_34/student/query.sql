-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
DELIMITER //

CREATE TRIGGER trg_line_total
BEFORE INSERT ON LINE
FOR EACH ROW
BEGIN
    -- Calculate LINE_TOTAL as the product of LINE_UNITS and LINE_PRICE
    SET NEW.LINE_TOTAL = NEW.LINE_UNITS * NEW.LINE_PRICE;
END;
//

DELIMITER ;
