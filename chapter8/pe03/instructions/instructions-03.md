## Task 2:

The House Development team wants a SQL script to add `ExtraID` **1** and **2** with `HouseID` **3** to the `HOUSE_EXTRA` table. However, they do not want this data in the database after they complete their operations. You need to create a transaction with the rollback of the changes:

```mysql
SET autocommit = OFF;
START TRANSACTION;
INSERT INTO HOUSE_EXTRA VALUES ('3','1');
INSERT INTO HOUSE_EXTRA VALUES ('3','2');
ROLLBACK;
SET autocommit = ON;
```

MySQL automatically commits each line of command. Therefore, the script first disables auto commit feature. After the `INSERT` statements, if you run `SELECT * FROM HOUSE_EXTRA;` command, you will get the following result:

<p align='center'>
<img src='../assets/MLfCdPRRaWPNj4sMg45T.png' width='95%' alt='HOUSE_EXTRA table after the ROLLBACK' />
</p>

<sup>_HOUSE_EXTRA table after the ROLLBACK_</sup>

> After the `ROLLBACK` command the `HOUSE_EXTRA` table will look the same as it did after _Task 1_.
