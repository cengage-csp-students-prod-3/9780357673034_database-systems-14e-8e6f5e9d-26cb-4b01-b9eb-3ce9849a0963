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
-- Temporary view structure for view `ACTIVE_DRIVERS`
--

DROP TABLE IF EXISTS `ACTIVE_DRIVERS`;
/*!50001 DROP VIEW IF EXISTS `ACTIVE_DRIVERS`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ACTIVE_DRIVERS` AS SELECT 
 1 AS `DRIVER_ID`,
 1 AS `DRIVER_FIRST_NAME`,
 1 AS `DRIVER_LAST_NAME`,
 1 AS `DRIVER_DRIVING_LICENSE_ID`,
 1 AS `DRIVER_RATING`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CARS`
--

DROP TABLE IF EXISTS `CARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARS` (
  `CAR_ID` char(5) NOT NULL,
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
INSERT INTO `CARS` VALUES ('1001','BB-542-AB','TOYOTA PRIUS',2021),('1002','BB-883-EE','TESLA MODEL 3',2022),('1003','BB-451-ZN','TOYOTA AURIS',2022),('1004','BB-189-MM','MERCEDES E200',2022);
/*!40000 ALTER TABLE `CARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVERS`
--

DROP TABLE IF EXISTS `DRIVERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVERS` (
  `DRIVER_ID` int NOT NULL AUTO_INCREMENT,
  `DRIVER_FIRST_NAME` varchar(20) NOT NULL,
  `DRIVER_LAST_NAME` varchar(20) NOT NULL,
  `DRIVER_DRIVING_LICENSE_ID` varchar(10) NOT NULL,
  `DRIVER_START_DATE` date NOT NULL,
  `DRIVER_DRIVING_LICENSE_CHECKED` tinyint(1) NOT NULL,
  `DRIVER_RATING` decimal(2,1) NOT NULL,
  PRIMARY KEY (`DRIVER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVERS`
--

LOCK TABLES `DRIVERS` WRITE;
/*!40000 ALTER TABLE `DRIVERS` DISABLE KEYS */;
INSERT INTO `DRIVERS` VALUES (2001,'Willie','Butler','1874501','2022-09-12',1,4.4),(2002,'Justin','Howard','1953853','2022-09-09',1,4.8),(2003,'Anthony','Walker','1735487','2022-09-15',1,3.5),(2004,'Ece','Yilmaz','1734747','2022-08-15',1,0.0),(2005,'Nursin','Yilmaz','4141447','2019-12-28',1,4.0);
/*!40000 ALTER TABLE `DRIVERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAINTENANCES`
--

DROP TABLE IF EXISTS `MAINTENANCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAINTENANCES` (
  `CAR_ID` char(5) NOT NULL,
  `MAINTENANCE_TYPE_ID` char(5) NOT NULL,
  `MAINTENANCE_DUE` date NOT NULL,
  PRIMARY KEY (`CAR_ID`,`MAINTENANCE_TYPE_ID`,`MAINTENANCE_DUE`),
  KEY `MAINTENANCE_TYPE_ID` (`MAINTENANCE_TYPE_ID`),
  CONSTRAINT `MAINTENANCES_ibfk_1` FOREIGN KEY (`CAR_ID`) REFERENCES `CARS` (`CAR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MAINTENANCES_ibfk_2` FOREIGN KEY (`MAINTENANCE_TYPE_ID`) REFERENCES `MAINTENANCE_TYPES` (`MAINTENANCE_TYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAINTENANCES`
--

LOCK TABLES `MAINTENANCES` WRITE;
/*!40000 ALTER TABLE `MAINTENANCES` DISABLE KEYS */;
INSERT INTO `MAINTENANCES` VALUES ('1001','2','2020-06-01'),('1003','2','2020-06-01');
/*!40000 ALTER TABLE `MAINTENANCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAINTENANCE_TYPES`
--

DROP TABLE IF EXISTS `MAINTENANCE_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAINTENANCE_TYPES` (
  `MAINTENANCE_TYPE_ID` char(5) NOT NULL,
  `MAINTENANCE_TYPE_DESCRIPTION` varchar(30) NOT NULL,
  `MAINTENANCE_PRICE` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`MAINTENANCE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAINTENANCE_TYPES`
--

LOCK TABLES `MAINTENANCE_TYPES` WRITE;
/*!40000 ALTER TABLE `MAINTENANCE_TYPES` DISABLE KEYS */;
INSERT INTO `MAINTENANCE_TYPES` VALUES ('1','Tyre Change',50.00),('2','Oil Change',75.00),('3','Full Cleaning',100.00);
/*!40000 ALTER TABLE `MAINTENANCE_TYPES` ENABLE KEYS */;
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
  `DRIVER_ID` char(5) NOT NULL,
  `CAR_ID` char(5) NOT NULL,
  `USER_ID` char(5) NOT NULL,
  `TRAVEL_DISCOUNT` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`TRAVEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAVELS`
