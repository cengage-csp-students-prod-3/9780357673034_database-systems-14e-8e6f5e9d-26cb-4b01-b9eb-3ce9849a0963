## Task 3:

The Driver Relationship team wants to create some workshops and increase communication with the active drivers in InstantRide. Therefore, they requested a new database table to store the driver details of the drivers that have had at least one ride in the system. Create a new table, ACTIVE_DRIVERS##from the `DRIVERS` and `TRAVELS` tables which contains the following fields:

- DRIVER_ID `CHAR(5)` (Primary key)
- DRIVER_FIRST_NAME `VARCHAR(20)`
- DRIVER_LAST_NAME `VARCHAR(20)`
- DRIVER_DRIVING_LICENSE_ID `VARCHAR(10)`
- DRIVER_DRIVING_LICENSE_CHECKED `BOOL`
- DRIVER_RATING `DECIMAL(2,1)`
