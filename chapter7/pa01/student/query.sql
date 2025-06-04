-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
*
FROM
DRIVERS;

SELECT 
DATE_FORMAT(DRIVER_START_DATE, "%Y-%m-%d") AS DRIVER_START_DATE
FROM 
DRIVERS;

SELECT
 DRIVER_ID, DRIVER_RATING
 FROM
 DRIVERS
 ORDER BY DRIVER_RATING DESC;

