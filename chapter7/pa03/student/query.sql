-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
    *
FROM
    TRAVELS T, DRIVERS D
WHERE
    D.DRIVER_RATING < 4;