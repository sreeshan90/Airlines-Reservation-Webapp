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
-- Table structure for table `can_land`
--

DROP TABLE IF EXISTS `can_land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `can_land` (
  `Airplane_type_name` varchar(10) NOT NULL,
  `Airport_code` varchar(10) NOT NULL,
  PRIMARY KEY (`Airplane_type_name`,`Airport_code`),
  KEY `fk_Canland_flight` (`Airport_code`),
  CONSTRAINT `fk_Canland_airplanetype` FOREIGN KEY (`Airplane_type_name`) REFERENCES `airplane_type` (`Airplane_type_name`),
  CONSTRAINT `fk_Canland_flight` FOREIGN KEY (`Airport_code`) REFERENCES `airport` (`Airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `can_land`
--

LOCK TABLES `can_land` WRITE;
/*!40000 ALTER TABLE `can_land` DISABLE KEYS */;
INSERT INTO `can_land` VALUES ('A36','ATL'),('A38','ATL'),('L76','ATL'),('L77','ATL'),('M99','ATL'),('MM2','ATL'),('A36','AUS'),('A38','AUS'),('L76','AUS'),('L77','AUS'),('M99','AUS'),('MM2','AUS'),('A36','BNA'),('L76','BNA'),('L77','BNA'),('M99','BNA'),('MM2','BNA'),('A36','BOS'),('A38','BOS'),('L76','BOS'),('L77','BOS'),('M99','BOS'),('MM2','BOS'),('A36','BWI'),('A38','BWI'),('L76','BWI'),('L77','BWI'),('M99','BWI'),('MM2','BWI'),('A36','CLE'),('L76','CLE'),('L77','CLE'),('M99','CLE'),('MM2','CLE'),('A36','CLT'),('L76','CLT'),('L77','CLT'),('M99','CLT'),('MM2','CLT'),('A36','DCA'),('A38','DCA'),('L76','DCA'),('L77','DCA'),('M99','DCA'),('MM2','DCA'),('A36','DEN'),('L76','DEN'),('L77','DEN'),('M99','DEN'),('MM2','DEN'),('A36','DFW'),('A38','DFW'),('L76','DFW'),('L77','DFW'),('M99','DFW'),('MM2','DFW'),('A36','DTW'),('L76','DTW'),('L77','DTW'),('M99','DTW'),('MM2','DTW'),('A36','EWR'),('L76','EWR'),('L77','EWR'),('M99','EWR'),('MM2','EWR'),('A36','FLL'),('L76','FLL'),('L77','FLL'),('M99','FLL'),('MM2','FLL'),('A36','HNL'),('A38','HNL'),('L76','HNL'),('L77','HNL'),('M99','HNL'),('MM2','HNL'),('A36','HOU'),('A38','HOU'),('L76','HOU'),('L77','HOU'),('M99','HOU'),('MM2','HOU'),('A36','IAD'),('L76','IAD'),('L77','IAD'),('M99','IAD'),('MM2','IAD'),('A36','IAH'),('L76','IAH'),('L77','IAH'),('M99','IAH'),('MM2','IAH'),('A36','JFK'),('A38','JFK'),('L76','JFK'),('L77','JFK'),('M99','JFK'),('MM2','JFK'),('A36','LAS'),('L76','LAS'),('L77','LAS'),('M99','LAS'),('MM2','LAS'),('A36','LAX'),('A38','LAX'),('L76','LAX'),('L77','LAX'),('M99','LAX'),('MM2','LAX'),('A36','LGA'),('A38','LGA'),('L76','LGA'),('L77','LGA'),('M99','LGA'),('MM2','LGA'),('A36','MCI'),('L76','MCI'),('L77','MCI'),('M99','MCI'),('MM2','MCI'),('A36','MCO'),('L76','MCO'),('L77','MCO'),('M99','MCO'),('MM2','MCO'),('A36','MDW'),('L76','MDW'),('L77','MDW'),('M99','MDW'),('MM2','MDW'),('A36','MIA'),('A38','MIA'),('L76','MIA'),('L77','MIA'),('M99','MIA'),('MM2','MIA'),('A36','MSP'),('L76','MSP'),('L77','MSP'),('M99','MSP'),('MM2','MSP'),('A36','OAK'),('L76','OAK'),('L77','OAK'),('M99','OAK'),('MM2','OAK'),('A36','ORD'),('L76','ORD'),('L77','ORD'),('M99','ORD'),('MM2','ORD'),('A36','PDX'),('L76','PDX'),('L77','PDX'),('M99','PDX'),('MM2','PDX'),('A36','PHL'),('L76','PHL'),('L77','PHL'),('M99','PHL'),('MM2','PHL'),('A36','PHX'),('L76','PHX'),('L77','PHX'),('M99','PHX'),('MM2','PHX'),('A36','RDU'),('L76','RDU'),('L77','RDU'),('M99','RDU'),('MM2','RDU'),('A36','SAN'),('A38','SAN'),('L76','SAN'),('L77','SAN'),('M99','SAN'),('MM2','SAN'),('A36','SEA'),('A38','SEA'),('L76','SEA'),('L77','SEA'),('M99','SEA'),('MM2','SEA'),('A36','SFO'),('A38','SFO'),('L76','SFO'),('L77','SFO'),('M99','SFO'),('MM2','SFO'),('A36','SLC'),('L76','SLC'),('L77','SLC'),('M99','SLC'),('MM2','SLC'),('A36','SMF'),('L76','SMF'),('L77','SMF'),('M99','SMF'),('MM2','SMF'),('A36','SNA'),('L76','SNA'),('L77','SNA'),('M99','SNA'),('MM2','SNA'),('A36','STL'),('L76','STL'),('L77','STL'),('M99','STL'),('MM2','STL'),('A36','TPA'),('L76','TPA'),('L77','TPA'),('M99','TPA'),('MM2','TPA');
/*!40000 ALTER TABLE `can_land` ENABLE KEYS */;
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
