-- MySQL dump 10.13  Distrib 8.4.11, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `attribute_changes` json DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'ventas','creado','App\\Models\\Sale',14,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"189078.12\", \"notes\": null, \"total\": \"1184226.12\", \"status\": \"pagada\", \"user_id\": 2, \"subtotal\": \"995148.00\", \"client_id\": 5, \"sale_date\": \"2026-11-05T00:00:00.000000Z\", \"invoice_number\": \"FV-00014\"}}','[]','2026-11-05 22:11:27','2026-11-05 22:11:27'),(2,'ventas','actualizado','App\\Models\\Sale',14,'updated','App\\Models\\User',2,'{\"old\": {\"status\": \"pagada\"}, \"attributes\": {\"status\": \"anulada\"}}','[]','2026-11-05 22:12:00','2026-11-05 22:12:00'),(3,'ventas','eliminado','App\\Models\\Sale',14,'deleted','App\\Models\\User',2,'{\"old\": {\"tax\": \"189078.12\", \"notes\": null, \"total\": \"1184226.12\", \"status\": \"anulada\", \"user_id\": 2, \"subtotal\": \"995148.00\", \"client_id\": 5, \"sale_date\": \"2026-11-05T00:00:00.000000Z\", \"invoice_number\": \"FV-00014\"}}','[]','2026-11-05 22:12:00','2026-11-05 22:12:00'),(4,'compras','creado','App\\Models\\Purchase',14,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"5700.00\", \"notes\": null, \"total\": \"35700.00\", \"status\": \"pendiente\", \"user_id\": 2, \"subtotal\": \"30000.00\", \"provider_id\": 3, \"received_at\": null, \"purchase_date\": \"2026-11-05T00:00:00.000000Z\", \"purchase_number\": \"OC-00014\", \"provider_invoice\": null}}','[]','2026-11-05 22:13:39','2026-11-05 22:13:39'),(5,'compras','actualizado','App\\Models\\Purchase',14,'updated','App\\Models\\User',2,'{\"old\": {\"status\": \"pendiente\"}, \"attributes\": {\"status\": \"parcial\"}}','[]','2026-11-05 22:13:53','2026-11-05 22:13:53'),(6,'productos','actualizado','App\\Models\\Product',6,'updated','App\\Models\\User',2,'{\"old\": {\"precio\": \"234179.00\"}, \"attributes\": {\"precio\": \"234179.03\"}}','[]','2026-11-05 22:26:44','2026-11-05 22:26:44'),(7,'productos','creado','App\\Models\\Product',14,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Termo acero inoxidable 750ml\", \"precio\": \"58000.00\", \"imagen_url\": null, \"descripcion\": \"Termo con doble pared, mantiene temperatura 12 horas\", \"categoria_id\": 6, \"proveedor_id\": 12}}','[]','2026-11-20 01:11:32','2026-11-20 01:11:32'),(8,'productos','creado','App\\Models\\Product',15,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Juego de toallas de algodón\", \"precio\": \"65000.00\", \"imagen_url\": null, \"descripcion\": \"Set de 3 toallas 100% algodón, 500 g/m²\", \"categoria_id\": 6, \"proveedor_id\": 10}}','[]','2026-11-20 01:13:05','2026-11-20 01:13:05'),(9,'productos','creado','App\\Models\\Product',16,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Audífonos inalámbricos\", \"precio\": \"89000.00\", \"imagen_url\": null, \"descripcion\": \"Audífonos Bluetooth 5.0 con estuche de carga\", \"categoria_id\": 8, \"proveedor_id\": 2}}','[]','2026-11-20 01:13:05','2026-11-20 01:13:05'),(10,'productos','actualizado','App\\Models\\Product',4,'updated','App\\Models\\User',2,'{\"old\": {\"precio\": \"442077.00\", \"descripcion\": \"Cuadriculado, tapa dura\"}, \"attributes\": {\"precio\": \"7500.00\", \"descripcion\": \"Cuaderno cuadriculado tapa dura\"}}','[]','2026-11-20 01:13:05','2026-11-20 01:13:05'),(11,'productos','creado','App\\Models\\Product',17,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Café molido 500g\", \"precio\": \"24000.00\", \"imagen_url\": null, \"descripcion\": \"Café de origen, tostión media, empaque sellado\", \"categoria_id\": 4, \"proveedor_id\": 8}}','[]','2026-11-20 01:13:05','2026-11-20 01:13:05'),(12,'productos','creado','App\\Models\\Product',18,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Cargador USB-C 20W\", \"precio\": \"32000.00\", \"imagen_url\": null, \"descripcion\": \"Cargador de pared carga rápida con cable USB-C incluido\", \"categoria_id\": 8, \"proveedor_id\": 1}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(13,'productos','actualizado','App\\Models\\Product',18,'updated','App\\Models\\User',2,'{\"old\": {\"codigo\": null}, \"attributes\": {\"codigo\": \"PROD-000018\"}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(14,'productos','actualizado','App\\Models\\Product',1,'updated','App\\Models\\User',2,'{\"old\": {\"precio\": \"201353.00\", \"descripcion\": \"Mouse óptico 2.4 GHz\", \"categoria_id\": 1}, \"attributes\": {\"precio\": \"28000.00\", \"descripcion\": \"Mouse óptico 2.4 GHz con receptor USB, 1600 DPI\", \"categoria_id\": 8}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(15,'productos','creado','App\\Models\\Product',19,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Panela orgánica 1kg\", \"precio\": \"9500.00\", \"imagen_url\": null, \"descripcion\": \"Panela pulverizada orgánica, empaque sellado\", \"categoria_id\": 4, \"proveedor_id\": 8}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(16,'productos','actualizado','App\\Models\\Product',19,'updated','App\\Models\\User',2,'{\"old\": {\"codigo\": null}, \"attributes\": {\"codigo\": \"PROD-000019\"}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(17,'productos','creado','App\\Models\\Product',20,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Set de sartenes antiadherentes\", \"precio\": \"120000.00\", \"imagen_url\": null, \"descripcion\": \"Set de 3 sartenes de 20, 24 y 28 cm\", \"categoria_id\": 6, \"proveedor_id\": 10}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(18,'productos','actualizado','App\\Models\\Product',20,'updated','App\\Models\\User',2,'{\"old\": {\"codigo\": null}, \"attributes\": {\"codigo\": \"PROD-000020\"}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(19,'productos','creado','App\\Models\\Product',21,'created','App\\Models\\User',2,'{\"attributes\": {\"codigo\": null, \"nombre\": \"Lámpara LED de escritorio\", \"precio\": \"45000.00\", \"imagen_url\": null, \"descripcion\": \"Lámpara flexible con 3 niveles de brillo y puerto USB\", \"categoria_id\": 6, \"proveedor_id\": 11}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(20,'productos','actualizado','App\\Models\\Product',21,'updated','App\\Models\\User',2,'{\"old\": {\"codigo\": null}, \"attributes\": {\"codigo\": \"PROD-000021\"}}','[]','2026-11-20 01:17:16','2026-11-20 01:17:16'),(21,'ventas','creado','App\\Models\\Sale',15,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"63026.04\", \"notes\": null, \"total\": \"394742.04\", \"status\": \"pagada\", \"user_id\": 2, \"subtotal\": \"331716.00\", \"client_id\": 4, \"sale_date\": \"2026-11-20T00:00:00.000000Z\", \"invoice_number\": \"FV-00015\"}}','[]','2026-11-20 02:16:51','2026-11-20 02:16:51'),(22,'ventas','creado','App\\Models\\Sale',16,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"493622.85\", \"notes\": null, \"total\": \"3091637.85\", \"status\": \"pagada\", \"user_id\": 2, \"subtotal\": \"2598015.00\", \"client_id\": 5, \"sale_date\": \"2026-11-20T00:00:00.000000Z\", \"invoice_number\": \"FV-00016\"}}','[]','2026-11-20 02:18:50','2026-11-20 02:18:50'),(23,'compras','creado','App\\Models\\Purchase',15,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"2375.00\", \"notes\": null, \"total\": \"14875.00\", \"status\": \"pendiente\", \"user_id\": 2, \"subtotal\": \"12500.00\", \"provider_id\": 4, \"received_at\": null, \"purchase_date\": \"2026-11-20T00:00:00.000000Z\", \"purchase_number\": \"OC-00015\", \"provider_invoice\": null}}','[]','2026-11-20 02:20:28','2026-11-20 02:20:28'),(24,'compras','actualizado','App\\Models\\Purchase',15,'updated','App\\Models\\User',2,'{\"old\": {\"status\": \"pendiente\", \"received_at\": null}, \"attributes\": {\"status\": \"recibida\", \"received_at\": \"2026-11-20T02:20:33.000000Z\"}}','[]','2026-11-20 02:20:33','2026-11-20 02:20:33'),(25,'compras','creado','App\\Models\\Purchase',16,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"4750.00\", \"notes\": null, \"total\": \"29750.00\", \"status\": \"pendiente\", \"user_id\": 2, \"subtotal\": \"25000.00\", \"provider_id\": 8, \"received_at\": null, \"purchase_date\": \"2026-11-20T00:00:00.000000Z\", \"purchase_number\": \"OC-00016\", \"provider_invoice\": null}}','[]','2026-11-20 02:21:21','2026-11-20 02:21:21'),(26,'compras','actualizado','App\\Models\\Purchase',16,'updated','App\\Models\\User',4,'{\"old\": {\"status\": \"pendiente\", \"received_at\": null}, \"attributes\": {\"status\": \"recibida\", \"received_at\": \"2026-11-20T02:22:16.000000Z\"}}','[]','2026-11-20 02:22:16','2026-11-20 02:22:16'),(27,'compras','actualizado','App\\Models\\Purchase',10,'updated','App\\Models\\User',4,'{\"old\": {\"status\": \"pendiente\", \"received_at\": null}, \"attributes\": {\"status\": \"recibida\", \"received_at\": \"2026-11-20T02:22:46.000000Z\"}}','[]','2026-11-20 02:22:46','2026-11-20 02:22:46'),(28,'ventas','creado','App\\Models\\Sale',17,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"311458.11\", \"notes\": null, \"total\": \"1950711.32\", \"status\": \"pagada\", \"user_id\": 2, \"subtotal\": \"1639253.21\", \"client_id\": 10, \"sale_date\": \"2026-11-20T00:00:00.000000Z\", \"invoice_number\": \"FV-00017\"}}','[]','2026-11-20 02:25:06','2026-11-20 02:25:06'),(29,'ventas','creado','App\\Models\\Sale',18,'created','App\\Models\\User',2,'{\"attributes\": {\"tax\": \"420475.32\", \"notes\": null, \"total\": \"2633503.32\", \"status\": \"pagada\", \"user_id\": 2, \"subtotal\": \"2213028.00\", \"client_id\": 8, \"sale_date\": \"2026-11-20T00:00:00.000000Z\", \"invoice_number\": \"FV-00018\"}}','[]','2026-11-20 02:28:06','2026-11-20 02:28:06');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'CAT-01','Tecnología','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(2,'CAT-02','Papelería','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(3,'CAT-03','Aseo','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(4,'CAT-04','Alimentos','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(5,'CAT-05','Ferretería','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(6,'CAT-06','Hogar','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(7,'CAT-07','Oficina','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(8,'CAT-08','Electrónica','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(9,'CAT-09','Herramientas','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(10,'CAT-10','Accesorios','2026-10-25 00:39:29','2026-10-25 00:39:29',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `document_type` enum('CC','NIT','CE','PP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CC',
  `document_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_document_number_unique` (`document_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'CC','1088123456','Juan Pérez','juan@test.com','3001234567','Calle 10 #20-30',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(2,'NIT','900123456','TecnoSolutions SAS','contacto@tecno.com','3109876543','Carrera 5 #45-10',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(3,'CC','1098765432','María Gómez','maria@test.com','3201112233','Av. Principal #12-34',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(4,'CE','E1234567','Carlos Rodríguez','carlos@test.com','3154445566','Transversal 8 #90-12',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(5,'CC','1055443322','Ana Martínez','ana@test.com','3187778899','Diagonal 15 #40-50',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(6,'CC','1020304050','Luis Gómez','luis@test.com','3011110001','Calle 1 #2-3',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(7,'CC','1011223344','Sofía Ramírez','sofia@test.com','3011110002','Cra 4 #5-6',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(8,'NIT','900888001','Comercial Los Andes S.A.S.','andes@test.com','3011110003','Av. 7 #8-9',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(9,'CC','1033445566','Pedro Castaño','pedro@test.com','3011110004','Calle 20 #10-11',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(10,'CC','1055667788','Laura Ospina','laura@test.com','3011110005','Cra 12 #13-14',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_movements`
--

DROP TABLE IF EXISTS `inventory_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_movements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `type` enum('entrada','salida') COLLATE utf8mb4_unicode_ci NOT NULL,
  `concept` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL,
  `balance` int NOT NULL,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_movements_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `inventory_movements_user_id_foreign` (`user_id`),
  KEY `inventory_movements_product_id_created_at_index` (`product_id`,`created_at`),
  CONSTRAINT `inventory_movements_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `inventory_movements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_movements`
--

LOCK TABLES `inventory_movements` WRITE;
/*!40000 ALTER TABLE `inventory_movements` DISABLE KEYS */;
INSERT INTO `inventory_movements` VALUES (1,1,'entrada','inventario_inicial',45,45,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(2,2,'entrada','inventario_inicial',12,12,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(3,3,'entrada','inventario_inicial',90,90,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(4,4,'entrada','inventario_inicial',100,100,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(5,5,'entrada','inventario_inicial',33,33,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(6,6,'entrada','inventario_inicial',2,2,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(7,7,'entrada','inventario_inicial',80,80,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(8,8,'entrada','inventario_inicial',11,11,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(9,9,'entrada','inventario_inicial',12,12,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(10,10,'entrada','inventario_inicial',19,19,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(11,11,'entrada','inventario_inicial',5,5,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(12,12,'entrada','inventario_inicial',60,60,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(13,13,'entrada','inventario_inicial',33,33,NULL,NULL,NULL,NULL,'Saldo inicial del producto','2026-11-05 21:39:54','2026-11-05 21:39:54'),(14,8,'salida','venta',3,8,331716.00,'App\\Models\\Sale',14,2,NULL,'2026-11-05 22:11:27','2026-11-05 22:11:27'),(15,8,'entrada','anulacion_venta',3,11,331716.00,'App\\Models\\Sale',14,2,NULL,'2026-11-05 22:12:00','2026-11-05 22:12:00'),(16,7,'entrada','compra',2,82,10000.00,'App\\Models\\Purchase',14,2,NULL,'2026-11-05 22:13:53','2026-11-05 22:13:53'),(17,2,'entrada','ajuste',1,13,NULL,NULL,NULL,2,'Recepcion 1','2026-11-05 22:20:54','2026-11-05 22:20:54'),(18,14,'entrada','inventario_inicial',45,45,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:11:32','2026-11-20 01:11:32'),(19,15,'entrada','inventario_inicial',80,80,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:13:05','2026-11-20 01:13:05'),(20,16,'entrada','inventario_inicial',60,60,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:13:05','2026-11-20 01:13:05'),(21,17,'entrada','inventario_inicial',200,200,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:13:05','2026-11-20 01:13:05'),(22,18,'entrada','inventario_inicial',150,150,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:17:16','2026-11-20 01:17:16'),(23,19,'entrada','inventario_inicial',250,250,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:17:16','2026-11-20 01:17:16'),(24,20,'entrada','inventario_inicial',35,35,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:17:16','2026-11-20 01:17:16'),(25,21,'entrada','inventario_inicial',70,70,NULL,NULL,NULL,2,'Saldo inicial del producto','2026-11-20 01:17:16','2026-11-20 01:17:16'),(26,8,'salida','venta',1,10,331716.00,'App\\Models\\Sale',15,2,NULL,'2026-11-20 02:16:51','2026-11-20 02:16:51'),(27,9,'salida','venta',7,5,371145.00,'App\\Models\\Sale',16,2,NULL,'2026-11-20 02:18:50','2026-11-20 02:18:50'),(28,9,'entrada','compra',5,10,2500.00,'App\\Models\\Purchase',15,2,NULL,'2026-11-20 02:20:33','2026-11-20 02:20:33'),(29,6,'entrada','compra',10,12,2500.00,'App\\Models\\Purchase',16,4,NULL,'2026-11-20 02:22:16','2026-11-20 02:22:16'),(30,11,'entrada','compra',6,11,320000.00,'App\\Models\\Purchase',10,4,NULL,'2026-11-20 02:22:46','2026-11-20 02:22:46'),(31,6,'salida','venta',7,5,234179.03,'App\\Models\\Sale',17,2,NULL,'2026-11-20 02:25:06','2026-11-20 02:25:06'),(32,11,'salida','venta',6,5,368838.00,'App\\Models\\Sale',18,2,NULL,'2026-11-20 02:28:07','2026-11-20 02:28:07');
/*!40000 ALTER TABLE `inventory_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_13_165455_create_providers_table',1),(5,'2026_09_13_165456_create_categorias_table',1),(6,'2026_09_13_165457_create_productos_table',1),(7,'2026_09_22_000001_add_identification_to_users_table',1),(8,'2026_10_02_014835_create_permission_tables',1),(9,'2026_10_08_202010_add_soft_deletes_to_products_table',1),(10,'2026_10_08_202058_add_soft_deletes_to_categories_table',1),(11,'2026_10_09_000002_create_purchases_table',1),(12,'2026_10_09_013351_create_clients_table',1),(13,'2026_10_09_013741_create_sales_table',1),(14,'2026_10_09_013918_create_sale_details_table',1),(15,'2026_10_16_012419_create_purchase_details_table',1),(16,'2026_10_24_225156_add_active_to_users_table',1),(17,'2026_11_05_205854_create_activity_log_table',2),(18,'2026_11_05_211617_create_inventory_movements_table',3),(19,'2026_11_06_012601_create_personal_access_tokens_table',4),(20,'2026_11_20_015711_create_notifications_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (26,'App\\Models\\User',5);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2),(2,'App\\Models\\User',3),(3,'App\\Models\\User',4),(2,'App\\Models\\User',5),(3,'App\\Models\\User',5);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('1ca2e80d-fdbe-4241-b5fb-5a0fb2e89a1e','App\\Notifications\\LowStockNotification','App\\Models\\User',1,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=9\"}',NULL,'2026-11-20 02:18:50','2026-11-20 02:18:50'),('2209b12e-5532-491f-962b-69e39efe7cee','App\\Notifications\\LowStockNotification','App\\Models\\User',2,'{\"title\":\"Stock bajo\",\"message\":\"\\u00abSilla ergon\\u00f3mica de oficina\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=11\"}',NULL,'2026-11-20 02:28:09','2026-11-20 02:28:09'),('41f93844-393d-4d47-8bad-b397d125844a','App\\Notifications\\PurchaseReceivedNotification','App\\Models\\User',2,'{\"title\":\"Compra recibida\",\"message\":\"Orden OC-00016: recibida completa.\",\"url\":\"http:\\/\\/localhost\\/purchases\\/16\"}','2026-11-20 02:24:34','2026-11-20 02:22:18','2026-11-20 02:24:34'),('5ae21666-c48e-4744-b22f-cf9f4afa55ce','App\\Notifications\\LowStockNotification','App\\Models\\User',5,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=9\"}',NULL,'2026-11-20 02:18:50','2026-11-20 02:18:50'),('60a3786c-c6a2-48c2-b618-e75da3367ae9','App\\Notifications\\LowStockNotification','App\\Models\\User',4,'{\"title\":\"Stock bajo\",\"message\":\"\\u00abSilla ergon\\u00f3mica de oficina\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=11\"}',NULL,'2026-11-20 02:28:09','2026-11-20 02:28:09'),('6a1d4de8-fc81-4850-9181-b2f5615f314f','App\\Notifications\\LowStockNotification','App\\Models\\User',5,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=6\"}',NULL,'2026-11-20 02:25:07','2026-11-20 02:25:07'),('99803d13-8c3c-424c-bddd-c0e90f35564f','App\\Notifications\\LowStockNotification','App\\Models\\User',1,'{\"title\":\"Stock bajo\",\"message\":\"\\u00abSilla ergon\\u00f3mica de oficina\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=11\"}',NULL,'2026-11-20 02:28:09','2026-11-20 02:28:09'),('a863789d-5b2c-4da1-83f7-57e8e864fbba','App\\Notifications\\LowStockNotification','App\\Models\\User',4,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=6\"}',NULL,'2026-11-20 02:25:07','2026-11-20 02:25:07'),('a9aebb03-427a-4f1a-ba30-62d92b4fc3b4','App\\Notifications\\LowStockNotification','App\\Models\\User',5,'{\"title\":\"Stock bajo\",\"message\":\"\\u00abSilla ergon\\u00f3mica de oficina\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=11\"}',NULL,'2026-11-20 02:28:09','2026-11-20 02:28:09'),('ade37be5-4b3e-4195-af18-4e47b3692e8d','App\\Notifications\\LowStockNotification','App\\Models\\User',2,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=6\"}','2026-11-20 02:27:46','2026-11-20 02:25:07','2026-11-20 02:27:46'),('bb613652-3364-49bd-9b93-834a6aab1da5','App\\Notifications\\PurchaseReceivedNotification','App\\Models\\User',1,'{\"title\":\"Compra recibida\",\"message\":\"Orden OC-00010: recibida completa.\",\"url\":\"http:\\/\\/localhost\\/purchases\\/10\"}',NULL,'2026-11-20 02:22:48','2026-11-20 02:22:48'),('c42d6b72-c261-4677-9064-ab24c8e777e0','App\\Notifications\\LowStockNotification','App\\Models\\User',1,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=6\"}',NULL,'2026-11-20 02:25:07','2026-11-20 02:25:07'),('d4b6f752-68d0-462c-886f-0147a1d05452','App\\Notifications\\LowStockNotification','App\\Models\\User',4,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=9\"}','2026-11-20 02:23:18','2026-11-20 02:18:50','2026-11-20 02:23:18'),('de22076c-f001-4b80-a536-e1be5fca3e46','App\\Notifications\\LowStockNotification','App\\Models\\User',2,'{\"title\":\"Stock bajo\",\"message\":\"\\u00ab\\u00bb qued\\u00f3 con 5 unidades.\",\"url\":\"http:\\/\\/localhost\\/inventario\\/kardex?product=9\"}','2026-11-20 02:19:40','2026-11-20 02:18:50','2026-11-20 02:19:40');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'ver-productos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(2,'crear-productos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(3,'editar-productos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(4,'eliminar-productos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(5,'ver-categorias','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(6,'crear-categorias','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(7,'editar-categorias','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(8,'eliminar-categorias','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(9,'ver-clientes','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(10,'crear-clientes','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(11,'editar-clientes','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(12,'eliminar-clientes','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(13,'ver-ventas','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(14,'crear-ventas','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(15,'editar-ventas','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(16,'eliminar-ventas','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(17,'ver-proveedores','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(18,'crear-proveedores','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(19,'editar-proveedores','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(20,'eliminar-proveedores','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(21,'ver-compras','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(22,'crear-compras','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(23,'editar-compras','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(24,'eliminar-compras','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(25,'recibir-compras','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(26,'ver-reportes','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(27,'ver-usuarios','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(28,'crear-usuarios','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(29,'editar-usuarios','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(30,'ver-roles','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(31,'crear-roles','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(32,'editar-roles','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(33,'eliminar-roles','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(34,'ver-permisos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(35,'crear-permisos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(36,'eliminar-permisos','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(37,'ver-inventario','web','2026-11-05 21:06:16','2026-11-05 21:06:16'),(38,'ajustar-inventario','web','2026-11-05 21:06:16','2026-11-05 21:06:16'),(39,'ver-auditoria','web','2026-11-05 21:06:16','2026-11-05 21:06:16'),(40,'exportar-productos','web','2026-11-20 00:53:37','2026-11-20 00:53:37'),(41,'importar-productos','web','2026-11-20 00:53:37','2026-11-20 00:53:37'),(42,'exportar-ventas','web','2026-11-20 00:53:37','2026-11-20 00:53:37');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',3,'curl','bc155fbd5ed360b6755681fe07851c4abaf3d468836cde83c879ef68fd05a4f3','[\"rol:vendedor\"]',NULL,NULL,'2026-11-06 01:47:29','2026-11-06 01:47:29'),(2,'App\\Models\\User',3,'curl','ad4b416007f3ada7ff15e493c8a8c552dc0e9b29946b6920b29177d5bfd3431e','[\"rol:vendedor\"]',NULL,NULL,'2026-11-06 01:47:42','2026-11-06 01:47:42'),(3,'App\\Models\\User',3,'postman','cbbad4a69e280457831f819a1acdac21bb4a4fefe34f6c78301adc59e19c8793','[\"rol:vendedor\"]','2026-11-06 02:00:57',NULL,'2026-11-06 01:56:07','2026-11-06 02:00:57'),(4,'App\\Models\\User',3,'postman','b0156a08af4e4bbbb90e0efe0b4f988e53114dfee3bcaf13fe530e4866abd1f8','[\"rol:vendedor\"]','2026-11-06 02:03:59',NULL,'2026-11-06 02:02:44','2026-11-06 02:03:59'),(5,'App\\Models\\User',4,'postman','1d76cd51cf3130d5258aacf1539223a2aadc282919589b7e962fc69e181d57f8','[\"rol:almacenista\"]','2026-11-06 02:04:29',NULL,'2026-11-06 02:04:09','2026-11-06 02:04:29'),(6,'App\\Models\\User',3,'curl','945b244c86f3fa60fc69682ca1cd79b9d0590f4dcb543d73a608d18fb40f00a7','[\"rol:vendedor\"]','2026-11-06 02:06:56',NULL,'2026-11-06 02:06:16','2026-11-06 02:06:56'),(7,'App\\Models\\User',3,'curl','77b4d2eefef14a6f611b83a3ad576e54a5e44967a4d0154e3f40c41bbd48f4b1','[\"rol:vendedor\"]',NULL,NULL,'2026-11-06 02:12:00','2026-11-06 02:12:00'),(8,'App\\Models\\User',3,'curl','ba6f13a37682378234dc8e92704fdd58f6c361b3420a2ec66cf694926e2d495f','[\"rol:vendedor\"]','2026-11-06 02:40:42',NULL,'2026-11-06 02:40:06','2026-11-06 02:40:42'),(9,'App\\Models\\User',3,'curl','0196cce57539d2416bb5b1456880cb06d5c4f253c97d7e2f6453724494026ac8','[\"rol:vendedor\"]','2026-11-20 00:50:23',NULL,'2026-11-20 00:47:42','2026-11-20 00:50:23');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `imagen_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `precio` decimal(12,2) DEFAULT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor_id` bigint unsigned NOT NULL,
  `categoria_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productos_proveedor_id_foreign` (`proveedor_id`),
  KEY `productos_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `productos_proveedor_id_foreign` FOREIGN KEY (`proveedor_id`) REFERENCES `providers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Mouse inalámbrico','Mouse óptico 2.4 GHz con receptor USB, 1600 DPI',NULL,45,28000.00,'PRD-0001',5,8,'2026-10-25 00:39:29','2026-11-20 01:17:16',NULL),(2,'Teclado mecánico','Teclado USB con switches azules',NULL,13,66671.00,'PRD-0002',5,1,'2026-10-25 00:39:29','2026-11-05 22:20:54',NULL),(3,'Resma de papel carta','500 hojas, 75 g',NULL,90,221533.00,'PRD-0003',6,2,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(4,'Cuaderno argollado 100 hojas','Cuaderno cuadriculado tapa dura',NULL,100,7500.00,'PRD-0004',6,2,'2026-10-25 00:39:29','2026-11-20 01:13:05',NULL),(5,'Detergente en polvo 1 kg','Para ropa de color y blanca',NULL,33,267388.00,'PRD-0005',7,3,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(6,'Desinfectante multiusos 1 L','Aroma lavanda',NULL,5,234179.03,'PRD-0006',7,3,'2026-10-25 00:39:29','2026-11-20 02:25:06',NULL),(7,'Arroz premium 500 g','Grano largo',NULL,82,152496.00,'PRD-0007',8,4,'2026-10-25 00:39:29','2026-11-05 22:13:53',NULL),(8,'Aceite de cocina 1 L','Aceite vegetal',NULL,10,331716.00,'PRD-0008',8,4,'2026-10-25 00:39:29','2026-11-20 02:16:51',NULL),(9,'Taladro inalámbrico 12 V','Incluye batería y cargador',NULL,10,371145.00,'PRD-0009',9,9,'2026-10-25 00:39:29','2026-11-20 02:20:33',NULL),(10,'Juego de destornilladores','Set de 12 piezas',NULL,19,204026.00,'PRD-0010',9,5,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(11,'Silla ergonómica de oficina','Con soporte lumbar y ruedas',NULL,5,368838.00,'PRD-0011',10,7,'2026-10-25 00:39:29','2026-11-20 02:28:06',NULL),(12,'Cable HDMI 2 m','Alta velocidad 4K',NULL,60,279065.00,'PRD-0012',11,8,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(13,'Audífonos con micrófono','Diadema, conexión 3.5 mm',NULL,33,428154.00,'PRD-0013',12,10,'2026-10-25 00:39:29','2026-10-25 22:36:32',NULL),(14,'Termo acero inoxidable 750ml','Termo con doble pared, mantiene temperatura 12 horas',NULL,45,58000.00,NULL,12,6,'2026-11-20 01:11:32','2026-11-20 01:11:32',NULL),(15,'Juego de toallas de algodón','Set de 3 toallas 100% algodón, 500 g/m²',NULL,80,65000.00,NULL,10,6,'2026-11-20 01:13:05','2026-11-20 01:13:05',NULL),(16,'Audífonos inalámbricos','Audífonos Bluetooth 5.0 con estuche de carga',NULL,60,89000.00,NULL,2,8,'2026-11-20 01:13:05','2026-11-20 01:13:05',NULL),(17,'Café molido 500g','Café de origen, tostión media, empaque sellado',NULL,200,24000.00,NULL,8,4,'2026-11-20 01:13:05','2026-11-20 01:13:05',NULL),(18,'Cargador USB-C 20W','Cargador de pared carga rápida con cable USB-C incluido',NULL,150,32000.00,'PROD-000018',1,8,'2026-11-20 01:17:16','2026-11-20 01:17:16',NULL),(19,'Panela orgánica 1kg','Panela pulverizada orgánica, empaque sellado',NULL,250,9500.00,'PROD-000019',8,4,'2026-11-20 01:17:16','2026-11-20 01:17:16',NULL),(20,'Set de sartenes antiadherentes','Set de 3 sartenes de 20, 24 y 28 cm',NULL,35,120000.00,'PROD-000020',10,6,'2026-11-20 01:17:16','2026-11-20 01:17:16',NULL),(21,'Lámpara LED de escritorio','Lámpara flexible con 3 niveles de brillo y puerto USB',NULL,70,45000.00,'PROD-000021',11,6,'2026-11-20 01:17:16','2026-11-20 01:17:16',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `document_type` enum('NIT','CC','CE','PP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NIT',
  `document_number` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `providers_document_number_unique` (`document_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'NIT','900111222','Mayorista Digital SAS','Laura Ríos','ventas@mayoristadigital.com','6012345678','Bogotá, Calle 80 #45-12',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(2,'NIT','900333444','Importadora Tech Andina','Pedro Salazar','pedidos@techandina.com','6044567890','Medellín, Carrera 43A #1-50',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(3,'NIT','900555666','Accesorios del Pacífico','Diana Mejía','comercial@accpacifico.com','6027654321','Cali, Av. 6N #23-45',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(4,'CC','1094555666','Andrés Cardona (independiente)',NULL,'andres.cardona@test.com','3135556677','Cartago, Calle 12 #5-30',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(5,'NIT','900777001','Tecnoparts S.A.S.','Sergio Vélez','ventas@tecnoparts.com','6011110001','Bogotá, Cra 15 #80-20',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(6,'NIT','900777002','Papelería Mayorista','Rosa Gil','pedidos@papmayorista.com','6011110002','Bogotá, Calle 13 #30-10',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(7,'NIT','900777003','Químicos y Aseo Ltda.','Juan Mora','info@quimicosaseo.com','6041110003','Medellín, Cra 50 #20-15',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(8,'NIT','900777004','Alimentos del Campo','Marta Ríos','ventas@alimentoscampo.com','6021110004','Cali, Calle 5 #40-22',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(9,'NIT','900777005','Ferretería Central','Óscar Peña','compras@ferrecentral.com','6061110005','Pereira, Av. 30 de Agosto #25-10',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(10,'NIT','900777006','Comercial del Valle','Paula Soto','ventas@comvalle.com','6021110006','Cartago, Calle 10 #8-45',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(11,'NIT','900777007','Importaciones Pacífico','Hugo Lara','info@imppacifico.com','6021110007','Buenaventura, Cra 3 #2-10',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(12,'NIT','900777008','Distribuidora Andina','Elena Cruz','pedidos@distandina.com','6011110008','Bogotá, Cra 7 #45-33',1,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(13,'CC','102939303','Prueba',NULL,NULL,NULL,NULL,1,'2026-10-25 22:34:29','2026-10-25 22:34:29',NULL);
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `received_quantity` int NOT NULL DEFAULT '0',
  `unit_cost` decimal(12,2) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_details_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
INSERT INTO `purchase_details` VALUES (1,1,1,20,20,48000.00,960000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(2,2,3,50,50,11000.00,550000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(3,3,9,5,5,150000.00,750000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(4,4,12,30,30,15000.00,450000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(5,5,4,40,40,4800.00,192000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(6,6,10,10,4,22000.00,220000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(7,7,5,30,15,12000.00,360000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(8,8,6,24,0,9500.00,228000.00,'2026-10-25 00:39:29','2026-10-25 00:39:29'),(9,9,8,40,40,8200.00,328000.00,'2026-10-25 00:39:29','2026-10-25 01:05:39'),(10,10,11,6,6,320000.00,1920000.00,'2026-10-25 00:39:29','2026-11-20 02:22:46'),(11,11,1,3,0,50000.00,150000.00,'2026-10-25 01:44:56','2026-10-25 01:44:56'),(12,12,13,4,4,5000.00,20000.00,'2026-10-25 01:46:00','2026-10-25 01:46:03'),(13,13,13,20,20,20000.00,400000.00,'2026-10-25 22:34:57','2026-10-25 22:36:32'),(14,14,7,3,2,10000.00,30000.00,'2026-11-05 22:13:39','2026-11-05 22:13:53'),(15,15,9,5,5,2500.00,12500.00,'2026-11-20 02:20:28','2026-11-20 02:20:33'),(16,16,6,10,10,2500.00,25000.00,'2026-11-20 02:21:21','2026-11-20 02:22:16');
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `provider_invoice` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtotal` decimal(14,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(14,2) NOT NULL DEFAULT '0.00',
  `total` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` enum('pendiente','parcial','recibida','anulada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `received_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_purchase_number_unique` (`purchase_number`),
  KEY `purchases_provider_id_foreign` (`provider_id`),
  KEY `purchases_user_id_foreign` (`user_id`),
  CONSTRAINT `purchases_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'OC-00001',5,1,'2026-09-27',NULL,960000.00,182400.00,1142400.00,'recibida','2026-10-25 00:39:29',NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(2,'OC-00002',6,1,'2026-09-29',NULL,550000.00,104500.00,654500.00,'recibida','2026-10-25 00:39:29',NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(3,'OC-00003',9,1,'2026-10-04',NULL,750000.00,142500.00,892500.00,'recibida','2026-10-25 00:39:29',NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(4,'OC-00004',11,1,'2026-10-10',NULL,450000.00,85500.00,535500.00,'recibida','2026-10-25 00:39:29',NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(5,'OC-00005',6,1,'2026-10-13',NULL,192000.00,36480.00,228480.00,'recibida','2026-10-25 00:39:29',NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(6,'OC-00006',9,1,'2026-10-16',NULL,220000.00,41800.00,261800.00,'parcial',NULL,NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(7,'OC-00007',7,1,'2026-10-18',NULL,360000.00,68400.00,428400.00,'parcial',NULL,NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(8,'OC-00008',7,1,'2026-10-20',NULL,228000.00,43320.00,271320.00,'pendiente',NULL,NULL,'2026-10-25 00:39:29','2026-10-25 00:39:29',NULL),(9,'OC-00009',8,1,'2026-10-21',NULL,328000.00,62320.00,390320.00,'recibida','2026-10-25 01:05:39',NULL,'2026-10-25 00:39:29','2026-10-25 01:05:39',NULL),(10,'OC-00010',10,1,'2026-10-23',NULL,1920000.00,364800.00,2284800.00,'recibida','2026-11-20 02:22:46',NULL,'2026-10-25 00:39:29','2026-11-20 02:22:46',NULL),(11,'OC-00011',8,2,'2026-10-25',NULL,150000.00,28500.00,178500.00,'anulada',NULL,NULL,'2026-10-25 01:44:56','2026-10-25 01:45:20','2026-10-25 01:45:20'),(12,'OC-00012',3,2,'2026-10-25',NULL,20000.00,3800.00,23800.00,'recibida','2026-10-25 01:46:03',NULL,'2026-10-25 01:46:00','2026-10-25 01:46:03',NULL),(13,'OC-00013',13,4,'2026-10-25',NULL,400000.00,76000.00,476000.00,'recibida','2026-10-25 22:36:32',NULL,'2026-10-25 22:34:57','2026-10-25 22:36:32',NULL),(14,'OC-00014',3,2,'2026-11-05',NULL,30000.00,5700.00,35700.00,'parcial',NULL,NULL,'2026-11-05 22:13:39','2026-11-05 22:13:53',NULL),(15,'OC-00015',4,2,'2026-11-20',NULL,12500.00,2375.00,14875.00,'recibida','2026-11-20 02:20:33',NULL,'2026-11-20 02:20:28','2026-11-20 02:20:33',NULL),(16,'OC-00016',8,2,'2026-11-20',NULL,25000.00,4750.00,29750.00,'recibida','2026-11-20 02:22:16',NULL,'2026-11-20 02:21:21','2026-11-20 02:22:16',NULL);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(1,2),(9,2),(10,2),(11,2),(13,2),(14,2),(1,3),(2,3),(3,3),(5,3),(17,3),(18,3),(19,3),(21,3),(22,3),(25,3),(37,3),(38,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(2,'vendedor','web','2026-10-25 00:39:29','2026-10-25 00:39:29'),(3,'almacenista','web','2026-10-25 00:39:29','2026-10-25 00:39:29');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `subtotal` decimal(14,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  KEY `sale_details_product_id_foreign` (`product_id`),
  CONSTRAINT `sale_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sale_details_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_details`
--

LOCK TABLES `sale_details` WRITE;
/*!40000 ALTER TABLE `sale_details` DISABLE KEYS */;
INSERT INTO `sale_details` VALUES (1,1,1,2,65000.00,130000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(2,2,3,10,14000.00,140000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(3,3,9,1,189000.00,189000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(4,4,4,5,6500.00,32500.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(5,5,12,3,22000.00,66000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(6,6,5,6,18500.00,111000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(7,7,13,2,48000.00,96000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(8,8,10,4,35000.00,140000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(9,9,2,1,90000.00,90000.00,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(10,10,7,12,4200.00,50400.00,'2026-10-25 00:39:31','2026-10-25 00:39:31'),(11,11,8,20,331716.00,6634320.00,'2026-10-25 22:37:59','2026-10-25 22:37:59'),(12,12,8,10,331716.00,3317160.00,'2026-10-25 22:39:07','2026-10-25 22:39:07'),(13,13,8,5,331716.00,1658580.00,'2026-10-25 22:40:02','2026-10-25 22:40:02'),(14,14,8,3,331716.00,995148.00,'2026-11-05 22:11:27','2026-11-05 22:11:27'),(15,15,8,1,331716.00,331716.00,'2026-11-20 02:16:51','2026-11-20 02:16:51'),(16,16,9,7,371145.00,2598015.00,'2026-11-20 02:18:50','2026-11-20 02:18:50'),(17,17,6,7,234179.03,1639253.21,'2026-11-20 02:25:06','2026-11-20 02:25:06'),(18,18,11,6,368838.00,2213028.00,'2026-11-20 02:28:06','2026-11-20 02:28:06');
/*!40000 ALTER TABLE `sale_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `sale_date` date NOT NULL,
  `subtotal` decimal(14,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(14,2) NOT NULL DEFAULT '0.00',
  `total` decimal(14,2) NOT NULL DEFAULT '0.00',
  `status` enum('pendiente','pagada','anulada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pagada',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_number_unique` (`invoice_number`),
  KEY `sales_client_id_foreign` (`client_id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'FV-00001',1,1,'2026-09-25',130000.00,24700.00,154700.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(2,'FV-00002',2,1,'2026-10-18',140000.00,26600.00,166600.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(3,'FV-00003',3,1,'2026-10-23',189000.00,35910.00,224910.00,'pendiente',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(4,'FV-00004',6,1,'2026-10-11',32500.00,6175.00,38675.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(5,'FV-00005',7,1,'2026-10-15',66000.00,12540.00,78540.00,'pendiente',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(6,'FV-00006',8,1,'2026-10-18',111000.00,21090.00,132090.00,'pendiente',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(7,'FV-00007',9,1,'2026-10-20',96000.00,18240.00,114240.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(8,'FV-00008',10,1,'2026-10-22',140000.00,26600.00,166600.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(9,'FV-00009',1,1,'2026-10-23',90000.00,17100.00,107100.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(10,'FV-00010',3,1,'2026-10-24',50400.00,9576.00,59976.00,'pagada',NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30',NULL),(11,'FV-00011',3,3,'2026-10-25',6634320.00,1260520.80,7894840.80,'pagada',NULL,'2026-10-25 22:37:59','2026-10-25 22:37:59',NULL),(12,'FV-00012',5,3,'2026-10-25',3317160.00,630260.40,3947420.40,'pagada',NULL,'2026-10-25 22:39:07','2026-10-25 22:39:07',NULL),(13,'FV-00013',5,3,'2026-10-25',1658580.00,315130.20,1973710.20,'anulada',NULL,'2026-10-25 22:40:02','2026-10-25 22:42:22','2026-10-25 22:42:22'),(14,'FV-00014',5,2,'2026-11-05',995148.00,189078.12,1184226.12,'anulada',NULL,'2026-11-05 22:11:27','2026-11-05 22:12:00','2026-11-05 22:12:00'),(15,'FV-00015',4,2,'2026-11-20',331716.00,63026.04,394742.04,'pagada',NULL,'2026-11-20 02:16:51','2026-11-20 02:16:51',NULL),(16,'FV-00016',5,2,'2026-11-20',2598015.00,493622.85,3091637.85,'pagada',NULL,'2026-11-20 02:18:50','2026-11-20 02:18:50',NULL),(17,'FV-00017',10,2,'2026-11-20',1639253.21,311458.11,1950711.32,'pagada',NULL,'2026-11-20 02:25:06','2026-11-20 02:25:06',NULL),(18,'FV-00018',8,2,'2026-11-20',2213028.00,420475.32,2633503.32,'pagada',NULL,'2026-11-20 02:28:06','2026-11-20 02:28:06',NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_identificacion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_identificacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','CC','1234567890','test@example.com','2026-10-25 00:39:29','$2y$12$oUFR.pS9OgpK43ur69n6n.Npw2OQsh7tLxb40n.L19ynVbbPQUjY6',1,'s13b130eoq','2026-10-25 00:39:29','2026-10-25 00:39:29'),(2,'Administrador',NULL,NULL,'admin@test.com','2026-10-25 00:39:30','$2y$12$jdY7LcxlfRfRcwRaknT0r.O2RwLT/J4Um6cZblbUh2iM9j2nEF1Fi',1,NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(3,'Vendedor',NULL,NULL,'vendedor@test.com','2026-10-25 00:39:30','$2y$12$HAKc04tlWdxVIi.v3yIMyeTIirQmHfetgPUE.g/..hsvct71fpuzm',1,NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(4,'Almacenista',NULL,NULL,'almacenista@test.com','2026-10-25 00:39:30','$2y$12$Qcw90Hvn8kW7t.//r38ezOjVwdihF0ex6flvMJoj.mS0DvLCIFKXy',1,NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30'),(5,'Supervisor',NULL,NULL,'supervisor@test.com','2026-10-25 00:39:30','$2y$12$47QHQaqv/DxLSBoEjePQ9O3ESnqiauddoSYFkgTvzZ4WbJpptW5S2',1,NULL,'2026-10-25 00:39:30','2026-10-25 00:39:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-22  0:28:35
