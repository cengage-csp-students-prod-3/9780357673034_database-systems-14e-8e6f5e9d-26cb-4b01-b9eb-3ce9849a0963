-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ch08_AviaCo
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
-- Table structure for table `AIRCRAFT`
--

DROP TABLE IF EXISTS `AIRCRAFT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRCRAFT` (
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `MOD_CODE` varchar(10) DEFAULT NULL,
  `AC_TTAF` float DEFAULT NULL,
  `AC_TTEL` float DEFAULT NULL,
  `AC_TTER` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRCRAFT`
--

LOCK TABLES `AIRCRAFT` WRITE;
/*!40000 ALTER TABLE `AIRCRAFT` DISABLE KEYS */;
INSERT INTO `AIRCRAFT` VALUES ('1484P','PA23-250',1833.1,1833.1,101.8),('2289L','C-90A',4243.8,768.9,1123.4),('2778V','PA31-350',7992.9,1513.1,789.5),('4278Y','PA31-350',2147.3,622.1,243.2);
/*!40000 ALTER TABLE `AIRCRAFT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARTER`
--

DROP TABLE IF EXISTS `CHARTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHARTER` (
  `CHAR_TRIP` int DEFAULT NULL,
  `CHAR_DATE` datetime DEFAULT NULL,
  `AC_NUMBER` varchar(5) DEFAULT NULL,
  `CHAR_DESTINATION` varchar(3) DEFAULT NULL,
  `CHAR_DISTANCE` float DEFAULT NULL,
  `CHAR_HOURS_FLOWN` float DEFAULT NULL,
  `CHAR_HOURS_WAIT` float DEFAULT NULL,
  `CHAR_FUEL_GALLONS` float DEFAULT NULL,
  `CHAR_OIL_QTS` int DEFAULT NULL,
  `CUS_CODE` int DEFAULT NULL,
  `CHAR_WAIT_CHG` decimal(6,2) DEFAULT NULL,
  `CHAR_FLT_CHG_HR` decimal(6,2) DEFAULT NULL,
  `CHAR_FLT_CHG` decimal(10,2) DEFAULT NULL,
  `CHAR_TAX_CHG` decimal(6,2) DEFAULT NULL,
  `CHAR_TOT_CHG` decimal(10,2) DEFAULT NULL,
  `CHAR_PYMT` decimal(10,2) DEFAULT NULL,
  `CHAR_BALANCE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARTER`
--

LOCK TABLES `CHARTER` WRITE;
/*!40000 ALTER TABLE `CHARTER` DISABLE KEYS */;
INSERT INTO `CHARTER` VALUES (10001,'2022-02-05 00:00:00','2289L','ATL',936,5.1,2.2,354.1,1,10011,100.00,2.67,NULL,NULL,NULL,NULL,NULL),(10002,'2022-02-05 00:00:00','2778V','BNA',320,1.6,0,72.6,0,10016,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10003,'2022-02-05 00:00:00','4278Y','GNV',1574,7.8,0,339.8,2,10014,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10004,'2022-02-06 00:00:00','1484P','STL',472,2.9,4.9,97.2,1,10019,50.00,1.93,NULL,NULL,NULL,NULL,NULL),(10005,'2022-02-06 00:00:00','2289L','ATL',1023,5.7,3.5,397.7,2,10011,100.00,2.67,NULL,NULL,NULL,NULL,NULL),(10006,'2022-02-06 00:00:00','4278Y','STL',472,2.6,5.2,117.1,0,10017,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10007,'2022-02-06 00:00:00','2778V','GNV',1574,7.9,0,348.4,2,10012,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10008,'2022-02-07 00:00:00','1484P','TYS',644,4.1,0,140.6,1,10014,50.00,1.93,NULL,NULL,NULL,NULL,NULL),(10009,'2022-02-07 00:00:00','2289L','GNV',1574,6.6,23.4,459.9,0,10017,100.00,2.67,NULL,NULL,NULL,NULL,NULL),(10010,'2022-02-07 00:00:00','4278Y','ATL',998,6.2,3.2,279.7,0,10016,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10011,'2022-02-07 00:00:00','1484P','BNA',352,1.9,5.3,66.4,1,10012,50.00,1.93,NULL,NULL,NULL,NULL,NULL),(10012,'2022-02-08 00:00:00','2778V','MOB',884,4.8,4.2,215.1,0,10010,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10013,'2022-02-08 00:00:00','4278Y','TYS',644,3.9,4.5,174.3,1,10011,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10014,'2022-02-09 00:00:00','4278Y','ATL',936,6.1,2.1,302.6,0,10017,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10015,'2022-02-09 00:00:00','2289L','GNV',1645,6.7,0,459.5,2,10016,100.00,2.67,NULL,NULL,NULL,NULL,NULL),(10016,'2022-02-09 00:00:00','2778V','MQY',312,1.5,0,67.2,0,10011,75.00,2.35,NULL,NULL,NULL,NULL,NULL),(10017,'2022-02-10 00:00:00','1484P','STL',508,3.1,0,105.5,0,10014,50.00,1.93,NULL,NULL,NULL,NULL,NULL),(10018,'2022-02-10 00:00:00','4278Y','TYS',644,3.8,4.5,167.4,0,10017,75.00,2.35,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `CHARTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREW`
--

DROP TABLE IF EXISTS `CREW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREW` (
  `CHAR_TRIP` int DEFAULT NULL,
  `EMP_NUM` int DEFAULT NULL,
  `CREW_JOB` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREW`
--

LOCK TABLES `CREW` WRITE;
/*!40000 ALTER TABLE `CREW` DISABLE KEYS */;
INSERT INTO `CREW` VALUES (10001,104,'Pilot'),(10002,101,'Pilot'),(10003,105,'Pilot'),(10003,109,'Copilot'),(10004,106,'Pilot'),(10005,101,'Pilot'),(10006,109,'Pilot'),(10007,104,'Pilot'),(10007,105,'Copilot'),(10008,106,'Pilot'),(10009,105,'Pilot'),(10010,108,'Pilot'),(10011,101,'Pilot'),(10011,104,'Copilot'),(10012,101,'Pilot'),(10013,105,'Pilot'),(10014,106,'Pilot'),(10015,101,'Copilot'),(10015,104,'Pilot'),(10016,105,'Copilot'),(10016,109,'Pilot'),(10017,101,'Pilot'),(10018,104,'Copilot'),(10018,105,'Pilot');
/*!40000 ALTER TABLE `CREW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `CUS_CODE` int DEFAULT NULL,
  `CUS_LNAME` varchar(15) DEFAULT NULL,
  `CUS_FNAME` varchar(15) DEFAULT NULL,
  `CUS_INITIAL` varchar(1) DEFAULT NULL,
  `CUS_AREACODE` varchar(3) DEFAULT NULL,
  `CUS_PHONE` varchar(8) DEFAULT NULL,
  `CUS_BALANCE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (10010,'Ramas','Alfred','A','615','844-2573',0),(10011,'Dunne','Leona','K','713','894-1238',0),(10012,'Smith','Kathy','W','615','894-2285',896.54),(10013,'Olowski','Paul','F','615','894-2180',1285.19),(10014,'Orlando','Myron','','615','222-1672',673.21),(10015,'O\'Brian','Amy','B','713','442-3381',1014.56),(10016,'Brown','James','G','615','297-1228',0),(10017,'Williams','George','','615','290-2556',0),(10018,'Farriss','Anne','G','713','382-7185',0),(10019,'Smith','Olette','K','615','297-3809',453.98);
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EARNEDRATING`
--

DROP TABLE IF EXISTS `EARNEDRATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EARNEDRATING` (
  `EMP_NUM` int DEFAULT NULL,
  `RTG_CODE` varchar(5) DEFAULT NULL,
  `EARNRTG_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EARNEDRATING`
--

LOCK TABLES `EARNEDRATING` WRITE;
/*!40000 ALTER TABLE `EARNEDRATING` DISABLE KEYS */;
INSERT INTO `EARNEDRATING` VALUES (101,'CFI','2002-02-18 00:00:00'),(101,'CFII','2009-12-15 00:00:00'),(101,'INSTR','1997-11-08 00:00:00'),(101,'MEL','1998-06-23 00:00:00'),(101,'SEL','1997-04-21 00:00:00'),(104,'INSTR','2000-07-15 00:00:00'),(104,'MEL','2001-01-29 00:00:00'),(104,'SEL','1999-03-12 00:00:00'),(105,'CFI','2001-11-18 00:00:00'),(105,'INSTR','1999-04-17 00:00:00'),(105,'MEL','1999-08-12 00:00:00'),(105,'SEL','1998-09-23 00:00:00'),(106,'INSTR','1999-12-20 00:00:00'),(106,'MEL','2000-04-02 00:00:00'),(106,'SEL','1998-03-10 00:00:00'),(109,'CFI','2002-11-05 00:00:00'),(109,'CFII','2007-06-21 00:00:00'),(109,'INSTR','2000-07-23 00:00:00'),(109,'MEL','2001-03-15 00:00:00'),(109,'SEL','2000-02-05 00:00:00'),(109,'SES','2000-05-12 00:00:00');
/*!40000 ALTER TABLE `EARNEDRATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `EMP_NUM` int DEFAULT NULL,
  `EMP_TITLE` varchar(4) DEFAULT NULL,
  `EMP_LNAME` varchar(15) DEFAULT NULL,
  `EMP_FNAME` varchar(15) DEFAULT NULL,
  `EMP_INITIAL` varchar(1) DEFAULT NULL,
  `EMP_DOB` datetime DEFAULT NULL,
  `EMP_HIRE_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (100,'Mr.','Kolmycz','George','D','1952-06-15 00:00:00','1997-03-15 00:00:00'),(101,'Ms.','Lewis','Rhonda','G','1975-03-19 00:00:00','1998-04-25 00:00:00'),(102,'Mr.','VanDam','Rhett','','1968-11-14 00:00:00','2002-12-20 00:00:00'),(103,'Ms.','Jones','Anne','M','1984-10-16 00:00:00','2015-08-28 00:00:00'),(104,'Mr.','Lange','John','P','1981-11-08 00:00:00','2006-10-20 00:00:00'),(105,'Mr.','Williams','Robert','D','1985-03-14 00:00:00','2016-01-08 00:00:00'),(106,'Mrs.','Duzak','Jeanine','K','1978-02-12 00:00:00','2001-01-05 00:00:00'),(107,'Mr.','Diante','Jorge','D','1984-08-21 00:00:00','2006-07-02 00:00:00'),(108,'Mr.','Wiesenbach','Paul','R','1976-02-14 00:00:00','2004-11-18 00:00:00'),(109,'Ms.','Travis','Elizabeth','K','1971-06-18 00:00:00','2001-04-14 00:00:00'),(110,'Mrs.','Genkazi','Leighla','W','1980-05-19 00:00:00','2002-12-01 00:00:00');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODEL`
--

DROP TABLE IF EXISTS `MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODEL` (
  `MOD_CODE` varchar(10) DEFAULT NULL,
  `MOD_MANUFACTURER` varchar(15) DEFAULT NULL,
  `MOD_NAME` varchar(20) DEFAULT NULL,
  `MOD_SEATS` decimal(8,0) DEFAULT NULL,
  `MOD_CHG_MILE` decimal(8,2) DEFAULT NULL,
  `MOD_WAIT_CHG` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODEL`
--

LOCK TABLES `MODEL` WRITE;
/*!40000 ALTER TABLE `MODEL` DISABLE KEYS */;
INSERT INTO `MODEL` VALUES ('C-90A','Beechcraft','KingAir',8,2.67,100.00),('PA23-250','Piper','Aztec',6,1.93,50.00),('PA31-350','Piper','Navajo Chieftain',10,2.35,75.00);
/*!40000 ALTER TABLE `MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PILOT`
--

DROP TABLE IF EXISTS `PILOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PILOT` (
  `EMP_NUM` int DEFAULT NULL,
  `PIL_LICENSE` varchar(25) DEFAULT NULL,
  `PIL_RATINGS` varchar(30) DEFAULT NULL,
  `PIL_MED_TYPE` varchar(1) DEFAULT NULL,
  `PIL_MED_DATE` datetime DEFAULT NULL,
  `PIL_PT135_DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PILOT`
--

LOCK TABLES `PILOT` WRITE;
/*!40000 ALTER TABLE `PILOT` DISABLE KEYS */;
INSERT INTO `PILOT` VALUES (101,'ATP','ATP/SEL/MEL/Instr/CFII','1','2022-01-20 00:00:00','2018-01-11 00:00:00'),(104,'ATP','ATP/SEL/MEL/Instr','1','2021-12-18 00:00:00','2018-01-17 00:00:00'),(105,'COM','COMM/SEL/MEL/Instr/CFI','2','2022-01-05 00:00:00','2018-01-02 00:00:00'),(106,'COM','COMM/SEL/MEL/Instr','2','2021-12-10 00:00:00','2018-02-02 00:00:00'),(109,'COM','ATP/SEL/MEL/SES/Instr/CFII','1','2022-01-22 00:00:00','2018-01-15 00:00:00');
/*!40000 ALTER TABLE `PILOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RATING`
--

DROP TABLE IF EXISTS `RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RATING` (
  `RTG_CODE` varchar(5) DEFAULT NULL,
  `RTG_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RATING`
--

LOCK TABLES `RATING` WRITE;
/*!40000 ALTER TABLE `RATING` DISABLE KEYS */;
INSERT INTO `RATING` VALUES ('CFI','Certified Flight Instructor'),('CFII','Certified Flight Instructor, Instrument'),('INSTR','Instrument'),('MEL','Multiengine Land'),('SEL','Single Engine, Land'),('SES','Single Engine, Sea');
/*!40000 ALTER TABLE `RATING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Ch08_AviaCo'
--
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCharter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCharter`()
BEGIN
UPDATE CHARTER C
INNER JOIN MODEL M ON C.CHAR_TRIP = M.MOD_CODE
SET C.CHAR_WAIT_CHG  = M.MOD_WAIT_CHG;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCharterFltChgHr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCharterFltChgHr`()
BEGIN
              UPDATE CHARTER C
    INNER JOIN MODEL M ON C.AC_NUMBER = M.MOD_CODE
    SET C.CHAR_FLT_CHG_HR = M.MOD_CHG_MILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-15 22:03:42
