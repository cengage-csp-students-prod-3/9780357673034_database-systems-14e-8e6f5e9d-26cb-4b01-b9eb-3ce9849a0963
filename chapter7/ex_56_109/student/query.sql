SELECT
    P.PAT_ID,        -- Patron ID
    B.BOOK_NUM,      -- Book Number
    P.PAT_FNAME,     -- Patron First Name
    P.PAT_LNAME,     -- Patron Last Name
    B.BOOK_TITLE     -- Book Title
FROM
    PATRON AS P      -- Alias PATRON table as P
JOIN
    BOOK AS B ON P.PAT_ID = B.PAT_ID -- Join PATRON and BOOK tables where PAT_ID in BOOK matches a PATRON
WHERE
    B.PAT_ID IS NOT NULL -- Filter for books that are currently checked out (have a PAT_ID assigned in the BOOK table)
ORDER BY
    P.PAT_LNAME ASC, -- Sort by patron last name in ascending order
    B.BOOK_TITLE ASC; -- Then by book title in ascending order