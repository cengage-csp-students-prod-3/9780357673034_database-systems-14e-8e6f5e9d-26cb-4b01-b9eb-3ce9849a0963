-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
 SELECT 
 U.USER_ID, TIMEDIFF(T.TRAVEL_END_TIME, T.TRAVEL_START_TIME) AS 'TRAVEL_TIME '
 FROM 
 TRAVELS T, USERS U
 WHERE
 T.USER_ID = U.USER_ID;
