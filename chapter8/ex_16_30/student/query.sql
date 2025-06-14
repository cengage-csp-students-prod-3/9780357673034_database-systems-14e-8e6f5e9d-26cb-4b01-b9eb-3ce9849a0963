-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.

DROP DATABASE IF EXISTS Ch08_SimpleCo;
CREATE DATABASE Ch08_SimpleCo;
USE Ch08_SimpleCo;

CREATE TABLE CUSTOMER(
 CUST_NUM INT,
 CUST_LNAME VARCHAR(30),
 CUST_FNAME VARCHAR(30),
 CUST_BALANCE DECIMAL(10,2),
 PRIMARY KEY (CUST_NUM)   
);

INSERT INTO CUSTOMER (CUST_NUM,CUST_LNAME, CUST_FNAME, CUST_BALANCE)
VALUES (1000,'Smith', 'Jeanne', 1050.11),
(1001,'Ortega', 'Juan', 840.92);
