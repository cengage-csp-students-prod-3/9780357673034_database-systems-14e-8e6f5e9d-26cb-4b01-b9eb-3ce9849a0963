-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
DRIVER_ID, COUNT(CAR_ID) AS CARS
FROM
TRAVELS
GROUP BY DRIVER_ID;