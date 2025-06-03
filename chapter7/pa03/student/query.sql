-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
    *
FROM
    STAY
WHERE
    ChannelID IN (SELECT
            ChannelID
        FROM
            CHANNEL
        WHERE
            ChannelCommission > 0.1);