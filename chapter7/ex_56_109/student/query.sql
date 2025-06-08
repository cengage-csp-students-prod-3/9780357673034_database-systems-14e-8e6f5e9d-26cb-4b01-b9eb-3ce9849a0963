SELECT
    B.BOOK_NUM,
    B.BOOK_TITLE,
    COUNT(C.CHECK_NUM) AS `TIMES CHECKED OUT` -- Count the number of actual checkouts for each book
FROM
    BOOK AS B
JOIN
    CHECKOUT AS C ON B.BOOK_NUM = C.BOOK_NUM -- Use INNER JOIN to only include books that have been checked out
GROUP BY
    B.BOOK_NUM,
    B.BOOK_TITLE
HAVING
    COUNT(C.CHECK_NUM) > 5 -- Filter for books checked out more than five times
ORDER BY
    `TIMES CHECKED OUT` DESC, -- Sort by the number of times checked out in descending order
    B.BOOK_TITLE ASC;     -- Then by book title in ascending order