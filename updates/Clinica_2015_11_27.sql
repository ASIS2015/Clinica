-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime DEFAULT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `id_personal_medico` int(11) DEFAULT NULL,
  `Comentarios` varchar(150) DEFAULT NULL,
  `id_tipo_cita` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,'2015-11-22 15:50:00',1,1,'Traer expediente',1,4),(2,'2015-11-22 15:50:00',2,1,'Traer muestras de sangre',2,2),(3,'2015-11-22 15:50:00',3,2,'Llamar al paciente para recordar, al menos una hora antes',1,1),(4,'2015-11-20 09:00:00',6,1,'Algo que hacer',1,4),(5,'2015-11-22 13:00:00',4,1,'Prestados',2,3),(6,'2015-11-22 14:22:00',4,1,'dasdadas',1,4),(7,'2015-11-04 11:11:00',6,1,'SDASDASDSADSAD',3,2),(8,'2015-11-22 11:11:00',6,1,'SDASDASDSADSAD',2,2),(9,'2015-11-04 11:11:00',6,1,'SDASDASDSADSAD',2,2),(10,'2015-11-04 11:11:00',6,1,'SDASDASDSADSAD',2,2),(11,'2015-11-04 11:11:00',6,1,'SDASDASDSADSAD',1,2),(12,'2015-11-04 11:11:00',6,1,'SDASDASDSADSAD',2,3),(13,'2015-11-22 11:11:00',6,1,'SDASDASDSADSAD',1,4),(14,'2015-11-06 06:06:00',1,1,'dsdasdsadsa',1,4),(15,'2015-11-06 06:06:00',1,1,'dsdasdsadsa',1,4),(16,'2015-11-04 11:11:00',1,1,'wwwwww',1,2),(17,'2015-11-05 11:11:00',6,1,'PEDRO PICA PIEDRA',2,4),(18,'2015-11-04 11:11:00',1,1,'wwwwww',2,4),(19,'2015-11-22 03:33:00',7,1,'Pedro Juan',1,2),(20,NULL,NULL,NULL,NULL,3,NULL),(21,'2015-11-25 13:00:00',7,1,'Comentarios Comentarios Comentarios Comentarios ',1,4),(22,'2015-11-28 12:23:00',7,1,'ytytytytytytyt',1,1),(23,'2015-11-25 17:00:00',9,9,'Nada que comentar',1,4),(24,'2015-11-25 17:00:00',9,9,'Nada que ver',1,4),(25,'2015-11-25 17:30:00',16,10,'No hay tiempo',1,4),(26,'2015-11-03 13:00:00',17,10,'dfsdfsfdfsdfdsfdsfdsfdsd',1,4),(27,'2015-11-03 13:00:00',17,10,'dfsdfsfdfsdfdsfdsfdsfdsd',1,4),(28,'2015-11-02 11:11:00',17,16,'oooooo',1,4),(29,'2015-11-05 14:22:00',16,16,'sdsfsdfdsfsdfdsfsdf',1,4),(30,'2015-11-01 11:11:00',17,10,'fgfdgdfgfdgfdgfdgfd',1,2),(31,'2015-11-25 11:11:00',17,17,'dasdsadsdasdas',1,1),(32,'2015-11-26 23:58:00',17,16,'dasdasdas',1,1),(33,'2015-12-17 00:00:00',17,10,'tertetretre',1,4),(34,'2015-11-01 12:59:00',17,17,'tyuytu',1,4),(35,'2015-11-01 23:58:00',17,16,'rererwrwer',1,4),(36,'2015-11-25 06:55:00',10,17,'gfgdfgfdgd',1,4);
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_medico`
--

DROP TABLE IF EXISTS `detalle_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_personal` int(11) DEFAULT NULL,
  `jvpm` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_medico`
--

