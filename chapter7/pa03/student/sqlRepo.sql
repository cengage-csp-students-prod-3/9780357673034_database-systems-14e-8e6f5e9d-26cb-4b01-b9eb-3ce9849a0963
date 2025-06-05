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

SELECT
CAR_ID, ROUND(AVG(ROUND(TRAVEL_PRICE * TRAVEL_DISCOUNT,2)),2) AS DISCOUNT_AMOUNT
FROM
TRAVELS 
WHERE TRAVEL_DISCOUNT > 0
GROUP BY CAR_ID;

SELECT
*
FROM
TRAVELS T
WHERE
T.TRAVEL_DISCOUNT > (SELECT AVG(T.TRAVEL_DISCOUNT) FROM TRAVELS T WHERE T.TRAVEL_DISCOUNT IS NOT NULL);

SELECT
T.CAR_ID, COUNT(T.CAR_ID) AS Usages 
FROM TRAVELS T
GROUP BY T.CAR_ID;

SELECT T.CAR_ID, AVG(TIMEDIFF(TRAVEL_END_TIME,TRAVEL_START_TIME))
FROM
TRAVELS T
GROUP BY T.CAR_ID;


SELECT AVG(TIMEDIFF(TRAVEL_END_TIME,TRAVEL_START_TIME))
FROM
TRAVELS T;

SELECT
    TUSAGES.CAR_ID,
    TUSAGES.Usages
FROM
    ( -- Level 1: Calculate the usage count for each CAR_ID
        SELECT
            CAR_ID,
            COUNT(TRAVEL_ID) AS Usages
        FROM
            TRAVELS
        GROUP BY
            CAR_ID
    ) AS TUSAGES
WHERE
    TUSAGES.Usages > ( -- Level 2: Calculate the average of all individual car usage counts
        SELECT
            AVG(CarUsageCounts.Usages)
        FROM
            ( -- This subquery gets the individual usage counts for averaging
                SELECT
                    COUNT(TRAVEL_ID) AS Usages
                FROM
                    TRAVELS
                GROUP BY
                    CAR_ID
            ) AS CarUsageCounts
    );