-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: InstantRide
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
-- Table structure for table `CARS`
--

DROP TABLE IF EXISTS `CARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARS` (
  `CAR_ID` int NOT NULL,
  `CAR_PLATE` varchar(10) NOT NULL,
  `CAR_MODEL` varchar(20) NOT NULL,
  `CAR_YEAR` year NOT NULL,
  PRIMARY KEY (`CAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARS`
--

LOCK TABLES `CARS` WRITE;
/*!40000 ALTER TABLE `CARS` DISABLE KEYS */;
INSERT INTO `CARS` VALUES (1001,'BB-542-AB','TOYOTA PRIUS',2021),(1002,'BB-883-EE','TESLA MODEL 3',2022),(1003,'BB-451-ZN','TOYOTA AURIS',2022),(1004,'BB-189-MM','MERCEDES E200',2022);
/*!40000 ALTER TABLE `CARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVERS`
--

DROP TABLE IF EXISTS `DRIVERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVERS` (
  `DRIVER_ID` int NOT NULL,
  `DRIVER_FIRST_NAME` varchar(20) NOT NULL,
  `DRIVER_LAST_NAME` varchar(20) NOT NULL,
  `DRIVER_DRIVING_LICENSE_ID` varchar(10) NOT NULL,
  `DRIVER_START_DATE` date NOT NULL,
  `DRIVER_DRIVING_LICENSE_CHECKED` tinyint(1) NOT NULL,
  `DRIVER_RATING` decimal(2,1) NOT NULL,
  PRIMARY KEY (`DRIVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVERS`
--

LOCK TABLES `DRIVERS` WRITE;
/*!40000 ALTER TABLE `DRIVERS` DISABLE KEYS */;
INSERT INTO `DRIVERS` VALUES (2001,'Willie','Butler','1874501','2022-09-12',1,4.4),(2002,'Justin','Howard','1953853','2022-09-09',1,4.8),(2003,'Anthony','Walker','1735487','2022-09-15',1,3.5),(2004,'Ece','Yilmaz','1734747','2022-08-15',1,0.0);
/*!40000 ALTER TABLE `DRIVERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAVELS`
--

DROP TABLE IF EXISTS `TRAVELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRAVELS` (
  `TRAVEL_ID` char(10) NOT NULL,
  `TRAVEL_START_TIME` datetime NOT NULL,
  `TRAVEL_END_TIME` datetime NOT NULL,
  `TRAVEL_START_LOCATION` char(30) NOT NULL,
  `TRAVEL_END_LOCATION` char(30) NOT NULL,
  `TRAVEL_PRICE` decimal(5,2) NOT NULL,
  `DRIVER_ID` int NOT NULL,
  `CAR_ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TRAVEL_DISCOUNT` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`TRAVEL_ID`),
  KEY `DRIVER_ID` (`DRIVER_ID`),
  KEY `CAR_ID` (`CAR_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `TRAVELS_ibfk_1` FOREIGN KEY (`DRIVER_ID`) REFERENCES `DRIVERS` (`DRIVER_ID`),
  CONSTRAINT `TRAVELS_ibfk_2` FOREIGN KEY (`CAR_ID`) REFERENCES `CARS` (`CAR_ID`),
  CONSTRAINT `TRAVELS_ibfk_3` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVELS`
--

LOCK TABLES `TRAVELS` WRITE;
/*!40000 ALTER TABLE `TRAVELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAVELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `USER_ID` int NOT NULL,
  `USER_FIRST_NAME` varchar(20) NOT NULL,
  `USER_LAST_NAME` varchar(20) NOT NULL,
  `USER_EMAIL` varchar(100) NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (3001,'Jack','Hill','j.hill@xmail.com'),(3002,'Ryan','Collins','r.collins@xmail.com'),(3003,'Nursin','Yilmaz','n.atak@gmail.com'),(3004,'Sarah','Price','s.price@xmail.com'),(3005,'Bobby','Griffin','b.griffin@xmail.com'),(3006,'Randy','Clark','r.clark@xmail.com'),(3007,'Jose','Thomas','j.thomas@xmail.com'),(3008,'Nursin','Yilmaz','n.yilmaz@xmail.com');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'InstantRide'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12  1:29:32