LOCK TABLES `detalle_medico` WRITE;
/*!40000 ALTER TABLE `detalle_medico` DISABLE KEYS */;
INSERT INTO `detalle_medico` VALUES (1,17,'A7896');
/*!40000 ALTER TABLE `detalle_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Abierta'),(2,'Cerrada'),(3,'Cancelada'),(4,'Finalizada');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expediente`
--

DROP TABLE IF EXISTS `expediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_personal` int(11) DEFAULT NULL,
  `id_receta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expediente`
--

LOCK TABLES `expediente` WRITE;
/*!40000 ALTER TABLE `expediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `expediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cita` int(11) DEFAULT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `total_medicina` double DEFAULT NULL,
  `total_consulta` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,19,1,34.5,5,39.5),(2,19,1,34.5,5,39.5),(3,19,1,34.5,5,39.5),(4,19,1,34.5,5,39.5),(5,19,1,34.5,5,39.5),(6,19,1,34.5,5,39.5),(7,19,1,34.5,5,39.5),(8,19,1,34.5,5,39.5),(9,19,1,34.5,5,39.5),(10,19,1,34.5,5,39.5),(11,19,1,34.5,5,39.5),(12,8,1,0,12.5,12.5),(13,8,1,0,12.5,12.5),(14,8,1,0,12.5,12.5),(15,9,1,0,12.5,12.5),(16,10,1,0,12.5,12.5),(17,11,4,0,12.5,12.5),(18,16,6,0.7,10,10.7),(19,30,10,0,10,10);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicinas`
--

DROP TABLE IF EXISTS `medicinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinas`
--

LOCK TABLES `medicinas` WRITE;
/*!40000 ALTER TABLE `medicinas` DISABLE KEYS */;
INSERT INTO `medicinas` VALUES (1,'PARACETAMOL',50,0.25),(4,'VITAGRIP',50,0.35),(5,'ULTRACID',50,1),(7,'ACETAMINOFEN',50,0.58);
/*!40000 ALTER TABLE `medicinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_medicina` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,5,100,1),(2,5,50,3),(3,5,100,4),(4,7,50,1);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(150) DEFAULT NULL,
  `Apellidos` varchar(150) DEFAULT NULL,
  `DUI` varchar(45) DEFAULT NULL,
  `Celular` varchar(45) DEFAULT NULL,
  `Fijo` varchar(45) DEFAULT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Domicilio` varchar(250) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DUI_UNIQUE` (`DUI`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Roberto Napoleon','Siman Poma','0000000','895623','2245-8956','2015-11-04','iraheta@gmail.com','Col. Miralvalle, calle amsterdam',2),(4,'Ricardo','Sosa','784512-7','7845-8989','2301-8956','1982-09-10','asd@ddd.com','Col. Miralvalle',1),(6,'Carlos','Magno','7845236','784512','2356898','2015-11-18','robertoira.heta@gmail.com','Col. Miralvalle, calle amsterdam',3),(7,'Juan Carlos','Siman Poma','123456789-9','7845-5623','4578-8956','1988-02-17','robertoira.heta@gmail.com','Col. Miralvalle, calle amsterdam',1),(8,'Ana','lfaro','00000','7827-0027','2523-9600','1990-05-13','robertoira.heta@gmail.com','Col. Miralvalle',1),(9,'Karla Bea','Cadiz Beltran','7894562-8345','7845-89565','7845-8956','2015-11-03','78asd','Col. Miralvalle',2),(10,'Beatriz del crmen','Perez','7812er8934','7827-0027','2523-9600','2015-11-24','robertoira.heta@gmail.com','Col. Miralvalle',2),(12,'Beatriz del crmen','Perez','7812er89334rf','7827-0027','2523-9600','2015-11-24','robertoira.heta@gmail.com','Col. Miralvalle',2),(14,'Beatriz del crmen','Perez','7812er89','7827-0027','2523-9600','2015-11-24','robertoira.heta@gmail.com','Col. Miralvalle',2),(16,'ACETAMINOFEN','Siman Poma','784512-7er','7827-0027','20.365','2015-11-26','robertoira.heta@gmail.com','Col. Miralvalle',2),(17,'ACETAMINOFEN','Iraheta Alfaro','123op456789-978','7827-0027','20.365','2015-11-25','robertoira.heta@gmail.com','Col. Miralvalle',2);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recetas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cita` int(11) DEFAULT NULL,
  `id_medicina` int(11) DEFAULT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (1,19,1,'cada 8 horas',2),(2,19,1,'cada 8 horas',34),(3,19,1,'cada 8 horas',34),(4,19,1,'cada 8 horas',34),(5,19,1,'cada 8 horas',34),(6,16,4,'cada 8 horas',2),(7,33,4,'cada 8 horas',25),(8,33,4,'cada 8 horas',25),(9,13,1,'cada 8 horas',25),(10,23,1,'cada 8 horas',2),(11,36,1,'cada 8 horas',25),(12,36,1,'cada 8 horas',25),(13,36,1,'dsfsdf',25);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Paciente'),(2,'Medico'),(3,'Empleado');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cita`
--

DROP TABLE IF EXISTS `tipo_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cita`
--

LOCK TABLES `tipo_cita` WRITE;
/*!40000 ALTER TABLE `tipo_cita` DISABLE KEYS */;
INSERT INTO `tipo_cita` VALUES (1,'GENERAL',5),(2,'ESPECIALIDAD',10),(3,'DENTISTA',12.5);
/*!40000 ALTER TABLE `tipo_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_usuario`
--

DROP TABLE IF EXISTS `tipos_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_usuario`
--

LOCK TABLES `tipos_usuario` WRITE;
/*!40000 ALTER TABLE `tipos_usuario` DISABLE KEYS */;
INSERT INTO `tipos_usuario` VALUES (1,'Administrador'),(2,'Asistente');
/*!40000 ALTER TABLE `tipos_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `usuario` varchar(80) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `id_personal` int(11) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('admin','admin',1,1),('federico','qwe',2,7),('roberto','123456',2,2),('yema','yema',2,0);
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

-- Dump completed on 2015-11-27  8:17:26
