CREATE DATABASE  IF NOT EXISTS `vital_crossfit_tienda2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vital_crossfit_tienda2`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: vital_crossfit_tienda2
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','fulladmin') NOT NULL DEFAULT 'admin',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `administradores_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'Isabella María','Castro Romero','isabella.castro@email.com','$2b$12$mqZC1cc.YIjKd/pW31jA2eZyS7SJN.7Y7WGW4Hb2snhuQ6Nv/7sr2','admin',1,'2025-08-20 14:38:44','2025-08-20 14:38:44'),(2,'Carlos','Batista','batistaBat@email.com','$2b$12$PffxPfv/DE1OF/NhajpX8um5EmtMlzozOgwyZ.EXeD0MjIrNwnDmW','admin',1,'2025-08-20 14:50:28','2025-08-20 14:50:28');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `nombreOriginal` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `peso` float NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `idProducto` int NOT NULL,
  `fechaSubida` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (19,'1759243154527-k9bk91.jpg','Rack-de-sentadillas-Mir-Fitness-1.jpg','image/jpeg',135464,'uploads/productos/20/1759243154527-k9bk91.jpg',20,'2025-09-30 14:39:14'),(27,'1759262439531-gdu1xs.jpg','Rack-de-sentadillas-Mir-Fitness-4.jpg','image/jpeg',67497,'uploads/productos/20/1759262439531-gdu1xs.jpg',20,'2025-09-30 20:00:39'),(28,'1759265430155-6injfx.jfif','images.jfif','image/jpeg',7526,'uploads/productos/20/1759265430155-6injfx.jfif',20,'2025-09-30 20:50:30'),(34,'1761658238542-kx37el.jfif','images (3).jfif','image/jpeg',3354,'uploads/productos/7/1761658238542-kx37el.jfif',7,'2025-10-28 13:30:38'),(35,'1761658238544-bgy8d3.webp','s-l1600.webp','image/webp',238684,'uploads/productos/7/1761658238544-bgy8d3.webp',7,'2025-10-28 13:30:38'),(36,'1761658828917-0ztcnl.webp','blacktraing25_1200x1200.webp','image/webp',29292,'uploads/productos/3/1761658828917-0ztcnl.webp',3,'2025-10-28 13:40:28'),(37,'1761658828918-p7pkot.webp','iwf-training-bumpers-web2_1024x1024.webp','image/webp',42138,'uploads/productos/3/1761658828918-p7pkot.webp',3,'2025-10-28 13:40:28'),(39,'1761659119788-c1dt5k.png','973_fucsia-6-f9cfeb5b331d3b8a1717359324940440-1024-1024.png','image/png',414974,'uploads/productos/4/1761659119788-c1dt5k.png',4,'2025-10-28 13:45:19'),(40,'1761659119795-vfgwcf.jpg','FF161-BK_3Deportes-Once-Follow-Fit.jpg','image/jpeg',138115,'uploads/productos/4/1761659119795-vfgwcf.jpg',4,'2025-10-28 13:45:19'),(41,'1761659701919-9i509s.jfif','images (3).jfif','image/jpeg',4247,'uploads/productos/5/1761659701919-9i509s.jfif',5,'2025-10-28 13:55:01'),(42,'1761659701921-xjulmz.jfif','images (4).jfif','image/jpeg',5053,'uploads/productos/5/1761659701921-xjulmz.jfif',5,'2025-10-28 13:55:01'),(43,'1761659843305-g2v3ik.jpg','957f0af4efc09b81980dd3d31d5cbcaf.jpg','image/jpeg',31024,'uploads/productos/9/1761659843305-g2v3ik.jpg',9,'2025-10-28 13:57:23'),(44,'1761661286368-4wmsfw.webp','D_NQ_NP_2X_835372-MLA93832830173_092025-F.webp','image/webp',90112,'uploads/productos/23/1761661286368-4wmsfw.webp',23,'2025-10-28 14:21:26'),(45,'1761661286369-tjskdu.webp','D_NQ_NP_2X_904949-MLA93832243469_092025-F.webp','image/webp',66102,'uploads/productos/23/1761661286369-tjskdu.webp',23,'2025-10-28 14:21:26'),(48,'1761662009489-s1n1dq.webp','D_NQ_NP_2X_855144-MLA91918540834_092025-F.webp','image/webp',24828,'uploads/productos/24/1761662009489-s1n1dq.webp',24,'2025-10-28 14:33:29'),(52,'1761662226841-s2vep8.webp','D_NQ_NP_2X_688959-MLA91918827854_092025-F.webp','image/webp',31360,'uploads/productos/24/1761662226841-s2vep8.webp',24,'2025-10-28 14:37:06'),(53,'1761662562534-7c3bhw.webp','D_NQ_NP_2X_800665-MLA84632922578_052025-F.webp','image/webp',46140,'uploads/productos/25/1761662562534-7c3bhw.webp',25,'2025-10-28 14:42:42'),(54,'1761662562534-d8r2uc.webp','D_NQ_NP_2X_822434-MLA84634576108_052025-F.webp','image/webp',69298,'uploads/productos/25/1761662562534-d8r2uc.webp',25,'2025-10-28 14:42:42'),(55,'1761670448308-z2gulu.webp','D_NQ_NP_2X_910524-MLA83031298293_032025-F.webp','image/webp',121420,'uploads/productos/26/1761670448308-z2gulu.webp',26,'2025-10-28 16:54:08'),(56,'1761670448310-6whlwh.webp','D_NQ_NP_2X_986864-MLA82743935392_032025-F.webp','image/webp',120048,'uploads/productos/26/1761670448310-6whlwh.webp',26,'2025-10-28 16:54:08'),(57,'1761670912978-qwm8po.webp','D_NQ_NP_2X_742801-MLA94724193515_102025-F.webp','image/webp',94504,'uploads/productos/27/1761670912978-qwm8po.webp',27,'2025-10-28 17:01:52'),(58,'1761670912980-npiare.webp','D_NQ_NP_2X_985206-MLA94724073791_102025-F.webp','image/webp',173482,'uploads/productos/27/1761670912980-npiare.webp',27,'2025-10-28 17:01:52'),(59,'1761671227890-z82qzh.webp','D_NQ_NP_2X_663070-MLA92598186985_092025-F.webp','image/webp',25494,'uploads/productos/28/1761671227890-z82qzh.webp',28,'2025-10-28 17:07:07'),(60,'1761671227892-uin6t4.webp','D_NQ_NP_2X_665754-MLA92597792461_092025-F.webp','image/webp',21566,'uploads/productos/28/1761671227892-uin6t4.webp',28,'2025-10-28 17:07:07'),(61,'1761671644683-nga500.webp','D_NQ_NP_2X_865123-MLA87354894967_072025-F.webp','image/webp',24432,'uploads/productos/29/1761671644683-nga500.webp',29,'2025-10-28 17:14:04'),(62,'1761671644683-5fz9zd.webp','D_NQ_NP_2X_924687-MLA87354718701_072025-F.webp','image/webp',65352,'uploads/productos/29/1761671644683-5fz9zd.webp',29,'2025-10-28 17:14:04'),(63,'1761671990440-sk6ds5.webp','D_NQ_NP_2X_743158-MLA86235528663_062025-F.webp','image/webp',75086,'uploads/productos/30/1761671990440-sk6ds5.webp',30,'2025-10-28 17:19:50'),(64,'1761671990442-my1asx.webp','D_NQ_NP_2X_949200-MLA85728335474_062025-F.webp','image/webp',13306,'uploads/productos/30/1761671990442-my1asx.webp',30,'2025-10-28 17:19:50'),(65,'1761672316936-m3bvzn.webp','D_NQ_NP_2X_658575-MLA96153648751_102025-F.webp','image/webp',98538,'uploads/productos/31/1761672316936-m3bvzn.webp',31,'2025-10-28 17:25:16'),(66,'1761672316938-6pex7o.webp','D_NQ_NP_2X_767447-MLA96152834459_102025-F.webp','image/webp',70916,'uploads/productos/31/1761672316938-6pex7o.webp',31,'2025-10-28 17:25:16'),(67,'1761672642223-6pvz8i.webp','D_NQ_NP_2X_752566-MLA95942347597_102025-F.webp','image/webp',45032,'uploads/productos/32/1761672642223-6pvz8i.webp',32,'2025-10-28 17:30:42'),(68,'1761672642224-odlc5t.webp','D_NQ_NP_2X_803438-MLA95942337653_102025-F.webp','image/webp',103450,'uploads/productos/32/1761672642224-odlc5t.webp',32,'2025-10-28 17:30:42'),(69,'1761672987428-kkd2c7.webp','D_NQ_NP_2X_780772-MLA83442334782_042025-F.webp','image/webp',34406,'uploads/productos/33/1761672987428-kkd2c7.webp',33,'2025-10-28 17:36:27'),(70,'1761672987429-h9wyrd.webp','D_NQ_NP_2X_968020-MLA83734501115_042025-F.webp','image/webp',51816,'uploads/productos/33/1761672987429-h9wyrd.webp',33,'2025-10-28 17:36:27'),(71,'1761673593448-1hnu45.webp','D_NQ_NP_2X_743483-MLU78329743648_082024-F.webp','image/webp',27190,'uploads/productos/34/1761673593448-1hnu45.webp',34,'2025-10-28 17:46:33'),(72,'1761673593449-adk1re.webp','D_NQ_NP_2X_857763-MLU78329918858_082024-F.webp','image/webp',61824,'uploads/productos/34/1761673593449-adk1re.webp',34,'2025-10-28 17:46:33'),(73,'1761673952327-gossrj.webp','D_NQ_NP_2X_689305-MLA80761165258_112024-F.webp','image/webp',30362,'uploads/productos/35/1761673952327-gossrj.webp',35,'2025-10-28 17:52:32'),(74,'1761673952327-j1d6mf.webp','D_NQ_NP_2X_953772-MLA81026096869_112024-F.webp','image/webp',20640,'uploads/productos/35/1761673952327-j1d6mf.webp',35,'2025-10-28 17:52:32'),(75,'1761674365744-jhfq2z.webp','D_NQ_NP_2X_661132-MLA70740739505_072023-F.webp','image/webp',67466,'uploads/productos/36/1761674365744-jhfq2z.webp',36,'2025-10-28 17:59:25'),(76,'1761674365746-uizx4z.webp','D_NQ_NP_2X_821994-MLA70710549462_072023-F.webp','image/webp',88600,'uploads/productos/36/1761674365746-uizx4z.webp',36,'2025-10-28 17:59:25'),(77,'1761674695911-qyjz6w.webp','D_NQ_NP_2X_605298-MLA92422939631_092025-F.webp','image/webp',48530,'uploads/productos/37/1761674695911-qyjz6w.webp',37,'2025-10-28 18:04:55'),(78,'1761675091340-ixql7u.webp','D_NQ_NP_2X_953969-MLA95831618423_102025-F.webp','image/webp',18820,'uploads/productos/38/1761675091340-ixql7u.webp',38,'2025-10-28 18:11:31'),(79,'1761675091341-2irtx7.webp','D_NQ_NP_2X_862084-MLA92669274488_092025-F.webp','image/webp',45138,'uploads/productos/38/1761675091341-2irtx7.webp',38,'2025-10-28 18:11:31'),(80,'1761675959306-om1r3a.webp','D_NQ_NP_2X_734793-MLA88421475843_072025-F.webp','image/webp',43232,'uploads/productos/39/1761675959306-om1r3a.webp',39,'2025-10-28 18:25:59'),(81,'1761675959307-dl78g1.webp','D_NQ_NP_2X_956081-MLA88421515585_072025-F.webp','image/webp',57012,'uploads/productos/39/1761675959307-dl78g1.webp',39,'2025-10-28 18:25:59'),(82,'1761676312004-oag4tg.webp','D_NQ_NP_2X_883329-MLA54621758311_032023-F.webp','image/webp',9340,'uploads/productos/40/1761676312004-oag4tg.webp',40,'2025-10-28 18:31:52'),(83,'1761676312005-9had3r.webp','D_NQ_NP_2X_985328-MLA54624816514_032023-F.webp','image/webp',31476,'uploads/productos/40/1761676312005-9had3r.webp',40,'2025-10-28 18:31:52'),(84,'1761676638282-rnmdau.webp','D_NQ_NP_2X_811177-MLA93397161198_092025-F.webp','image/webp',84350,'uploads/productos/41/1761676638282-rnmdau.webp',41,'2025-10-28 18:37:18'),(85,'1761677001076-npqj19.webp','D_NQ_NP_2X_744404-MLA31044519667_062019-F.webp','image/webp',19134,'uploads/productos/42/1761677001076-npqj19.webp',42,'2025-10-28 18:43:21'),(86,'1761677001078-j5h1ku.webp','D_NQ_NP_2X_887357-MLA31044518138_062019-F.webp','image/webp',20810,'uploads/productos/42/1761677001078-j5h1ku.webp',42,'2025-10-28 18:43:21'),(87,'1761677674237-04j9do.webp','D_NQ_NP_2X_607726-MLA88450315179_072025-F.webp','image/webp',22800,'uploads/productos/44/1761677674237-04j9do.webp',44,'2025-10-28 18:54:34'),(88,'1761677674239-1s2ssd.webp','D_NQ_NP_2X_852718-MLA88450315159_072025-F.webp','image/webp',72836,'uploads/productos/44/1761677674239-1s2ssd.webp',44,'2025-10-28 18:54:34'),(89,'1761679200172-pi51ji.webp','D_NQ_NP_2X_684488-MLA84834921751_052025-F.webp','image/webp',70100,'uploads/productos/47/1761679200172-pi51ji.webp',47,'2025-10-28 19:20:00'),(90,'1761679200175-1nt5au.webp','D_NQ_NP_2X_957306-MLA84536688768_052025-F.webp','image/webp',56184,'uploads/productos/47/1761679200175-1nt5au.webp',47,'2025-10-28 19:20:00'),(91,'1761679505639-h3ua1a.webp','D_NQ_NP_2X_832266-MLA84537335362_052025-F.webp','image/webp',97832,'uploads/productos/48/1761679505639-h3ua1a.webp',48,'2025-10-28 19:25:05'),(98,'1761862978546-pv1yw2.webp','mancuerna2.webp','image/webp',127526,'uploads/productos/51/1761862978546-pv1yw2.webp',51,'2025-10-30 22:22:58'),(99,'1761862978548-yo3e2g.webp','mancuerna3.webp','image/webp',194408,'uploads/productos/51/1761862978548-yo3e2g.webp',51,'2025-10-30 22:22:58'),(100,'1761862978552-cg1u5d.webp','mancuerna4.webp','image/webp',78252,'uploads/productos/51/1761862978552-cg1u5d.webp',51,'2025-10-30 22:22:58');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
