SELECT
    ROUND(AVG(DATEDIFF( CHECK_IN_DATE, CHECK_OUT_DATE)),2) AS `AVERAGE DAYS KEPT` -- Calculates the average of 'Days Kept'
FROM
    CHECKOUT
WHERE
    CHECK_IN_DATE IS NOT NULL; -- Includes only checkouts that have been returned
    