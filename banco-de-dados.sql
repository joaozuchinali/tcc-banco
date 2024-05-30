CREATE DATABASE  IF NOT EXISTS `dbmain` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbmain`;
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
-- Table structure for table `credencial`
--

DROP TABLE IF EXISTS `credencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencial` (
  `idcredencial` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`idcredencial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencial`
--

LOCK TABLES `credencial` WRITE;
/*!40000 ALTER TABLE `credencial` DISABLE KEYS */;
INSERT INTO `credencial` VALUES (1,'User'),(2,'Admin'),(3,'Super Admin');
/*!40000 ALTER TABLE `credencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `idequipe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idstatus` int NOT NULL,
  PRIMARY KEY (`idequipe`),
  KEY `fk_equipe_equipestatus1_idx` (`idstatus`),
  CONSTRAINT `fk_equipe_equipestatus1` FOREIGN KEY (`idstatus`) REFERENCES `equipestatus` (`idequipestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (10,'Equipe 1',1);
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipestatus`
--

DROP TABLE IF EXISTS `equipestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipestatus` (
  `idequipestatus` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idequipestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipestatus`
--

LOCK TABLES `equipestatus` WRITE;
/*!40000 ALTER TABLE `equipestatus` DISABLE KEYS */;
INSERT INTO `equipestatus` VALUES (1,'Ativo'),(2,'Inativo');
/*!40000 ALTER TABLE `equipestatus` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipeuso`
--

LOCK TABLES `equipeuso` WRITE;
/*!40000 ALTER TABLE `equipeuso` DISABLE KEYS */;
INSERT INTO `equipeuso` VALUES (1,2,10,10);
/*!40000 ALTER TABLE `equipeuso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `idprojeto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `identificador` varchar(45) NOT NULL,
  `codigo` int NOT NULL,
  `idequipe` int NOT NULL,
  `idstatus` int NOT NULL,
  PRIMARY KEY (`idprojeto`),
  KEY `fk_projeto_equipe1_idx` (`idequipe`),
  KEY `fk_projeto_projetostatus1_idx` (`idstatus`),
  CONSTRAINT `fk_projeto_equipe1` FOREIGN KEY (`idequipe`) REFERENCES `equipe` (`idequipe`),
  CONSTRAINT `fk_projeto_projetostatus1` FOREIGN KEY (`idstatus`) REFERENCES `projetostatus` (`idprojetostatus`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (8,'Projeto 1','BIYKENXZIH',344562,10,1);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projetostatus`
--

DROP TABLE IF EXISTS `projetostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projetostatus` (
  `idprojetostatus` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idprojetostatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projetostatus`
--

LOCK TABLES `projetostatus` WRITE;
/*!40000 ALTER TABLE `projetostatus` DISABLE KEYS */;
INSERT INTO `projetostatus` VALUES (1,'Ativo'),(2,'Inativo');
/*!40000 ALTER TABLE `projetostatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registronavegacao`
--

DROP TABLE IF EXISTS `registronavegacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registronavegacao` (
  `idregistronavegacao` int NOT NULL AUTO_INCREMENT,
  `acesso` bigint NOT NULL,
  `dominio` varchar(200) NOT NULL,
  `anonimo` int NOT NULL,
  `titulo` text NOT NULL,
  `url` text NOT NULL,
  `favicon` text,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `useragent` text NOT NULL,
  `appversion` text NOT NULL,
  `contype` varchar(45) NOT NULL,
  `idusopesquisados` int NOT NULL,
  `idprojeto` int NOT NULL,
  PRIMARY KEY (`idregistronavegacao`),
  KEY `fk_registronavegacao_usopesquisados1_idx` (`idusopesquisados`),
  KEY `fk_registronavegacao_projeto1_idx` (`idprojeto`),
  CONSTRAINT `fk_registronavegacao_projeto1` FOREIGN KEY (`idprojeto`) REFERENCES `projeto` (`idprojeto`),
  CONSTRAINT `fk_registronavegacao_usopesquisados1` FOREIGN KEY (`idusopesquisados`) REFERENCES `usopesquisados` (`idusopesquisados`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registronavegacao`
--

LOCK TABLES `registronavegacao` WRITE;
/*!40000 ALTER TABLE `registronavegacao` DISABLE KEYS */;
INSERT INTO `registronavegacao` VALUES (1,1716663717901,'extensions',0,'Extensões','chrome://extensions/','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(2,1716663737522,'www.youtube.com',0,'(13) Disney\'s Most Advanced Animatronics – You\'ll Be Amazed - YouTube','https://www.youtube.com/watch?v=QjXIgdn6a_0','https://www.youtube.com/s/desktop/aef0ced3/img/favicon_32x32.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(3,1716663738490,'www.youtube.com',0,'(13) YouTube','https://www.youtube.com/','https://www.youtube.com/s/desktop/aef0ced3/img/favicon_32x32.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(4,1716663739133,'drive.google.com',0,'pre-banca - Google Drive','https://drive.google.com/drive/u/1/folders/1SJZzBLcmJ4E4qgb0f4P5f4qSTiDA1XHi','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(5,1716663739826,'docs.google.com',0,'Hotmail - Documentos Google','https://docs.google.com/document/d/1vdpbbTFDbPvIMxfwjhl6DSmVDmTATtjw05wB59t7mZA/edit','https://ssl.gstatic.com/docs/documents/images/kix-favicon-2023q4.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(6,1716663740547,'drive.google.com',0,'Ginga Eiyuu Densetsu - Google Drive','https://drive.google.com/drive/u/0/folders/1lp-4GdJLUPlYWI8AoTwqITI2MeF0O0yw','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(7,1716663740983,'pt.overleaf.com',0,'Seus Projetos - Overleaf, Editor LaTeX Online','https://pt.overleaf.com/project','https://pt.overleaf.com/favicon.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(8,1716663742571,'drive.google.com',0,'Ginga Eiyuu Densetsu - Google Drive','https://drive.google.com/drive/u/0/folders/1lp-4GdJLUPlYWI8AoTwqITI2MeF0O0yw','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(9,1716663743100,'docs.google.com',0,'Hotmail - Documentos Google','https://docs.google.com/document/d/1vdpbbTFDbPvIMxfwjhl6DSmVDmTATtjw05wB59t7mZA/edit','https://ssl.gstatic.com/docs/documents/images/kix-favicon-2023q4.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(10,1716663743742,'drive.google.com',0,'pre-banca - Google Drive','https://drive.google.com/drive/u/1/folders/1SJZzBLcmJ4E4qgb0f4P5f4qSTiDA1XHi','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(11,1716663744332,'www.youtube.com',0,'(13) YouTube','https://www.youtube.com/','https://www.youtube.com/s/desktop/aef0ced3/img/favicon_32x32.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(12,1716663744994,'www.youtube.com',0,'(13) Disney\'s Most Advanced Animatronics – You\'ll Be Amazed - YouTube','https://www.youtube.com/watch?v=QjXIgdn6a_0','https://www.youtube.com/s/desktop/aef0ced3/img/favicon_32x32.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(13,1716663746934,'www.youtube.com',0,'(13) YouTube','https://www.youtube.com/','https://www.youtube.com/s/desktop/aef0ced3/img/favicon_32x32.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(14,1716663747472,'drive.google.com',0,'pre-banca - Google Drive','https://drive.google.com/drive/u/1/folders/1SJZzBLcmJ4E4qgb0f4P5f4qSTiDA1XHi','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(15,1716663748027,'docs.google.com',0,'Hotmail - Documentos Google','https://docs.google.com/document/d/1vdpbbTFDbPvIMxfwjhl6DSmVDmTATtjw05wB59t7mZA/edit','https://ssl.gstatic.com/docs/documents/images/kix-favicon-2023q4.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(16,1716663748535,'drive.google.com',0,'Ginga Eiyuu Densetsu - Google Drive','https://drive.google.com/drive/u/0/folders/1lp-4GdJLUPlYWI8AoTwqITI2MeF0O0yw','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(17,1716663749187,'pt.overleaf.com',0,'Seus Projetos - Overleaf, Editor LaTeX Online','https://pt.overleaf.com/project','https://pt.overleaf.com/favicon.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(18,1716663759252,'pt.wikipedia.org',0,'Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Wikip%C3%A9dia:P%C3%A1gina_principal','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(19,1716663767354,'pt.wikipedia.org',0,'Dia da Independência – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Dia_da_Independ%C3%AAncia','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(20,1716663829309,'g1.globo.com',0,'g1.globo.com','https://g1.globo.com/','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(21,1716663855747,'g1.globo.com',0,'VÍDEO: Casal reage a assalto e dá surra em assaltantes em Uberlândia | Triângulo Mineiro | G1','https://g1.globo.com/mg/triangulo-mineiro/noticia/2024/05/25/video-casal-reage-a-assalto-e-da-surra-em-assaltantes-em-uberlandia.ghtml','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(22,1716663869135,'pt.wikipedia.org',0,'Dia da Independência – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Dia_da_Independ%C3%AAncia','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(23,1716663871566,'pt.wikipedia.org',0,'Dia da Independência – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Dia_da_Independ%C3%AAncia','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(24,1716664167788,'docs.google.com',0,'Hotmail - Documentos Google','https://docs.google.com/document/d/1vdpbbTFDbPvIMxfwjhl6DSmVDmTATtjw05wB59t7mZA/edit','https://ssl.gstatic.com/docs/documents/images/kix-favicon-2023q4.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(25,1716664168992,'drive.google.com',0,'Ginga Eiyuu Densetsu - Google Drive','https://drive.google.com/drive/u/0/folders/1lp-4GdJLUPlYWI8AoTwqITI2MeF0O0yw','https://ssl.gstatic.com/docs/doclist/images/drive_2022q3_32dp.png',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(26,1716664169790,'pt.overleaf.com',0,'Seus Projetos - Overleaf, Editor LaTeX Online','https://pt.overleaf.com/project','https://pt.overleaf.com/favicon.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(27,1716664171632,'pt.wikipedia.org',0,'Dia da Independência – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Dia_da_Independ%C3%AAncia','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(28,1716664173932,'pt.wikipedia.org',0,'pt.wikipedia.org/wiki/Ucrânia','https://pt.wikipedia.org/wiki/Ucr%C3%A2nia','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(29,1716664193209,'pt.wikipedia.org',0,'Ucrânia – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Ucr%C3%A2nia','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(30,1716664216208,'pt.wikipedia.org',0,'Guerra Russo-Ucraniana – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Guerra_Russo-Ucraniana','',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8),(31,1716664236962,'pt.wikipedia.org',0,'Guerra Russo-Ucraniana – Wikipédia, a enciclopédia livre','https://pt.wikipedia.org/wiki/Guerra_Russo-Ucraniana','https://pt.wikipedia.org/static/favicon/wikipedia.ico',1707,898,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','4g',11,8);
/*!40000 ALTER TABLE `registronavegacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempodominio`
--

DROP TABLE IF EXISTS `tempodominio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempodominio` (
  `idtempodominio` int NOT NULL AUTO_INCREMENT,
  `tempo` int NOT NULL,
  `dominio` varchar(200) NOT NULL,
  `idusopesquisados` int NOT NULL,
  `idprojeto` int NOT NULL,
  PRIMARY KEY (`idtempodominio`),
  UNIQUE KEY `idxu1` (`idusopesquisados`,`idprojeto`,`dominio`),
  KEY `fk_tempodominio_usopesquisados1_idx` (`idusopesquisados`),
  KEY `fk_tempodominio_projeto1_idx` (`idprojeto`),
  CONSTRAINT `fk_tempodominio_projeto1` FOREIGN KEY (`idprojeto`) REFERENCES `projeto` (`idprojeto`),
  CONSTRAINT `fk_tempodominio_usopesquisados1` FOREIGN KEY (`idusopesquisados`) REFERENCES `usopesquisados` (`idusopesquisados`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempodominio`
--

LOCK TABLES `tempodominio` WRITE;
/*!40000 ALTER TABLE `tempodominio` DISABLE KEYS */;
INSERT INTO `tempodominio` VALUES (1,19621,'extensions',11,8),(6,4751,'www.youtube.com',11,8),(14,39826,'g1.globo.com',11,8),(15,4253,'drive.google.com',11,8),(16,3075,'docs.google.com',11,8),(17,13495,'pt.overleaf.com',11,8),(19,121164,'pt.wikipedia.org',11,8);
/*!40000 ALTER TABLE `tempodominio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usopesquisados`
--

DROP TABLE IF EXISTS `usopesquisados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usopesquisados` (
  `idusopesquisados` int NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(250) NOT NULL,
  `idprojeto` int NOT NULL,
  PRIMARY KEY (`idusopesquisados`),
  KEY `fk_usopesquisados_projeto1_idx` (`idprojeto`),
  CONSTRAINT `fk_usopesquisados_projeto1` FOREIGN KEY (`idprojeto`) REFERENCES `projeto` (`idprojeto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usopesquisados`
--

LOCK TABLES `usopesquisados` WRITE;
/*!40000 ALTER TABLE `usopesquisados` DISABLE KEYS */;
INSERT INTO `usopesquisados` VALUES (11,'Q61VPLX5G3YUZTTE6YK1WHW6BZFVEUXKRQWX8W4L1LWDVYYUJX3G01SL5GP7J1UGMOXJGI2D2UAOETBWGEN8HTIQ1W6BI7N77V3BPOSS620WE460J7WVWDNZKNYL40KTKJ3G807QGB3QJQYAVYXCD1C23H4WD3560HBJI8S3L8NO1OVPN83FDF4VKP0KCKK7JEKSUP1T',8);
/*!40000 ALTER TABLE `usopesquisados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idstatus` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_usuariostatus1_idx` (`idstatus`),
  CONSTRAINT `fk_usuario_usuariostatus1` FOREIGN KEY (`idstatus`) REFERENCES `usuariostatus` (`idusuariostatus`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (10,'testes','123','testes@email.com',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariostatus`
--

DROP TABLE IF EXISTS `usuariostatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariostatus` (
  `idusuariostatus` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuariostatus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariostatus`
--

LOCK TABLES `usuariostatus` WRITE;
/*!40000 ALTER TABLE `usuariostatus` DISABLE KEYS */;
INSERT INTO `usuariostatus` VALUES (1,'Ativo'),(2,'Inativo');
/*!40000 ALTER TABLE `usuariostatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbmain'
--

--
-- Dumping routines for database 'dbmain'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28 21:09:03
