-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
*
FROM TRAVELS T
WHERE T.DRIVER_ID IN
(SELECT
D.DRIVER_ID
FROM
DRIVERS D
WHERE
D.DRIVER_RATING < 4
);