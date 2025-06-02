## Task 1:

The House Development team wants a SQL script to add multiple rows to the `HOUSE_EXTRA` table in a batch. You need to create a transaction, add the rows and finally commit the changes:

```mysql
SET autocommit = OFF;
START TRANSACTION;
INSERT INTO HOUSE_EXTRA VALUES ('2','1');
INSERT INTO HOUSE_EXTRA VALUES ('2','2');
COMMIT;
SET autocommit = ON;
```

MySQL automatically commits each line of command. Therefore, the script first disables auto commit feature. Then it starts a transaction and all the lines until the `COMMIT` statement which executes the commands in a batch. When you open another connection to the database and run the `SELECT * FROM HOUSE_EXTRA;` command before and after the line `COMMIT` you will get the following two results:

<p align='center'>
<img src='../assets/qLhPDaTyRuiIfwrSVHGw.png' width='75%' alt='Before COMMIT' />
</p>

<sup>_Before COMMIT_</sup>

<p align='center'>
<img src='../assets/MLfCdPRRaWPNj4sMg45T.png' width='75%' alt='After COMMIT' />
</p>

<sup>_After COMMIT_</sup>

> The outputs show that the `INSERT` statements are not actually executed before the `COMMIT` statement.
