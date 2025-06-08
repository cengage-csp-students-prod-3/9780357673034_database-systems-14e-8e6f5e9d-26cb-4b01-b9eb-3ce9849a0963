WITH SubjectAvgCost AS (
    -- Step 1: Calculate the average cost for each distinct subject
    SELECT
        BOOK_SUBJECT,
        AVG(BOOK_COST) AS AvgCost
    FROM
        BOOK
    GROUP BY
        BOOK_SUBJECT
)
-- Step 2: Find the minimum and maximum of these calculated subject averages
SELECT
    ROUND(MIN(AvgCost), 2) AS `LOWEST AVG COST`,
    ROUND(MAX(AvgCost), 2) AS `HIGHEST AVG COST`
FROM
    SubjectAvgCost;