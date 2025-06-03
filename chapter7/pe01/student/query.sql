-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
-- Select identifies the column for the table created by the query

SELECT
    ChannelName
FROM
    CHANNEL;


SELECT
    ChannelName
-- From selects the table to be displayed
FROM
    CHANNEL;


SELECT
    ChannelName,ChannelCommission
FROM CHANNEL
-- Order by sorts alphabetically, DESC sorts in reverse
ORDER BY ChannelCommission DESC;

SELECT
    ChannelName, ChannelCommission
FROM
    CHANNEL
-- where modifies select based on criteria 
WHERE
    ChannelCommission > 0.1;

SELECT 
-- AS creates a new column for the new table
    StayID, StayPrice * (1 - StayDiscount) AS 'Actual Price'
FROM 
    STAY;

SELECT
-- Round is a function, ROUND(Item, DECIMAL POINTS (INT)) 
    StayID, ROUND(StayPrice * (1 - StayDiscount), 2) AS 'Actual Price Rounded' 
FROM
    STAY;

SELECT 
    *
FROM 
    OWNER
WHERE
-- Date_ADD function adds an interval speified by an integer to a date
    (OwnerJoinDate >= DATE_ADD(CURDATE(), INTERVAL - 1 YEAR))
        AND OwnerEndDate IS NULL;
