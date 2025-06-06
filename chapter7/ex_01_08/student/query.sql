-- Write your query below and then click "Run Query" to execute it. To save multiple queries, click the "+" icon on the left.
SELECT
P.PROJ_NAME, P.PROJ_VALUE,P.PROJ_BALANCE, E.EMP_LNAME, E.EMP_FNAME, E.EMP_INITIAL, J.JOB_CODE, J.JOB_DESCRIPTION, J.JOB_CHG_HOUR 
FROM 
      JOB J
JOIN 
    EMPLOYEE E 
ON E.JOB_CODE = J.JOB_CODE
JOIN
 PROJECT P
ON 
P.EMP_NUM = E.EMP_NUM;



