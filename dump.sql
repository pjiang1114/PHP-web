-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ts2
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `hall_name` varchar(64) DEFAULT NULL,
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `instructor_input_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_input_id` (`instructor_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('ESH',1,NULL),('SSB',2,NULL),('Clark',3,NULL),('UC',4,NULL);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_name`
--

DROP TABLE IF EXISTS `course_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_name` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `catalog_num` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_name`
--

LOCK TABLES `course_name` WRITE;
/*!40000 ALTER TABLE `course_name` DISABLE KEYS */;
INSERT INTO `course_name` VALUES (1,'intro to computing',1250),(2,'prog & data structures',2250),(3,'obj orient prog with c++',2260),(4,'Comp Sys: Architc & Orgz',2700),(5,'Comp Sys: Programming',2710),(6,'Sys. Programming & Tools',2750),(7,'Web Programming',3010),(8,'Design & Analysis of Algorithm',3010),(9,'Programming Languages',4250),(10,'Intro-Aritficial Intelligence',4300),(11,'Database Management Systems',4610),(12,'Computer Networks & Communication',4730),(13,'Operation System',4760),(14,'Adv Data Structure & Algorithm',5130),(15,'Intro Evol Computation',5320),(16,'Software Engineering',5500),(17,'Top Image Proc & Multimd',6420);
/*!40000 ALTER TABLE `course_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_interval`
--

DROP TABLE IF EXISTS `day_interval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `day_interval` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `period` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_interval`
--

LOCK TABLES `day_interval` WRITE;
/*!40000 ALTER TABLE `day_interval` DISABLE KEYS */;
INSERT INTO `day_interval` VALUES (1,'morning'),(2,'afternoon'),(3,'night');
/*!40000 ALTER TABLE `day_interval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hour`
--

DROP TABLE IF EXISTS `hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hour` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `start_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hour`
--

LOCK TABLES `hour` WRITE;
/*!40000 ALTER TABLE `hour` DISABLE KEYS */;
INSERT INTO `hour` VALUES (1,'08:00:00'),(2,'09:30:00'),(3,'11:00:00'),(4,'12:30:00'),(5,'14:00:00'),(6,'15:30:00'),(7,'17:30:00'),(8,'18:55:00'),(9,'20:20:00');
/*!40000 ALTER TABLE `hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_input`
--

DROP TABLE IF EXISTS `instructor_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_input` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `semester` varchar(64) DEFAULT NULL,
  `building_list` varchar(128) DEFAULT NULL,
  `course_list` varchar(256) DEFAULT NULL,
  `instructor_name` varchar(64) DEFAULT NULL,
  `hour_list` varchar(256) DEFAULT NULL,
  `weekday_list` varchar(256) DEFAULT NULL,
  `day_interval` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_input`
--

LOCK TABLES `instructor_input` WRITE;
/*!40000 ALTER TABLE `instructor_input` DISABLE KEYS */;
INSERT INTO `instructor_input` VALUES (5,'Summer','ESH,Clark','1250,2750','D','08:00:00,11:00:00','Monday,Wednesday',NULL),(6,'Spring','SSB','2250,2260,2700','C','09:30:00,11:00:00,12:30:00,14:00:00,15:30:00','Tuesday,Wednesday,Thursday',NULL),(7,'Spring','ESH,Clark','1250,2260','D','09:30:00,11:00:00','Monday,Wednesday','morning,night'),(8,'Spring','ESH,Clark','1250,2260','D','09:30:00,11:00:00','Monday,Wednesday','morning,night'),(9,'Fall','Clark','2250','I','18:55:00','Friday','night'),(10,'Fall','Clark','2260','J','17:30:00','Wednesday','night'),(11,'Fall','Clark','2260','J','17:30:00','Wednesday','night'),(12,'Spring','ESH','1250','H','09:30:00','Tuesday','morning'),(13,'Fall','SSB','2250','C','15:30:00','Tuesday','afternoon'),(14,'Fall','SSB','2250','C','15:30:00','Tuesday','afternoon'),(16,'Summer','SSB','4760','B','09:30:00','Tuesday','night'),(17,'Summer','SSB','4760','B','09:30:00','Tuesday','night'),(18,'Spring','UC','4300','C','09:30:00','Wednesday','morning'),(19,'Summer','Clark','2250','E','18:55:00','Tuesday','afternoon'),(20,'Fall','SSB','2260','H','18:55:00','Wednesday','afternoon'),(21,'Fall','SSB','2260','H','18:55:00','Wednesday','afternoon'),(22,'Spring','ESH,Clark','1250,2750','F','08:00:00,20:20:00','Monday,Wednesday','morning,night'),(23,'Spring','ESH,Clark','1250,2750','F','08:00:00,20:20:00','Monday,Wednesday','morning,night'),(24,'Spring','SSB','2250','F','09:30:00','Wednesday','night'),(25,'Spring','SSB','1250','F','09:30:00','Monday','afternoon'),(26,'Spring','Clark','2260','F','11:00:00','Tuesday','night'),(27,'Winter','SSB','2250','J','08:00:00','Wednesday','morning'),(28,'Spring','Clark','2260','F','11:00:00','Tuesday','night'),(29,'Spring','SSB','1250','F','09:30:00','Monday','afternoon'),(30,'Spring','SSB','2250','F','09:30:00','Wednesday','night'),(31,'Spring','ESH,Clark','1250,2750','F','08:00:00,20:20:00','Monday,Wednesday','morning,night'),(32,'',NULL,'1250','',NULL,NULL,NULL),(33,'Summer','SSB','2250','C','09:30:00',NULL,'afternoon'),(34,'Spring','SSB','2250','B','09:30:00',NULL,'afternoon'),(35,'Spring','SSB','2250','B','09:30:00',NULL,'afternoon'),(36,'Spring','SSB','2250','B','09:30:00',NULL,'afternoon'),(37,'Summer','SSB','2250','C','09:30:00',NULL,'afternoon'),(38,'',NULL,'1250','',NULL,NULL,NULL),(39,'',NULL,'1250','',NULL,NULL,NULL),(40,'Summer',NULL,'2260','B','11:00:00','Wednesday','afternoon');
/*!40000 ALTER TABLE `instructor_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_name`
--

DROP TABLE IF EXISTS `instructor_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_name` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_name`
--

LOCK TABLES `instructor_name` WRITE;
/*!40000 ALTER TABLE `instructor_name` DISABLE KEYS */;
INSERT INTO `instructor_name` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'J');
/*!40000 ALTER TABLE `instructor_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `season` varchar(64) NOT NULL,
  `instructor_input_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor_input_id` (`instructor_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'Fall',NULL),(2,'Summer',NULL),(3,'Spring',NULL),(4,'Winter',NULL);
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekday`
--

DROP TABLE IF EXISTS `weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekday` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `day` int(8) NOT NULL,
  `dayname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekday`
--

LOCK TABLES `weekday` WRITE;
/*!40000 ALTER TABLE `weekday` DISABLE KEYS */;
INSERT INTO `weekday` VALUES (1,0,'Monday'),(2,1,'Tuesday'),(3,2,'Wednesday'),(4,3,'Thursday'),(5,4,'Friday'),(6,5,'Saturday'),(7,6,'Sunday');
/*!40000 ALTER TABLE `weekday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-06 23:25:23
