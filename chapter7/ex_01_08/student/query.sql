-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
    [EMPLOYEE][EMP_NUM], [EMPLOYEE][EMP_LNAME], [EMPLOYEE][EMP_FNAME], [EMPLOYEE][EMP_INITIAL]
FROM 
    EMPLOYEE
WHERE 
    EMP_LNAME LIKE 'Smith%';
