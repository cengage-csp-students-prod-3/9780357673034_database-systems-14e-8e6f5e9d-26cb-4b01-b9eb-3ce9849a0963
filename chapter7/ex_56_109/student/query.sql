
SELECT
    BOOK_NUM,
    COUNT(*) AS `TIMES CHECKED OUT` -- Count the number of checkouts for each book
FROM
    CHECKOUT
GROUP BY
    BOOK_NUM
-- Implicitly, books that have never been checked out will not appear in the CHECKOUT table,
-- so they won't be included in the results of this query.
ORDER BY
    `TIMES CHECKED OUT` DESC, -- Sort by the number of times checked out in descending order
    BOOK_NUM DESC;        -- Then by book number in descending order