CREATE DATABASE  IF NOT EXISTS `maraya` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `maraya`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: maraya
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `especializaciones`
--

DROP TABLE IF EXISTS `especializaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especializaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `especializacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `especializacion` (`especializacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especializaciones`
--

LOCK TABLES `especializaciones` WRITE;
/*!40000 ALTER TABLE `especializaciones` DISABLE KEYS */;
INSERT INTO `especializaciones` VALUES (2,'Cardiólogo'),(1,'Endocrino'),(5,'Ginecólogo'),(3,'Médico de cabecera'),(4,'Neurocirujano');
/*!40000 ALTER TABLE `especializaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruposmedicos`
--

DROP TABLE IF EXISTS `gruposmedicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruposmedicos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `paciente` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`),
  KEY `paciente` (`paciente`),
  CONSTRAINT `gruposmedicos_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`),
  CONSTRAINT `gruposmedicos_ibfk_2` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`NSS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposmedicos`
--

LOCK TABLES `gruposmedicos` WRITE;
/*!40000 ALTER TABLE `gruposmedicos` DISABLE KEYS */;
INSERT INTO `gruposmedicos` VALUES (1,'0000000003','0000000000000002'),(2,'0000000003','45123qweasdzxc14'),(3,'123qweasdx','45123qweasdzxc12');
/*!40000 ALTER TABLE `gruposmedicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nHistorial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `informacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nHistorial` (`nHistorial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` VALUES (1,'0000000000000001','El paciente sufre de bajones de tensión al ver sangre','2014-04-18'),(2,'0000000000000002','El paciente sufre de Diabetes','2014-04-18');
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `nColegiado` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `especializacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`nColegiado`),
  KEY `especializacion` (`especializacion`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especializacion`) REFERENCES `especializaciones` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES ('0000000000000001','42102329H','Javier','Ordíñez Martínez',5),('0000000000000002','42102321L','Paco','Domínguez Guillen',1),('45123qweasdzxc12','69017485L','Dani Cuenca','Fernández Rodríguez',3),('45123qweasdzxc14','69017485X','Nathan','Explosion',4);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `NSS` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DNI` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `historial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`NSS`),
  KEY `historial` (`historial`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`historial`) REFERENCES `historial` (`nHistorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('0000000003','76918475L','Edgar','Pérez Ferrando','1989-12-28','0000000000000001'),('123qweasdc','79019418L','Francisco José','Dominguez Ruiz','2010-01-08',NULL),('123qweasdx','79019417L','Francisco Jesus','Dominguez Ruiz','1993-06-12','0000000000000002');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_historial`
--

DROP TABLE IF EXISTS `registro_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_historial` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `historial` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenido` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`),
  KEY `historial` (`historial`),
  CONSTRAINT `registro_historial_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`),
  CONSTRAINT `registro_historial_ibfk_2` FOREIGN KEY (`historial`) REFERENCES `historial` (`nHistorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_historial`
--

LOCK TABLES `registro_historial` WRITE;
/*!40000 ALTER TABLE `registro_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_medicos`
--

DROP TABLE IF EXISTS `usuarios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_medicos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medico` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `medico` (`medico`),
  CONSTRAINT `usuarios_medicos_ibfk_1` FOREIGN KEY (`medico`) REFERENCES `medicos` (`nColegiado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_medicos`
--

LOCK TABLES `usuarios_medicos` WRITE;
/*!40000 ALTER TABLE `usuarios_medicos` DISABLE KEYS */;
INSERT INTO `usuarios_medicos` VALUES (1,'Paco','1234','0000000000000002'),(2,'Pulgy','1234','0000000000000001');
/*!40000 ALTER TABLE `usuarios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_pacientes`
--

DROP TABLE IF EXISTS `usuarios_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_pacientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paciente` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `paciente` (`paciente`),
  CONSTRAINT `usuarios_pacientes_ibfk_1` FOREIGN KEY (`paciente`) REFERENCES `paciente` (`NSS`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_pacientes`
--

LOCK TABLES `usuarios_pacientes` WRITE;
/*!40000 ALTER TABLE `usuarios_pacientes` DISABLE KEYS */;
INSERT INTO `usuarios_pacientes` VALUES (1,'Edgar','1234','0000000003'),(2,'Chiki','1234','123qweasdx');
/*!40000 ALTER TABLE `usuarios_pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-20 22:23:11
