## Task 3:

The House Development team collected the extras and they want you to update the system’s database with the relative information:

- ID: **1**, Description: **Liability Insurance**, Price: **0**
- ID: **2**, Description: **Personal Insurance**, Price: **100**
- ID: **3**, Description: **Household Insurance**, Price: **125**

```mysql
INSERT INTO EXTRA(ExtraID,ExtraDescription) VALUES (1, 'Liability Insurance');

INSERT INTO EXTRA VALUES (2, 'Personal Insurance', 100);

INSERT INTO EXTRA VALUES (3, 'Household Insurance', 125);
```
