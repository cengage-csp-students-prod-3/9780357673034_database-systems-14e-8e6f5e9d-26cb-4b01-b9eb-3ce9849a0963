-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Ch07_FACT
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
-- Table structure for table `AUTHOR`
--

DROP TABLE IF EXISTS `AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHOR` (
  `AU_ID` decimal(7,0) NOT NULL,
  `AU_FNAME` varchar(30) NOT NULL,
  `AU_LNAME` varchar(30) NOT NULL,
  `AU_BIRTHYEAR` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`AU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHOR`
--

LOCK TABLES `AUTHOR` WRITE;
/*!40000 ALTER TABLE `AUTHOR` DISABLE KEYS */;
INSERT INTO `AUTHOR` VALUES (185,'Benson','Reeves',1990),(218,'Rachel','Beatney',1983),(229,'Carmine','Salvadore',NULL),(251,'Hugo','Bruer',1972),(262,'Xia','Chiang',NULL),(273,'Reba','Durante',1969),(284,'Trina','Tankersly',1961),(383,'Neal','Walsh',1980),(394,'Robert','Lake',1982),(438,'Perry','Pearson',1986),(460,'Connie','Paulsen',1983),(559,'Rachel','McGill',NULL),(581,'Manish','Aggerwal',1984),(592,'Lawrence','Sheel',1976),(603,'Julia','Palca',1988);
/*!40000 ALTER TABLE `AUTHOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BOOK`
--

DROP TABLE IF EXISTS `BOOK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOOK` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `BOOK_TITLE` varchar(120) NOT NULL,
  `BOOK_YEAR` decimal(4,0) DEFAULT NULL,
  `BOOK_COST` decimal(8,2) DEFAULT NULL,
  `BOOK_SUBJECT` varchar(120) DEFAULT NULL,
  `PAT_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`BOOK_NUM`),
  KEY `PAT_ID` (`PAT_ID`),
  CONSTRAINT `BOOK_ibfk_1` FOREIGN KEY (`PAT_ID`) REFERENCES `PATRON` (`PAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOOK`
--

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;
INSERT INTO `BOOK` VALUES (5235,'Beginner\'s Guide to JAVA',2018,59.95,'Programming',NULL),(5236,'Database in the Cloud',2018,79.95,'Cloud',NULL),(5237,'Mastering the database environment',2019,89.95,'Database',NULL),(5238,'Conceptual Programming',2019,59.95,'Programming',1229),(5239,'J++ in Mobile Apps',2019,49.95,'Programming',NULL),(5240,'iOS Programming',2019,79.95,'Programming',1212),(5241,'JAVA First Steps',2019,49.95,'Programming',NULL),(5242,'C# in Middleware Deployment',2019,59.95,'Middleware',1228),(5243,'DATABASES in Theory',2019,129.95,'Database',NULL),(5244,'Cloud-based Mobile Applications',2019,69.95,'Cloud',NULL),(5245,'The Golden Road to Platform independence',2020,119.95,'Middleware',NULL),(5246,'Capture the Cloud',2020,69.95,'Cloud',1172),(5247,'Shining Through the Cloud: Sun Programming',2020,109.95,'Programming',NULL),(5248,'What You Always Wanted to Know About Database, But Were Afraid to Ask',2020,49.95,'Database',NULL),(5249,'Starlight Applications',2020,69.95,'Cloud',1207),(5250,'Reengineering the Middle Tier',2020,89.95,'Middleware',NULL),(5251,'Thoughts on Revitalizing Ruby',2020,59.95,'Programming',NULL),(5252,'Beyond the Database Veil',2020,69.95,'Database',1229),(5253,'Virtual Programming for Virtual Environments',2020,79.95,'Programming',NULL),(5254,'Coding Style for Maintenance',2021,49.95,'Programming',NULL);
/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHECKOUT`
--

DROP TABLE IF EXISTS `CHECKOUT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHECKOUT` (
  `CHECK_NUM` decimal(15,0) NOT NULL,
  `BOOK_NUM` decimal(10,0) DEFAULT NULL,
  `PAT_ID` decimal(10,0) DEFAULT NULL,
  `CHECK_OUT_DATE` date DEFAULT NULL,
  `CHECK_DUE_DATE` date DEFAULT NULL,
  `CHECK_IN_DATE` date DEFAULT NULL,
  PRIMARY KEY (`CHECK_NUM`),
  KEY `BOOK_NUM` (`BOOK_NUM`),
  KEY `PAT_ID` (`PAT_ID`),
  CONSTRAINT `CHECKOUT_ibfk_1` FOREIGN KEY (`BOOK_NUM`) REFERENCES `BOOK` (`BOOK_NUM`),
  CONSTRAINT `CHECKOUT_ibfk_2` FOREIGN KEY (`PAT_ID`) REFERENCES `PATRON` (`PAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHECKOUT`
--

LOCK TABLES `CHECKOUT` WRITE;
/*!40000 ALTER TABLE `CHECKOUT` DISABLE KEYS */;
INSERT INTO `CHECKOUT` VALUES (91001,5235,1165,'2021-03-31','2021-04-14','2021-04-09'),(91002,5238,1209,'2021-03-31','2021-04-07','2021-04-05'),(91003,5240,1160,'2021-03-31','2021-04-14','2021-04-09'),(91004,5237,1160,'2021-03-31','2021-04-14','2021-04-03'),(91005,5236,1202,'2021-03-31','2021-04-07','2021-04-08'),(91006,5235,1203,'2021-04-05','2021-04-12','2021-04-13'),(91007,5244,1174,'2021-04-05','2021-04-12','2021-04-08'),(91008,5248,1181,'2021-04-05','2021-04-12','2021-04-06'),(91009,5242,1170,'2021-04-05','2021-04-19','2021-04-09'),(91010,5235,1161,'2021-04-05','2021-04-19','2021-04-05'),(91011,5236,1181,'2021-04-05','2021-04-12','2021-04-11'),(91012,5249,1181,'2021-04-08','2021-04-15','2021-04-12'),(91013,5240,1160,'2021-04-10','2021-04-24','2021-04-19'),(91014,5236,1204,'2021-04-11','2021-04-18','2021-04-19'),(91015,5237,1204,'2021-04-11','2021-04-18','2021-04-13'),(91016,5236,1183,'2021-04-13','2021-04-27','2021-04-14'),(91017,5240,1184,'2021-04-14','2021-04-21','2021-04-22'),(91018,5236,1170,'2021-04-14','2021-04-28','2021-04-14'),(91019,5246,1171,'2021-04-14','2021-04-21','2021-04-17'),(91020,5254,1185,'2021-04-16','2021-04-23','2021-04-23'),(91021,5238,1185,'2021-04-16','2021-04-23','2021-04-21'),(91022,5252,1171,'2021-04-16','2021-04-23','2021-04-19'),(91023,5249,1207,'2021-04-16','2021-04-23','2021-04-19'),(91024,5235,1209,'2021-04-21','2021-04-28','2021-04-29'),(91025,5246,1172,'2021-04-21','2021-04-28','2021-04-27'),(91026,5254,1161,'2021-04-21','2021-05-04','2021-04-26'),(91027,5243,1161,'2021-04-21','2021-05-04','2021-04-26'),(91028,5236,1183,'2021-04-22','2021-05-05','2021-04-30'),(91029,5244,1203,'2021-04-22','2021-04-29','2021-04-26'),(91030,5242,1207,'2021-04-22','2021-04-29','2021-04-30'),(91031,5252,1165,'2021-04-23','2021-05-06','2021-04-30'),(91032,5238,1172,'2021-04-23','2021-04-30','2021-04-26'),(91033,5235,1174,'2021-04-23','2021-04-30','2021-04-23'),(91034,5240,1185,'2021-04-23','2021-04-30','2021-05-01'),(91035,5248,1165,'2021-04-24','2021-05-07','2021-04-25'),(91036,5237,1202,'2021-04-24','2021-04-30','2021-04-28'),(91037,5235,1210,'2021-04-28','2021-05-04','2021-05-01'),(91038,5238,1215,'2021-04-28','2021-05-04','2021-04-30'),(91039,5240,1222,'2021-04-28','2021-05-04','2021-05-06'),(91040,5237,1228,'2021-04-28','2021-05-04','2021-05-05'),(91041,5236,1211,'2021-04-28','2021-05-04','2021-04-30'),(91042,5235,1220,'2021-04-29','2021-05-05','2021-05-05'),(91043,5244,1226,'2021-04-29','2021-05-05','2021-05-07'),(91044,5248,1219,'2021-04-30','2021-05-07','2021-05-08'),(91045,5242,1210,'2021-04-30','2021-05-07','2021-05-04'),(91046,5235,1225,'2021-04-30','2021-05-07','2021-05-03'),(91047,5236,1218,'2021-04-30','2021-05-07','2021-05-07'),(91048,5249,1229,'2021-05-04','2021-05-11','2021-05-06'),(91049,5240,1214,'2021-05-04','2021-05-11','2021-05-04'),(91050,5236,1220,'2021-05-08','2021-05-15','2021-05-13'),(91051,5237,1222,'2021-05-08','2021-05-15','2021-05-15'),(91052,5236,1213,'2021-05-08','2021-05-15','2021-05-08'),(91053,5240,1212,'2021-05-09','2021-05-16',NULL),(91054,5236,1221,'2021-05-09','2021-05-16','2021-05-11'),(91055,5246,1221,'2021-05-09','2021-05-16','2021-05-10'),(91056,5254,1224,'2021-05-10','2021-05-17','2021-05-15'),(91057,5238,1224,'2021-05-10','2021-05-17','2021-05-11'),(91058,5252,1171,'2021-05-10','2021-05-17','2021-05-15'),(91059,5249,1207,'2021-05-10','2021-05-17',NULL),(91060,5235,1209,'2021-05-15','2021-05-22','2021-05-18'),(91061,5246,1172,'2021-05-15','2021-05-22',NULL),(91062,5254,1223,'2021-05-15','2021-05-22','2021-05-16'),(91063,5243,1223,'2021-05-15','2021-05-22','2021-05-20'),(91064,5236,1183,'2021-05-17','2021-05-31','2021-05-21'),(91065,5244,1210,'2021-05-17','2021-05-24','2021-05-17'),(91066,5242,1228,'2021-05-19','2021-05-26',NULL),(91067,5252,1229,'2021-05-24','2021-05-31',NULL),(91068,5238,1229,'2021-05-24','2021-05-31',NULL);
/*!40000 ALTER TABLE `CHECKOUT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PATRON`
--

DROP TABLE IF EXISTS `PATRON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATRON` (
  `PAT_ID` decimal(10,0) NOT NULL,
  `PAT_FNAME` varchar(20) NOT NULL,
  `PAT_LNAME` varchar(20) NOT NULL,
  `PAT_TYPE` varchar(10) NOT NULL,
  PRIMARY KEY (`PAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PATRON`
--

LOCK TABLES `PATRON` WRITE;
/*!40000 ALTER TABLE `PATRON` DISABLE KEYS */;
INSERT INTO `PATRON` VALUES (1160,'robert','carter','Faculty'),(1161,'Kelsey','Koch','Faculty'),(1165,'Cedric','Baldwin','Faculty'),(1166,'Vera','Alvarado','Student'),(1167,'Alan','Martin','FACULTY'),(1170,'Cory','Barry','faculty'),(1171,'Peggy','Marsh','STUDENT'),(1172,'Tony','Miles','STUDENT'),(1174,'Betsy','Malone','STUDENT'),(1180,'Nadine','Blair','STUDENT'),(1181,'Allen','Horne','Student'),(1182,'Jamal','Melendez','STUDENT'),(1183,'Helena','Hughes','Faculty'),(1184,'Jimmie','Love','StudenT'),(1185,'Sandra','Yang','student'),(1200,'Lorenzo','Torres','Student'),(1201,'Shelby','Noble','Student'),(1202,'Holly','Anthony','Student'),(1203,'Tyler','Pope','STUDENT'),(1204,'Thomas','Duran','Student'),(1205,'Claire','Gomez','student'),(1207,'Iva','Ramos','Student'),(1208,'Ollie','Cantrell','Student'),(1209,'Rena','Mathis','Student'),(1210,'Keith','Cooley','STUdent'),(1211,'Jerald','Gaines','Student'),(1212,'Iva','McClain','Student'),(1213,'Desiree','Rivas','Student'),(1214,'Marina','King','Student'),(1215,'Maureen','Downs','Student'),(1218,'Angel','Terrell','Student'),(1219,'Desiree','Harrington','Student'),(1220,'Carlton','Morton','Student'),(1221,'Gloria','Pitts','Student'),(1222,'Zach','Kelly','Student'),(1223,'Jose','Hays','Student'),(1224,'Jewel','England','Student'),(1225,'Wilfred','Fuller','Student'),(1226,'Jeff','Owens','Student'),(1227,'Alicia','Dickson','Student'),(1228,'Homer','Goodman','Student'),(1229,'Gerald','Burke','Student'),(1237,'Brandi','Larson','Student'),(1238,'Erika','Bowen','Student'),(1239,'Elton','Irwin','Student'),(1240,'Jan','Joyce','Student'),(1241,'Irene','West','Student'),(1242,'Mario','King','Student'),(1243,'Roberto','Kennedy','Student'),(1244,'Leon','Richmond','Student');
/*!40000 ALTER TABLE `PATRON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WRITES`
--

DROP TABLE IF EXISTS `WRITES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WRITES` (
  `BOOK_NUM` decimal(10,0) NOT NULL,
  `AU_ID` decimal(7,0) NOT NULL,
  PRIMARY KEY (`BOOK_NUM`,`AU_ID`),
  KEY `WRITES_AU_ID_FK` (`AU_ID`),
  CONSTRAINT `WRITES_AU_ID_FK` FOREIGN KEY (`AU_ID`) REFERENCES `AUTHOR` (`AU_ID`),
  CONSTRAINT `WRITES_BOOK_NUM_FK` FOREIGN KEY (`BOOK_NUM`) REFERENCES `BOOK` (`BOOK_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WRITES`
--

LOCK TABLES `WRITES` WRITE;
/*!40000 ALTER TABLE `WRITES` DISABLE KEYS */;
INSERT INTO `WRITES` VALUES (5237,185),(5253,185),(5240,218),(5239,229),(5248,229),(5243,251),(5246,251),(5244,262),(5249,262),(5252,262),(5235,273),(5244,284),(5236,383),(5250,383),(5245,394),(5247,394),(5250,438),(5239,460),(5241,460),(5251,460),(5241,559),(5254,559),(5242,581),(5239,592),(5238,603);
/*!40000 ALTER TABLE `WRITES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Ch07_FACT'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 10:02:19
