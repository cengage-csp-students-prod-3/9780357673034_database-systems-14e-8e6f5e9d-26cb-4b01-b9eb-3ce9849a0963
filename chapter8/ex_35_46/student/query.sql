-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
ALTER TABLE CHARTER
ADD  CHAR_WAIT_CHG decimal(6,2),
ADD  CHAR_FLT_CHG_HR decimal(6,2),
ADD  CHAR_FLT_CHG decimal(10,2),
ADD  CHAR_TAX_CHG decimal(6,2),
ADD  CHAR_TOT_CHG decimal(10,2),
ADD  CHAR_PYMT decimal(10,2),
ADD  CHAR_BALANCE decimal(10,2);
