-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
DATE_FORMAT(T.TRAVEL_END_TIME, "%M") AS LAST_TRAVEL_MONTH, DATE_ADD(LAST_TRAVEL_MONTH, INTERVAL 1 WEEK)
FROM
TRAVELS T;
