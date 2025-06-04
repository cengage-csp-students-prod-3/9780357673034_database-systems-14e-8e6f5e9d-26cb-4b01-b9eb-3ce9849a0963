-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
DRIVER_ID, DRIVER_FIRST_NAME, DRIVER_LAST_NAME
FROM
DRIVERS
WHERE
DRIVERS.DRIVER_ID = 
(SELECT 
D.DRIVER_ID
FROM
DRIVERS D
WHERE 
D.DRIVER_ID != ALL (SELECT DISTINCT T.DRIVER_ID FROM TRAVELS T)
);