INSERT INTO `carritos` VALUES (8,29,'2025-10-07 13:57:40','2025-10-07 13:57:40'),(9,30,'2025-10-14 14:43:56','2025-10-14 14:43:56'),(10,31,'2025-10-14 14:58:22','2025-10-14 14:58:22');
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagenUrl` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fechaDeCreacion` datetime NOT NULL,
  `fechaDeActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Calzado CrossFit','Zapatillas específicamente diseñadas para CrossFit con suela plana para levantamientos, estabilidad lateral y durabilidad para entrenamientos de alta intensidad.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652407813-q0t3ms.jpg',1,'2025-06-18 12:18:47','2025-10-28 11:53:27'),(2,'Barras y Discos','Barras olímpicas, discos bumper plates y accesorios para levantamiento de pesas. Equipamiento esencial para movimientos como deadlifts, squats y clean & jerk.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652335213-hfmeck.png',1,'2025-06-18 12:21:10','2025-10-28 11:52:15'),(3,'Pesas Rusas ','Pesas rusas de diferentes pesos para entrenamientos funcionales. Ideales para swings, Turkish get-ups y ejercicios de fuerza y resistencia.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761653910567-8p5wqz.avif',1,'2025-06-18 12:24:14','2025-10-28 12:18:30'),(4,'Ropa Técnica','Indumentaria especializada para CrossFit: shorts, camisetas, medias y ropa interior con tejidos que absorben la humedad y permiten libertad de movimiento.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652248205-agcy05.jpg',1,'2025-06-18 12:28:14','2025-10-28 11:50:48'),(5,'Suplementos Deportivos','Proteínas, pre-entrenos, BCAAs y otros suplementos específicos para mejorar el rendimiento, recuperación y composición corporal en CrossFit.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652199089-lvxhfj.png',1,'2025-06-18 12:30:25','2025-10-28 11:49:59'),(6,'Guantes y Grips','Guantes de CrossFit y grips para proteger las manos durante pull-ups, muscle-ups y trabajo con barras. Mejoran el agarre y previenen callos.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652161410-iw8f1j.png',1,'2025-06-18 12:34:33','2025-10-28 11:49:21'),(7,'Wall Balls','Balones medicinales con peso específico para wall ball shots, ejercicios de core y entrenamientos funcionales. Disponibles en diferentes pesos.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761652054417-aty21x.webp',1,'2025-06-18 12:37:57','2025-10-28 11:47:34'),(9,'Equipamiento Auxiliar','Mejora y complementa tus entrenamientos esenciales. Mayor comodidad, soporte y eficiencia en cada ejercicio. Accesorios especializados para cualquier disciplina.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761671327264-rqsoqz.jfif',1,'2025-06-18 19:57:28','2025-10-28 17:08:47'),(10,'Pesas rusas Grandes','pesas rusas de gran calidad','http://localhost:3000/api/v1/categorias/imagen/portadas/1757505386045-t2gcum.jpg',0,'2025-09-09 19:55:06','2025-09-10 11:56:26'),(11,'Barras olimpicas','Barras olimpicas de 20 kilogramos maxima calidad','http://localhost:3000/api/v1/categorias/imagen/portadas/1757505728407-a3tvw4.webp',0,'2025-09-10 12:02:08','2025-10-28 11:46:17'),(13,'Mancuernas','Diseñadas en fundición de acero cromado. Ideales para entrenamiento de fuerza y tonificación. Amplio rango de pesos disponibles.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761651905208-fektea.jfif',1,'2025-09-10 15:30:42','2025-10-28 11:45:05'),(14,'Bancos y Racks de Musculación','Bancos y racks de máxima estabilidad y resistencia. Diseñados para entrenamientos seguros con pesas libres. Ajustables para trabajar todos los grupos musculares.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761653192807-a7tpkh.jfif',1,'2025-10-28 12:06:32','2025-10-28 12:06:32'),(15,'Máquinas Multifunción','Optimiza tu espacio con equipos todo-en-uno para un entrenamiento completo. Diseños robustos que integran múltiples estaciones de ejercicio. La solución definitiva para tu hogar o gimnasio.','http://localhost:3000/api/v1/categorias/imagen/portadas/1761673180789-pl0kqx.webp',1,'2025-10-28 12:09:27','2025-10-28 17:39:40');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuponesdescuento`
