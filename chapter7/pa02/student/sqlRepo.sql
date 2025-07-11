-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
D.DRIVER_FIRST_NAME, 
D.DRIVER_LAST_NAME, 
D.DRIVER_DRIVING_LICENSE_ID, 
T.TRAVEL_START_TIME, 
T.TRAVEL_END_TIME 
FROM TRAVELS T 
LEFT JOIN DRIVERS D ON T.DRIVER_ID = D.DRIVER_ID;-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
D.DRIVER_FIRST_NAME, 
D.DRIVER_LAST_NAME, 
D.DRIVER_DRIVING_LICENSE_ID, 
T.TRAVEL_START_TIME, 
T.TRAVEL_END_TIME
FROM DRIVERS D
LEFT JOIN TRAVELS T ON T.DRIVER_ID = D.DRIVER_ID
ORDER BY D.DRIVER_LAST_NAME;

SELECT
 U.USER_FIRST_NAME, 
 U.USER_LAST_NAME, 
 T.TRAVEL_START_TIME, 
 T.TRAVEL_END_TIME
FROM USERS U 
JOIN TRAVELS T 
USING (USER_ID);

SELECT DISTINCT
 T.TRAVEL_ID, 
 D.DRIVER_FIRST_NAME, 
 D.DRIVER_LAST_NAME, 
 T.TRAVEL_PRICE,
 T.TRAVEL_DISCOUNT
FROM TRAVELS T 
INNER JOIN DRIVERS D 
ON T.DRIVER_ID = D.DRIVER_ID;