SELECT
    AU_ID,
    AU_FNAME,
    AU_LNAME,
    AU_BIRTHYEAR
FROM
    AUTHOR
ORDER BY
    AU_BIRTHYEAR DESC, -- Sorts by year of birth in descending order
    AU_LNAME ASC;      -- Then sorts by last name in ascending order for authors with the same birth year