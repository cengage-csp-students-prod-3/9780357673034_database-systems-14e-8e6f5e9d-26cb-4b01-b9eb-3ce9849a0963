## Task 2:

The InstantRide Driver Relationship team wants to check if there are any drivers with zero rides. You need to extract the **DRIVER_ID**, **DRIVER_FIRST_NAME**, **DRIVER_LAST_NAME** of the drivers with zero rides. You can use a subquery where the `DRIVER_ID` from the `DRIVERS` table is not equal to distinct `DRIVER_ID` rows in the `TRAVELS` table using `ALL`.
