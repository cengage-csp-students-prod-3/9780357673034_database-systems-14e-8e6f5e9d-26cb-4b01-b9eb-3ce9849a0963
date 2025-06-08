SELECT
    A.AU_LNAME,        -- Author's last name
    A.AU_FNAME,        -- Author's first name
    B.BOOK_TITLE,      -- Book title
    B.BOOK_COST AS `BOOK COST` -- Book cost, aliased as 'Replacement Cost'
FROM
    AUTHOR AS A
JOIN
    WRITES AS W ON A.AU_ID = W.AU_ID -- Link authors to books via the WRITES table
JOIN
    BOOK AS B ON W.BOOK_NUM = B.BOOK_NUM -- Link WRITES to BOOK table
ORDER BY
    B.BOOK_NUM ASC,    -- Sort by book number
    A.AU_ID ASC;       -- Then by author ID