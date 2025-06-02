## Task 1:

The Finance team wants to calculate a VAT (8%) on the amount of the stay reservations in the database. However, the team wants to calculate the VAT after the discounts are applied on the prices. In addition, it is important to remember if there is no discount/offers, then the value is `NULL` in the `TRAVELS` table. Create a procedure called **VATCalculator** to calculate the VAT amount and return with the corresponding travel ID. In addition, execute the procedure to account for `NULL` values and send the respective result to the team. The VAT value should be rounded to **2** decimals.

> Remember to redefine the MYSQL delimiter (`;`) when creating the procedure. This will prevent the commands from executing separately.
