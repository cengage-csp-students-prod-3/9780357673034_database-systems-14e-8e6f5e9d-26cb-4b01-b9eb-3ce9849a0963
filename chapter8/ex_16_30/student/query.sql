-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.

DROP TABLE IF EXISTS INVOICE;
CREATE TABLE INVOICE(
    INV_NUM INT AUTO_INCREMENT,
    CUST_NUM INT,
    INV_DATE DATE,
    INV_AMOUNT DECIMAL(10, 2),
    PRIMARY KEY (INV_NUM),
    FOREIGN KEY (CUST_NUM) REFERENCES CUSTOMER(CUST_NUM)
);

INSERT INTO
    INVOICE
VALUES
    (8000, 1000, '2022/03/23', 235.89),
    (8001, 1001, '2022/03/23', 312.82),
    (8002, 1001, '2022/03/30', 528.10),
    (8003, 1000, '2022/04/16', 194.78),
    (8004, 1000, '2022/04/23', 619.44);
