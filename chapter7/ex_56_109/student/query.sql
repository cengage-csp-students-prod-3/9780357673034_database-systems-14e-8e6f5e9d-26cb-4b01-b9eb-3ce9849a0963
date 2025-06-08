SELECT
    PAT_ID,
    PAT_FNAME,
    PAT_LNAME,
    PAT_TYPE
FROM
    PATRON
WHERE
    PAT_LNAME LIKE 'C%' -- This will match last names starting with 'C' (case-sensitive, depends on DB collation)
    -- OR, for guaranteed case-insensitivity across databases:
    -- LOWER(PAT_LNAME) LIKE 'c%'
ORDER BY
    PAT_ID;