-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
TRAVELS.CAR_ID, (ROUND(TRAVEL_PRICE * TRAVEL_DISCOUNT,2)) AS DISCOUNT_AMOUNT
FROM
TRAVELS;

