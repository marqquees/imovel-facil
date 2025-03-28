CREATE DATABASE  IF NOT EXISTS `imovel_facil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `imovel_facil`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: imovel_facil
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel` (
  `id` int NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `cozinha` int NOT NULL,
  `sala` int NOT NULL,
  `quarto` int NOT NULL,
  `casa_de_banho` int NOT NULL,
  `garagem` int NOT NULL,
  `numero_de_comodo` int NOT NULL,
  `area` int NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
INSERT INTO `imovel` 
VALUES (1,'Moradia',1,1,3,2,2,7,125,'Rua das Flores, 123, Chaves',380000,'Casa familiar com jardim, garagem e com boa localização, próximo a transportes públicos e comércio local.'),
(2,'Moradia',1,1,2,1,1,5,70,'Alameda do Sol, 45, Oliveira do Hospital',180000,'Casa de verão com jardim, terraço e vista para a Serra da Estrela. Zona rural e tranquila com fácil acesso a inúmeros serviços.'),
(3,'Mansão',1,2,5,4,3,12,320,'Quinta dos Carvalhos, Sintra',950000,'Propriedade de luxo com piscina, jardim amplo e acabamentos de alta qualidade. Localizada em zona exclusiva com segurança privada.');
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-28 16:00:57
