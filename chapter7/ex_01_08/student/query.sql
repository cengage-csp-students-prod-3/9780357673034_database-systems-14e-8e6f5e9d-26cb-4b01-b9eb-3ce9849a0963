-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
    EMP_NUM, EMP_LNAME, EMP_FNAME, EMP_INITIAL
FROM 
    EMPLOYEE
WHERE 
    EMP_LNAME LIKE 'Smith%';