--

LOCK TABLES `TRAVELS` WRITE;
/*!40000 ALTER TABLE `TRAVELS` DISABLE KEYS */;
INSERT INTO `TRAVELS` VALUES ('5001','2022-10-01 04:04:55','2022-10-01 04:14:19','9614 York Road','84 Church Lane',15.44,'2001','1003','3005',NULL),('5002','2022-10-01 05:57:33','2022-10-01 06:12:33','47 Church Street','68 High Street',20.56,'2001','1003','3006',NULL),('5003','2022-10-01 13:35:20','2022-10-01 13:45:10','2 Windsor Road','95 West Street',12.32,'2002','1001','3002',NULL),('5004','2022-10-02 08:44:48','2022-10-02 09:15:28','9060 Mill Lane','27 Main Road',30.49,'2003','1002','3001',0.13),('5005','2022-10-02 16:38:54','2022-10-02 16:48:10','2 Queensway','24 Mill Lane',11.15,'2001','1003','3007',NULL),('5006','2022-10-03 19:12:14','2022-10-03 19:23:45','50 Main Road','93 Broadway',14.61,'2003','1002','3007',0.10),('5007','2022-10-03 16:06:36','2022-10-03 16:08:56','39 Park Road','91 West Street',4.41,'2002','1004','3003',0.14),('5008','2022-10-03 17:17:12','2022-10-03 17:37:42','37 The Drive','17 Stanley Road',25.12,'2001','1003','3001',0.25),('5009','2022-10-03 21:16:48','2022-10-03 21:26:18','77 Mill Road','724 Springfield Road',13.55,'2001','1003','3005',NULL),('5010','2022-10-03 23:21:40','2022-10-03 23:39:10','16 Church Road','30 North Road',25.62,'2003','1002','3003',0.20);
/*!40000 ALTER TABLE `TRAVELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `USER_ID` char(5) NOT NULL,
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
INSERT INTO `USERS` VALUES ('3001','Jack','Hill','j.hill@xmail.com'),('3002','Ryan','Collins','r.collins@xmail.com'),('3003','Nursin','Yilmaz','n.atak@gmail.com'),('3004','Sarah','Price','s.price@xmail.com'),('3005','Bobby','Griffin','b.griffin@xmail.com'),('3006','Randy','Clark','r.clark@xmail.com'),('3007','Jose','Thomas','j.thomas@xmail.com'),('3008','Nursin','Yilmaz','n.yilmaz@xmail.com');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'InstantRide'
--
/*!50003 DROP PROCEDURE IF EXISTS `VATCalculator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `VATCalculator`()
BEGIN
    SELECT
        TRAVEL_ID,
        ROUND(TRAVEL_PRICE * (1 - COALESCE(TRAVEL_DISCOUNT, 0)) * 0.08, 2) AS VAT_AMOUNT
    FROM
        TRAVELS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ACTIVE_DRIVERS`
--

/*!50001 DROP VIEW IF EXISTS `ACTIVE_DRIVERS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ACTIVE_DRIVERS` AS select `DRIVERS`.`DRIVER_ID` AS `DRIVER_ID`,`DRIVERS`.`DRIVER_FIRST_NAME` AS `DRIVER_FIRST_NAME`,`DRIVERS`.`DRIVER_LAST_NAME` AS `DRIVER_LAST_NAME`,`DRIVERS`.`DRIVER_DRIVING_LICENSE_ID` AS `DRIVER_DRIVING_LICENSE_ID`,`DRIVERS`.`DRIVER_RATING` AS `DRIVER_RATING` from `DRIVERS` where `DRIVERS`.`DRIVER_ID` in (select distinct `TRAVELS`.`DRIVER_ID` from `TRAVELS`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-12  1:44:02
