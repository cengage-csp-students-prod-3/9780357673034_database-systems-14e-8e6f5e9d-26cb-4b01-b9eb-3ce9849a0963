SELECT
    BOOK_NUM,
    CONCAT(BOOK_TITLE, ' (', BOOK_YEAR, ')') AS `BOOK`, -- Concatenates title and year in desired format
    BOOK_SUBJECT
FROM
    BOOK
ORDER BY
    BOOK_NUM ASC; 