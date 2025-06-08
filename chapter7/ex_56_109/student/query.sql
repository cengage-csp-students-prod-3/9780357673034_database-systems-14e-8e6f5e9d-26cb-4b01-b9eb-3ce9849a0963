WITH AuthorTotalBooks AS (
    -- First, calculate the total number of books written by each author, regardless of subject
    SELECT
        A.AU_ID,
        COUNT(W.BOOK_NUM) AS TotalBooksByAuthor
    FROM
        AUTHOR AS A
    JOIN
        WRITES AS W ON A.AU_ID = W.AU_ID
    GROUP BY
        A.AU_ID
)
SELECT
    B.BOOK_NUM,         -- Book Number
    B.BOOK_TITLE,       -- Book Title
    B.BOOK_SUBJECT,     -- Book Subject
    A.AU_LNAME,         -- Author Last Name
    ATB.TotalBooksByAuthor AS `Num Books by Author` -- Use the pre-calculated total from the CTE
FROM
    BOOK AS B
JOIN
    WRITES AS W ON B.BOOK_NUM = W.BOOK_NUM -- Link books to the authors who wrote them
JOIN
    AUTHOR AS A ON W.AU_ID = A.AU_ID       -- Link authors to their details
JOIN
    AuthorTotalBooks AS ATB ON A.AU_ID = ATB.AU_ID -- Join with the CTE to get total book count
WHERE
    B.BOOK_SUBJECT = 'Cloud' -- Now, filter for books specifically in the 'Cloud' subject
ORDER BY
    B.BOOK_TITLE ASC,   -- Sort by book title in ascending order
    A.AU_LNAME ASC;     -- Then by author last name in ascending order