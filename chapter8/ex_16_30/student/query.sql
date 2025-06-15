-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.

DROP DATABASE IF EXISTS Ch08_SimpleCo;
CREATE DATABASE Ch08_SimpleCo;
USE Ch08_SimpleCo;

CREATE TABLE CUSTOMER(
 CUST_NUM INT AUTO_INCREMENT,
 CUST_LNAME VARCHAR(30),
 CUST_FNAME VARCHAR(30),
 CUST_BALANCE DECIMAL(10,2),
 PRIMARY KEY (CUST_NUM)   
);