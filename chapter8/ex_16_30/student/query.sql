-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE CUSTOMER(
 CUST_NUM INT,
 CUST_LNAME VARCHAR(30),
 CUST_FNAME VARCHAR(30),
 CUST_BALANCE DECIMAL(8,2),
 PRIMARY KEY (CUST_NUM)   
);

SELECT *
FROM CUSTOMER;