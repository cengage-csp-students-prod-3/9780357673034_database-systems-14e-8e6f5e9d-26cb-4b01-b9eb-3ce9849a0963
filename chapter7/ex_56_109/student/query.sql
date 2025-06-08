SELECT
    A.AU_ID,          -- Author ID
    A.AU_LNAME,       -- Author Last Name
    B.BOOK_TITLE,     -- Book Title
    C.CHECK_OUT_DATE, -- Checkout Date
    P.PAT_LNAME       -- Patron Last Name
FROM
    AUTHOR AS A
JOIN
    WRITES AS W ON A.AU_ID = W.AU_ID       -- Link authors to books they wrote
JOIN
    BOOK AS B ON W.BOOK_NUM = B.BOOK_NUM   -- Link written books to their details
JOIN
    CHECKOUT AS C ON B.BOOK_NUM = C.BOOK_NUM -- Link books to their checkouts
JOIN
    PATRON AS P ON C.PAT_ID = P.PAT_ID     -- Link checkouts to patron details
WHERE
    A.AU_LNAME = 'Bruer' AND              -- Filter for authors with last name 'Bruer'
    P.PAT_LNAME = 'Miles'                 -- Filter for patrons with last name 'Miles'
ORDER BY
    C.CHECK_OUT_DATE ASC; -- Sort results by checkout date in ascending order
    