-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: quadomaniacy_development
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.6
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efiles`
--

DROP TABLE IF EXISTS `efiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efiles`
--

LOCK TABLES `efiles` WRITE;
/*!40000 ALTER TABLE `efiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `efiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `organiser_name` varchar(255) DEFAULT NULL,
  `organiser_address` varchar(255) DEFAULT NULL,
  `organiser_www` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `organiser_email` varchar(255) DEFAULT NULL,
  `organiser_phone` varchar(255) DEFAULT NULL,
  `relation` text,
  `relationdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fposts`
--

DROP TABLE IF EXISTS `fposts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fposts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fposts`
--

LOCK TABLES `fposts` WRITE;
/*!40000 ALTER TABLE `fposts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fposts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT  IGNORE INTO `galleries` VALUES (1,1,'test','2010-09-27 21:50:06','2010-09-27 21:50:06','data/1/128561700616.png',NULL);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_details`
--

DROP TABLE IF EXISTS `message_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL,
  `details` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_details`
--

LOCK TABLES `message_details` WRITE;
/*!40000 ALTER TABLE `message_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcomments`
--

DROP TABLE IF EXISTS `pcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcomments`
--

LOCK TABLES `pcomments` WRITE;
/*!40000 ALTER TABLE `pcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prates`
--

DROP TABLE IF EXISTS `prates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prates`
--

LOCK TABLES `prates` WRITE;
/*!40000 ALTER TABLE `prates` DISABLE KEYS */;
/*!40000 ALTER TABLE `prates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quads`
--

DROP TABLE IF EXISTS `quads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) DEFAULT NULL,
  `qtype` varchar(255) DEFAULT NULL,
  `description` text,
  `gallery_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quads`
--

