USE Ch07_SaleCo;

WITH CustomerTotalSales AS (
    SELECT
        C.CUS_CODE,
        SUM(L.LINE_UNITS * L.LINE_PRICE) AS Total_Purchases
    FROM
        CUSTOMER AS C
    JOIN
        INVOICE AS I ON C.CUS_CODE = I.CUS_CODE
    JOIN
        Ch07_SaleCoLINE AS L ON I.INV_NUMBER = L.INV_NUMBER
    GROUP BY
        C.CUS_CODE
)
SELECT
    (SELECT COUNT(DISTINCT INV_NUMBER) FROM INVOICE) AS "Total Invoices", -- Counts all unique invoices
    (SELECT ROUND(SUM(LINE_UNITS * LINE_PRICE)) FROM Ch07_SaleCoLINE) AS "Total Sales", -- Sums all line item totals
    ROUND(MIN(CTS.Total_Purchases),2) AS "Minimum Customer Purchases",
    ROUND(MAX(CTS.Total_Purchases),2) AS "Largest Customer Purchases",
    ROUND(AVG(CTS.Total_Purchases), 2) AS "Average Customer Purchases" -- Correct AVG of per-customer totals
FROM
    CustomerTotalSales AS CTS;