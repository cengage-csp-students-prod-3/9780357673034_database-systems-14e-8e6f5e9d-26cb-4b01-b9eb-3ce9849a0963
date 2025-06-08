SELECT
    A.AU_ID,
    COUNT(W.BOOK_NUM) AS  `BOOKS WRITTEN` -- Count the books associated with each author
FROM
    AUTHOR AS A
JOIN
    WRITES AS W ON A.AU_ID = W.AU_ID -- Join AUTHOR with WRITES to link authors to books
GROUP BY
    A.AU_ID
ORDER BY
    `BOOKS WRITTEN` DESC
