-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: InstantStay
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CHANNEL`
--

DROP TABLE IF EXISTS `CHANNEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHANNEL` (
  `ChannelID` int NOT NULL,
  `ChannelName` varchar(50) NOT NULL,
  `ChannelCommission` decimal(3,2) NOT NULL,
  PRIMARY KEY (`ChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHANNEL`
--

LOCK TABLES `CHANNEL` WRITE;
/*!40000 ALTER TABLE `CHANNEL` DISABLE KEYS */;
INSERT INTO `CHANNEL` VALUES (1,'InstantStay',0.00),(2,'Newspaper',0.07),(3,'Online Ads',0.15),(4,'Travel Agency',0.13);
/*!40000 ALTER TABLE `CHANNEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GUEST`
--

DROP TABLE IF EXISTS `GUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GUEST` (
  `GuestID` int NOT NULL,
  `GuestFirstName` varchar(50) NOT NULL,
  `GuestLastName` varchar(50) NOT NULL,
  `GuestEmail` varchar(50) NOT NULL,
  PRIMARY KEY (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GUEST`
--

LOCK TABLES `GUEST` WRITE;
/*!40000 ALTER TABLE `GUEST` DISABLE KEYS */;
INSERT INTO `GUEST` VALUES (1,'Clinton','Castro','c.castro@xmail.com'),(2,'Kobie','Burris','k.burris@xmail.com'),(3,'Erika','Tomlinson','e.tomlinson@xmail.com'),(4,'Aubrey','Carpenter','a.carpenter@xmail.com'),(5,'Amy','Tapia','a.tapia@xmail.com'),(6,'Kaine','Harwood','k.harwood@xmail.com'),(7,'Ronald','Oneil','r.oneil@xmail.com'),(8,'Manuel','Gibson','m.gibson@xmail.com'),(9,'Jada','Swan','j.swan@xmail.com'),(10,'Bryce','Thorpe','b.thorpe@xmail.com'),(11,'Jada','Swan','j.swan@tmail.com'),(12,'Ronald','Oneil','r.oneil@tmail.com');
/*!40000 ALTER TABLE `GUEST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOUSE`
--

DROP TABLE IF EXISTS `HOUSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOUSE` (
  `HouseID` int NOT NULL,
  `HouseAddress` varchar(100) NOT NULL,
  `HouseCity` varchar(20) NOT NULL,
  `HouseZIPCode` char(5) NOT NULL,
  `HouseState` char(2) NOT NULL,
  `HouseNumberOfRooms` int NOT NULL,
  `HouseSquareMeter` int NOT NULL,
  `HouseBuildYear` int NOT NULL,
  `HouseJoinDate` date NOT NULL,
  `HouseEndDate` date DEFAULT NULL,
  `OwnerID` int NOT NULL,
  PRIMARY KEY (`HouseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOUSE`
--

LOCK TABLES `HOUSE` WRITE;
/*!40000 ALTER TABLE `HOUSE` DISABLE KEYS */;
INSERT INTO `HOUSE` VALUES (1,'33 Southpoint Dr','Lancaster','14086','NY',4,150,2001,'2022-03-10',NULL,1),(2,'204 Garfield Ave','Libertyville','60048','IL',3,120,1990,'2022-06-26',NULL,2),(3,'3200 Price Rd','Bartlesville','74006','OK',4,150,2001,'2022-08-02',NULL,3),(4,'12791 Amethyst St','Garden Grove','92845','CA',6,210,1975,'2022-08-15',NULL,4),(5,'100 Cleveland Ave','Endicott','13760','NY',2,75,1920,'2022-09-17',NULL,5),(6,'505 Dawson St','Morro Bay','93442','CA',4,120,1982,'2022-08-22',NULL,4),(7,'20 Woodlawn Rd','Hadley','01035','MA',3,130,1925,'2022-04-15','2022-05-15',6),(8,'2402 13th St','Meridian','39301','MS',2,90,1994,'2022-03-15','2022-06-12',7);
/*!40000 ALTER TABLE `HOUSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OWNER`
--

DROP TABLE IF EXISTS `OWNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OWNER` (
  `OwnerID` int NOT NULL,
  `OwnerFirstName` varchar(50) NOT NULL,
  `OwnerLastName` varchar(50) NOT NULL,
  `OwnerEmail` varchar(50) NOT NULL,
  `OwnerJoinDate` date NOT NULL,
  `OwnerEndDate` date DEFAULT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OWNER`
--

LOCK TABLES `OWNER` WRITE;
/*!40000 ALTER TABLE `OWNER` DISABLE KEYS */;
INSERT INTO `OWNER` VALUES (1,'Kaya','Logan','k.logan@xmail.com','2024-03-08',NULL),(2,'Ruth','Gibbs','r.gibbs@xmail.com','2024-06-26',NULL),(3,'Alberto','Burke','a.burke@xmail.com','2024-08-02',NULL),(4,'Kristen','Jones','k.jones@xmail.com','2024-08-08',NULL),(5,'Alec','Webber','a.webber@xmail.com','2024-09-17',NULL),(6,'Ronald','Snow','r.snow@xmail.com','2024-04-15','2024-05-15'),(7,'Donald','Schmidt','d.schmidt@xmail.com','2024-03-15','2024-06-12');
/*!40000 ALTER TABLE `OWNER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAY`
--

DROP TABLE IF EXISTS `STAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STAY` (
  `StayID` int NOT NULL,
  `HouseID` int NOT NULL,
  `GuestID` int NOT NULL,
  `ChannelID` int NOT NULL,
  `StayStartDate` date NOT NULL,
  `StayEndDate` date NOT NULL,
  `StayPrice` decimal(5,2) NOT NULL,
  `StayDiscount` decimal(3,2) NOT NULL,
  PRIMARY KEY (`StayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAY`
--

LOCK TABLES `STAY` WRITE;
/*!40000 ALTER TABLE `STAY` DISABLE KEYS */;
INSERT INTO `STAY` VALUES (1,1,1,1,'2022-04-10','2022-04-15',110.00,0.00),(2,1,2,1,'2022-04-10','2022-04-15',110.00,0.00),(3,1,3,1,'2022-04-10','2022-04-15',110.00,0.00),(4,1,7,1,'2022-04-10','2022-04-15',110.00,0.00),(5,2,3,2,'2022-06-30','2022-07-10',130.00,0.10),(6,2,5,2,'2022-06-30','2022-07-10',140.00,0.15),(7,2,6,2,'2022-06-30','2022-07-10',-120.50,0.00),(8,5,4,4,'2022-08-01','2022-09-01',150.00,0.15),(9,5,10,4,'2022-08-01','2022-09-01',160.00,0.20),(10,4,1,3,'2022-09-10','2022-09-15',125.00,0.20),(11,4,2,3,'2022-09-10','2022-09-15',125.00,0.30),(12,4,3,3,'2022-09-10','2022-09-15',-130.25,0.30),(13,4,7,3,'2022-09-10','2022-09-15',200.00,0.00);
/*!40000 ALTER TABLE `STAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'InstantStay'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 21:15:49
