SELECT
    C.CUST_CODE,
    C.CUST_FNAME,
    C.CUST_LNAME,
    -- Select individual address components as expected
    C.CUST_STREET,
    C.CUST_CITY,
    C.CUST_STATE,
    C.CUST_ZIP,
    CLP.INV_DATE,
    -- Display invoice total as 0 if no purchase was made, and alias it as 'LARGEST INVOICE'
    COALESCE(CLP.INV_TOTAL, 0) AS "LARGEST INVOICE"
FROM
    LGCUSTOMER C
LEFT JOIN (
    -- Subquery to find the largest purchase for each customer
    SELECT
        INV_NUM,
        CUST_CODE,
        INV_DATE,
        INV_TOTAL,
        -- Assign a rank to each invoice based on total and date, for each customer
        ROW_NUMBER() OVER (PARTITION BY CUST_CODE ORDER BY INV_TOTAL DESC, INV_DATE DESC) as rn
    FROM
        LGINVOICE
) CLP ON C.CUST_CODE = CLP.CUST_CODE AND CLP.rn = 1 -- Join only the largest purchase for each customer
WHERE
    C.CUST_STATE = 'AL' -- Filter for customers located in Alabama
ORDER BY
    C.CUST_LNAME, -- Sort by customer last name
    C.CUST_FNAME; -- Then by customer first name