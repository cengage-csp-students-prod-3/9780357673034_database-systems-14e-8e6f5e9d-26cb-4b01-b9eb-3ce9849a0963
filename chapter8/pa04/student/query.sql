USE InstantRide;

-- Drop the procedure if it already exists to allow for recreation
DROP PROCEDURE IF EXISTS VATCalculator;

-- Change the delimiter to allow for multiple statements within the procedure definition
DELIMITER $$

CREATE PROCEDURE VATCalculator()
BEGIN
    -- Select the travel ID and calculate the VAT amount
    SELECT
        T.TRAVEL_ID,
        -- Calculate the effective price after applying the discount.
        -- COALESCE handles NULL discounts by treating them as 0.
        ROUND(
            (T.TRAVEL_PRICE * (1 - COALESCE(T.TRAVEL_DISCOUNT, 0))) * 0.08,
            2
        ) AS Calculated_VAT_Amount
    FROM
        TRAVELS AS T;
END$$

-- Reset the delimiter back to the standard semicolon
DELIMITER ;

-- Execute the VATCalculator procedure to get the results
CALL VATCalculator();