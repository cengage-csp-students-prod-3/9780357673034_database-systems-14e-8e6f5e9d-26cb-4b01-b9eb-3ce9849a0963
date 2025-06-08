SELECT
    PAT_ID AS PATRON,
    BOOK_NUM AS BOOK,
    -- Calculate "Days Kept" as the difference between check-in and check-out dates.
    -- If CHECK_IN_DATE is NULL (book not returned), DaysKept will also be NULL.
    -- The specific function for date difference may vary slightly by database system:
    -- SQL Server: DATEDIFF(day, CHECK_OUT_DATE, CHECK_IN_DATE)
    -- MySQL: DATEDIFF(CHECK_IN_DATE, CHECK_OUT_DATE)
    -- PostgreSQL/Oracle: CHECK_IN_DATE - CHECK_OUT_DATE (results in days for DATE types)
       DATEDIFF(CHECK_IN_DATE, CHECK_IN_DATE) AS `DAYS KEPT`
FROM
    CHECKOUT
ORDER BY
    `DAYS KEPT` DESC, -- Sort by days kept in descending order
    PATRON ASC,    -- Then by patron ID in ascending order
     BOOK ASC;  -- Then by book number in ascending order