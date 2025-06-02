## Task 2:

The Car Maintenance team also wants to store the actual maintenance operations in the database. The team wants to start with a table to store **CAR_ID** `CHAR(5)`, **MAINTENANCE_TYPE_ID** `CHAR(5)` and **MAINTENANCE_DUE** `DATE` date for the operation. Create a new table named **MAINTENANCES**. The `PRIMARY_KEY` should be the combination of the three fields. The `CAR_ID` and `MAINTENANCE_TYPE_ID` should be foreign keys to their original tables. Cascade update and cascade delete the foreign keys.
