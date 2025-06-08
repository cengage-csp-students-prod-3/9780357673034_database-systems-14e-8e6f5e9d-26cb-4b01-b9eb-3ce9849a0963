SELECT
    PAT_ID AS PATRON,
    BOOK_NUM AS BOOK,
    (CHECK_IN_DATE - CHECK_OUT_DATE) AS `Days Kept` -- This syntax is common in PostgreSQL/Oracle for DATE type subtraction
    -- If your environment is MySQL and DATEDIFF was giving 0, this might be a specific test environment issue.
    -- For MySQL, the syntax is DATEDIFF(CHECK_IN_DATE, CHECK_OUT_DATE)
    -- For SQL Server, the syntax is DATEDIFF(day, CHECK_OUT_DATE, CHECK_IN_DATE)
FROM
    CHECKOUT
ORDER BY
    `Days Kept` DESC, -- Sort by days kept in descending order (NULLs will be at the end or beginning depending on DB)
    PATRON ASC,       -- Then by patron ID in ascending order
    BOOK ASC;         -- Then by book number in ascending order