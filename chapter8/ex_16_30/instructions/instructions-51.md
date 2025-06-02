## Problem 26
Create a MySQL trigger named `trg_updatecustbalance` to update the `CUST_BALANCE` in the `CUSTOMER` table when a new invoice record is entered. (Assume that the sale is a credit sale.) Whatever value appears in the `INV_AMOUNT` column of the new invoice should be added to the customer’s balance. Test the trigger using the following new `INVOICE` record, which would add 225.40 to the balance of customer 1001:

| INV_NUM | CUST_NUM | INV_DATE | INV_AMOUNT|
| -------- | -------- | -------- |--------|
| 8005     | 1001     | 2022-04-27     | 225.40|