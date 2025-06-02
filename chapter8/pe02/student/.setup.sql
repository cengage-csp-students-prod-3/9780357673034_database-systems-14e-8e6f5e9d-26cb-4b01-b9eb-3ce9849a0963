CREATE DATABASE InstantStay;
USE InstantStay;

CREATE TABLE HOUSE (
    HouseID INT PRIMARY KEY NOT NULL,
    HouseAddress VARCHAR(100) NOT NULL,
    HouseCity VARCHAR(20) NOT NULL,
    HouseZIPCode CHAR(5) NOT NULL,
    HouseState CHAR(2) NOT NULL,
    HouseNumberOfRooms INT NOT NULL,
    HouseSquareMeter INT NOT NULL,
    HouseBuildYear INT NOT NULL,
    HouseJoinDate DATE NOT NULL,
    HouseEndDate DATE,
    OwnerID INT NOT NULL
);

INSERT INTO HOUSE VALUES(1,'33 Southpoint Dr','Lancaster','14086','NY',4, 150, 2001,'2022-03-10', NULL, 1 );
INSERT INTO HOUSE VALUES(2,'204 Garfield Ave','Libertyville','60048','IL',3, 120, 1990,'2022-06-26', NULL, 2 );
INSERT INTO HOUSE VALUES(3,'3200 Price Rd','Bartlesville','74006','OK',4, 150, 2001,'2022-08-02', NULL, 3 );
INSERT INTO HOUSE VALUES(4,'12791 Amethyst St','Garden Grove','92845','CA',6, 210, 1975,'2022-08-15', NULL, 4 );
INSERT INTO HOUSE VALUES(5,'100 Cleveland Ave','Endicott','13760','NY',2, 75, 1920,'2022-09-17', NULL, 5 );
INSERT INTO HOUSE VALUES(6,'505 Dawson St','Morro Bay','93442','CA',4, 120, 1982,'2022-08-22', NULL, 4 );
INSERT INTO HOUSE VALUES(7,'20 Woodlawn Rd','Hadley','01035','MA',3, 130, 1925,'2022-04-15', '2022-05-15', 6 );
INSERT INTO HOUSE VALUES(8,'2402 13th St','Meridian','39301','MS',2, 90, 1994,'2022-03-15', '2022-06-12', 7 );

CREATE TABLE OWNER (
    OwnerID INT PRIMARY KEY NOT NULL,
    OwnerFirstName VARCHAR(50) NOT NULL,
    OwnerLastName VARCHAR(50) NOT NULL,
    OwnerEmail VARCHAR(50) NOT NULL,
    OwnerJoinDate DATE NOT NULL,
    OwnerEndDate DATE
);

INSERT INTO OWNER VALUES(1,'Kaya','Logan','k.logan@xmail.com','2022-03-08', NULL);
INSERT INTO OWNER VALUES(2,'Ruth','Gibbs','r.gibbs@xmail.com','2022-06-26', NULL);
INSERT INTO OWNER VALUES(3,'Alberto','Burke','a.burke@xmail.com','2022-08-02', NULL);
INSERT INTO OWNER VALUES(4,'Kristen','Jones','k.jones@xmail.com','2022-08-08', NULL);
INSERT INTO OWNER VALUES(5,'Alec','Webber','a.webber@xmail.com','2022-09-17', NULL);
INSERT INTO OWNER VALUES(6,'Ronald','Snow','r.snow@xmail.com','2022-04-15', '2022-05-15');
INSERT INTO OWNER VALUES(7,'Donald','Schmidt','d.schmidt@xmail.com','2022-03-15', '2022-06-12');

CREATE TABLE GUEST (
    GuestID INT PRIMARY KEY NOT NULL,
    GuestFirstName VARCHAR(50) NOT NULL,
    GuestLastName VARCHAR(50) NOT NULL,
    GuestEmail VARCHAR(50) NOT NULL
);

