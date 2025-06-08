SELECT
    P.PAT_ID,      -- Patron ID
    P.PAT_FNAME,   -- Patron First Name
    P.PAT_LNAME    -- Patron Last Name
FROM
    PATRON AS P
LEFT JOIN
    CHECKOUT AS C ON P.PAT_ID = C.PAT_ID -- Join PATRON with CHECKOUT
WHERE
    C.PAT_ID IS NULL -- Filter for patrons who have no matching records in the CHECKOUT table
ORDER BY
    P.PAT_LNAME ASC, -- Sort by patron last name in ascending order
    P.PAT_FNAME ASC; -- Then by patron first name in ascending order