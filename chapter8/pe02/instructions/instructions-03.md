## Task 2:

The Owner Relationship team requested a constraint on the first names and last names of the active users. The team does not want dummy owner names with only 1 letter in the system, therefore, you need to insert the following `CHECK` to the `ACTIVE_OWNER` table:

```mysql
ALTER TABLE ACTIVE_OWNER ADD CHECK (LENGTH(OwnerFirstName) > 2 AND LENGTH(OwnerLastName) > 2);
```
