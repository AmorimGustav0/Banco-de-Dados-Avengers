CREATE DATABASE  IF NOT EXISTS `vingadores` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vingadores`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: vingadores
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `chip_gps`
--

DROP TABLE IF EXISTS `chip_gps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chip_gps` (
  `id_chipgps` int NOT NULL AUTO_INCREMENT,
  `id_tornozeleira` int NOT NULL,
  `heroi_id` int NOT NULL,
  `localizacao_atual` varchar(150) DEFAULT NULL,
  `ultima_localizacao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_chipgps`),
  KEY `id_tornozeleira_idx` (`id_tornozeleira`),
  KEY `heroi_id_idx` (`heroi_id`),
  CONSTRAINT `id_tornozeleira` FOREIGN KEY (`id_tornozeleira`) REFERENCES `tornozeleira` (`id_tornozeleira`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chip_gps`
--

LOCK TABLES `chip_gps` WRITE;
/*!40000 ALTER TABLE `chip_gps` DISABLE KEYS */;
INSERT INTO `chip_gps` VALUES (1,3,3,'Dfghjk','Fghjk'),(2,2,2,'Nova York','Brasil'),(3,1,6,'Eua','Chicago'),(4,4,4,'Brooklyn','Nave Do Thanos'),(5,5,7,'Wakanda','Asgard'),(6,5,7,'Wakanda','Asgard');
/*!40000 ALTER TABLE `chip_gps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocacao`
--

DROP TABLE IF EXISTS `convocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convocacao` (
  `numero_registro` int NOT NULL AUTO_INCREMENT,
  `heroi_id` int NOT NULL,
  `nome_heroi` varchar(45) NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `data_convocacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_comparecimento` date DEFAULT NULL,
  `status` enum('Pendente','Compareceu','Ausente') NOT NULL,
  PRIMARY KEY (`numero_registro`),
  KEY `heroi_id_idx` (`heroi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocacao`
--

LOCK TABLES `convocacao` WRITE;
/*!40000 ALTER TABLE `convocacao` DISABLE KEYS */;
INSERT INTO `convocacao` VALUES (1,0,'Homem Aranha','Duende Verde','2024-12-04 10:52:56',NULL,'Pendente'),(2,0,'Homem de Ferro','Ultron','2024-12-04 11:06:25',NULL,'Pendente'),(3,5,'Hulk','Coiso Na Cidade','2024-12-04 16:32:19',NULL,'Pendente'),(4,3,'Thor','Loki Na Cidade','2024-12-06 09:41:05',NULL,'Pendente'),(5,7,'T-challa','Killmonger Esta Em Wakanda','2024-12-06 13:03:18',NULL,'Pendente');
/*!40000 ALTER TABLE `convocacao` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Convocacao_BEFORE_UPDATE` BEFORE UPDATE ON `convocacao` FOR EACH ROW BEGIN 

	IF NEW.status = 'Pendente' AND OLD.status <> 'Pendente' and OLD.status <> 'Ausente' THEN
        SET New.data_comparecimento = CURRENT_TIMESTAMP;
	end if;
    
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `heroi`
--

DROP TABLE IF EXISTS `heroi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heroi` (
  `heroi_id` int NOT NULL AUTO_INCREMENT,
  `nome_heroi` varchar(45) DEFAULT NULL,
  `nome_real` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `poderes` varchar(45) DEFAULT NULL,
  `poder_principal` varchar(45) DEFAULT NULL,
  `fraquezas` varchar(45) DEFAULT NULL,
  `nivel_forca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`heroi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroi`
--

LOCK TABLES `heroi` WRITE;
/*!40000 ALTER TABLE `heroi` DISABLE KEYS */;
INSERT INTO `heroi` VALUES (2,'Homem de Ferro','Tony Stark','Humano','Inteligência, Tecnologia','Armadura','Arrogância','100'),(3,'Thor','Thor','Deus','Força, Relâmpagos, Mjolnir','Rompe-tormentas','Orgulho, Fortnite','1000'),(4,'Homem Aranha','Peter Parker','Humano','Teias,  Escalar,  Agilidade','Sentido Aranha','Tia may,  MJ,  Dinheiro','100'),(5,'Hulk','Bruce Banner','Humano','super força','Força','Escadas','1000'),(6,'Capitão America','Steve Rogers','Humano','Super Força','Habilidades Super Humanas','Amor','80'),(7,'Pantera Negra','T-challa','Humano','Força,  Agilidade','Traje de Vibranium','Soldado Invernal','100');
/*!40000 ALTER TABLE `heroi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mandado_prisao`
--

DROP TABLE IF EXISTS `mandado_prisao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mandado_prisao` (
  `id_mandado` int NOT NULL AUTO_INCREMENT,
  `heroi_id` int NOT NULL,
  `motivo` varchar(250) NOT NULL,
  `data_mandado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Procurado','Detenção','Cumprido','Cancelado') NOT NULL,
  PRIMARY KEY (`id_mandado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mandado_prisao`
--

LOCK TABLES `mandado_prisao` WRITE;
/*!40000 ALTER TABLE `mandado_prisao` DISABLE KEYS */;
INSERT INTO `mandado_prisao` VALUES (1,3,'Matou O Loki','2024-12-06 12:58:06','Procurado'),(2,2,'Criou Ultron E Destruiu Cidades','2024-12-06 12:59:29','Procurado'),(3,7,'Acabou Matando O Killmonger','2024-12-06 13:05:54','Procurado');
/*!40000 ALTER TABLE `mandado_prisao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tornozeleira`
--

DROP TABLE IF EXISTS `tornozeleira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tornozeleira` (
  `id_tornozeleira` int NOT NULL AUTO_INCREMENT,
  `heroi_id` int NOT NULL,
  `nome_heroi` varchar(45) DEFAULT NULL,
  `status` enum('Ativa','Inativa') NOT NULL,
  `data_ativacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_desativacao` date DEFAULT NULL,
  PRIMARY KEY (`id_tornozeleira`),
  KEY `id_heroi_idx` (`heroi_id`),
  CONSTRAINT `heroi_id` FOREIGN KEY (`heroi_id`) REFERENCES `heroi` (`heroi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tornozeleira`
--

LOCK TABLES `tornozeleira` WRITE;
/*!40000 ALTER TABLE `tornozeleira` DISABLE KEYS */;
INSERT INTO `tornozeleira` VALUES (1,6,'Capitão','Inativa','2024-12-04 16:20:57',NULL),(2,2,'Tony','Ativa','2024-12-04 16:32:33',NULL),(3,3,'Thor','Ativa','2024-12-06 09:24:03',NULL),(4,4,'Homem Aranha','Ativa','2024-12-06 10:39:20',NULL),(5,7,'T-challa','Ativa','2024-12-06 13:04:14',NULL);
/*!40000 ALTER TABLE `tornozeleira` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tornozeleira_BEFORE_UPDATE` BEFORE UPDATE ON `tornozeleira` FOR EACH ROW BEGIN
	IF NEW.status = 'inativa' AND OLD.status <> 'inativa' THEN
        SET New.data_desativacao = CURRENT_TIMESTAMP;
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'vingadores'
--

--
-- Dumping routines for database 'vingadores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-06 13:32:54
