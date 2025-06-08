SELECT
    PAT_ID,
    CONCAT(PAT_FNAME, ' ', PAT_LNAME) AS `NAME`, -- Concatenates first and last names
    PAT_TYPE
FROM
    PATRON
ORDER BY
    LOWER(PAT_TYPE) ASC, -- Sorts by patron type case-insensitively
    LOWER(PAT_LNAME) ASC, -- Then by last name case-insensitively
    LOWER(PAT_FNAME) ASC; -- Then by first name case-insensitively