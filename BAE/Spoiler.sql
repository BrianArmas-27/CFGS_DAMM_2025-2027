CREATE DATABASE  IF NOT EXISTS `Empresa2017BAE` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `Empresa2017BAE`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: Empresa2017BAE
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `Ndep` int(11) NOT NULL,
  `Nombdep` varchar(20) NOT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `Jefe` int(11) DEFAULT NULL,
  `Presupuesto` decimal(10,2) DEFAULT '10000.00',
  PRIMARY KEY (`Ndep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (10,'CONTABILIDAD        ','MADRID              ',7566,10000.00),(20,'INVESTIGACION       ','BARCELONA           ',7788,10000.00),(30,'VENTAS              ','SEVILLA             ',7499,10000.00),(40,'OPERACIONES         ','HUELVA              ',7782,10000.00),(50,'MARKETING           ','MADRID              ',7839,10000.00),(60,'PUBLICIDAD','SEVILLA',7698,10000.00),(70,'RECURSOS HUMANOS','MADRID',7001,10000.00);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--
