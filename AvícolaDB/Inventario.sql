CREATE DATABASE  IF NOT EXISTS `inventario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventario`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `id_alimento` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `disp` int NOT NULL,
  PRIMARY KEY (`id_alimento`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (1,'MGR1','Maiz',55),(2,'TR1','Trigo',50),(3,'AV1','Avena',210),(4,'CBD1','Cebada',135),(5,'CNTN1','Centeno',50),(6,'SJA1','Soja',50),(7,'RPLL','Repollo',125),(8,'LCH','Lechuga',187),(9,'HRB','Hierba',300),(10,'ARRZ','Arroz',65),(11,'SPL','Suplemento A',100),(12,'ZNH','Zanahoria',80),(13,'CL','Col',23);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aves`
--

DROP TABLE IF EXISTS `aves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aves` (
  `id_gallina` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `raza` varchar(45) NOT NULL,
  `estatus` varchar(45) NOT NULL,
  `fechanac` varchar(40) NOT NULL,
  PRIMARY KEY (`id_gallina`)
) ENGINE=InnoDB AUTO_INCREMENT=3158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aves`
--

LOCK TABLES `aves` WRITE;
/*!40000 ALTER TABLE `aves` DISABLE KEYS */;
INSERT INTO `aves` VALUES (3126,'allan','dddd','Viva','2022-06-19 20:31:51'),(3127,'Bryan','negro','Viva','2022-06-19 20:35:00'),(3128,'Bryan','negro','Viva','2022-06-19 20:36:11'),(3129,'Y652F','BLANCA','Viva','2022-06-19 20:39:58'),(3130,'YT653','NEGRA','Viva','2022-06-19 21:37:49'),(3131,'LEO','MESSI','Viva','2022-06-19 21:52:11'),(3132,'72919','zzzz','Viva','2022-06-19 22:19:28'),(3133,'ASFR','GRIS','Viva','2022-06-19 23:09:00'),(3134,'ASFR','GRIS','Viva','2022-06-19 23:09:28'),(3135,'21344','sasa','Viva','2022-06-19 23:29:53'),(3136,'dss','piru','Viva','2022-06-19 23:30:10'),(3137,'6548','yova','Viva','2022-06-19 23:30:28'),(3138,'allan','sddee','Viva','2022-06-19 23:44:13'),(3157,'QW2E','Borbonesa','MUERTA','2022-06-23 03:23:06');
/*!40000 ALTER TABLE `aves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `id_medicamento` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `disp` int NOT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES (1,'AGRN','Agrogenta',100),(2,'AGRM','Agromycin',100),(3,'AURM','Aureomycin',100),(4,'CVFX','Coverflox',100),(5,'DFVT','Diflovet',100),(6,'DXMT','Doximutin',100),(7,'ENRF','Enoroflox',100),(8,'SPCT','Spectomix',100),(9,'TYVX','Tylvax',100),(10,'CTFS','Catofos',100),(11,'HMTB','Hematofos',100),(12,'MDVT','Modivitasan',100),(13,'KNDL','Kinodil',100);
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phuevos`
--

DROP TABLE IF EXISTS `phuevos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phuevos` (
  `id_gallina` int NOT NULL,
  `id_huevo` int NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `peso` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id_huevo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phuevos`
--

LOCK TABLES `phuevos` WRITE;
/*!40000 ALTER TABLE `phuevos` DISABLE KEYS */;
INSERT INTO `phuevos` VALUES (33172,1,'BLANCO','28','HOY'),(33172,2,'BALNCO','15','HOY'),(33173,3,'MARRON','23','2022-06-22 06:08:09'),(33174,4,'BLANCO','21','2022-06-22 06:49:29'),(33173,5,'MARRON','21','2022-06-23 03:17:39');
/*!40000 ALTER TABLE `phuevos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'arroz','ENTRADA','12','HOY'),(2,'Maiz','ENTRADA','31','2022-06-21 09:17:46'),(3,'Trigo','ENTRADA','22','2022-06-21 09:18:48'),(4,'Soja','ENTRADA','50','2022-06-21 09:23:32'),(5,'Arroz','ENTRADA','65','2022-06-21 09:31:28'),(6,'Maiz','ENTRADA','10','2022-06-21 09:40:25'),(7,'Maiz','ENTRADA','210','2022-06-21 09:41:24'),(8,'Maiz','ENTRADA','210','2022-06-21 09:41:43'),(9,'Maiz','ENTRADA','10','2022-06-21 09:42:14'),(10,'Maiz','ENTRADA','210','2022-06-21 09:50:26'),(11,'Maiz','SALIDA','200','2022-06-21 09:51:16'),(12,'Maiz','ENTRADA','10','2022-06-21 09:54:55'),(13,'Maiz','ENTRADA','(int)0','2022-06-21 10:02:22'),(14,'Maiz','ENTRADA','(int)0','2022-06-21 10:02:30'),(15,'Maiz','ENTRADA','(int)0','2022-06-21 10:02:37'),(16,'Maiz','ENTRADA','(int)10','2022-06-21 10:04:30'),(17,'Maiz','ENTRADA','(int)30','2022-06-21 10:04:51'),(18,'Maiz','ENTRADA','(int)11','2022-06-21 10:05:33'),(19,'Maiz','ENTRADA','(int)10','2022-06-21 10:08:48'),(20,'Maiz','ENTRADA','(int)20','2022-06-21 10:08:55'),(21,'Maiz','ENTRADA','(int)11','2022-06-21 10:09:14'),(22,'Maiz','ENTRADA','(int)11','2022-06-21 10:10:11'),(23,'Maiz','ENTRADA','(int)11','2022-06-21 10:10:43'),(24,'Maiz','ENTRADA','(int)11','2022-06-21 10:10:56'),(25,'Maiz','ENTRADA','(int)11','2022-06-21 10:11:01'),(26,'Maiz','ENTRADA','(int)11','2022-06-21 10:12:03'),(27,'Maiz','ENTRADA','(int)11','2022-06-21 10:12:07'),(28,'Maiz','ENTRADA','(int)11','2022-06-21 10:12:28'),(29,'Maiz','ENTRADA','(int)20','2022-06-21 10:15:48'),(30,'Maiz','ENTRADA','(int)20','2022-06-21 10:15:56'),(31,'Maiz','ENTRADA','(int)20','2022-06-21 10:16:39'),(32,'Maiz','ENTRADA','(int)11','2022-06-21 10:17:04'),(33,'Maiz','ENTRADA','(int)20','2022-06-21 10:17:30'),(34,'Maiz','ENTRADA','(int)20','2022-06-22 02:36:57'),(35,'Maiz','SALIDA','45','2022-06-23 03:30:30'),(36,'Maiz','ENTRADA','(int)21','2022-06-23 03:33:26'),(37,'Maiz','ENTRADA','(int)21','2022-06-23 03:33:53'),(38,'Maiz','ENTRADA','(int)11','2022-06-23 03:34:12'),(39,'Maiz','ENTRADA','(int)10','2022-06-23 03:49:04'),(40,'Maiz','ENTRADA','(int)45','2022-06-23 03:49:14'),(41,'Maiz','ENTRADA','(int)10','2022-06-23 03:49:45'),(42,'Maiz','ENTRADA','(int)11','2022-06-23 03:51:36'),(43,'Maiz','ENTRADA','(int)46','2022-06-23 03:51:50'),(44,'Maiz','ENTRADA','(int)45','2022-06-23 03:52:44'),(45,'Maiz','ENTRADA','(int)45','2022-06-23 03:53:19'),(46,'Maiz','ENTRADA','10','2022-06-23 04:18:32'),(47,'Maiz','ENTRADA','200','2022-06-23 04:18:46'),(48,'Maiz','SALIDA','200','2022-06-23 04:19:26'),(49,'Maiz','ENTRADA','210','2022-06-23 04:20:08'),(50,'Maiz','SALIDA','100','2022-06-23 04:20:14'),(51,'Maiz','ENTRADA','10','2022-06-23 05:08:41'),(52,'Maiz','SALIDA','10','2022-06-23 05:09:45'),(53,'Agrogenta','ENTRADA','100','2022-06-23 05:29:59'),(54,'Maiz','ENTRADA','10','2022-06-23 05:44:17'),(55,'Maiz','SALIDA','10','2022-06-23 05:44:22');
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrob`
--

DROP TABLE IF EXISTS `registrob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrob` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `cantidad` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrob`
--

LOCK TABLES `registrob` WRITE;
/*!40000 ALTER TABLE `registrob` DISABLE KEYS */;
INSERT INTO `registrob` VALUES (1,'Agrocenta','ENTRADA','10','2022-06-23 04:47:22'),(2,'Agrocenta','ENTRADA','10','2022-06-23 04:48:01'),(3,'Agrocenta','ENTRADA','10','2022-06-23 04:52:14'),(4,'Agromicyn','ENTRADA','10','2022-06-23 04:54:18'),(5,'Agromicyn','ENTRADA','10','2022-06-23 04:57:16'),(6,'Agrocenta','ENTRADA','10','2022-06-23 05:00:43'),(7,'Agrocenta','ENTRADA','10','2022-06-23 05:00:49'),(8,'Agrocenta','ENTRADA','10','2022-06-23 05:04:17'),(9,'Agrocenta','ENTRADA','10','2022-06-23 05:10:13'),(10,'Agrocenta','ENTRADA','10','2022-06-23 05:14:20'),(11,'Agrocenta','ENTRADA','','2022-06-23 05:18:21'),(12,'Agrocenta','ENTRADA','','2022-06-23 05:18:24'),(13,'Agrocenta','ENTRADA','','2022-06-23 05:18:24'),(14,'Agrocenta','ENTRADA','','2022-06-23 05:18:25'),(15,'Agrocenta','ENTRADA','','2022-06-23 05:18:25'),(16,'Agrocenta','ENTRADA','10','2022-06-23 05:18:53'),(17,'Agrocenta','SALIDA','10','2022-06-23 05:24:11'),(18,'Agrogenta','SALIDA','10','2022-06-23 05:29:01'),(19,'Agrogenta','ENTRADA','210','2022-06-23 05:29:12'),(20,'Agrogenta','ENTRADA','100','2022-06-23 05:30:45'),(21,'Agrogenta','ENTRADA','10','2022-06-23 05:30:50'),(22,'Agrogenta','ENTRADA','10','2022-06-23 05:31:03'),(23,'Agrogenta','ENTRADA','200','2022-06-23 05:31:35'),(24,'Agrogenta','ENTRADA','10','2022-06-23 05:31:39'),(25,'Agrogenta','ENTRADA','10','2022-06-23 05:51:53'),(26,'Agrogenta','ENTRADA','10','2022-06-23 05:51:56'),(27,'Agrogenta','ENTRADA','10','2022-06-23 05:52:00'),(28,'Agrogenta','ENTRADA','10','2022-06-23 05:52:21'),(29,'Agrogenta','ENTRADA','10','2022-06-23 05:52:29');
/*!40000 ALTER TABLE `registrob` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 22:53:29
