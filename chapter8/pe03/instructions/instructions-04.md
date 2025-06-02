## Task 3:

The Owner Relationship team realized that maintaining owners in two different tables is difficult. Therefore, they indicated that they do not need the `ACTIVE_OWNER` table anymore. You need to delete the table from the database:

```mysql
DROP TABLE ACTIVE_OWNER;
```

> The `DROP` command in MySQL is executed immediately and logged in transaction logs. In other words, you are removing the table from your database completely. If you have backups of your database, you can recover the table.
