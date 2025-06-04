-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
D.DRIVER_ID, D.DRIVER_FIRST_NAME, D.DRIVER_LAST_NAME
FROM DRIVERS D
WHERE DRIVER IN
(SELECT
D.DRIVER_ID
FROM
DRIVERS D
WHERE
D.DRIVER_RATING < 4
);