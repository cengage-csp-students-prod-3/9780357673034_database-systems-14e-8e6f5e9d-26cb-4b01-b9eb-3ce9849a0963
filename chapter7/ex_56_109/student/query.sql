SELECT
    B.BOOK_NUM,         -- Book Number
    B.BOOK_TITLE,       -- Book Title
    B.BOOK_SUBJECT,     -- Book Subject
    A.AU_LNAME,         -- Author Last Name
    COUNT(W.BOOK_NUM) OVER (PARTITION BY A.AU_ID) AS NumBooksByAuthor -- Counts all books written by each author
FROM
    BOOK AS B
JOIN
    WRITES AS W ON B.BOOK_NUM = W.BOOK_NUM -- Link books to the authors who wrote them
JOIN
    AUTHOR AS A ON W.AU_ID = A.AU_ID       -- Link authors to their details
WHERE
    B.BOOK_SUBJECT = 'Cloud' -- Filter for books specifically in the 'Cloud' subject
ORDER BY
    B.BOOK_TITLE ASC,   -- Sort by book title in ascending order
    A.AU_LNAME ASC;     -- Then by author last name in ascending order