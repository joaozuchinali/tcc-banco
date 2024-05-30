-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbmain
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `equipeuso`
--

DROP TABLE IF EXISTS `equipeuso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipeuso` (
  `idequipeuso` int NOT NULL AUTO_INCREMENT,
  `idcredencial` int NOT NULL,
  `idequipe` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idequipeuso`),
  KEY `fk_equipeuso_credencial1_idx` (`idcredencial`),
  KEY `fk_equipeuso_equipe1_idx` (`idequipe`),
  KEY `fk_equipeuso_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_equipeuso_credencial1` FOREIGN KEY (`idcredencial`) REFERENCES `credencial` (`idcredencial`),
  CONSTRAINT `fk_equipeuso_equipe1` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`),
  CONSTRAINT `fk_equipeuso_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipeuso`
--

LOCK TABLES `equipeuso` WRITE;
/*!40000 ALTER TABLE `equipeuso` DISABLE KEYS */;
INSERT INTO `equipeuso` VALUES (1,1,1,1),(6,2,4,6),(7,2,5,6),(10,1,4,7),(12,1,4,8),(13,2,7,6);
/*!40000 ALTER TABLE `equipeuso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 14:29:11
