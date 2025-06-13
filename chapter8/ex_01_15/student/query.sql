UPDATE EMP_2
SET EMP_PCT = EMP_PCT + 0.15
WHERE EMP_LNAME = 'Alonzo'
  AND EMP_FNAME = 'Maria'
  AND EMP_INITIAL = 'D';

-- Select all data from EMP_2 to verify contents
SELECT *
FROM EMP_2;