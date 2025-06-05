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