INSERT INTO GUEST VALUES(1,'Clinton','Castro','c.castro@xmail.com');
INSERT INTO GUEST VALUES(2,'Kobie','Burris','k.burris@xmail.com');
INSERT INTO GUEST VALUES(3,'Erika','Tomlinson','e.tomlinson@xmail.com');
INSERT INTO GUEST VALUES(4,'Aubrey','Carpenter','a.carpenter@xmail.com');
INSERT INTO GUEST VALUES(5,'Amy','Tapia','a.tapia@xmail.com');
INSERT INTO GUEST VALUES(6,'Kaine','Harwood','k.harwood@xmail.com');
INSERT INTO GUEST VALUES(7,'Ronald','Oneil','r.oneil@xmail.com');
INSERT INTO GUEST VALUES(8,'Manuel','Gibson','m.gibson@xmail.com');
INSERT INTO GUEST VALUES(9,'Jada','Swan','j.swan@xmail.com');
INSERT INTO GUEST VALUES(10,'Bryce','Thorpe','b.thorpe@xmail.com');
INSERT INTO GUEST VALUES(11,'Jada','Swan','j.swan@tmail.com');
INSERT INTO GUEST VALUES(12,'Ronald','Oneil','r.oneil@tmail.com');

CREATE TABLE CHANNEL (
    ChannelID INT PRIMARY KEY NOT NULL,
    ChannelName VARCHAR(50) NOT NULL,
    ChannelCommission DECIMAL(3,2) NOT NULL
);
INSERT INTO CHANNEL VALUES(1, 'InstantStay', 0);
INSERT INTO CHANNEL VALUES(2, 'Newspaper', 0.07);
INSERT INTO CHANNEL VALUES(3, 'Online Ads', 0.15);
INSERT INTO CHANNEL VALUES(4, 'Travel Agency', 0.13);

CREATE TABLE STAY (
    StayID INT PRIMARY KEY NOT NULL,
    HouseID INT NOT NULL,
    GuestID INT NOT NULL,
    ChannelID INT NOT NULL,
    StayStartDate DATE NOT NULL,
    StayEndDate DATE NOT NULL,
    StayPrice DECIMAL(5, 2) NOT NULL,
    StayDiscount DECIMAL(3, 2) NOT NULL
);

INSERT INTO STAY VALUES(1,1,1,1,'2022-04-10','2022-04-15', 110, 0);
INSERT INTO STAY VALUES(2,1,2,1,'2022-04-10','2022-04-15', 110, 0);
INSERT INTO STAY VALUES(3,1,3,1,'2022-04-10','2022-04-15', 110, 0);
INSERT INTO STAY VALUES(4,1,7,1,'2022-04-10','2022-04-15', 110, 0);
INSERT INTO STAY VALUES(5,2,3,2,'2022-06-30','2022-07-10', 130, 0.1);
INSERT INTO STAY VALUES(6,2,5,2,'2022-06-30','2022-07-10', 140, 0.15);
INSERT INTO STAY VALUES(7,2,6,2,'2022-06-30','2022-07-10', -120.50, 0);
INSERT INTO STAY VALUES(8,5,4,4,'2022-08-01','2022-09-01', 150, 0.15);
INSERT INTO STAY VALUES(9,5,10,4,'2022--08-01','2022-09-01', 160, 0.2);
INSERT INTO STAY VALUES(10,4,1,3,'2022-09-10','2022-09-15', 125, 0.2);
INSERT INTO STAY VALUES(11,4,2,3,'2022-09-10','2022-09-15', 125, 0.3);
INSERT INTO STAY VALUES(12,4,3,3,'2022-09-10','2022-09-15', -130.25, 0.3);
INSERT INTO STAY VALUES(13,4,7,3,'2022-09-10','2022-09-15', 200, 0);

USE InstantStay;

-- Task 1
CREATE TABLE EXTRA (
    ExtraID INT PRIMARY KEY NOT NULL,
    ExtraDescription VARCHAR(20) NOT NULL
);


-- Task 2
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

-- Task 3
CREATE TABLE ACTIVE_OWNER (
    OwnerID INT NOT NULL,
    OwnerFirstName VARCHAR(50) NOT NULL,
    OwnerLastName VARCHAR(50) NOT NULL,
    OwnerStatus BOOL DEFAULT TRUE,
    OwnerEmail VARCHAR(50) NOT NULL
) AS SELECT OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail FROM
    OWNER
WHERE
    OwnerEndDate IS NULL;

-- Task 4
CREATE INDEX NameSearch ON ACTIVE_OWNER(OwnerFirstName, OwnerLastName); 


-- Task 5
ALTER TABLE ACTIVE_OWNER 
ADD CONSTRAINT DuplicateCheck UNIQUE (OwnerFirstName,OwnerLastName,OwnerEmail);

-- Task 6
ALTER TABLE EXTRA 
ADD COLUMN ExtraPrice DECIMAL(5,2);