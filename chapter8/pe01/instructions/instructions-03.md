## Task 2:

The House Development team wants to combine extras and house information in a separate table. Create a new table called **HOUSE_EXTRA** with the fields `ExtraID` and `HouseID`. Use foreign keys to add the respective references to their own tables.

In addition, when the IDs of the houses or extras are updated or changed, the changes should be automatically reflected in the `HOUSE_EXTRA` table with the `ON UPDATE CASCADE` references. Similarly, when the houses or extras are deleted, the corresponding rows from the `HOUSE_EXTRA` table will also need to be deleted using the `ON DELETE CASCADE` statements:

```mysql
CREATE TABLE HOUSE_EXTRA (
        HouseID INT NOT NULL,
    ExtraID INT NOT NULL,
    PRIMARY KEY (HouseID , ExtraID),
    FOREIGN KEY (HouseID)
        REFERENCES HOUSE (HouseID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ExtraID)
        REFERENCES EXTRA (ExtraID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
```
