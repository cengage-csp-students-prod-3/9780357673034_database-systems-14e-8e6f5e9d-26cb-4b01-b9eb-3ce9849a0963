-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT 
CUS_CODE,INV_NUMBER,INV_DATE,P_DESCRIPT,LINE_UNITS,LINE_PRICE
FROM
CUSTOMER C
JOIN
INVOICE I
ON
C.CUS_CODE = I.CUS_CODE
JOIN
Ch07_SaleCoLINE L
ON
L.INV_NUMBER = L.INV_NUMBER
JOIN
PRODUCT P
ON
L.P_CODE = P.P_CODE

