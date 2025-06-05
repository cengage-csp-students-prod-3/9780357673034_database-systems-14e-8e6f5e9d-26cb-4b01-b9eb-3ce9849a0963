-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.()
SELECT
*
FROM
TRAVELS T
WHERE
T.TRAVEL_DISCOUNT > (SELECT AVG(T.TRAVEL_DISCOUNT) FROM TRAVELS T WHERE T.TRAVEL_DISCOUNT IS NOT NULL);