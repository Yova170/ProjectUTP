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
-- Table structure for table `diariocompras`
--

DROP TABLE IF EXISTS `diariocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariocompras` (
  `idDiarioCompras` int NOT NULL,
  `idFactura` varchar(45) DEFAULT NULL,
  `idProveedor` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ComprasDebido` varchar(45) DEFAULT NULL,
  `ITBMSDebito` varchar(45) DEFAULT NULL,
  `CtsCredito` varchar(45) DEFAULT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariocompras`
--

LOCK TABLES `diariocompras` WRITE;
/*!40000 ALTER TABLE `diariocompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diarioegresos`
--

DROP TABLE IF EXISTS `diarioegresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diarioegresos` (
  `idDiarioEgresos` int NOT NULL,
  `idCheque` varchar(45) DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `GeneralDeb` varchar(45) DEFAULT NULL,
  `Compras` varchar(45) DEFAULT NULL,
  `ITBMS` varchar(45) DEFAULT NULL,
  `CtsPag` varchar(45) DEFAULT NULL,
  `Banco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diarioegresos`
--

LOCK TABLES `diarioegresos` WRITE;
/*!40000 ALTER TABLE `diarioegresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `diarioegresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariogeneral`
--

DROP TABLE IF EXISTS `diariogeneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariogeneral` (
  `idDiarioGeneral` int NOT NULL,
  `idDiarioCompras` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral`),
  UNIQUE KEY `idDiarioCompras_UNIQUE` (`idDiarioCompras`),
  CONSTRAINT `idDiarioCompras` FOREIGN KEY (`idDiarioGeneral`) REFERENCES `diariocompras` (`idDiarioCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariogeneral`
--

LOCK TABLES `diariogeneral` WRITE;
/*!40000 ALTER TABLE `diariogeneral` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariogeneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariogeneral2`
--

DROP TABLE IF EXISTS `diariogeneral2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariogeneral2` (
  `idDiarioGeneral1` int NOT NULL,
  `idDiarioVentas` int DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral1`),
  KEY `idDiarioVentas_idx` (`idDiarioVentas`),
  CONSTRAINT `idDiarioVentas` FOREIGN KEY (`idDiarioVentas`) REFERENCES `diarioventas` (`idDiarioVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariogeneral2`
--

LOCK TABLES `diariogeneral2` WRITE;
/*!40000 ALTER TABLE `diariogeneral2` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariogeneral2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariogeneral3`
--

DROP TABLE IF EXISTS `diariogeneral3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariogeneral3` (
  `idDiarioGeneral3` int NOT NULL,
  `idiarioEgresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneral3`),
  KEY `idDiarioEgresos_idx` (`idiarioEgresos`),
  CONSTRAINT `idDiarioEgresos` FOREIGN KEY (`idiarioEgresos`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariogeneral3`
--

LOCK TABLES `diariogeneral3` WRITE;
/*!40000 ALTER TABLE `diariogeneral3` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariogeneral3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariogeneraln`
--

DROP TABLE IF EXISTS `diariogeneraln`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariogeneraln` (
  `idDiarioGeneralN` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioGeneralN`),
  KEY `idDiarioIngresos1_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariogeneraln`
--

LOCK TABLES `diariogeneraln` WRITE;
/*!40000 ALTER TABLE `diariogeneraln` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariogeneraln` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diarioingresos`
--

DROP TABLE IF EXISTS `diarioingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diarioingresos` (
  `idDiarioIngresos` int NOT NULL,
  `idDoc` int DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `GeneralCredit` varchar(45) DEFAULT NULL,
  `Banco` varchar(45) DEFAULT NULL,
  `CtsCob` varchar(45) DEFAULT NULL,
  `ITBMS` varchar(45) DEFAULT NULL,
  `Ventas` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diarioingresos`
--

LOCK TABLES `diarioingresos` WRITE;
/*!40000 ALTER TABLE `diarioingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `diarioingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diariosmayorgeneralitbms2`
--

DROP TABLE IF EXISTS `diariosmayorgeneralitbms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diariosmayorgeneralitbms2` (
  `idDiariosMayorGeneralITBMS2` int NOT NULL,
  `idDiarioEgresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiariosMayorGeneralITBMS2`),
  KEY `idDiarioEgresos4_idx` (`idDiarioEgresos`),
  CONSTRAINT `idDiarioEgresos4` FOREIGN KEY (`idDiarioEgresos`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diariosmayorgeneralitbms2`
--

LOCK TABLES `diariosmayorgeneralitbms2` WRITE;
/*!40000 ALTER TABLE `diariosmayorgeneralitbms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `diariosmayorgeneralitbms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diarioventas`
--

DROP TABLE IF EXISTS `diarioventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diarioventas` (
  `idDiarioVentas` int NOT NULL,
  `idFactura` varchar(45) DEFAULT NULL,
  `idCliente` varchar(45) DEFAULT NULL,
  `Fehca` date DEFAULT NULL,
  `CuentasCob` varchar(45) DEFAULT NULL,
  `ITBMS` varchar(45) DEFAULT NULL,
  `Ventas` varchar(45) DEFAULT NULL,
  `Condicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDiarioVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diarioventas`
--

LOCK TABLES `diarioventas` WRITE;
/*!40000 ALTER TABLE `diarioventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `diarioventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorcuentascob2`
--

DROP TABLE IF EXISTS `mayorcuentascob2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorcuentascob2` (
  `idMayorCuentasPag2` int NOT NULL,
  `idDiarioVentas` int DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorCuentasPag2`),
  KEY `idDiarioVentas2_idx` (`idDiarioVentas`),
  CONSTRAINT `idDiarioVentas2` FOREIGN KEY (`idDiarioVentas`) REFERENCES `diarioventas` (`idDiarioVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorcuentascob2`
--

LOCK TABLES `mayorcuentascob2` WRITE;
/*!40000 ALTER TABLE `mayorcuentascob2` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorcuentascob2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneral/general7`
--

DROP TABLE IF EXISTS `mayorgeneral/general7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneral/general7` (
  `idMayorGeneral/General7` int NOT NULL,
  `idDiarioVentas` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneral/General7`),
  KEY `idDiarioEgresos1_idx` (`idDiarioVentas`),
  CONSTRAINT `idDiarioEgresos1` FOREIGN KEY (`idDiarioVentas`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneral/general7`
--

LOCK TABLES `mayorgeneral/general7` WRITE;
/*!40000 ALTER TABLE `mayorgeneral/general7` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneral/general7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneral/general8`
--

DROP TABLE IF EXISTS `mayorgeneral/general8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneral/general8` (
  `idMayorGeneral/General8` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneral/General8`),
  KEY `idDiarioIngresos1_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos1` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneral/general8`
--

LOCK TABLES `mayorgeneral/general8` WRITE;
/*!40000 ALTER TABLE `mayorgeneral/general8` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneral/general8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralbanc6`
--

DROP TABLE IF EXISTS `mayorgeneralbanc6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralbanc6` (
  `idMayorGeneralBanc6` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralBanc6`),
  KEY `idDiarioIngresos2_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos2` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralbanc6`
--

LOCK TABLES `mayorgeneralbanc6` WRITE;
/*!40000 ALTER TABLE `mayorgeneralbanc6` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralbanc6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralbanco6`
--

DROP TABLE IF EXISTS `mayorgeneralbanco6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralbanco6` (
  `idMayorGeneralBanco6` int NOT NULL,
  `idDiarioEgresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralBanco6`),
  KEY `idDiarioEgresos5_idx` (`idDiarioEgresos`),
  CONSTRAINT `idDiarioEgresos5` FOREIGN KEY (`idDiarioEgresos`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralbanco6`
--

LOCK TABLES `mayorgeneralbanco6` WRITE;
/*!40000 ALTER TABLE `mayorgeneralbanco6` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralbanco6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralcompras`
--

DROP TABLE IF EXISTS `mayorgeneralcompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralcompras` (
  `idMayorGeneralCompras` int NOT NULL,
  `idDiarioCompras` int DEFAULT NULL,
  `Fehca` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCompras`),
  KEY `Fecha_idx` (`idDiarioCompras`),
  CONSTRAINT `Fecha` FOREIGN KEY (`idDiarioCompras`) REFERENCES `diariocompras` (`idDiarioCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralcompras`
--

LOCK TABLES `mayorgeneralcompras` WRITE;
/*!40000 ALTER TABLE `mayorgeneralcompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralcompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralcompras1`
--

DROP TABLE IF EXISTS `mayorgeneralcompras1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralcompras1` (
  `idMayorGeneralCompras1` int NOT NULL,
  `idDiarioEgresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCompras1`),
  KEY `idDiarioEgresos2_idx` (`idDiarioEgresos`),
  CONSTRAINT `idDiarioEgresos2` FOREIGN KEY (`idDiarioEgresos`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralcompras1`
--

LOCK TABLES `mayorgeneralcompras1` WRITE;
/*!40000 ALTER TABLE `mayorgeneralcompras1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralcompras1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralctsporpag3`
--

DROP TABLE IF EXISTS `mayorgeneralctsporpag3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralctsporpag3` (
  `idMayorGeneralCtsPorPag3` int NOT NULL,
  `idDiarioEgresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCtsPorPag3`),
  KEY `idDiarioEgresos6_idx` (`idDiarioEgresos`),
  CONSTRAINT `idDiarioEgresos6` FOREIGN KEY (`idDiarioEgresos`) REFERENCES `diarioegresos` (`idDiarioEgresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralctsporpag3`
--

LOCK TABLES `mayorgeneralctsporpag3` WRITE;
/*!40000 ALTER TABLE `mayorgeneralctsporpag3` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralctsporpag3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralcuentaspag`
--

DROP TABLE IF EXISTS `mayorgeneralcuentaspag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralcuentaspag` (
  `idMayorGeneralCuentasPag` int NOT NULL,
  `idDiarioCompras` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCuentasPag`),
  KEY `idDiarioCompras_idx` (`idDiarioCompras`),
  CONSTRAINT `idDiarioCompras1` FOREIGN KEY (`idDiarioCompras`) REFERENCES `diariocompras` (`idDiarioCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralcuentaspag`
--

LOCK TABLES `mayorgeneralcuentaspag` WRITE;
/*!40000 ALTER TABLE `mayorgeneralcuentaspag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralcuentaspag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralcuentcob`
--

DROP TABLE IF EXISTS `mayorgeneralcuentcob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralcuentcob` (
  `idMayorGeneralCuentCob` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralCuentCob`),
  KEY `idDiarioIngresos3_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos3` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralcuentcob`
--

LOCK TABLES `mayorgeneralcuentcob` WRITE;
/*!40000 ALTER TABLE `mayorgeneralcuentcob` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralcuentcob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralitbms`
--

DROP TABLE IF EXISTS `mayorgeneralitbms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralitbms` (
  `idMayorGeneralITBMS` int NOT NULL,
  `idDiarioCompras` int DEFAULT NULL,
  `Fehca` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS`),
  KEY `idDiarioCompras_idx` (`idDiarioCompras`),
  CONSTRAINT `Fecha1` FOREIGN KEY (`idDiarioCompras`) REFERENCES `diariocompras` (`idDiarioCompras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralitbms`
--

LOCK TABLES `mayorgeneralitbms` WRITE;
/*!40000 ALTER TABLE `mayorgeneralitbms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralitbms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralitbms1`
--

DROP TABLE IF EXISTS `mayorgeneralitbms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralitbms1` (
  `idMayorGeneralITBMS2` int NOT NULL,
  `idDiarioVentas` int DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS2`),
  KEY `idDiarioVentas1_idx` (`idDiarioVentas`),
  CONSTRAINT `idDiarioVentas1` FOREIGN KEY (`idDiarioVentas`) REFERENCES `diarioventas` (`idDiarioVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralitbms1`
--

LOCK TABLES `mayorgeneralitbms1` WRITE;
/*!40000 ALTER TABLE `mayorgeneralitbms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralitbms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralitbms2`
--

DROP TABLE IF EXISTS `mayorgeneralitbms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralitbms2` (
  `idMayorGeneralITBMS2` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralITBMS2`),
  KEY `idDiarioIngresos5_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos5` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralitbms2`
--

LOCK TABLES `mayorgeneralitbms2` WRITE;
/*!40000 ALTER TABLE `mayorgeneralitbms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralitbms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralventas`
--

DROP TABLE IF EXISTS `mayorgeneralventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralventas` (
  `idMayorGeneralVentas` int NOT NULL,
  `idDiarioVentas` int DEFAULT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralVentas`),
  KEY `idDiarioVentas3_idx` (`idDiarioVentas`),
  CONSTRAINT `idDiarioVentas3` FOREIGN KEY (`idDiarioVentas`) REFERENCES `diarioventas` (`idDiarioVentas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralventas`
--

LOCK TABLES `mayorgeneralventas` WRITE;
/*!40000 ALTER TABLE `mayorgeneralventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mayorgeneralventas5`
--

DROP TABLE IF EXISTS `mayorgeneralventas5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mayorgeneralventas5` (
  `idMayorGeneralVentas5` int NOT NULL,
  `idDiarioIngresos` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Debito` varchar(45) DEFAULT NULL,
  `Credito` varchar(45) DEFAULT NULL,
  `Saldo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMayorGeneralVentas5`),
  KEY `idDiarioIngresos4_idx` (`idDiarioIngresos`),
  CONSTRAINT `idDiarioIngresos4` FOREIGN KEY (`idDiarioIngresos`) REFERENCES `diarioingresos` (`idDiarioIngresos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mayorgeneralventas5`
--

LOCK TABLES `mayorgeneralventas5` WRITE;
/*!40000 ALTER TABLE `mayorgeneralventas5` DISABLE KEYS */;
/*!40000 ALTER TABLE `mayorgeneralventas5` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18 21:42:04
