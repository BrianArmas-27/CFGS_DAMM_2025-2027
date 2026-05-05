CREATE DATABASE  IF NOT EXISTS `AlmacenSL` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `AlmacenSL`;
-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: AlmacenSL
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `Pnum` char(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Pnombre` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Color` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Peso` int(11) DEFAULT NULL,
  `Ciudad` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Precio` decimal(8,2) DEFAULT NULL,
  `Unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('P1','Tuerca','Rojo',12,'Londres',3.00,1500),('P2','Perno','Verde',17,'Paris',5.00,1300),('P3','Birlo','Azul',17,'Roma',10.00,1400),('P4','Birlo','Rojo',14,'Londres',11.00,2000),('P5','Leva','Azul',12,'Paris',50.00,1400),('P6','Engrane','Rojo',19,'Londres',20.00,1100),('P7','Tuerca','Verde',10,'Madrid',10.00,1300),('P8','Torno','Negro',60,'Madrid',90.00,1200);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministrador`
--

DROP TABLE IF EXISTS `suministrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suministrador` (
  `Snum` char(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Snombre` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `Situacion` tinyint(4) DEFAULT NULL,
  `Ciudad` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `FechaContacto` date DEFAULT NULL,
  `Movil` char(9) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`Snum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministrador`
--

LOCK TABLES `suministrador` WRITE;
/*!40000 ALTER TABLE `suministrador` DISABLE KEYS */;
INSERT INTO `suministrador` VALUES ('S1','Salazar',20,'Londres','2010-02-05','675112224','salazar20@gmail.com'),('S2','Jaime',10,'Paris','2000-10-05','642852123','jaime10@gmail.com'),('S3','Bernal',30,'Paris','2010-01-24','612854125',NULL),('S4','Corona',20,'Londres','1995-05-25','689541254','corona20@gmail.com'),('S5','Aldana',30,'Atenas','2015-10-25','698541236','aldana30@gmail.com'),('S6','Paco',30,'Madrid','2010-10-12','684125366',NULL),('S7','Antonio',10,'Londres','2011-05-03','689541123',NULL);
/*!40000 ALTER TABLE `suministrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `Snum` char(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Pnum` char(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pnum`,`Snum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES ('S1','P1',300),('S2','P1',300),('S7','P1',100),('S1','P2',200),('S2','P2',400),('S3','P2',200),('S4','P2',200),('S7','P2',50),('S1','P3',400),('S3','P3',50),('S1','P4',200),('S4','P4',300),('S7','P4',10),('S1','P5',100),('S1','P6',100),('S1','P7',500),('S1','P8',400);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-17 23:35:40

