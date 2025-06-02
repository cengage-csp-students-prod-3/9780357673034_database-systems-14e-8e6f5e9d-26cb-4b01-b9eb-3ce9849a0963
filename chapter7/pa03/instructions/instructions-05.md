## Task 3:

The InstantRide Finance team wants to know the average discount amounts for each car in the InstantRide. Calculate the average discount amount as monetary value for the travels where a discount is applied. You need to create a subquery over the `TRAVELS` table to retrieve **CAR_ID** and **DISCOUNT_AMOUNT** calculated with **2** decimals using the `ROUND` function.

To calculate the `DISCOUNT_AMOUNT`, multiply the `TRAVEL_PRICE` by the `TRAVEL_DISCOUNT` where the `TRAVEL_DISCOUNT` value is not `NULL`. Round the result to **2** decimals.

Then you can use this subquery to get the **CAR_ID** and **AVG** of `DISCOUNT_AMOUNT` values, once again using the `ROUND` function on the average results. Group the results by the `CAR_ID`. Use **CAR_ID** and **DISCOUNT_AMOUNT** as column aliases and return it back to the Finance team.
