## Task 1:

The House Development team wants to ensure that the default price of the extras should be **0** instead of `NULL`. Their calculation systems resulted with errors when `NULL` values are returned. You need to set default value for the `ExtraPrice` column of the `EXTRA` table:

```mysql
ALTER TABLE EXTRA
ALTER COLUMN ExtraPrice SET DEFAULT 0;
```
