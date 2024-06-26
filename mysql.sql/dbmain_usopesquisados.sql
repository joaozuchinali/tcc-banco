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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usopesquisados`
--

LOCK TABLES `usopesquisados` WRITE;
/*!40000 ALTER TABLE `usopesquisados` DISABLE KEYS */;
INSERT INTO `usopesquisados` VALUES (1,'HPGEIK45035LGWOML8R6R6AJO450Z5TVXIY2K42LJETXJVS11YAUXK8IMWOMLDNMH5KOXTQCFVDZDDFOMLQE2DB2UEZVF0K8GFCVHVRZFX56PY430DFL4ED7TEPYRIRN8Y4UG6XF4UZ2TF512EUQJRU6XE8YO7DCJ50Q0XG8EC744LYIJYQCC7JK0FHFMF8PW34V25ZZ',1),(2,'P7F585HGD7886FS30PTPRRY8DDT803S7GHGOAJBFDX5I8KOU20KN8LTCJEO62338R27C4X0XVXGRGV0VAFR7A4DR4KO43ZCJKJM4APDTVUEE0VACB0UQANWP1AUNE61LI34R1LSV3EHZ5G0LSQ5LFG0L7HZH15DKC4S7YSAEWKI3B1Y05R2WZKFNEELLP054ME6N6CK6',1),(3,'CQMI02HR2K60DGI776B7717FXFWVUV7JR7I575RRB77WK5P2PAIX6JG5UDC11JHW87KOMV7VKHC5E7LL0KK8QGBG6IRGC8R00WQNM1DIE0JMJ2RIUAXHETN43KZCDAHGSSVGSC2UR8WWVMQTEDKF4QXPOOKXDJI2R4DZPS7QEFEL7T7KLTBM3UTQWSF6RA3QY0YELUFP',1),(4,'QHPOISNQXLHSCZY5EA5DEDUUWB7MG5XJTB2QQ8533BMQUK75GT6CB7WS64NPBVTMLA06IUJO2QBOSRP6OOF4KAMIUYRK7U25UA1MSP2F464OIYNN0TISSASX0R6PLBX2D88BOKD6X2PXY8732TP1UAWDJ0QONRV50MMT8CAYUWXD4888R2H08C35AP43PYA4THKLORSN',1),(5,'D61PE71KCA462AQ4NKH8WT3Q6RMM7J625BWBMZ1XZY0VCJX7WJP28MQ2DV4DDGOJE1J0QJDX4VU84HZ64RX40ZC2ZKF7V761PYPX1D882JZLWDB6TPEOQXSREXXBY8I0N3Q3TLAAYHRY1KRNRKS7BE003JHAGBYJJF3QAWXHJ72N247PUUFEE3PCPHJJXKUFK5QZ37QL',1),(6,'JVK7FN05WOQBKKGGUJH6QEPT0FAPAA7NH51AISQWZPRK2R2H2OLKH75BUEUZ0OUWOFPDWDKCBMZORFDLYESOGJVDGEBK5WRVA43CI2GT5ERM3PLAA3O6QRZOGEITYI3P2JBE0BS11LEXOZF8E5JQD6KKQ0IKCPVXNJLB3FDETCSHFY550HCYO0V72ZNNZATI0G5TB3VC',1),(7,'VHT15SQ63L77ICSOCEOLFZJUBOC16RAH1HVNRVYTMWUV8IRHL5CH0AYSHINB8BRGYMWD1VBKCPJ31TXBGER166Y3KV71V68D1SNX4HB8G65PE3T4WBEQ4UVLCPQKKB6ENBMFI2JPFZWJZXCJGI0GJGMTKE4EQD6LLRBXVJ7YDHPP7S4T0LFE0NVUFRRHH4WSFP7XOGQJ',1),(8,'VSFACSQJ0QOAT7H0051VTEZ42S58N6FMORE701BE83LALK4B644FDHI7YNX0N3R4D2FLPGCZGYOX6UNCPEDMRM4YR27OONOO4MBBUY6HUPJJZSIKDFIQ5GBBLBWWB3VKD8CFONUCX8GRWJZI7OXQUF4OMBXFYJJ2UXGO25VVFOVSGVNNHZDDZV3IO2VPZ3QU4Q10B5VW',2),(9,'PZBTVCN4E240N38QH4Z5LNZWZGUB4EFYAZ8YZL3BVV7WUHHUTYCS74R51DOVQ3S631VX0R1Q3A6IZOAW85RSP1F8Z5LNMMAK6325TGGS16NHG501ZYJWXR16NIM02XGAHTZ162S8KHRWCCKANL145JKMZIW2C8M6J5WFEB4VTEOEU57D7FLM7B4TUCQWNT8LC2DGV67S',2);
/*!40000 ALTER TABLE `usopesquisados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-28 14:29:12
