SELECT
    W.AU_ID,        -- Author ID from the WRITES table
    B.BOOK_NUM,     -- Book number from the BOOK table
    B.BOOK_TITLE,   -- Book title from the BOOK table
    B.BOOK_SUBJECT  -- Book subject from the BOOK table
FROM
    BOOK AS B
JOIN
    WRITES AS W ON B.BOOK_NUM = W.BOOK_NUM -- Join BOOK and WRITES tables on BOOK_NUM
ORDER BY
    B.BOOK_NUM ASC, -- Sort by book number in ascending order
    W.AU_ID ASC;    -- Then by author ID in ascending order