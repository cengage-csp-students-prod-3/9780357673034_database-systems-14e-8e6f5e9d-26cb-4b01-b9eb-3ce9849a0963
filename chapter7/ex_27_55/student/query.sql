SELECT
  EM.EMP_FNAME AS ManagerFirstName,
  EM.EMP_LNAME AS ManagerLastName,
  D.DEPT_NAME,
  D.DEPT_PHONE,
  ES.EMP_FNAME AS EmployeeFirstName,
  ES.EMP_LNAME AS EmployeeLastName,
  C.CUST_FNAME AS CustomerFirstName,
  C.CUST_LNAME AS CustomerLastName,
  I.INV_DATE,
  I.INV_TOTAL
FROM
  LGCUSTOMER AS C
JOIN
  LGINVOICE AS I
ON
  C.CUST_CODE = I.CUST_CODE
JOIN
  LGEMPLOYEE AS ES -- Alias for the employee who made the sale
ON
  I.EMPLOYEE_ID = ES.EMP_NUM
JOIN
  LGDEPARTMENT AS D
ON
  ES.DEPT_NUM = D.DEPT_NUM
JOIN
  LGEMPLOYEE AS EM -- Alias for the department manager
ON
  D.EMP_NUM = EM.EMP_NUM
WHERE
  C.CUST_LNAME = 'Hagan'
  AND I.INV_DATE = '2021-05-18'
  AND ES.EMP_FNAME = 'THURMAN' -- Added filter for the specific employee
  AND ES.EMP_LNAME = 'WILKINSON'; -- Added filter for the specific employee