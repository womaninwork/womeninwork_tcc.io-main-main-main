CREATE DATABASE  IF NOT EXISTS `blpkdphhphnmf0o8ikdt` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blpkdphhphnmf0o8ikdt`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: blpkdphhphnmf0o8ikdt
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `aluno_tem_cursos`
--

DROP TABLE IF EXISTS `aluno_tem_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_tem_cursos` (
  `cursos_id_cursos` int NOT NULL,
  `usuario_id_usuario` int NOT NULL,
  `pagamento_id_pagamento` int NOT NULL,
  PRIMARY KEY (`cursos_id_cursos`,`usuario_id_usuario`),
  KEY `fk_aluno_tem_cursos_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_aluno_tem_cursos_pagamento1_idx` (`pagamento_id_pagamento`),
  CONSTRAINT `fk_aluno_tem_cursos_cursos1` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_aluno_tem_cursos_pagamento1` FOREIGN KEY (`pagamento_id_pagamento`) REFERENCES `pagamento` (`id_pagamento`),
  CONSTRAINT `fk_aluno_tem_cursos_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_tem_cursos`
--

LOCK TABLES `aluno_tem_cursos` WRITE;
/*!40000 ALTER TABLE `aluno_tem_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno_tem_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `idaulas` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `link_aula` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `cursos_id_cursos` int NOT NULL,
  PRIMARY KEY (`idaulas`),
  KEY `fk_aulas_cursos1_idx` (`cursos_id_cursos`),
  CONSTRAINT `fk_aulas_cursos1` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `menssagem` longtext NOT NULL,
  `remetente_id_usuario` int DEFAULT NULL,
  `destinatario_id_usuario` int DEFAULT NULL,
  `usuario_id_usuario` int NOT NULL,
  KEY `fk_chat_usuario1_idx` (`usuario_id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_cursos` int NOT NULL AUTO_INCREMENT,
  `descricao_cursos` mediumtext NOT NULL,
  `nome_curso` varchar(70) NOT NULL,
  `categoria_curso` varchar(70) NOT NULL,
  `duraco_curso` varchar(20) NOT NULL,
  `preco_curso` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cursos`),
  UNIQUE KEY `id_cursos_UNIQUE` (`id_cursos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Aprenda a entender o corpo humano','Linguagem Corporal ','qwwerr','qwerr','23','https://s3.amazonaws.com/ibc-portal/wp-content/uploads/2015/06/12143722/linguagem-corporal.jpg'),(2,'teste','teste','teste','teste','233','teste');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma de pagamento`
--

DROP TABLE IF EXISTS `forma de pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma de pagamento` (
  `id_forma_de_pagamento` int NOT NULL,
  PRIMARY KEY (`id_forma_de_pagamento`),
  UNIQUE KEY `id_forma_de_pagamento_UNIQUE` (`id_forma_de_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma de pagamento`
--

LOCK TABLES `forma de pagamento` WRITE;
/*!40000 ALTER TABLE `forma de pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma de pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL,
  `status_mp` varchar(45) NOT NULL,
  `pagamento_data` date NOT NULL,
  `valor_pagamento` double NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  UNIQUE KEY `id_pagamento_UNIQUE` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_tem_cursos`
--

DROP TABLE IF EXISTS `professor_tem_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_tem_cursos` (
  `usuario_id_usuario` int NOT NULL,
  `cursos_id_cursos` int NOT NULL,
  KEY `fk_usuario_has_cursos_cursos1_idx` (`cursos_id_cursos`),
  KEY `fk_usuario_has_cursos_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_usuario_has_cursos_cursos1` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_usuario_has_cursos_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_tem_cursos`
--

LOCK TABLES `professor_tem_cursos` WRITE;
/*!40000 ALTER TABLE `professor_tem_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_tem_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL,
  `tipo_comum` varchar(45) NOT NULL,
  `tipo_professor` varchar(45) NOT NULL,
  `tipo_adm` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`),
  UNIQUE KEY `id_tipo_usuario_UNIQUE` (`id_tipo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(70) NOT NULL,
  `email_usuario` varchar(35) NOT NULL,
  `celular_usuario` char(11) NOT NULL,
  `senha_usuario` varchar(225) NOT NULL,
  `sobrenome_usuario` varchar(70) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `profissao` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Hellen','hellen123@gmail.com','11963823981','$2a$10$75drDunF6hFYUN0P.BoaNurmbduBHbVHrKeqFpP4ttxjueM4JdbTi','Silva',NULL,NULL),(2,'Agata','agata123@gmail.com','11943584346','$2a$10$O70bIMvQZxgHM7EofRZp9uaPvo0I2EEofxsTM819U5xtSv9PBouZG','Rodrigues',NULL,NULL),(3,'gustavo','gustavoteste@gmail.com','11996919109','$2a$10$n/w.yd2emBnBMyfdjJsrhObqj66xVEAdPgqYZGhRwx0L5cRszlupy','couto',NULL,NULL),(4,'gustavo','gustavoteste1@gmail.com','11996919109','$2a$12$cxsVIRhp2ZPp.6ATDN/iQunxY66yu4fApBJMEb0LhU.h645mFIT8C','couto',NULL,NULL),(5,'gustavo','gustavoteste12@gmail.com','11996919109','$2a$12$.0qc6wkcRSJYMKW9OSXcgef0kpiwLh47O3LMBQIpxfO9ISfK8WD1m','couto',NULL,NULL),(6,'gustavo','gustavoteste122@gmail.com','11996919109','$2a$12$hRVVaTvUgej4lNsjPZNw3uBMGpgi0lbB28FjJ3CoyrfaacvPLyqn.','couto',NULL,NULL),(7,'gustavo','gustavoteste123@gmail.com','11996919109','$2a$12$FNMkE5/lf8eF3bHQ/jToJewGdCgv0rSuNQbdCcKXlb7FSKvBsHP5q','couto',NULL,NULL),(8,'gustavo','gustavoteste1243@gmail.com','11996919109','$2a$12$PnHaI7MMxl8omCSjMK2DwOY6SjIecFEwtxgBViH5H1jrSY9xmM2ZC','couto',NULL,NULL),(9,'gustavo','gustavoteste1243g@gmail.com','11996919109','$2a$12$ZGZHrRxidauW0zWIbDW0i.ay7p/AwS7MwDUYsZ8tafki0h.KExCmq','couto',NULL,NULL),(10,'gustavo','gustavoteste2243g@gmail.com','11996919109','$2a$12$wOPlRl9qE6WuvPoWkVhBe.T1juIOLyQnOcPF3zZtdwJJzLWXLZpb6','couto',NULL,NULL),(11,'gustavo','gustavoteste2223g@gmail.com','11996919109','$2a$12$jbFhMR.0MU3fTn4SLb6bO./d/ggcfEweeG7iOoIa9gq1HM3DQ.siu','couto',NULL,NULL),(12,'gustavo','gustavoteste2226g@gmail.com','11996919109','$2a$12$Ggkj.7La0WgLhoSaxmXTI.az4NcdMg5o5KULqI5em18TuNQM85ixy','couto',NULL,NULL),(13,'mariana','mariana12@gmail.com','1198772916','$2a$12$3Mdf0jj0MNEjI4NgyWGtYO078Rj59xWcMQsSvH4zlmKxTX824DpP.','figueiredo',NULL,NULL),(14,'yasmin ','yasmin@gmail.com','11958857583','$2a$10$RmyOfmRhKfKUHeKRrxnaq.rEAtTFlRq1bPnSRmXimwQjxeE4udt1K','silva ',NULL,NULL),(15,'luan','Luan@gmail.com','11969528185','$2a$12$CSDSoQHndCftgG3N2jDfW..JZuwkmZjQpKHIM73gasa.xEJdd6yC6','ribeiro',NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_avalia_cursos`
--

DROP TABLE IF EXISTS `usuario_avalia_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_avalia_cursos` (
  `usuario_id_usuario` int NOT NULL,
  `cursos_id_cursos` int NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`,`cursos_id_cursos`),
  KEY `fk_usuario_avalia_cursos_cursos1_idx` (`cursos_id_cursos`),
  CONSTRAINT `fk_usuario_avalia_cursos_cursos1` FOREIGN KEY (`cursos_id_cursos`) REFERENCES `cursos` (`id_cursos`),
  CONSTRAINT `fk_usuario_avalia_cursos_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_avalia_cursos`
--

LOCK TABLES `usuario_avalia_cursos` WRITE;
/*!40000 ALTER TABLE `usuario_avalia_cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_avalia_cursos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 11:41:03