LOCK TABLES `quads` WRITE;
/*!40000 ALTER TABLE `quads` DISABLE KEYS */;
INSERT  IGNORE INTO `quads` VALUES (1,'Cectek','tester','tester',NULL,1,'2010-09-27 21:35:01','2010-09-27 22:21:31');
/*!40000 ALTER TABLE `quads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `initiator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT  IGNORE INTO `schema_migrations` VALUES ('20090604144449'),('20090604145505'),('20090604151159'),('20090604174034'),('20090604181530'),('20090605200405'),('20090606135544'),('20090606175335'),('20090606183901'),('20090606221635'),('20090606225433'),('20090607134117'),('20090607134146'),('20090607144801'),('20090607144855'),('20090607144926'),('20090607174435'),('20090707191545'),('20090708192020'),('20090708192640'),('20090708192651'),('20090708192858'),('20090708192905'),('20090708200908'),('20090728192040'),('20090728202112'),('20090728210850'),('20090728211323'),('20090811122519'),('20090819170426'),('20090824142814'),('20090824143359'),('20090914165040'),('20090914165050'),('20090926202004'),('20091015163919'),('20091028060634'),('20091128165654'),('20091201013024'),('20091201023332'),('20091229004043'),('20100225203543'),('20100226005618');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT  IGNORE INTO `sessions` VALUES (1,'ef7b28345d4cba61fa10409884e57567','BAh7CToKcHBhZ2UiES91c2VyL3Nob3cvMToNcHJldnBhZ2UiEy91c2VyL3Jl\nZ2lzdGVyIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxh\nc2hIYXNoewY6CmVycm9yIjtNdXNpc3ogemFha2NlcHRvd2HEhyByZWd1bGFt\naW4gYnkga29yenlzdGHEhyB6IHNlcndpc3UGOgpAdXNlZHsGOwhUOhNzaW1w\nbGVfY2FwdGNoYSItMDgwMjlmZDNkOGFlMmI5ZjUwMjE4YTQ2NTA2YWI1NDJj\nYzk3YzNkOA==\n','2010-09-17 22:59:07','2010-09-17 23:22:09'),(2,'2c52ee2824dc6c05617f8b40458c0187','BAh7CDoKcHBhZ2UiES91c2VyL3Nob3cvMToNcHJldnBhZ2UiGi91c2VyX3Nl\nc3Npb25zL2NyZWF0ZSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxh\nc2g6OkZsYXNoSGFzaHsGOgplcnJvciIrTmllcHJhd2lkxYJvd2UgZGFuZSwg\nc3Byw7NidWogcG9ub3duaWUGOgpAdXNlZHsGOwhG\n','2010-09-22 09:16:54','2010-09-22 11:09:32'),(3,'cf249c93c8e1accc527bfbd084d1ab3e','BAh7CDoTc2ltcGxlX2NhcHRjaGEiLWQ5YWRkMmM2ZTU1YzBiMjlmNDZiZDQ1\nNzE2ODkyYjU1YmFiYzYxNWQiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoKZXJyb3IiIU5pZXByYXdpZMWCb3d5IGtv\nZCB6IG9icmF6a2EGOgpAdXNlZHsGOwdUOg1wcmV2cGFnZSITL3VzZXIvcmVn\naXN0ZXI=\n','2010-09-23 22:16:58','2010-09-24 08:22:27'),(4,'09a9a6350b57178ba9632f2d4a406095','BAh7CiIVdXNlcl9jcmVkZW50aWFscyIBgGJlNjQwNzkyMmIxMjVkNjM5Y2Yx\nZDk5MWU1MWE4MGVjZjNiOWVjZWI3NzMxZDY0YjJhMzNiZjRjYjFlZjA2MDZk\nYTgzZGI3MzlkMzkwZGJmNTBiZTlmOTNhYjQ3ODMwZTM5NGFiYmQ3Y2JmOTBl\nZWI1MWU1MWYzYzRlM2E0Yzk5OhNzaW1wbGVfY2FwdGNoYSItYjY5OGFkNzVl\nNjQyODg2NDQ5ZmE0MDBiMWY4NTQ5MmMyZDVmZGE3YToNcHJldnBhZ2UiDS91\nc2Vycy8xIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQYiCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-09-27 21:19:09','2010-09-28 14:41:06'),(5,'54ce7185c7478335213a77f683b0b95a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-09-28 22:19:12','2010-09-28 22:22:25');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_captcha_data`
--

DROP TABLE IF EXISTS `simple_captcha_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_captcha_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) DEFAULT NULL,
  `value` varchar(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
INSERT  IGNORE INTO `simple_captcha_data` VALUES (5,'d9add2c6e55c0b29f46bd45716892b55babc615d','OCVZZB','2010-09-23 22:22:41','2010-09-24 08:22:25'),(6,'b698ad75e642886449fa400b1f85492c2d5fda7a','JKRFQF','2010-09-27 21:27:52','2010-09-27 21:27:52');
/*!40000 ALTER TABLE `simple_captcha_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_teams_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamusers`
--

DROP TABLE IF EXISTS `teamusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teamusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamusers`
--

LOCK TABLES `teamusers` WRITE;
/*!40000 ALTER TABLE `teamusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teamusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprates`
--

DROP TABLE IF EXISTS `userprates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `prate_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprates`
--

LOCK TABLES `userprates` WRITE;
/*!40000 ALTER TABLE `userprates` DISABLE KEYS */;
/*!40000 ALTER TABLE `userprates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `gg` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `about` text,
  `sex` char(1) DEFAULT NULL,
  `crypted_password` varchar(255) NOT NULL,
  `persistence_token` varchar(255) NOT NULL,
  `perishable_token` varchar(255) NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT  IGNORE INTO `users` VALUES (1,'damian','dmarciniec@gmail.com','','','wieliczka','małopolskie','','','','2010-09-17 23:00:33','2010-09-28 14:41:05',NULL,NULL,'',NULL,'18eb074ce373645b89e0e419288c0c03f3d9fbd5a8dce00f2fa6f88e9d3c443613871a0eb52fc22361cae730f6b7983e50811604a564b78e5e539cd67a8c38aa','be6407922b125d639cf1d991e51a80ecf3b9eceb7731d64b2a33bf4cb1ef0606da83db739d390dbf50be9f93ab47830e394abbd7cbf90eeb51e51f3c4e3a4c99','oB8hF2XORkGRPiylj8HC',1,0,'2010-09-28 14:41:05','2010-09-27 21:33:56',NULL,'127.0.0.1',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservrates`
--

DROP TABLE IF EXISTS `uservrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uservrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `vrate_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservrates`
--

LOCK TABLES `uservrates` WRITE;
/*!40000 ALTER TABLE `uservrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `uservrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcomments`
--

DROP TABLE IF EXISTS `vcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcomments`
--

LOCK TABLES `vcomments` WRITE;
/*!40000 ALTER TABLE `vcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrates`
--

DROP TABLE IF EXISTS `vrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrates`
--

LOCK TABLES `vrates` WRITE;
/*!40000 ALTER TABLE `vrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-28 22:55:29
