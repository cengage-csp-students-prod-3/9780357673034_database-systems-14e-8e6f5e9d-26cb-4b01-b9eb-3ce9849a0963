SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS `PATRON NAME`, -- Concatenates first and last names
    PAT_TYPE
FROM
    PATRON
ORDER BY
    PAT_ID ASC;