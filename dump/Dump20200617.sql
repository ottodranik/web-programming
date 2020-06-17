CREATE DATABASE  IF NOT EXISTS `web_prog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `web_prog`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: web_prog
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `achievements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `age_ratings`
--

DROP TABLE IF EXISTS `age_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `age_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `age_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_ratings`
--

LOCK TABLES `age_ratings` WRITE;
/*!40000 ALTER TABLE `age_ratings` DISABLE KEYS */;
INSERT INTO `age_ratings` VALUES (1,'до 16','Rating R',NULL),(2,'до 12','Детям можно',NULL);
/*!40000 ALTER TABLE `age_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Жюль верн',NULL),(2,'Толкиен',NULL),(3,'Рауль',NULL),(4,'Марвел',NULL),(5,'Лысый из бразерс',NULL),(6,'Пушкин',NULL),(7,'Шевченко',NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `age_limit_id` int(11) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `average_mark` float DEFAULT NULL,
  `rent_price` double DEFAULT NULL,
  `buy_price` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `age_limit_id_idx` (`age_limit_id`),
  CONSTRAINT `age_limit_id` FOREIGN KEY (`age_limit_id`) REFERENCES `age_ratings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Lala',1,'Blq vlq',NULL,3.33333,1,6,NULL,1),(5,'Book 5',NULL,'Short description',NULL,4,2,9,NULL,1),(6,'Book 6',NULL,'Short description',NULL,3.5,3,8,NULL,1),(8,'Book 8',NULL,'Short description',NULL,1.4,5,9,NULL,1),(10,'Adventure 10',NULL,'Short description',NULL,5.4,2,9,NULL,1),(11,'Deadpool',1,'Short description',NULL,5,1,8,NULL,1),(16,'Супермен',NULL,'dfdfdhd fhg dh',NULL,3.5,2,4,NULL,1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_authors`
--

DROP TABLE IF EXISTS `books_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books_authors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `author_id_idx` (`author_id`),
  CONSTRAINT `author_book_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_author_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_authors`
--

LOCK TABLES `books_authors` WRITE;
/*!40000 ALTER TABLE `books_authors` DISABLE KEYS */;
INSERT INTO `books_authors` VALUES (1,3),(3,7),(5,6),(6,5),(7,4),(8,3),(9,2),(10,1),(10,4),(11,1),(16,2);
/*!40000 ALTER TABLE `books_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_genres`
--

DROP TABLE IF EXISTS `books_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books_genres` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `book_id_idx` (`book_id`),
  KEY `genre_id_idx` (`genre_id`),
  CONSTRAINT `book_genre_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `genre_book_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_genres`
--

LOCK TABLES `books_genres` WRITE;
/*!40000 ALTER TABLE `books_genres` DISABLE KEYS */;
INSERT INTO `books_genres` VALUES (3,1),(5,2),(6,3),(8,4),(10,5),(11,6),(16,1),(16,3);
/*!40000 ALTER TABLE `books_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_textdata`
--

DROP TABLE IF EXISTS `books_textdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books_textdata` (
  `book_id` int(11) NOT NULL,
  `full_text` text,
  `contents` text,
  `url_to_file` text,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `book_id_UNIQUE` (`book_id`),
  CONSTRAINT `book_fulldata_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_textdata`
--

LOCK TABLES `books_textdata` WRITE;
/*!40000 ALTER TABLE `books_textdata` DISABLE KEYS */;
INSERT INTO `books_textdata` VALUES (16,'ffgh',NULL,NULL);
/*!40000 ALTER TABLE `books_textdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `text` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_approved` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,'Fdfdf','243545433244','efrerf@fdfdf','sdfsdfsdf','2019-04-30 01:47:44',NULL),(2,'Fdfdfdffdgf','6304941135','fanjuve@gmail.com','dfg sdgfsdfg\r\ndfg sdfg s\r\ndfg\r\n sd','2019-04-30 01:48:03',NULL),(3,'Fdfsdfsdfsdgdfg','546345634563','asdfasdf@dfsdfsdf','asfddg dfgsdfg sdfg dfg ','2019-04-30 01:59:29',NULL),(4,'Tfbdfbb','4356335643','fanjuve@gmail.com','dfgsdfvdfgsdfg','2019-04-30 01:59:38',NULL),(5,'Gfgdgdfg','254523452345','adfgsdfgsdfg@sdfsdf','asdgsdfg fg dfg dsfg','2019-04-30 01:59:50',NULL),(6,'Hdgsfgasgs','435345345345','asgagsdfg@dfsdf','sdfasd dgf asg asfg dg sd','2019-04-30 02:00:04',NULL),(7,'Yurii Uvarov','380630494113','fanjuve@gmail.com','hgfds',NULL,NULL),(8,'Yurii Uvarov','380630494113','fanjuve@gmail.com','fasfsdf',NULL,NULL),(9,'Yurii Uvarov','380630494113','fanjuve@gmail.com','j',NULL,NULL),(10,'Ffgfg','380630494113','fanjuve@gmail.com','sdfdf',NULL,NULL),(11,'Yurii Uvarov','380630494113','fanjuve@gmail.com','dfg',NULL,NULL),(12,'Yurii Uvarov','380630494113','fanjuve@gmail.com','sdfsdf','2019-05-09 02:03:47',NULL),(13,'Fdfdf','390630494113','fanjuve@gmail.com','asdfasdf','2019-05-09 19:38:03',1);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Триллер',NULL),(2,'Приключения',NULL),(3,'Кулинария',NULL),(4,'Фантастика',NULL),(5,'Фэнтези',NULL),(6,'Комиксы',NULL);
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `keyword_page_id_idx` (`page_id`),
  CONSTRAINT `keyword_page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
INSERT INTO `keywords` VALUES (1,'sport',1),(2,'sport goods',1),(3,'clothes',1),(4,'catalog sport goods',2);
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `mark_value` smallint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `book_mark_id_idx` (`book_id`),
  KEY `user_mark_id_idx` (`user_id`),
  CONSTRAINT `book_mark_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `user_mark_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (4,3,2,'2019-05-09 20:26:57',4),(5,5,22,'2019-05-09 20:26:57',5),(6,3,22,'2019-05-09 20:26:57',1),(7,5,2,'2019-05-09 20:26:57',2),(11,6,24,'2019-05-09 20:28:21',3),(12,6,26,'2019-05-09 20:28:21',4),(13,8,24,'2019-05-09 20:28:21',1),(14,8,26,'2019-05-09 20:28:21',3),(15,10,29,'2019-05-09 20:30:13',2),(16,11,33,'2019-05-09 20:30:13',5),(17,16,36,'2019-05-09 20:30:13',4),(18,10,43,'2019-05-09 20:30:13',2),(19,11,29,'2019-05-09 20:30:13',3),(20,16,33,'2019-05-09 20:30:13',4),(21,10,36,'2019-05-09 20:30:13',5),(22,11,43,'2019-05-09 20:30:13',2),(23,16,2,'2019-05-09 20:30:13',1),(34,16,50,'2019-05-13 00:08:44',5),(36,3,50,'2019-05-13 00:09:02',5),(37,5,50,'2019-05-13 00:17:37',5);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Головна',1,NULL,'Головна сторінка'),(2,'Каталог',1,'books','Усі товари'),(3,'Зворотній зв\'язок',1,'feedback','Зворотній зв\'язок'),(4,'Про нас',1,'about','Про компанію');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscription_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
INSERT INTO `subscription_types` VALUES (1,'Базовая','базова підписка');
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_type_id` int(11) NOT NULL,
  `subscription_start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `subscription_end_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `purchase_status_id_idx` (`subscription_type_id`),
  KEY `purchase_book_id_idx` (`book_id`),
  KEY `subscription_user_id_idx` (`user_id`),
  CONSTRAINT `subscription_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `subscription_type_id` FOREIGN KEY (`subscription_type_id`) REFERENCES `subscription_types` (`id`),
  CONSTRAINT `subscription_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,3,50,1,'2019-05-10 01:04:50','2019-05-24 00:00:00'),(7,6,50,1,'2019-05-10 13:16:34','2019-05-24 00:00:00'),(8,5,50,1,'2019-05-13 00:17:29','2019-05-27 00:00:00');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_family_connections`
--

DROP TABLE IF EXISTS `user_family_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_family_connections` (
  `user_id` int(11) NOT NULL,
  `family_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`family_user_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `family_user_id_idx` (`family_user_id`),
  CONSTRAINT `family_user_id` FOREIGN KEY (`family_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_family_connections`
--

LOCK TABLES `user_family_connections` WRITE;
/*!40000 ALTER TABLE `user_family_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_family_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `achievement_id` int(11) DEFAULT NULL,
  `address` text,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `achievement_id_idx` (`achievement_id`),
  CONSTRAINT `achievement_id` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,NULL,'fanjuve@gmail.com','undefined',NULL,NULL,NULL,NULL,1),(22,NULL,'fanjuve2@gmail.com','[object Promise]',NULL,NULL,NULL,NULL,1),(24,NULL,'fanjuve3@gmail.com','[object Promise]',NULL,NULL,NULL,NULL,1),(26,NULL,'fanjuve4@gmail.com','$2b$10$fsGYzNFzINKDzoMfBWpeD.hOhAWQ0bK2vl4s32PdG2PVr6bc3q1A6',NULL,NULL,NULL,NULL,1),(29,NULL,'fanjuve5@gmail.com','$2b$10$v11/ttOvVlxmECiM0ZfP0O/aX9z58X555BI0Y7/QlDFUXn1gQd0ey',NULL,NULL,NULL,NULL,1),(33,NULL,'fanjuve10@gmail.com','[object Promise]',NULL,NULL,NULL,NULL,1),(36,NULL,'fanjuve12@gmail.com','$2b$10$rISspDLFqgIfnarFyDBA6eDlDzldigzR7hL3hftHPllDPAShBwpw2',NULL,NULL,NULL,NULL,1),(43,NULL,'fanjuve15@gmail.com','$2b$10$EG0.YdqDKmRKudMAc7PHiuhLcvA4YaXzz.oZBUJDX9OG4n3.VuaUK',NULL,NULL,NULL,NULL,1),(50,NULL,'fanjuve1@gmail.com','$2b$10$PSiNa7iHREadt3gAFc29vO6Uubz4HzUtsd9v.mYAfmjkEDlvJEtsq',NULL,NULL,NULL,NULL,1),(52,NULL,'fanjuve16@gmail.com','$2b$10$7APH8fqHwkK.npBdnSPnWOmOIOxqvrc.kEVAaj1em9oA/clw.G3SK',NULL,NULL,NULL,NULL,1),(54,NULL,'fanjuve45@gmail.com','$2b$10$YCsOSgyUEu8T0L7ZEIJJ3eK43P3y4A8qG.YAo.fUPLoC/h7lE2AgG',NULL,NULL,NULL,NULL,1);
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

-- Dump completed on 2020-06-17 13:46:51
