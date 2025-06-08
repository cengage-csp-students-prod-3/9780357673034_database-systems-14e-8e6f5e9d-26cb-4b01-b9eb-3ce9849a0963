SELECT
    A.AU_ID,        -- Author ID
    A.AU_FNAME,     -- Author First Name
    A.AU_LNAME,     -- Author Last Name
    B.BOOK_NUM,     -- Book Number
    B.BOOK_TITLE    -- Book Title
FROM
    AUTHOR AS A
JOIN
    WRITES AS W ON A.AU_ID = W.AU_ID -- Link Author to Written Books
JOIN
    BOOK AS B ON W.BOOK_NUM = B.BOOK_NUM -- Link Written Books to Book details
WHERE
    B.BOOK_SUBJECT = 'Cloud' -- Filter for books in the 'Cloud' subject
ORDER BY
    B.BOOK_TITLE ASC, -- Sort by book title in ascending order
    A.AU_LNAME ASC;   -- Then by author last name in ascending order