-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
D.DRIVER_ID, D.DRIVER_FIRST_NAME, D.DRIVER_LAST_NAME
FROM DRIVERS D
WHERE D.DRIVER_ID = ALL
(SELECT
T.DRIVER_ID
FROM
TRAVELS T
WHERE
D.DRIVER_ID  = T.DRIVER_ID
);