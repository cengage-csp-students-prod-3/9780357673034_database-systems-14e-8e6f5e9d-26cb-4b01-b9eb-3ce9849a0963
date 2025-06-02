## Problem 44

Create a trigger named `trg_char_hours` that automatically updates the `AIRCRAFT` table when a new `CHARTER` row is added. Use the `CHARTER` table’s `CHAR_HOURS_FLOWN` to update the `AIRCRAFT` table’s `AC_TTAF`, `AC_TTEL`, and `AC_TTER` values.

(Hint: use temp values, as the `INSERT` event does not accept the `OLD` keyword.)