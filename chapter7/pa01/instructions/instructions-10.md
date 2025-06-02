## Task 6:

User Satisfaction team wants to send monthly summaries for each user. They need the following details with the user ID:

- The last day of the month when the users traveled most recently
- One week after the last day of the month when the users traveled most recently

You need to return a three-column output with

1. **USER_ID**
2. **LAST_TRAVEL_MONTH**
3. **NOTIFICATION**

You need to return a three-column output with **USER_ID**, **LAST_TRAVEL_MONTH** and **NOTIFICATION**, `LAST_TRAVEL_MONTH` should be calculated using the **MAX** of the `LAST_DAY` of the `TRAVEL_END_TIME` field. Similarly, `NOTIFICATION` should be calculated with `DATE_ADD` function to add one week.