--

DROP TABLE IF EXISTS `cuponesdescuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuponesdescuento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `porcentajeDescuento` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `idProducto` int DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  UNIQUE KEY `codigo_2` (`codigo`),
  UNIQUE KEY `codigo_3` (`codigo`),
  UNIQUE KEY `codigo_4` (`codigo`),
  UNIQUE KEY `codigo_5` (`codigo`),
  UNIQUE KEY `codigo_6` (`codigo`),
  UNIQUE KEY `codigo_7` (`codigo`),
  UNIQUE KEY `codigo_8` (`codigo`),
  UNIQUE KEY `codigo_9` (`codigo`),
  UNIQUE KEY `codigo_10` (`codigo`),
  UNIQUE KEY `codigo_11` (`codigo`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `cuponesdescuento_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuponesdescuento`
--

LOCK TABLES `cuponesdescuento` WRITE;
/*!40000 ALTER TABLE `cuponesdescuento` DISABLE KEYS */;
INSERT INTO `cuponesdescuento` VALUES (1,'Descuento Bienvenida','BIENVENIDA10',25,1,3,'2025-06-22 18:41:52','2025-06-22 18:41:52'),(2,'Descuento Bienvenida2','BIENVENIDA101',20,1,5,'2025-06-22 18:42:20','2025-06-22 18:42:20'),(3,'Descuento de Invierno','INVIERNO2025',50,0,10,'2025-06-22 18:43:15','2025-09-10 14:13:22'),(4,'Primavera2025','PRIMAVERAfull25',16,1,5,'2025-09-10 14:19:08','2025-09-10 14:19:08');
/*!40000 ALTER TABLE `cuponesdescuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemscarrito`
--

DROP TABLE IF EXISTS `itemscarrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemscarrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCarrito` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idCarrito` (`idCarrito`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `itemscarrito_ibfk_31` FOREIGN KEY (`idCarrito`) REFERENCES `carritos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itemscarrito_ibfk_32` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemscarrito`
--

LOCK TABLES `itemscarrito` WRITE;
/*!40000 ALTER TABLE `itemscarrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemscarrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsorden`
--

DROP TABLE IF EXISTS `itemsorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemsorden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrden` int NOT NULL,
  `idProducto` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idOrden` (`idOrden`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `itemsorden_ibfk_31` FOREIGN KEY (`idOrden`) REFERENCES `ordenes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `itemsorden_ibfk_32` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsorden`
--

LOCK TABLES `itemsorden` WRITE;
/*!40000 ALTER TABLE `itemsorden` DISABLE KEYS */;
INSERT INTO `itemsorden` VALUES (20,23,4,4,24.99),(21,23,9,1,145.00),(22,24,4,4,24.99),(23,24,9,1,145.00),(24,25,9,2,145.00),(25,25,20,2,2348.00),(26,25,5,1,89.00),(29,28,10,1,29.95),(30,28,3,1,349.00),(34,32,4,1,24.99),(35,33,4,2,24.99),(36,33,3,4,349.00),(37,33,NULL,1,34.00),(38,34,7,3,129.99),(39,34,3,1,349.00),(40,35,7,1,129.99),(41,36,23,1,100800.00),(42,37,23,1,100800.00),(43,38,51,1,123443.00),(44,39,51,1,123443.00);
/*!40000 ALTER TABLE `itemsorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text,
  `idProducto` int NOT NULL,
  `calificacion` int DEFAULT NULL,
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (19,'Producto de calidad',9,5,'2025-10-14 14:25:33','2025-10-14 14:25:33'),(20,'Lo compre por segunda vez por su solidad',9,4,'2025-10-14 14:34:30','2025-10-14 14:34:30'),(21,'Producto acorde a las especificaciones',4,4,'2025-10-14 14:44:40','2025-10-14 14:44:40'),(22,'Muy conforme con la compra!',3,5,'2025-10-14 14:56:08','2025-10-14 14:56:08'),(23,'Muy bueno',20,4,'2025-10-14 20:41:38','2025-10-14 20:41:38'),(24,'Genial ?',9,5,'2025-10-20 12:43:52','2025-10-20 12:43:52'),(25,'Producto muy bueno',51,4,'2025-10-31 13:14:28','2025-10-31 13:14:28');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `fechaOrden` datetime DEFAULT NULL,
  `estado` enum('pendiente','confirmada','enviada','cancelada') NOT NULL DEFAULT 'pendiente',
  `total` decimal(10,2) DEFAULT NULL,
  `nombreEnvio` varchar(255) DEFAULT NULL,
  `direccionEnvio` text NOT NULL,
  `telefonoEnvio` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (23,29,'2025-10-09 14:35:13','confirmada',NULL,'Emilio Perez','Av Libres del Sur','54 11 1234-5678'),(24,29,'2025-10-09 14:53:17','cancelada',NULL,'Emilio Perez','dadaddada','54 11 1234-5678'),(25,29,'2025-10-09 15:51:40','enviada',NULL,'pedro paramo','av la leñas','54 11 1234-5678'),(28,29,'2025-10-13 12:37:57','pendiente',NULL,'Emilio Perez','estrada 50','3844418268'),(32,30,'2025-10-14 14:51:21','pendiente',NULL,'Emilio Perez','Av Sin lujos','54 11 1234-5678'),(33,31,'2025-10-14 20:34:21','pendiente',NULL,'Emilio Perez','Av Ejemplo','3844418268'),(34,31,'2025-10-15 12:58:03','confirmada',NULL,'Omar Perez','Calle s/n','54 11 1234-5678'),(35,29,'2025-10-23 13:17:15','pendiente',NULL,'Carlos Rodriguez','Gral. Taboada 27','3844418268'),(36,29,'2025-10-28 20:34:34','pendiente',NULL,'Carlos Rodriguez','Av ejemplo 123','3844418268'),(37,29,'2025-10-30 22:58:29','pendiente',NULL,'Carlos Rodriguez','Av ejemplo','3844418268'),(38,29,'2025-10-31 00:38:15','pendiente',NULL,'Carlos Rodriguez','Av. Ejemplo 123','3844418268'),(39,29,'2025-10-31 00:42:20','pendiente',NULL,'Carlos Rodriguez','Av. Ejemplo 123\n','3844418268');
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagenUrl` varchar(255) NOT NULL,
  `especificaciones` varchar(255) NOT NULL,
  `idCategoria` int NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `calificacion` int DEFAULT NULL,
  `oferta` tinyint(1) NOT NULL DEFAULT '0',
  `descuento` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (3,'Discos Rogue HG 2.0','Set de discos de hierro con revestimiento de caucho para mayor protección. Compatibles con barras olímpicas estándar.',34900.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418540455-0iphi6.avif','Material: Hierro con revestimiento de caucho. Compatibilidad: Barras olímpicas estándar. Tipo: Set de discos.',2,1,'2025-06-18 19:39:45','2025-10-28 13:28:10',4,0,0),(4,'Soga para saltar','Cuerda de velocidad ajustable con rodamientos de alta calidad y cable de acero. Ideal para dobles unders.',2400.99,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418557694-y9j8cd.jpg','Unidades por pack: 1. Largo: 3m.Hecho en pvc. Con mango ergonómico.\r\n\r\n\r\n',9,1,'2025-06-18 19:40:36','2025-10-28 13:22:01',3,1,10),(5,' Anillo de Madera Rogue','Anillas de madera de maple con correas ajustables. Perfectas para muscle-ups, dips y ejercicios de gimnasia.',8900.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418571077-9vq9it.jpg','Material: Madera de maple. Característica: Correas ajustables. Uso: Muscle-ups, dips y gimnasia.',9,1,'2025-06-18 19:41:03','2025-10-28 13:52:38',5,0,0),(7,'5.11 Chaleco Tactico','Chaleco ajustable con capacidad para placas de peso. Usado en WODs con carreras y ejercicios de resistencia.',12567.99,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418596289-qvyoia.jpg','Tipo: Chaleco lastrado. Característica: Ajustable. Uso: WODs con carreras y resistencia.',9,1,'2025-06-18 19:41:46','2025-10-28 13:25:51',4,1,20),(9,'Rogue 20\" Plyo Box','Cajón de madera contrachapada para saltos pliométricos. Disponible en múltiples alturas. Resistente y estable.',14500.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418632090-0igbda.jpg','Material: Madera contrachapada. Altura: 20 pulgadas. Uso: Saltos pliométricos.',9,1,'2025-06-18 19:43:40','2025-10-28 13:27:24',3,0,0),(10,'Agarres de Mano WODFingers','Protectores de cuero para evitar rozaduras en barras y anillas. Diseño ergonómico con agujeros para los dedos.',20188.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1757418645286-mlq4v9.jpg','Material: Cuero. Característica: Diseño ergonómico. Uso: Protección en barras y anillas.',6,1,'2025-06-18 19:45:29','2025-10-28 14:00:51',4,0,0),(18,'super disco','Sin descripcion',234.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761655640026-5105me.avif','undefined',2,0,'2025-09-11 17:18:30','2025-10-28 12:47:20',NULL,0,0),(20,'Rack sentadilla','Soporte robusto para entrenamiento con barra. Diseño estable que garantiza máxima seguridad. Ideal para sentadillas.',184000.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761656015226-f4ckrl.jpg','Confeccionado en hierro. Altura mínima: 105 cm. Altura máxima: 155 cm. Ancho total: 100 cm. Distancia central: 67 cm. Profundidad: 48 cm. Caño de 4 x 4 cm',14,1,'2025-09-30 13:09:47','2025-10-28 14:09:59',NULL,0,0),(22,'Barra olimpica','Con rodamientos de aguja para un giro ultra fluido y un agarre agresivo que maximiza tu potencia y control.',50000.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761660450134-liwlpf.webp','Capacidad para 1,500 lbs. Rotación suave. Agarre de acero de primera calidad',2,1,'2025-10-28 14:07:30','2025-10-28 14:08:49',NULL,0,0),(23,'Zapatillas Deportivas Everlast','Zapatillas Deportivas Everlast de primera calidad. Deportes recomendados: Levantamiento de pesas, crossfit, entrenamiento deportivo',100800.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761661180610-z1d6sf.webp','Marca: Everlast. Materiales del exterior: Cuero sintético. Materiales de la suela: Goma',1,1,'2025-10-28 14:19:40','2025-10-28 14:20:38',NULL,0,0),(24,'Zapatillas Reebok Nano Pro','Las Reebok Nano Pro ofrecen estabilidad, resistencia y flexibilidad para acompañar tus rutinas más exigentes.',202099.06,'http://localhost:3000/api/v1/productos/imagen/portadas/1761662172157-n8lmq7.webp','Diseño de la tela: Lisa. Tiene cordones para un ajuste confortable.Su color principal es blanco con un diseño lisa. Interior de textil.',1,1,'2025-10-28 14:28:07','2025-10-28 14:36:12',NULL,0,0),(25,'Zapatillas Crossfit Everlast','Las Zapatillas Deportivas de Levantamiento Crossfit Everlast 01333 son la elección ideal para quienes buscan rendimiento.',118750.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761662494378-nmarnr.webp','Marca: Everlast. Materiales de la suela: Goma. Materiales del exterior: Gamuza, Cuero sintético, Tejido',1,1,'2025-10-28 14:41:34','2025-10-28 14:42:15',NULL,0,0),(26,'Banco Gimnasio Multiangular','Banco multiangular ideal para entrenamientos completos. Con respaldo regulable en 6 posiciones y asiento fijo.',265191.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761670401567-oai1xb.webp','Hecho en acero cuero sintético. Soporta hasta 320 kg.',14,1,'2025-10-28 16:53:21','2025-10-28 16:53:21',NULL,0,0),(27,'Banco Plano Gimnasio Ejercicios','Banco Plano Gimnasio Ejercicios Pesas Press Pectorales Gym Negro Con Dorado de gran calidad y materiales premiun.',159660.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761670851015-rxu72o.webp','Color: Negro con dorado. Marca: Fibra Fitness. Peso máximo soportado: 260 kg. Materiales: Acero cuero sintético',14,1,'2025-10-28 17:00:51','2025-10-28 17:00:51',NULL,0,0),(28,'Disco Bumper Set X 30kg','Disco Bumper Set X 30kg 50 Mm Olimpico Cross Fitness Deporar Color Negro&gris ( 2 De 10 Kg + 2 De 5 Kg ).',301659.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761671188009-bimycb.webp','Unidades por pack: 4. Peso: 30 kg. Con recubrimiento. Hecha en: bumper. Con identificador de peso.',2,1,'2025-10-28 17:06:28','2025-10-28 17:06:28',NULL,0,0),(29,'Guantes Gimnasio Gym','Guantes de gimnasio con palma reforzada y antideslizante, muñequera integrada y tiradores entre los dedos para fácil extracción.',24999.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761671603900-2ckemg.webp','Marca: GRIPSAFE. Materiales: Microfibra, Poliéster, Silicona. Género: Sin género. Diseño De La Tela: Geométrico',6,1,'2025-10-28 17:13:23','2025-10-28 17:13:23',NULL,0,0),(30,'Calleras Gym Guantes','Las Calleras Deportivas Buy Way Imports están diseñadas para vos. Fabricadas en silicona flexible, antialérgica.',15000.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761671920714-pyoghp.webp','Marca: buyWay. Materiales: Silicona. Talle único: Se adapta a diferentes tamaños de mano. Lavables y reutilizables. Diseño ergonómico',6,1,'2025-10-28 17:18:40','2025-10-28 17:18:40',NULL,0,0),(31,'Kit Mancuernas','Este kit incluye dos mancuerna clásicas con topes, fabricadas en hierro de alta calidad, garantizando durabilidad y resistencia. ',129190.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761672271443-2zaxjo.webp','Con recubrimiento. Hecha en: hierro. Con identificador de peso. Con mango ergonómico y antideslizante. Mide 35cm de largo.',13,1,'2025-10-28 17:24:31','2025-10-28 17:24:31',NULL,0,0),(32,'Mancuernas Hexagonales','Mancuerna Hexagonal engomada de alta densidad con centro de acero cromado, agarre antideslizante diamantado y forma hexagonal evita que ruede.',89670.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761672594442-az2dod.webp','Mancuerna hexagonal de alta densidad con centro de acero cromado. Agarre antideslizante diamantado para mayor seguridad en el entrenamiento. Peso: 15 kg',13,1,'2025-10-28 17:29:54','2025-10-28 17:29:54',NULL,0,0),(33,'Pesa Mancuerna Ajustable','Mancuerna Ajustable JPDumbbell Easy Fitness 24 kg Optimiza tu espacio. 15 Pesas en una, Fácil de trasladar. Más seguridad, más orden.',231000.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761672914509-ll1s21.webp','Unidades por pack: 1. Peso: 24 kg. Material de alta resistencia de acero y revestimiento de PVC para mayor durabilidad. Sistema de ajuste rápido con 15 pesos en una sola mancuerna.',13,1,'2025-10-28 17:35:14','2025-10-28 17:35:14',NULL,0,0),(34,'Multigimnasio Multigym','Multigimnasio ARG-63120. Asientos acolchados de cuero sintético rellenos de espuma de poliuretano. Incluye estación Scott.',538698.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761673555728-v9ach7.webp','Color del tapizado: Rojo. Color de la estructura: Negro. Carga incluída: 45kg. Admite un peso máximo de usuario de 120kg. Barra incluída. Incluye cables reforzados y sistema de poleas.',15,1,'2025-10-28 17:45:55','2025-10-28 17:45:55',NULL,0,0),(35,'Multigimnasio Athletic','El Home Gym 460M ofrece entrenamientos eficientes en casa para toda la familia, con características innovadoras.',1686702.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761673830074-yjp2hm.webp','Color del tapizado: Negro.\r\nColor de la estructura: Negro.\r\nEjercicio recomendado: pecho frontal.\r\nCarga máxima de 125kg.\r\n Músculo a entrenar: triceps.\r\nBarra incluída.\r\nIncluye cables reforzados y sistema de poleas.',15,1,'2025-10-28 17:50:30','2025-10-28 17:50:30',NULL,0,0),(36,'Maquina Multifuerza Smith','Nueva MAQUINA MULTIFUERZA GRAVEDAD CERO GENETIC PRO, hecha en caños tubulares curvos de 100x50 soldado semi-automatico.',3995500.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761674265221-tegceb.webp','Altura: 2.2 m.\r\nMarca: Genetic.\r\nAncho: 2.2 m.\r\nColor Del Tapizado: Acero',15,1,'2025-10-28 17:57:45','2025-10-28 17:57:45',NULL,0,0),(37,'Set 3 Pesas Rusas','Descubre el \'Set 3 Pesas Rusas Kettlebell 6kg/8kg/10kg Mr Gym\', la herramienta perfecta para llevar tu entrenamiento al siguiente nivel.',30038.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761674602636-w1vwem.webp','Núcleo de cemento y granalla metálica para mayor durabilidad.\r\nRecubrimiento de PVC que evita lesiones en las manos.\r\nBase diseñada para no marcar el piso.',3,1,'2025-10-28 18:03:22','2025-10-28 18:03:22',NULL,0,0),(38,'Pesa Rusa Kettlebell 24kg','Pesa Rusa de Fundición 24 kg – Potencia y resistencia para atletas exigentes. Diseñada para entrenamientos intensos y de nivel avanzado',234729.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761675014715-pzh1dw.webp','Peso: 24 kg.\r\nFabricada en fundición nacional ultra resistente.\r\nAgarre firme, cómodo y seguro.\r\nNo daña el piso.\r\nTratamiento antióxido para mayor vida útil.\r\nSuperficie suave que no irrita ni lastima las manos',3,1,'2025-10-28 18:10:14','2025-10-28 18:10:14',NULL,0,0),(39,'Pesa Rusa Regulable','La pesa rusa kettlebell regulable de Duko Fitness es la herramienta ideal para quienes buscan maximizar su entrenamiento en casa o en el gimnasio.',197880.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761675876328-3olz5f.webp','Peso: 20 kg. Fabricado en hierro. Con recubrimiento. regulable 7 en 1',3,1,'2025-10-28 18:24:36','2025-10-28 18:24:36',NULL,0,0),(40,'Remera Técnica Corvus','Remera técnica Corvus Chitah remera manga corta polera polo gimnasio gym entrenamiento tenis futbol running crossfit funcional',29500.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761676248742-rit4i4.webp','Material drifit cool calado. Cuello redondo. Anatómica. Corte regular fit. Transpirable. Respirable. Secado rápido\r\n',4,1,'2025-10-28 18:30:48','2025-10-28 18:30:48',NULL,0,0),(41,'Sudaderas Training Gym','Sudaderas Training Gym Culturismo Fitness Olimpica de Algodon Talles del S al XXL. Ideal para todo tipo de actividad fisica.',36100.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761676582745-cqrg4l.webp','Deportes recomendados: Fitness. Marca: Uro',4,1,'2025-10-28 18:36:22','2025-10-28 18:36:22',NULL,0,0),(42,'Bermuda Jiu Jitsu','Construido a partir de una microfibra duradera, los pantalones Fight Effect fueron diseñados para medir tu determinación.',59257.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761676938088-wpukzl.webp','100% poliéster liviano y duradero.\r\nDiseño sublimado asegurando durabilidad y calidad insuperable.\r\nCosturas reforzadas: vida prolongada.\r\n Peso: 270 gms',4,1,'2025-10-28 18:42:18','2025-10-28 18:42:18',NULL,0,0),(43,'Suplemento En Polvo Ena','Descubre el poder de la Creatina ENA monohidratada, un suplemento esencial para potenciar tu rendimiento físico.',30900.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761677235858-kbt7g3.webp','Peso de la unidad: 300 g.\r\nVolumen de la unidad: 300 mL.\r\nUnidades por envase: 2.\r\nUnidades por pack: 2.\r\nSabor: Sin sabor.\r\nTipo de envase: Sachet.\r\nSuplemento de uso deportivo.\r\nSin tacc y sin lactosa.\r\nProducto vegano.',5,1,'2025-10-28 18:47:15','2025-10-28 18:47:15',NULL,0,0),(44,'Gold Nutrition Omega 3 Fish Oil','Este suplemento está formulado para apoyar tu salud cardiovascular, cerebral y articular, proporcionándote la pureza y eficacia que necesitas.',32532.50,'http://localhost:3000/api/v1/productos/imagen/portadas/1761677571638-kk342h.webp','Unidades por envase: 1.\r\nUnidades por pack: 1.\r\nSabor: Neutro.\r\nTipo de envase: Frasco.\r\nDHA 500 mg y EPA 150 mg por porción para salud cardiovascular.\r\nCápsulas Softgel de rápida absorción y máxima pureza.',5,1,'2025-10-28 18:52:51','2025-10-28 18:52:51',NULL,0,0),(45,'Citrato de Magnesio','Suplemento nutricional de alta calidad que te ayudará a mejorar tu bienestar y rendimiento físico.',18000.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761680374552-g2f0jf.webp','Unidades por envase: 1.\r\nUnidades por pack: 1.\r\nTipo de envase: Sachet.\r\nCitrato de Magnesio de alta calidad para bienestar y rendimiento.\r\nPráctico sachet de 1 kg, fácil de almacenar y transportar.',5,1,'2025-10-28 19:12:12','2025-10-28 19:39:34',NULL,1,25),(46,'Bola Medicinal Slam Ball 15 Kg','La Bola Medicinal Slam Ball de 15 Kg es el complemento perfecto para tus entrenamientos funcionales y explosivos.',105630.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761678926364-6rwlxu.webp','Unidades por pack: 1.\r\nFormato de venta: Unidad.\r\nMaterial: goma.\r\nDiámetro: 30cm.',7,1,'2025-10-28 19:15:26','2025-10-28 19:15:26',NULL,0,0),(47,'Pelota Medicinal Funcional','Pelota / Balón / Medicine Ball SIN PIQUE 15 Kg de lona FULL FITNESS\r\nDoble Costura - Compacta.',57960.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761679092956-vgk6dt.webp','Color atractivo en azul y negro que se adapta a cualquier entorno de entrenamiento.\r\nDiámetro de 38 cm ideal para ejercicios funcionales.',7,1,'2025-10-28 19:18:12','2025-10-28 19:18:12',NULL,0,0),(48,'Pelota C/pique Cross-fit','Las GET FIT!® Medicine Ball son ideales para un gimnasio comercial. Tiene una superficie texturizada para un mejor agarre.',125132.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761679419124-agssrq.webp','Peso: 5 kg.\r\nColor gris elegante que se adapta a cualquier entorno de entrenamiento.\r\nDiámetro de 23 cm ideal para ejercicios funcionales.',7,1,'2025-10-28 19:23:39','2025-10-28 19:23:39',NULL,0,0),(51,'Kit Discos Rosca 15 Kg Maletin','mancuernas de hierro fundido cromado, un diseño robusto y elegante, este kit permite trabajar todo el cuerpo con la máxima durabilidad.',123443.00,'http://localhost:3000/api/v1/productos/imagen/portadas/1761861758398-lpzzfn.webp','Unidades por pack: 18.\r\nPeso: 15 kg.\r\nCon recubrimiento.\r\nHecha en: hierro fundido.\r\nCon identificador de peso.\r\nForma del producto redonda.',13,1,'2025-10-30 22:02:38','2025-10-30 22:02:38',NULL,0,0);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('bronce','plata','oro') NOT NULL DEFAULT 'bronce',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fechaCreacion` datetime NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarios_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (17,'Juan Mario Pedro','Perez','juam@email.com','$2b$12$SWMA8yn0YOFFUAA0Cp9DTe4mnnhOVMTNGsYGWmVHWDTkq2xXnr/2K','bronce',1,'2025-08-20 15:25:33','2025-09-30 20:46:46'),(21,'Nataly','Bedoya','naty@email.com','$2b$12$WIbjKKq1qzrqd2zNRfXyjOv17IJY79HvalJ0UtxBQ1vyc5aEweQvK','plata',1,'2025-09-25 14:52:44','2025-09-25 15:17:56'),(25,'Leandro','Herrera','leoAndro@email.com','$2b$12$7psWqwJiIiKD6/93K/XuxOI2inAb6gvTVqJ/wlIq9MEWxauK0xAMO','bronce',1,'2025-09-25 18:12:19','2025-09-25 18:15:06'),(26,'carlos','rodriguez','cualquiera@email.com','$2b$12$5iDh.wJCrlnLhUk87TAvM..Bzsw4fm2fhsdBK5.MHdIYITL.muvPW','bronce',1,'2025-09-30 20:46:13','2025-09-30 20:46:13'),(27,'Pedro','Llanos','ayuda234@email.com','$2b$12$GN09T3Xlq/bef2.Li/4ULO5U4hxwNcP9OEWpfd969RHqgUxZxRW1i','bronce',1,'2025-10-04 14:28:22','2025-10-04 14:28:22'),(28,'Omar','Paz','paz@gmail.com','$2b$12$jPc59puifhHgMH0.ODUqXug7iUZeSTK/Czb/AUrD76100FJIsGl1.','bronce',1,'2025-10-04 14:42:03','2025-10-04 14:42:03'),(29,'Carlos','Rodriguez','rodr26707@gmail.com','$2b$12$c1JcJVbZj/hfbhvpJv1Q.OZFFOqhVl2i3SvTks.B7nNmVTX6hrPRq','bronce',1,'2025-10-06 11:35:05','2025-10-06 11:35:05'),(30,'Juan','Perez','perez@gmail.com','$2b$12$D0Wq4KvreN2wN9oeZnIFq.0vBYuX2A5qMSLQWvF3QGGG/2UHOG5TW','bronce',1,'2025-10-14 14:41:05','2025-10-14 14:41:05'),(31,'Omar','Ibañez','ibaOma@gmail.com','$2b$12$hvH4ZV.p5qjtHuKi.oSWXOOSXWApdSsDPZQXU18K7g5850BsM.c6a','bronce',1,'2025-10-14 14:42:30','2025-10-14 14:42:30'),(32,'Claudia','Contreras','col.florentino.ameghino@gmail.com','$2b$12$7xcIoy/RYCvNIN3rQLn9ruMEGp2gmKEwCumSBpi0kVitBDEaVoX.S','bronce',1,'2025-10-23 13:31:20','2025-10-23 13:31:20'),(33,'Cliente','ElNumero!','cliente1@vitalcrossfitteam.testinator.com','$2b$12$JCewtynQKQfwOzn9V6IRD.bj/75D.ipSx3ofy52huFS9B3VU3aNt.','bronce',1,'2025-10-28 20:40:17','2025-10-28 20:40:17'),(34,'Juan','Perez','nuevo_cliente@vitalcrossfitteam.testinator.com','$2b$12$/Z9E9b2ue9/cEpeGCDaLYuaSHX0pBj8.dyAXCrhNiOqVddLV4LNd2','bronce',1,'2025-10-31 12:07:37','2025-10-31 12:07:37'),(36,'Juan','Gomez','nuevo_cliente_2@vitalcrossfitteam.testinator.com','$2b$12$QYDeaJIoW0xLF0IILYo44edJGWs.v840H2YFUOATMkMU6j6fjv1sq','bronce',1,'2025-10-31 12:14:13','2025-10-31 12:14:13');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-03 11:09:26
