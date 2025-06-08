SELECT
    A.AU_ID,       -- Author ID
    A.AU_FNAME,    -- Author First Name
    A.AU_LNAME     -- Author Last Name
FROM
    AUTHOR AS A
LEFT JOIN
    -- Join with WRITES and then BOOK to find books written by the author, specifically those with 'Programming' subject
    WRITES AS W ON A.AU_ID = W.AU_ID
LEFT JOIN
    BOOK AS B ON W.BOOK_NUM = B.BOOK_NUM AND B.BOOK_SUBJECT = 'Programming'
WHERE
    -- Filter for authors who had no matching 'Programming' book
    B.BOOK_NUM IS NULL
ORDER BY
    A.AU_LNAME ASC; -- Sort by author last name in ascending order