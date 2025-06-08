SELECT
    BOOK_SUBJECT,
    COUNT(*) AS `BOOKS IN SUBJECT` -- Changed alias to remove spaces
FROM
    BOOK
GROUP BY
    BOOK_SUBJECT
ORDER BY
    `BOOKS IN SUBJECT` DESC,    -- Reference the alias directly (unquoted)
    BOOK_SUBJECT ASC;