mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.4.10, for Linux (x86_64)
--
-- Host: localhost    Database: gestion_academica_universidad
-- ------------------------------------------------------
-- Server version	8.4.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `id_docente` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` int NOT NULL,
  `creditos` tinyint NOT NULL,
  `semestre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id_docente`),
  CONSTRAINT `cursos_chk_1` CHECK ((`codigo` > 0)),
  CONSTRAINT `cursos_chk_2` CHECK ((`creditos` between 1 and 6))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,1,'Bases de Datos',1001,4,'2026-1'),(2,1,'Programación Orientada a Objetos',1002,3,'2026-1'),(3,2,'Fundamentos de Enfermería',2001,5,'2026-1'),(4,3,'Gestión Empresarial',3001,3,'2026-1');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_institucional` varchar(200) NOT NULL,
  `departamento_academico` varchar(100) NOT NULL,
  `anios_experiencia` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `correo_institucional` (`correo_institucional`),
  CONSTRAINT `docentes_chk_1` CHECK ((`anios_experiencia` between 0 and 60))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Carlos Ramírez','carlos.ramirez@universidad.edu','Ingeniería de Sistemas',12),(2,'Tania Valdes','tania.valdes@universidad.edu','Enfermeria',12),(3,'Sharit Mendoza','sharit.mendoza@universidad.edu','Administración de Empresas',12);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `correo_electronico` varchar(200) NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `identificacion` char(10) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado_academico` enum('Activo','Inactivo','Graduado','Suspendido') NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Juan Pérez','juan.perez@correo.com','Masculino','1234567890','Ingeniería de Sistemas','2003-05-15','2024-01-22','Activo'),(2,'Miguel Ramirez','miguel.ramirez@correo.com','Masculino','1118835689','Enfermeria','2000-05-15','2021-01-02','Activo'),(3,'María Gómez','maria.gomez@correo.com','Femenino','2345678901','Administración de Empresas','2002-11-08','2024-01-22','Activo'),(4,'Carlos Rodríguez','carlos.rodriguez@correo.com','Masculino','3456789012','Enfermeria','2001-08-19','2023-07-31','Activo'),(5,'Valentina Herrera','valentina.herrera@correo.com','Femenino','4567890123','Administración de Empresas','2004-03-27','2025-01-20','Activo');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `id_curso` int NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `calificacion_final` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`),
  CONSTRAINT `inscripciones_chk_1` CHECK (((`calificacion_final` >= 0.00) and (`calificacion_final` <= 5.00)))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (1,1,1,'2026-02-01',4.50),(2,1,2,'2026-02-01',4.20),(3,2,3,'2026-02-02',4.80),(4,3,4,'2026-02-03',4.70),(5,4,3,'2026-02-04',3.90),(6,5,4,'2026-02-05',4.60),(7,3,2,'2026-02-06',4.10),(8,5,1,'2026-02-06',3.80);
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_historial_academico`
--

DROP TABLE IF EXISTS `vista_historial_academico`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_academico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_academico` AS SELECT 
 1 AS `estudiante`,
 1 AS `curso`,
 1 AS `docente`,
 1 AS `semestre`,
 1 AS `calificacion_final`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_historial_academico`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_academico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`postgres`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_academico` AS select `e`.`nombre_completo` AS `estudiante`,`c`.`nombre` AS `curso`,`d`.`nombre_completo` AS `docente`,`c`.`semestre` AS `semestre`,`i`.`calificacion_final` AS `calificacion_final` from (((`inscripciones` `i` join `estudiantes` `e` on((`i`.`id_estudiante` = `e`.`id_estudiante`))) join `cursos` `c` on((`i`.`id_curso` = `c`.`id_curso`))) join `docentes` `d` on((`c`.`id_docente` = `d`.`id_docente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-30 17:15:36
