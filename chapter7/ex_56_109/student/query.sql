SELECT
    B.BOOK_NUM,      -- Book Number
    B.BOOK_TITLE,    -- Book Title
    A.AU_LNAME,      -- Author Last Name
    A.AU_FNAME,      -- Author First Name
    P.PAT_ID,        -- Patron ID
    P.PAT_LNAME,     -- Patron Last Name
    P.PAT_TYPE       -- Patron Type
FROM
    BOOK AS B
JOIN
    PATRON AS P ON B.PAT_ID = P.PAT_ID -- Join BOOK with PATRON for current checkouts
JOIN
    WRITES AS W ON B.BOOK_NUM = W.BOOK_NUM -- Join BOOK with WRITES to link to authors
JOIN
    AUTHOR AS A ON W.AU_ID = A.AU_ID -- Join WRITES with AUTHOR for author details
WHERE
    B.PAT_ID IS NOT NULL -- Ensures only currently checked out books are included
ORDER BY
    B.BOOK_TITLE ASC;    -- Sort results by book title