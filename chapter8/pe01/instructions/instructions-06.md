## Task 5:

The Owner Relationship team wants to ensure that there are no multiple active owners with the same first name, last name and email. To ensure this, you need to create a `CONSTRAINT` on the `ACTIVE_OWNER` table to ensure the teams requirement:

```mysql
ALTER TABLE ACTIVE_OWNER
ADD CONSTRAINT DuplicateCheck UNIQUE (OwnerFirstName, OwnerLastName, OwnerEmail);
```
