-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
D.DRIVER_FIRST_NAME, 
D.DRIVER_LAST_NAME, 
D.DRIVER_DRIVING_LICENSE_ID, 
DATE_FORMAT(T.TRAVEL_START_TIME, "%y-%m-%d"), 
DATE_FORMAT(T.TRAVEL_END_TIME, "%y-%m-%d")
FROM TRAVELS T 
LEFT JOIN DRIVERS D ON T.DRIVER_ID = D.DRIVER_ID;