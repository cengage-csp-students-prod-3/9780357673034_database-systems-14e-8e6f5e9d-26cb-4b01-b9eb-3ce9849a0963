USE Ch07_SaleCo;

SELECT
    COUNT(DISTINCT I.INV_NUMBER) AS "Total Invoices",
    ROUND(SUM(L.LINE_UNITS * L.LINE_PRICE)) AS "Total Sales",
    MIN(CustomerPurchases.Total_Purchases) AS "Minimum Customer Purchases",
    MAX(CustomerPurchases.Total_Purchases) AS "Largest Customer Purchases",
    AVG(CustomerPurchases.Total_Purchases) AS "Average Customer Purchases"
FROM
    INVOICE AS I
JOIN
    Ch07_SaleCoLINE AS L ON I.INV_NUMBER = L.INV_NUMBER
JOIN
    (SELECT
        C.CUS_CODE,
        ROUND(SUM(L2.LINE_UNITS * L2.LINE_PRICE),2) AS Total_Purchases
    FROM
        CUSTOMER AS C
    JOIN
        INVOICE AS I2 ON C.CUS_CODE = I2.CUS_CODE
    JOIN
        Ch07_SaleCoLINE AS L2 ON I2.INV_NUMBER = L2.INV_NUMBER
    GROUP BY
        C.CUS_CODE
    ) AS CustomerPurchases ON I.CUS_CODE = CustomerPurchases.CUS_CODE;