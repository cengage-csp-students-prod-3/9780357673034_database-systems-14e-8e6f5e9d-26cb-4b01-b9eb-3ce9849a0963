-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.()
SELECT
CAR_ID, ROUND(AVG(ROUND(TRAVEL_PRICE * TRAVEL_DISCOUNT,2)),2) AS DISCOUNT_AMOUNT
FROM
TRAVELS 
WHERE TRAVEL_DISCOUNT > 0
GROUP BY CAR_ID;

