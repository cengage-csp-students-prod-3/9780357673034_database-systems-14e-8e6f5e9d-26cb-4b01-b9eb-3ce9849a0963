SELECT
    A.AU_ID,       -- Author ID
    A.AU_FNAME,    -- Author First Name
    A.AU_LNAME     -- Author Last Name
FROM
    AUTHOR AS A
WHERE NOT EXISTS (
    SELECT 1
    FROM
        WRITES AS W
    JOIN
        BOOK AS B ON W.BOOK_NUM = B.BOOK_NUM
    WHERE
        W.AU_ID = A.AU_ID          -- Link to the outer query's author
        AND B.BOOK_SUBJECT = 'Programming' -- Filter for 'Programming' subject
)
ORDER BY
    A.AU_LNAME ASC; -- Sort by author last name in ascending order