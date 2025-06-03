-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT 
-- Can assign an alias to a table for readability "GUEST G"
    GuestFirstName, GuestLastName, S.StayStartDate, S.StayEndDate
FROM
    GUEST G
        LEFT JOIN
    STAY S ON S.GuestID = G.GuestID;

SELECT
    OwnerFirstName,
    OwnerLastName,
    HouseID,
    HouseAddress,
    HouseCity,
    HouseZIPCode,
    HouseState
FROM 
    HOUSE
        JOIN 
    OWNER
    ON OWNER.OwnerID = HOUSE.OwnerID;