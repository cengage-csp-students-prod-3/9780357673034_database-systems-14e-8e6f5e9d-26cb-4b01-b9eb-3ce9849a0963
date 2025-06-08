SELECT
    B.BOOK_NUM,
    B.BOOK_TITLE,
    COUNT(C.CHECK_NUM) AS TIMES_CHECKED_OUT -- Counts non-null checkouts, resulting in 0 for books never checked out
FROM
    BOOK AS B
LEFT JOIN
    CHECKOUT AS C ON B.BOOK_NUM = C.BOOK_NUM -- Includes all books, even if they have no matching checkouts
GROUP BY
    B.BOOK_NUM,
    B.BOOK_TITLE
ORDER BY
    TIMES_CHECKED_OUT DESC, -- Sort by the number of times checked out in descending order
    B.BOOK_TITLE ASC;     -- Then by book title in ascending order