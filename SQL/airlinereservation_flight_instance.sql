CREATE DATABASE  IF NOT EXISTS `airlinereservation` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `airlinereservation`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: airlinereservation
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `flight_instance`
--

DROP TABLE IF EXISTS `flight_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_instance` (
  `Flight_number` int(11) NOT NULL,
  `_Date` date NOT NULL,
  `Number_of_available_seats` int(11) NOT NULL,
  `Airplane_id` int(11) NOT NULL,
  `Departure_time` time NOT NULL,
  `Arrival_time` time NOT NULL,
  PRIMARY KEY (`Flight_number`,`_Date`),
  KEY `fk_airplane_id` (`Airplane_id`),
  CONSTRAINT `fk_Flightinstance_flight` FOREIGN KEY (`Flight_number`) REFERENCES `flight` (`Flight_number`),
  CONSTRAINT `fk_airplane_id` FOREIGN KEY (`Airplane_id`) REFERENCES `airplane` (`Airplane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_instance`
--

LOCK TABLES `flight_instance` WRITE;
/*!40000 ALTER TABLE `flight_instance` DISABLE KEYS */;
INSERT INTO `flight_instance` VALUES (20,'2015-12-12',13,1431,'18:09:00','21:16:00'),(20,'2015-12-13',12,1431,'18:09:00','21:16:00'),(199,'2015-05-31',16,3964,'07:52:00','10:36:00'),(536,'2015-05-31',12,3633,'07:59:00','10:32:00'),(811,'2015-05-31',15,3907,'06:46:00','08:27:00');
/*!40000 ALTER TABLE `flight_instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-31  5:15:58
