-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
CAR_ID, COUNT(CAR_ID)
FROM
TRAVELS
GROUP BY CAR_ID;