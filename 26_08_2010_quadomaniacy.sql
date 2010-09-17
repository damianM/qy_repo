-- MySQL dump 10.13  Distrib 5.1.38, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: quadomaniacy
-- ------------------------------------------------------
-- Server version	5.1.38

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organiser_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organiser_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organiser_www` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organiser_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organiser_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relation` text COLLATE utf8_unicode_ci,
  `relationdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,'456346','346346','2010-03-17 17:43:31','2010-03-17 17:43:31','2010-03-17','2010-03-18','3463456','456346','4563456','','Wyprawa','','456346',NULL,NULL),(2,2,'Impreza ozgood\'a','Pierwsza impreza z serii rekraacyjno - sportowej dla miÅ‚oÅ›nikÃ³w quadÃ³w, zarÃ³wno amatorÃ³w jak i doÅ›wiadczonych...........','2010-03-17 22:51:47','2010-03-28 15:27:41','2010-03-22','2010-03-23','KrakÃ³w','ozgood','sfsd','','Rekreacyjno-sportowa','','888999977','Pierwsza impreza poÅ›wiÄ™cona sportom quadowym , dla amatorÃ³w i zaawansowanych. OczywiÅ›cie frekwencja znakomita , a wraÅ¼enia z imprezy jeszcze lepsze. Zatem zapraszamy na kolejne odcinki...:-)','2010-03-28'),(3,2,'II impreza ozgood\'a','Impreza u szkala....dfkhjf sfdjwsidfjh desfsdifhwe dsfwesihjf sdkfjcs dfkhes dkfh sdkh fwesdkfjweisdfjksedjf weskifjweds fwjnesdkfw sedksfjwe kfje dkfhakiesdfh wdskfisdjbfn skdjnf wes, wjefwijnesdf weds,wed jfdiwef ,w;..gfdgerg eergerge gergerger erg eg eg eeeeeeeeeeeeeeeeeeee eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeexxxx xxxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxx xxxxxxxxxxxxxxx xxxxxxx x xxxxxxxxxxxx x xxxxxxxxxx x       xxxxxxxxxx xxxxxxx x xxxxxxxxx xxx xxxxxxxxx xxxxx xxxxxxxxxxxxxx xxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx x xxxxxx x xxxxxx xx x///////////// /         / / ,,,,,,,,,,,,,,,,, , , , , , , , , x,fwefwergr ytryh56 h56tyh therh rer tertye6rt er er et reh rtyw5ytrhytu67 br45y 45y 6u56euj5e6 uy3eyu3y 6ty34y4y5j56yuj356y245 b56 53yu 43y6yju56hb 43 y46y 546y6uj56hy25ty 56yu b6y b 55yu 56','2010-04-13 21:12:45','2010-04-13 21:14:36','2010-05-13','2010-05-13','KrakÃ³w','ozgood','ul.bÅ‚otna 7','','Zlot','','987699809',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,1,'2010-03-28 15:34:31','2010-03-28 15:34:31'),(2,2,'2010-07-21 16:30:28','2010-07-21 16:30:28'),(3,3,'2010-08-25 22:55:17','2010-08-25 22:55:17');
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
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fposts`
--

LOCK TABLES `fposts` WRITE;
/*!40000 ALTER TABLE `fposts` DISABLE KEYS */;
INSERT INTO `fposts` VALUES (1,1,2,'Zapraszam wszystkich chÄ™tnych do grupy...:-)','2010-03-28 15:35:05','2010-03-28 15:35:05'),(2,1,2,'OczywiÅ›cie zarÃ³wno mÄ™Å¼czyzn jak i kobiety..:-)','2010-03-28 15:35:37','2010-03-28 15:35:37'),(3,1,2,'tet\r\n','2010-08-25 22:55:50','2010-08-25 22:55:50');
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,1,'234234','2010-03-17 17:38:54','2010-03-17 17:38:54','data/1/126884393455.png',NULL),(2,2,'MÃ³j album','2010-03-17 22:34:08','2010-03-17 22:34:08','data/2/126886164795.png',NULL),(3,NULL,'Galeria imprezy','2010-03-17 22:52:31','2010-03-17 22:52:31','data//126886275103.png',2),(4,4,'mÃ³j album','2010-03-28 16:12:23','2010-03-28 16:12:23','data/4/126978554354.png',NULL),(5,2,'Album wakacyjny','2010-07-21 20:41:58','2010-07-21 20:41:58','data/2/127973771863.png',NULL),(6,2,'Album czwarty','2010-07-21 20:43:42','2010-07-21 20:43:42','data/2/127973782229.png',NULL),(7,2,'Album trzeci','2010-07-21 20:43:58','2010-07-21 20:43:58','data/2/127973783856.png',NULL),(8,2,'Album piÄ…ty','2010-07-21 20:44:12','2010-07-21 20:44:12','data/2/127973785272.png',NULL),(9,2,'Album szÃ³sty','2010-07-21 20:44:27','2010-07-21 20:44:27','data/2/127973786758.png',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_details`
--

LOCK TABLES `message_details` WRITE;
/*!40000 ALTER TABLE `message_details` DISABLE KEYS */;
INSERT INTO `message_details` VALUES (1,1,0,'2010-03-28 15:39:39','2010-03-28 15:39:39'),(2,2,0,'2010-03-28 15:41:46','2010-03-28 15:41:46'),(3,3,0,'2010-03-28 15:44:27','2010-03-28 15:44:27'),(4,4,0,'2010-03-28 15:45:56','2010-03-28 15:45:56'),(5,5,0,'2010-03-28 16:05:32','2010-03-28 16:05:32'),(6,6,0,'2010-03-31 23:59:43','2010-03-31 23:59:43'),(7,7,0,'2010-04-13 21:00:34','2010-04-13 21:00:34'),(8,8,0,'2010-04-13 21:04:23','2010-04-13 21:04:24'),(9,9,0,'2010-08-25 23:20:21','2010-08-25 23:20:21');
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
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,2,'Zaproszenie do listy znajomych','UÅ¼ytkownik <a href=\"/user/show/4\"> quado1</a> zaprosiÅ‚\nCiÄ™ do listy znajomych,<br/><br/><br/><a href=\"/relationship/accept/4\" class=\"relationship_accept\">AkceptujÄ™ zaproszenie!</a>','2010-03-28 15:39:39','2010-08-25 23:40:12',1),(2,2,4,'Witaj','prÃ³ba mailowa','2010-03-28 15:41:46','2010-03-28 15:45:34',1),(3,2,4,'witaj ponownie','fdedfhs fnjisjf vf','2010-03-28 15:44:27','2010-03-28 15:45:40',1),(4,4,2,'Re: witaj ponownie','cIESZÄ˜ SIÄ˜ Å»E DO MNIE PISZESZ...:-)','2010-03-28 15:45:56','2010-08-25 23:40:12',1),(5,2,4,'halo','dskfmwk ejf wojf wejf sodkd oedfj aosjd','2010-03-28 16:05:32','2010-03-28 16:11:36',1),(6,2,5,'Zaproszenie do listy znajomych','UÅ¼ytkownik <a href=\"/user/show/2\"> ozgood</a> zaprosiÅ‚\nCiÄ™ do listy znajomych,<br/><br/><br/><a href=\"/relationship/accept/2\" class=\"relationship_accept\">AkceptujÄ™ zaproszenie!</a>','2010-03-31 23:59:43','2010-03-31 23:59:43',0),(7,2,4,'qqqqq','fwegergwerhweofh;awoeugfaiuedfwaegf ertghws bwstdfbger swtghwbw wtb wrstbwgfbwtb wrtbw tgbwrtbw ','2010-04-13 21:00:34','2010-04-13 21:04:00',1),(8,4,2,'Re: qqqqq','DziÄ™ki za wiadomoÅ›Ä‡...bÄ™dÄ™ w kontakcie w krÃ³tce...:-)','2010-04-13 21:04:24','2010-07-21 22:20:48',1),(9,2,3,'Zaproszenie do listy znajomych','UÅ¼ytkownik <a href=\"/user/show/2\"> ozgood</a> zaprosiÅ‚\nCiÄ™ do listy znajomych,<br/><br/><br/><a href=\"/relationship/accept/2\" class=\"relationship_accept\">AkceptujÄ™ zaproszenie!</a>','2010-08-25 23:20:21','2010-08-25 23:20:21',0);
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
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcomments`
--

LOCK TABLES `pcomments` WRITE;
/*!40000 ALTER TABLE `pcomments` DISABLE KEYS */;
INSERT INTO `pcomments` VALUES (1,8,2,'Impreza u szakala...','2010-03-28 15:25:32','2010-03-28 15:25:32'),(2,2,2,'Bardzo fajne zdjÄ™ice','2010-07-21 20:45:41','2010-07-21 20:45:41');
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
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,'data/1/1268843967322.jpg','data/1/t1268843967322.jpg','54757','2010-03-17 17:39:27','2010-03-17 17:39:27',0),(2,2,'data/2/1268861693030.jpg','data/2/t1268861693030.jpg','Zima na quadach','2010-03-17 22:34:55','2010-07-21 22:12:31',10),(3,2,'data/2/1268861734468.jpg','data/2/t1268861734468.jpg','','2010-03-17 22:35:37','2010-07-21 22:29:33',5),(5,2,'data/2/1268861808069.jpg','data/2/t1268861808069.jpg','','2010-03-17 22:36:50','2010-03-17 22:36:56',1),(8,3,'data/2/1269782695589.jpg','data/2/t1269782695589.jpg','','2010-03-28 15:24:58','2010-03-28 15:25:32',2),(9,4,'data/4/1269785566974.jpg','data/4/t1269785566974.jpg','','2010-03-28 16:12:47','2010-08-25 23:16:05',6),(10,2,'data/2/1273225781879.jpg','data/2/t1273225781879.jpg','','2010-05-07 11:49:43','2010-07-08 10:51:00',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prates`
--

LOCK TABLES `prates` WRITE;
/*!40000 ALTER TABLE `prates` DISABLE KEYS */;
INSERT INTO `prates` VALUES (1,1,0,0,'2010-03-17 17:39:27','2010-03-17 17:39:27'),(2,2,0,0,'2010-03-17 22:34:55','2010-03-17 22:34:55'),(3,3,0,0,'2010-03-17 22:35:37','2010-03-17 22:35:37'),(4,4,0,0,'2010-03-17 22:36:16','2010-03-17 22:36:16'),(5,5,0,0,'2010-03-17 22:36:50','2010-03-17 22:36:50'),(6,6,0,0,'2010-03-28 15:23:53','2010-03-28 15:23:53'),(7,7,0,0,'2010-03-28 15:24:26','2010-03-28 15:24:26'),(8,8,0,0,'2010-03-28 15:24:58','2010-03-28 15:24:58'),(9,9,0,0,'2010-03-28 16:12:47','2010-03-28 16:12:47'),(10,10,0,0,'2010-05-07 11:49:43','2010-05-07 11:49:43');
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
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `gallery_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quads`
--

LOCK TABLES `quads` WRITE;
/*!40000 ALTER TABLE `quads` DISABLE KEYS */;
INSERT INTO `quads` VALUES (1,'Kymco','Maxxer 300',' Pierwszy quad..., ale sprawdzony',NULL,2,'2010-03-17 22:29:13','2010-07-22 16:28:38'),(2,'Bombardier/Can-am','123','123',NULL,3,'2010-03-24 23:21:24','2010-03-24 23:21:24'),(3,'Honda','Rincon 660','Co tu duÅ¼o pisaÄ‡...piekielna maszyna...:-)',NULL,4,'2010-03-28 15:37:18','2010-03-28 15:37:18'),(4,'Kymco','Maxxer 300','Ciekawy egzemplarz...:-)',NULL,NULL,'2010-07-25 22:07:20','2010-07-25 22:07:20'),(5,'Cectek','TR123','test',NULL,NULL,'2010-08-25 13:46:37','2010-08-25 13:46:37');
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
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `initiator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES (1,4,2,'accepted','2010-03-28 15:39:39','2010-03-28 15:40:59',4),(2,2,4,'accepted','2010-03-28 15:39:39','2010-03-28 15:40:59',4),(3,2,5,'pending','2010-03-31 23:59:43','2010-03-31 23:59:43',2),(4,5,2,'requested','2010-03-31 23:59:43','2010-03-31 23:59:43',2),(5,2,3,'pending','2010-08-25 23:20:21','2010-08-25 23:20:21',2),(6,3,2,'requested','2010-08-25 23:20:21','2010-08-25 23:20:21',2);
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
INSERT INTO `schema_migrations` VALUES ('20090604144449'),('20090604145505'),('20090604151159'),('20090604174034'),('20090604181530'),('20090605200405'),('20090606135544'),('20090606175335'),('20090606183901'),('20090606221635'),('20090606225433'),('20090607134117'),('20090607134146'),('20090607144801'),('20090607144855'),('20090607144926'),('20090607174435'),('20090707191545'),('20090708192020'),('20090708192640'),('20090708192651'),('20090708192858'),('20090708192905'),('20090708200908'),('20090728192040'),('20090728202112'),('20090728210850'),('20090728211323'),('20090811122519'),('20090819170426'),('20090824142814'),('20090824143359'),('20090914165040'),('20090914165050'),('20090926202004'),('20091015163919'),('20091028060634'),('20091128165654'),('20091201013024'),('20091201023332'),('20091229004043'),('20100225203543'),('20100226005618');
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
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,'97f16511a39dc7f0dcd81de746d44576','BAh7CiIVdXNlcl9jcmVkZW50aWFscyIBgGVlNDdhYjYzMmUwZGMyYjIxMmNh\nMmFkZGQ2YmI2ZTE5NmJhZGE4YWM2MDVlNDYxOWM1Y2ViMzg0NDMzZDQyZWFh\nZTc4ZWYxNjIxZGM2ZDc2MTRjNDJjZjA0NWNjYmYyMGQyOWZlY2E5YWJjNGQz\nMjE1OTZmZTg2YzkwNWYxZTQwOhNzaW1wbGVfY2FwdGNoYSItNWYyZTAzZDBi\nMGRhYzVlM2EwYTFiZTVjYWQ4YjU0ZTMyMmViNGUzMDoNcHJldnBhZ2UiEy9m\nb3J1bS9sb2dpbi8xIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQYiCmZsYXNoSUM6\nJ0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2Vk\newA=\n','2010-03-17 17:29:34','2010-03-17 18:03:58'),(2,'e5192fc25c0e43eb47729f3796c804dc','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGVlNDdhYjYzMmUwZGMyYjIxMmNh\nMmFkZGQ2YmI2ZTE5NmJhZGE4YWM2MDVlNDYxOWM1Y2ViMzg0NDMzZDQyZWFh\nZTc4ZWYxNjIxZGM2ZDc2MTRjNDJjZjA0NWNjYmYyMGQyOWZlY2E5YWJjNGQz\nMjE1OTZmZTg2YzkwNWYxZTQwOg1wcmV2cGFnZSIGLyIKZmxhc2hJQzonQWN0\naW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ACIY\ndXNlcl9jcmVkZW50aWFsc19pZGkG\n','2010-03-17 18:04:12','2010-03-17 18:04:42'),(3,'e8d302279d82bf966b3b8d595fc77477','BAh7CDoTc2ltcGxlX2NhcHRjaGEiLTJkMmU2OGQyYTM3ZGRjMjBlNDdlOGMw\nMjU4ZDU0MTA0MTUwN2UyY2Q6DXByZXZwYWdlIgYvIgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIaUG9w\ncmF3bmllIHd5bG9nb3dhbm8hBjoKQHVzZWR7BjsIVA==\n','2010-03-17 21:48:10','2010-03-17 22:55:23'),(4,'80609418f4bae4ef373a648101ced6c3','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIaL3VzZXJfc2Vzc2lvbnMv\nY3JlYXRlIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZsYXNoSUM6J0FjdGlv\nbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3By\nYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwdG\n','2010-03-17 22:29:43','2010-03-17 22:30:04'),(5,'6c2e4de5c7f3631c51a67c25eb03f6e5','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-03-18 23:08:32','2010-03-18 23:10:35'),(6,'0634744e94d37a838bf705314b651828','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-19 16:36:06','2010-03-19 16:36:06'),(7,'abdf67734b3ca4d657d6004b70c137d4','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-20 20:07:53','2010-03-20 20:07:53'),(8,'594333058bf35308e9caffd22f2d3d35','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-21 23:46:50','2010-03-21 23:46:50'),(9,'1d6a2033a55ba2646aae5fe46366dc58','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-22 16:12:44','2010-03-22 16:12:44'),(10,'0f8729314b3c44844ffbc30862c65326','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-22 22:08:28','2010-03-22 22:08:28'),(11,'8eb7c5f39550f608339d153ff8fe2ff9','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-23 06:17:16','2010-03-23 06:17:16'),(12,'27d4f7c0b3b3a4f91e04ee5a915557aa','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-24 14:03:36','2010-03-24 14:03:36'),(13,'3cc114973bcf0b84f5704da7b32a3ddb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-24 17:36:11','2010-03-24 17:36:11'),(14,'ea31e25c60ee3208268d088ff1159552','BAh7CToKcHBhZ2UiCi91c2VyOhNzaW1wbGVfY2FwdGNoYSItMzFmNzJhOTEy\nODBjNzFmODllNzA5MjlhN2RiNjliZmYwOTIwOTU4NjoNcHJldnBhZ2UiBi8i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dvd2FubyEGOgpAdXNlZHsGOwlU\n','2010-03-24 22:47:18','2010-03-24 23:39:25'),(15,'c8ec77bc951eef136f9b43d4ac842955','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-25 22:02:42','2010-03-25 22:02:42'),(16,'17c16bd5206e071295b81f97003d1b04','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-27 07:58:22','2010-03-27 07:58:22'),(17,'1a7d667929af91d156fc6fb2794dba48','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-27 16:59:16','2010-03-27 16:59:16'),(18,'067afdaaeab999d45dd20b57e84c4e21','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-28 08:01:06','2010-03-28 08:01:06'),(19,'1a82d4d77c996b7740ba23bc724198bc','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-28 11:14:51','2010-03-28 11:14:51'),(20,'a9ff2b01487c9d9ff06e1750c2b01728','BAh7BjoNcHJldnBhZ2UiKC8/cGFnZT1odHRwOi8vNzIuNTQuMTI5LjIzNC8x\nLmdpZj8v\n','2010-03-28 13:43:39','2010-03-28 13:43:39'),(21,'ace032cdab0b0a71ca8e101d4f06dd83','BAh7BjoNcHJldnBhZ2UiOi8/X1NFUlZFUltET0NVTUVOVF9ST09UXT1odHRw\nOi8vNzIuNTQuMTI5LjIzNC8xLmdpZj8v\n','2010-03-28 13:43:40','2010-03-28 13:43:40'),(22,'45ca6918efead943874223c05b1ee02a','BAh7CDoNcHJldnBhZ2UiBi86E3NpbXBsZV9jYXB0Y2hhIi0zMTI2YTNjYzZm\nZDU4MTUwZmJhMzk5OTMzMGU3MjZkNDdlZGMzNWIxIgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSJiVHdv\namUga29udG8gem9zdGHFgm8gdXR3b3J6b25lLiBOYSBUd8OzaiBhZHJlcyBw\ncnplc8WCYWxpxZtteSBlbWFpbCB6IGtvZGVtIHBvdHdpZXJkemFqxIVjeW0u\nBjoKQHVzZWR7BjsIVA==\n','2010-03-28 15:10:02','2010-03-28 15:37:18'),(23,'f06aafa7b1e4a54fe955fab6f221c586','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-03-28 15:38:12','2010-03-28 16:14:15'),(24,'c66f34eb1c1f4002d19862d74dbc593b','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjOg1wcmV2cGFnZSIWL21lc3NhZ2UvcmVjZWl2\nZWQiGHVzZXJfY3JlZGVudGlhbHNfaWRpBiIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2010-03-29 00:07:52','2010-03-29 00:07:59'),(25,'47bb9400adc00967a90e6302c3f6fdbd','BAh7CDoKcHBhZ2UiES91c2VyL3Nob3cvMToNcHJldnBhZ2UiEC91c2VyL2xv\nZ2luIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIjZEb3N0xJlwIGRvIHRlaiBjesSZxZtjaSBzdHJvbnkg\nd3ltYWdhIHphbG9nb3dhbmlhBjoKQHVzZWR7BjsIVA==\n','2010-03-29 11:57:03','2010-03-29 12:32:39'),(26,'a064e738e7674878f4bc3027578f6fc0','BAh7CToKcHBhZ2UiDy91c2VyL3Nob3c6E3NpbXBsZV9jYXB0Y2hhIi01OGM0\nMzM5NjE1MGM4Y2M2OTZmZjdmNjNmMjc2YTQ0YmQ0NDczOWY3Og1wcmV2cGFn\nZSIGLyIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7AA==\n','2010-03-29 14:42:13','2010-03-29 14:58:13'),(27,'e1289972ef7a3615068cc1d635099e33','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-29 16:33:25','2010-03-29 16:33:25'),(28,'26d54bf640a12bbf77b1b5128908bbda','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-30 11:18:16','2010-03-30 11:18:16'),(29,'7d9fd0e895e49064893ad292a1c91f92','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-30 18:40:00','2010-03-30 18:40:00'),(30,'34f8298f6b79ff62986ff037c8cdfec2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-30 19:22:10','2010-03-30 19:22:10'),(31,'10279e594e894f183e9fb087d526c101','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-30 22:29:02','2010-03-30 22:29:02'),(32,'cc09078ff5567e47972ac87e5d12bb05','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 00:14:37','2010-03-31 00:14:37'),(33,'bc545317117327cdf202dd951ae9b15b','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 01:22:13','2010-03-31 01:22:13'),(34,'b860e964155eed9a4281a60050e373d6','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 10:45:55','2010-03-31 10:45:55'),(35,'dfcc5e956fd822d76deda702a9a93b6a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 11:54:00','2010-03-31 11:54:00'),(36,'7639e5aa18355e241bfda968cda514f2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 14:29:31','2010-03-31 14:29:31'),(37,'0eb9abcb31e66d125cd5bb10468884d1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-03-31 23:34:42','2010-03-31 23:34:42'),(38,'433d697f504d7db7529a3514b9e6ddbd','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIGLyIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9nb3dhbm8hBjoK\nQHVzZWR7BjsHVA==\n','2010-03-31 23:58:15','2010-04-01 01:39:43'),(39,'2c71f7dabf9c1074638bc1e2f294dd95','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-01 09:37:37','2010-04-01 09:37:37'),(40,'cc98817da80919f3c4be501ce2965712','BAh7CDoKcHBhZ2UiES9mb3J1bS9sb2dpbjoNcHJldnBhZ2UiEC91c2VyL2xv\nZ2luIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIjZEb3N0xJlwIGRvIHRlaiBjesSZxZtjaSBzdHJvbnkg\nd3ltYWdhIHphbG9nb3dhbmlhBjoKQHVzZWR7BjsIVA==\n','2010-04-01 17:27:37','2010-04-01 17:36:04'),(41,'b4103406aea9f723e80dd1def1b65641','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-01 23:36:45','2010-04-01 23:36:45'),(42,'2d8b34dde367850ba288efc3c88aab01','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-02 12:22:04','2010-04-02 12:22:04'),(43,'1f5a73179dd222fec6ead3c2c2468f0c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-02 17:21:11','2010-04-02 17:21:11'),(44,'4975002c874d9413cc283254cc2e4fc5','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-03 16:05:37','2010-04-03 16:05:37'),(45,'a64e619635784c5d40d1d1fe112d0a47','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-03 20:31:10','2010-04-03 20:31:10'),(46,'989408dce9783ce6d0176dea1ff92c04','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSISL3ZpZGVvL3Nob3cvNCIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ACIYdXNlcl9jcmVkZW50aWFsc19pZGkH\n','2010-04-04 15:04:14','2010-04-04 15:05:47'),(47,'a6162417143cea203427f556c904ec17','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-04 21:53:24','2010-04-04 21:53:24'),(48,'9781d6836f55b70c4b008dd879af2752','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-05 22:28:05','2010-04-05 22:28:05'),(49,'d3450552d5d21587722df1fa50706f5d','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-07 05:38:24','2010-04-07 05:38:24'),(50,'1cf8aeafe7a71c3bb4aa30f6585047bf','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIRL3VzZXIvc2hvdy8yIhh1\nc2VyX2NyZWRlbnRpYWxzX2lkaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xs\nZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-04-07 15:08:20','2010-04-07 16:09:58'),(51,'1e013eba6c65650485d485cce10260dc','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-08 08:52:45','2010-04-08 08:52:45'),(52,'7a5c16cd36bd13ce67e1b6a45015c05f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-08 12:39:20','2010-04-08 12:39:20'),(53,'c563ef012fa7e94208d2e673fc380eb1','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-04-08 22:47:55','2010-04-08 23:45:10'),(54,'0349682e62982d1f5f6b20cf9dacfbbf','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-09 16:07:01','2010-04-09 16:07:01'),(55,'713e1110917b740d357c140accacf9c2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-09 20:12:17','2010-04-09 20:12:17'),(56,'cbabdc2c146233435ff753ecc3dcb3ec','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-09 22:02:42','2010-04-09 22:02:42'),(57,'06de695c20a6cda9a1d0bb19a1bc32e5','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-09 22:25:40','2010-04-09 22:25:40'),(58,'6b29b6573ca10be5e4774506a384becd','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-10 00:32:00','2010-04-10 00:32:00'),(59,'a7a097d5ef5dc9c25aa72d4266274068','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-10 00:47:10','2010-04-10 00:47:10'),(60,'e0e8881282bf6b646d45d2fbdeeaeab3','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-10 06:27:28','2010-04-10 06:27:28'),(61,'7b7a1e404b5e95c2805e017e2cc40253','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-10 19:58:23','2010-04-10 19:58:23'),(62,'0053952610f85fed0097e00b4bb44dbf','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-10 21:20:27','2010-04-10 21:20:27'),(63,'a3596941ac78ba56c7387bb35c9fbe21','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-12 01:11:11','2010-04-12 01:11:11'),(64,'12c2ae12945d0654191ea2c5cdf93843','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-12 01:14:41','2010-04-12 01:14:41'),(65,'1be896d739fe14c704f10abb83c86d62','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-13 19:53:56','2010-04-13 19:53:56'),(66,'be035f8526339e98336d99e46a15dee1','BAh7CiIVdXNlcl9jcmVkZW50aWFscyIBgGRmMzQ0YWRmZDFlMmU3YWIyNzE4\nMGExZDUwYzY1MDJiM2QwYzU0NmEzODI3YzU3ODAzMDAwNmUyNzljMDM0ODA2\nZGU1OTRiZjMwODdiNTlkZTEzYWM0MWJkYjM0NDZkZmY3MzQ2YjYyNzExOTRl\nYmUxOTA4MmFmMzE5ZWFmYzcwOg1wcmV2cGFnZSISL3ZpZGVvL3Nob3cvNjoT\nc2ltcGxlX2NhcHRjaGEiLWRkNDFhZmY3ZDRiZTM1OTRlYjgyZmRjMDViYzVl\nYjAxNWRjYzI1ODUiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNo\nOjpGbGFzaEhhc2h7AAY6CkB1c2VkewAiGHVzZXJfY3JlZGVudGlhbHNfaWRp\nCQ==\n','2010-04-13 20:55:39','2010-04-13 21:43:43'),(67,'d6251aac5cc969bdc7e03adab5e8aa0f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-13 21:05:18','2010-04-13 21:05:18'),(68,'32600d2982af5c37b27c5befd9becdae','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGRmMzQ0YWRmZDFlMmU3YWIyNzE4\nMGExZDUwYzY1MDJiM2QwYzU0NmEzODI3YzU3ODAzMDAwNmUyNzljMDM0ODA2\nZGU1OTRiZjMwODdiNTlkZTEzYWM0MWJkYjM0NDZkZmY3MzQ2YjYyNzExOTRl\nYmUxOTA4MmFmMzE5ZWFmYzcwOg1wcmV2cGFnZSIRL3VzZXIvc2hvdy80Igpm\nbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAG\nOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQk=\n','2010-04-13 21:08:00','2010-04-13 21:10:02'),(69,'db45362d536fb51c2006b8515b13c6be','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-15 01:33:40','2010-04-15 01:33:40'),(70,'e72d0995b1ed2588bcc43d66488fd102','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-15 21:08:22','2010-04-15 21:08:22'),(71,'520d2187dcb10e2c688c29ac562d4937','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-15 22:18:11','2010-04-15 22:18:11'),(72,'5cfe68e1b3252d1b56318e14f6b56c5d','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-16 12:02:05','2010-04-16 12:02:05'),(73,'b1c32ed56ccea5b69b9bfcd720f72267','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-19 02:42:36','2010-04-19 02:42:36'),(74,'978f3995a71898c6f4229952316bd8ee','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-20 12:12:21','2010-04-20 12:12:21'),(75,'ab1a36666870023a27843d61260a2d56','BAh7CDoKcHBhZ2UiES91c2VyL3Nob3cvMToNcHJldnBhZ2UiEC91c2VyL2xv\nZ2luIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIjZEb3N0xJlwIGRvIHRlaiBjesSZxZtjaSBzdHJvbnkg\nd3ltYWdhIHphbG9nb3dhbmlhBjoKQHVzZWR7BjsIVA==\n','2010-04-22 09:43:39','2010-04-22 09:48:40'),(76,'005cb9cd552bdde6e5ee6519f4d556b8','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-22 22:38:39','2010-04-22 22:38:39'),(77,'c3a9053c4bd208bb3e36e9fb71598bf2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-23 20:02:25','2010-04-23 20:02:25'),(78,'cc039746c04dcf4dbb43d0493d993423','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-23 23:56:18','2010-04-23 23:56:18'),(79,'787ceb3c079e53b78ad29719786483db','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-24 00:18:32','2010-04-24 00:18:32'),(80,'810b677dde4098d10b4240f100afd9e2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-25 20:15:33','2010-04-25 20:15:33'),(81,'336d23478f19d7d6a38ff0af71d555cf','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-04-25 22:52:20','2010-04-25 23:29:40'),(82,'f1fb330d884059249ee120ea546caeda','BAh7BjoNcHJldnBhZ2UiEi9zaXRlL3Bwb2xpY3k=\n','2010-04-26 18:18:06','2010-04-26 19:32:09'),(83,'8a6adcd9175e994ad084772c332fe138','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-26 19:47:44','2010-04-26 19:47:44'),(84,'1b3e35df42b1b98fee97d9c4d465d59f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-26 21:07:24','2010-04-26 21:07:24'),(85,'b1ead76e9f3f8d4603b19acaa91fc7b3','BAh7CDoKcHBhZ2UiDy90ZWFtL2xpc3Q6DXByZXZwYWdlIisvdXNlci9pZmlu\nZC9Cb21iYXJkaWVyLS1DYW4tYW0/Ynk9cXVhZCIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2010-04-26 21:27:30','2010-04-26 21:27:58'),(86,'a17cf2a1a311b445be0c4ef9f4ba6e26','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-04-26 22:20:47','2010-04-26 22:21:51'),(87,'f157272c850012bbae44d640d4e2d0e0','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZUOg1w\ncmV2cGFnZSIGLw==\n','2010-04-27 20:26:19','2010-04-27 21:58:20'),(88,'b24a7661aae0d11b46b4dc185b28735d','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQY6DXBy\nZXZwYWdlIgYvIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9nb3dhbm8hBjoK\nQHVzZWR7BjsHVA==\n','2010-04-27 20:27:23','2010-04-27 21:57:44'),(89,'da1dbb09e9f9fa152bde82dc7ab8cf80','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-27 21:53:55','2010-04-27 21:53:55'),(90,'6d7f8d9c46c811132faaef010f4a98e7','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIYL2dhbGxlcnkvdl91bmZv\nbGQvMiIYdXNlcl9jcmVkZW50aWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25D\nb250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-04-27 22:00:32','2010-04-27 22:08:55'),(91,'d0a4e9c10b5d8d7368e5706352c8ea9c','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-04-27 22:03:20','2010-04-27 22:32:39'),(92,'a781ed2d1d27cd32e866a1241050f996','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-04-27 22:16:20','2010-04-27 22:22:49'),(93,'aa1f54a85f40c65aeb52d76b9fd7dd66','BAh7CToTc2ltcGxlX2NhcHRjaGEiLWRjODI4OGViMDMwYzE5MzJlOWE1NTA4\nODAxMWFiM2Q2ZjE0MjZmMTA6CnBwYWdlIhIvcGhvdG8vc2hvdy8yOg1wcmV2\ncGFnZSIQL3VzZXIvbG9naW4iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoKZXJyb3IiNkRvc3TEmXAgZG8gdGVqIGN6\nxJnFm2NpIHN0cm9ueSB3eW1hZ2EgemFsb2dvd2FuaWEGOgpAdXNlZHsGOwlU\n','2010-04-28 00:18:35','2010-04-28 08:06:05'),(94,'ebae23c3dec42ec6c0d1d884f401346f','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-04-28 08:45:38','2010-04-28 09:13:06'),(95,'dd7c3fb736507c98f3f20f970402a214','BAh7CDoTc2ltcGxlX2NhcHRjaGEiLWJkYjZlNWFjMGY0MDVkY2VlOWYxMTAw\nMTNkOGQ3MmI1MWM3NWRlZTA6DXByZXZwYWdlIhMvdXNlci9yZWdpc3RlciIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsG\nOgplcnJvciI7TXVzaXN6IHphYWtjZXB0b3dhxIcgcmVndWxhbWluIGJ5IGtv\ncnp5c3RhxIcgeiBzZXJ3aXN1BjoKQHVzZWR7BjsIRg==\n','2010-04-28 08:47:15','2010-04-28 08:48:59'),(96,'43506cbea68064697d549a9b96e780a6','BAh7CDoKcHBhZ2UiEi9nYWxsZXJ5L2xpc3Q6DXByZXZwYWdlIisvdXNlci9p\nZmluZC9Cb21iYXJkaWVyLS1DYW4tYW0/Ynk9cXVhZCIKZmxhc2hJQzonQWN0\naW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2010-04-28 10:44:21','2010-04-28 10:49:55'),(97,'db03d485415fb32eab4a65b311fe9f49','BAh7BzoNcHJldnBhZ2UiKy91c2VyL2lmaW5kL0JvbWJhcmRpZXItLUNhbi1h\nbT9ieT1xdWFkIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-04-28 12:34:59','2010-04-28 15:54:45'),(98,'365a05f9cc83cdce44997937a59f9569','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-04-28 15:23:07','2010-04-28 15:31:33'),(99,'9d163ede6e191663139a7c283643afaa','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-29 01:19:28','2010-04-29 01:19:28'),(100,'d21cf7a251dfa45a95bcc22e3a4789d3','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-29 08:52:06','2010-04-29 08:52:06'),(101,'05146460fd8a260d734d6babdfe04b0a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-29 21:14:39','2010-04-29 21:14:39'),(102,'f0503d954431af1d760479ada103a863','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-30 00:32:54','2010-04-30 00:32:54'),(103,'f1099e3cfb9de32b1c009a72ee96b779','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-04-30 14:08:59','2010-04-30 14:08:59'),(104,'31d401b1fe1f18f2c02b00e754d744ce','BAh7CDoKcHBhZ2UiEi9waG90by9zaG93LzUiCmZsYXNoSUM6J0FjdGlvbkNv\nbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoKZXJyb3IiNkRvc3TEmXAg\nZG8gdGVqIGN6xJnFm2NpIHN0cm9ueSB3eW1hZ2EgemFsb2dvd2FuaWEGOgpA\ndXNlZHsGOwdUOg1wcmV2cGFnZSIQL3VzZXIvbG9naW4=\n','2010-04-30 20:27:36','2010-04-30 21:01:04'),(105,'8635f1a3b7669f1cb0a4fe0a5098aa4c','BAh7BjoNcHJldnBhZ2UiEi92aWRlby9zaG93LzY=\n','2010-04-30 21:01:24','2010-04-30 21:01:48'),(106,'2b23db3f14d39feed0edf77b47561504','BAh7CDoKcHBhZ2UiGC9yZWxhdGlvbnNoaXAvcmVxLzQ6DXByZXZwYWdlIhAv\ndXNlci9sb2dpbiIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6\nOkZsYXNoSGFzaHsGOgplcnJvciI2RG9zdMSZcCBkbyB0ZWogY3rEmcWbY2kg\nc3Ryb255IHd5bWFnYSB6YWxvZ293YW5pYQY6CkB1c2VkewY7CFQ=\n','2010-05-02 13:19:45','2010-05-02 17:14:02'),(107,'723d694b88ef6dc3e6df418eeaa1b21f','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-05-03 23:08:24','2010-05-03 23:43:03'),(108,'e2c386f85b0ad3b6e47394f0f3c4dcf6','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-05 10:50:38','2010-05-05 10:50:38'),(109,'013bdd7c38661d58f75462c24b85080a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-05 12:38:59','2010-05-05 12:38:59'),(110,'8bdbb22b1cd9dd685402abd1d25f089e','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-05 21:15:16','2010-05-05 21:15:16'),(111,'4ec94692252a19e3ec375c178121e58a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-06 04:10:46','2010-05-06 04:10:46'),(112,'b809ee140e587b7b26271ddf1e3b639a','BAh7BzoNcHJldnBhZ2UiGi91c2VyX3Nlc3Npb25zL2NyZWF0ZSIKZmxhc2hJ\nQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgplcnJv\nciIrTmllcHJhd2lkxYJvd2UgZGFuZSwgc3Byw7NidWogcG9ub3duaWUGOgpA\ndXNlZHsGOwdG\n','2010-05-07 01:41:30','2010-05-11 01:02:38'),(113,'a6d83e33284fe6ca22d00698773eff6c','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-05-07 11:37:21','2010-05-07 12:28:40'),(114,'7c324d37bee4f87edbc2569ceceecdde','BAh7CToTc2ltcGxlX2NhcHRjaGEiLTFiOWMxYjY3MDhkNGM1ZWVkMDdiNDdh\nYmNiYzBmMjU5NDY0MDE0Nzg6CnBwYWdlIhIvcGhvdG8vc2hvdy8zIgpmbGFz\naElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpA\ndXNlZHsAOg1wcmV2cGFnZSITL3VzZXIvcmVnaXN0ZXI=\n','2010-05-07 21:39:19','2010-05-07 21:41:06'),(115,'12dbc87c32ba1216e0ccd7f2d417361a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-09 16:17:49','2010-05-09 16:17:49'),(116,'ab88f611d375f8ce9e682fde06605933','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-10 12:44:57','2010-05-10 12:44:57'),(117,'66a9e44d309450670b471b5f8521db6d','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-11 14:50:37','2010-05-11 14:50:37'),(118,'a9a5a40ff8c42a0cd7e1bb820876f54c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-13 16:35:18','2010-05-13 16:35:18'),(119,'a0233e822605557b906fcf9c1a98014f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-14 16:21:12','2010-05-14 16:21:12'),(120,'33ef751ff5d419b77cc8806d648197f2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-14 16:21:21','2010-05-14 16:21:21'),(121,'3c1b8cb952f0722e8fa84c2c40b4c9b7','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-15 10:21:08','2010-05-15 10:21:08'),(122,'a52cbb9adbaceb1eca54c73172beb68d','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-05-17 20:18:27','2010-05-17 20:19:31'),(123,'da3d8cda90a626d19d16d91b8c1340bc','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZUOg1w\ncmV2cGFnZSIGLw==\n','2010-05-17 20:18:40','2010-05-17 20:23:14'),(124,'e5c8301ea46223a4a45465fd13a5f38b','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-05-19 12:31:54','2010-05-19 12:51:29'),(125,'745a5ed62a2b94f08e5c91ca342a51f1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-19 21:41:02','2010-05-19 21:41:02'),(126,'311aecae3bfb288cd6f7a6fe3d845de2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-19 21:41:25','2010-05-19 21:41:25'),(127,'7715cff054249b2673ccb98c579de438','BAh7CToTc2ltcGxlX2NhcHRjaGEiLWMyZDBmYTA3YzQzNWY1MTdiN2QyZjZl\nOWMxNzM5NWMwZWYxNjRmOGE6CnBwYWdlIg8vdXNlci9zaG93IgpmbGFzaElD\nOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6CmVycm9y\nIitOaWVwcmF3aWTFgm93ZSBkYW5lLCBzcHLDs2J1aiBwb25vd25pZQY6CkB1\nc2VkewY7CEY6DXByZXZwYWdlIhovdXNlcl9zZXNzaW9ucy9jcmVhdGU=\n','2010-05-20 12:51:38','2010-05-20 13:00:33'),(128,'5bda188a3d14be7b1fa52c041c0ed0d7','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-20 13:36:31','2010-05-20 13:36:31'),(129,'c4bbc61e710b5caf90f9c0e8f1520d10','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-05-20 13:44:52','2010-05-20 13:47:41'),(130,'f43dd48726583b909577edad1683a2ac','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-21 16:01:18','2010-05-21 16:01:18'),(131,'d1e60668466fb7428573ab47405920f6','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRp\nYWxzX2lkaQc6DXByZXZwYWdlIgYv\n','2010-05-21 18:29:47','2010-05-21 18:34:14'),(132,'af8084b05064ce69850f12d0c6ba743f','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIPL3VzZXIvc2hvdyIYdXNl\ncl9jcmVkZW50aWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-05-21 19:51:24','2010-05-21 19:51:43'),(133,'8f9f13d02b28f523847a4bb2b8b9acd7','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRp\nYWxzX2lkaQc6DXByZXZwYWdlIg8vdXNlci9zaG93\n','2010-05-21 20:02:02','2010-05-21 21:09:00'),(134,'e08bd102153339cecf99d27a78370c27','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-21 20:52:09','2010-05-21 20:52:09'),(135,'9fab47e33d93dfd9dc125c28f4000933','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIRL2ZvcnVtL2xvZ2luIhh1\nc2VyX2NyZWRlbnRpYWxzX2lkaQciCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xs\nZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-05-22 15:11:58','2010-05-22 17:23:34'),(136,'a7c786dbd6c8a01a1ce3a2c19c24f4c4','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-22 17:23:52','2010-05-22 17:23:52'),(137,'8c62ee39ff04ebdad9130fc2eaa5f96b','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIGLyIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-05-22 23:39:42','2010-05-23 00:27:22'),(138,'ba49827949000032a7790ae276ea18c1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-24 11:28:47','2010-05-24 11:28:47'),(139,'f8f8d17c217fbf3b92f52631882b9630','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-24 11:57:58','2010-05-24 11:57:58'),(140,'a9ebfeeca74db184a81ff62489459c53','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-05-24 12:08:47','2010-05-24 17:00:41'),(141,'d5831db683e452060dccdcbdfd7946f3','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIGLyIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-05-24 18:43:08','2010-05-24 18:51:41'),(142,'c44b14d05dfe7a0500a580bdde80eb4c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-25 16:36:26','2010-05-25 16:36:26'),(143,'c588d4c1c26d1e09be2748044afc2baf','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRp\nYWxzX2lkaQc6DXByZXZwYWdlIhUvdXNlci9pZnJpZW5kcy8y\n','2010-05-25 19:55:25','2010-05-25 21:22:42'),(144,'fa87ddbfad5c4395983c380ba174288a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-26 23:12:05','2010-05-26 23:12:05'),(145,'cb156406c135bebe58db736c0c29628a','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSISL3VzZXIvbXl0ZWFtcyIY\ndXNlcl9jcmVkZW50aWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9s\nbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-05-27 19:13:04','2010-05-27 22:22:13'),(146,'6391f1568e76b3c5a360b6d03a3934b1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-05-28 01:31:38','2010-05-28 01:31:38'),(147,'f5f0e5dd331e5d238340322b47c0d476','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-04 09:23:54','2010-06-04 09:23:54'),(148,'12ecc728b82b1d372481d1629d282fa6','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-04 18:28:12','2010-06-04 18:28:12'),(149,'cf792172d4c8c2551479c9ce11509dbb','BAh7CCIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgplcnJvciI2RG9zdMSZcCBkbyB0ZWogY3rEmcWbY2kgc3Ryb255\nIHd5bWFnYSB6YWxvZ293YW5pYQY6CkB1c2VkewY7BlQ6CnBwYWdlIhEvdXNl\nci9zaG93LzY6DXByZXZwYWdlIhAvdXNlci9sb2dpbg==\n','2010-06-05 04:43:54','2010-06-05 04:52:16'),(150,'4d3526d31a0d8e04009df19d71de1a65','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-05 09:55:28','2010-06-05 09:55:28'),(151,'1f7c182a84c86cdd2fe3c30977d39da4','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-06 11:48:19','2010-06-06 11:48:19'),(152,'3c2160915d0a5abb09966d47930452a2','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQYiCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZUOg1w\ncmV2cGFnZSITL3Bob3RvL3Nob3cvMTA=\n','2010-06-06 11:49:34','2010-06-06 11:50:02'),(153,'7933d2a59b9c40ccc9921c5903164094','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIgYv\n','2010-06-06 12:15:28','2010-06-06 12:22:48'),(154,'bbf6284d9c9fd33f9556373b854ccbdf','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQYiCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIg8vdXNlci9zaG93\n','2010-06-06 23:46:11','2010-06-07 07:14:03'),(155,'868d9a4dd6e95401c067adfe902c321b','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-07 18:25:18','2010-06-07 18:25:18'),(156,'d10be62c644d8311c850d2f53eb9c955','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-07 18:30:14','2010-06-07 18:30:14'),(157,'2fcba3a02f0542cc590e09b06ddf9f35','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIhYvbWVzc2FnZS9yZWNlaXZlZA==\n','2010-06-08 13:11:21','2010-06-08 13:48:05'),(158,'aacf436d4219c9f0a0231ed19e693e3c','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIhEvdGVhbS9zaG93LzE=\n','2010-06-08 15:45:01','2010-06-08 15:47:08'),(159,'99b09ad0f13bd9fd0bd34baf9f2f8c21','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-08 15:49:41','2010-06-08 15:49:41'),(160,'3cf7b62d3639206b8f6044f79f5cc06b','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-08 15:50:50','2010-06-08 15:50:50'),(161,'2f7dc70c22370fbbc19249212a8ece7c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-08 15:51:49','2010-06-08 15:51:49'),(162,'8988817b41339362f341e371186d75ba','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRp\nYWxzX2lkaQY6DXByZXZwYWdlIhEvdXNlci9zaG93LzE=\n','2010-06-08 19:09:22','2010-06-08 22:06:34'),(163,'a8e3ae4498ca8ebf4912629142445ff1','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQYiCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIg8vdGVhbS9saXN0\n','2010-06-08 21:48:49','2010-06-08 21:51:41'),(164,'0a411e69daf5213849e6dfd1a853f8e1','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZUOg1w\ncmV2cGFnZSIGLw==\n','2010-06-09 11:49:45','2010-06-09 11:51:52'),(165,'1e9519f821a80e57cc25e347e14776d6','BAh7CDoKcHBhZ2UiDy91c2VyL3Nob3ciCmZsYXNoSUM6J0FjdGlvbkNvbnRy\nb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6DXByZXZwYWdl\nIgYv\n','2010-06-09 12:44:03','2010-06-09 12:45:14'),(166,'e6530f6a7578e3006b026867fa4113fc','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-09 22:03:36','2010-06-09 22:03:36'),(167,'83cfce4f6ea29605021104dfe127c0c6','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIisvdXNlci9pZmluZC9Cb21iYXJkaWVyLS1D\nYW4tYW0/Ynk9cXVhZA==\n','2010-06-11 11:22:42','2010-06-11 12:26:01'),(168,'6024c26e40fb242dd98040247bbd6dae','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-11 12:55:21','2010-06-11 12:55:21'),(169,'8684f8ef421606f5bf8323844a8e6e30','BAh7CDoKcHBhZ2UiES91c2VyL3Nob3cvOCIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoNcHJldnBh\nZ2UiBi8=\n','2010-06-11 14:42:00','2010-06-11 14:46:09'),(170,'3ce66dd8eedb9c903bd4264d9182c31c','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9n\nb3dhbm8hBjoKQHVzZWR7BjsGVCIYdXNlcl9jcmVkZW50aWFsc19pZGkHOg1w\ncmV2cGFnZSIGLw==\n','2010-06-11 22:31:10','2010-06-11 22:31:25'),(171,'8a62c9f3fcec26069d257b0c954d0f5a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-12 11:18:13','2010-06-12 11:18:13'),(172,'b7d64116dcfd4ac59f93740ba61c99f2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-12 16:01:12','2010-06-12 16:01:12'),(173,'578491864594a0900bc8874eeca10fb9','BAh7BzoKcHBhZ2UiHy9mb3J1bS9lMTA3X2ZpbGVzL2UxMDcuY3NzIgpmbGFz\naElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6CmVy\ncm9yIjZEb3N0xJlwIGRvIHRlaiBjesSZxZtjaSBzdHJvbnkgd3ltYWdhIHph\nbG9nb3dhbmlhBjoKQHVzZWR7BjsHRg==\n','2010-06-13 16:44:09','2010-06-13 16:44:09'),(174,'209eeabfcf164eacae2b6cd6d85c1c3a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-13 16:49:12','2010-06-13 16:49:12'),(175,'630fb998cbc99935874f6f62beb8e835','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZUOg1w\ncmV2cGFnZSIGLw==\n','2010-06-13 21:15:59','2010-06-13 21:16:29'),(176,'2b817c60f6e78ebd589da009bdb94479','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIhIvdXNlci9teXRlYW1z\n','2010-06-13 21:18:20','2010-06-13 21:21:01'),(177,'5f3880394f749a2478ad9130d46fd626','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-14 12:58:23','2010-06-14 12:58:23'),(178,'38f9cc971ed249f678e5c591df895c73','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-06-14 14:20:15','2010-06-14 14:23:36'),(179,'25bdb54e83c9ac355018a5c94924267c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-15 00:22:32','2010-06-15 00:22:32'),(180,'6c5b52fae31de6e6910727ec1c0a65b8','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoNcHJldnBhZ2UiEi9ldmVudC9zaG93LzM=\n','2010-06-15 00:22:34','2010-06-15 01:38:09'),(181,'12681037861ed3c128343202457c6405','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-15 02:44:27','2010-06-15 02:44:27'),(182,'522750fe10ed76a93e2cb2cdac63ee57','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSISL21lc3NhZ2UvbmV3ciIY\ndXNlcl9jcmVkZW50aWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9s\nbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-06-15 08:52:22','2010-06-15 09:06:53'),(183,'6b98120bbb493830ddd12030b838ed05','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIGLyIKZmxhc2hJQzonQWN0\naW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ACIY\ndXNlcl9jcmVkZW50aWFsc19pZGkH\n','2010-06-15 13:13:54','2010-06-15 14:57:11'),(184,'1110566f9534da57d1875a65118d3f68','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-15 18:58:06','2010-06-15 18:58:06'),(185,'ca767eb74504d6346dbff8caa2e7b5fb','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-06-16 00:52:07','2010-06-16 00:55:06'),(186,'500e75b484a1cc442877126939238f79','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-16 19:08:51','2010-06-16 19:08:51'),(187,'5472d6177d1c852ec7a6bf5ad51b9ab4','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-17 00:06:30','2010-06-17 00:06:30'),(188,'de936eda9158a4ffb4a2e1e2334a7332','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-18 02:19:59','2010-06-18 02:19:59'),(189,'51c169daa41d083e3b0b4e46d0332e4e','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-18 12:52:59','2010-06-18 12:52:59'),(190,'4100c439717594f548ce188508c702b5','BAh7BjoNcHJldnBhZ2UiLC8/UEhQU0VTU0lEPTVnaDZuY2poMDAwNDNWVU1U\nVVBfRSU1Q0ZDUA==\n','2010-06-18 22:35:04','2010-06-18 22:35:04'),(191,'8a99e4fd8f43118f44de71f599c16e46','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 08:27:32','2010-06-22 08:27:32'),(192,'1096886fac8f9f4bab96baf28bee3651','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA=\n','2010-06-22 09:18:18','2010-06-22 09:22:45'),(193,'4cbcd5d483a8b1e4931d0ca1d4066a5c','BAh7BjoNcHJldnBhZ2UiJy91c2VyL2lmaW5kL3BvZGthcnBhY2tpZT9ieT1y\nZWdpb24=\n','2010-06-22 09:28:12','2010-06-22 09:28:22'),(194,'06c987aa6d6d4ed712cdd2004916fc0e','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 14:35:31','2010-06-22 14:35:31'),(195,'64658756bafa10657d22fa106e61dec1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 18:05:09','2010-06-22 18:05:09'),(196,'45f667b84d1dc413bc1afab4feb59a38','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 22:16:10','2010-06-22 22:16:10'),(197,'0eaa05ca98cadd274751a65d30dc5ccb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 22:16:25','2010-06-22 22:16:25'),(198,'03ac5c2565da06be3e869e1161ef5b66','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-22 22:55:33','2010-06-22 22:55:33'),(199,'6b0e380aef2d8fea454d787a5058a7c0','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-23 10:03:08','2010-06-23 10:03:08'),(200,'ac72d266cb449186d7c2285e73a5e0b1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-23 11:16:20','2010-06-23 11:16:20'),(201,'b928f8111cdd66dc254ce32eaa748a8f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-24 23:37:59','2010-06-24 23:37:59'),(202,'300af1e865c2580bc4d7c8721826ccbf','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-25 10:10:52','2010-06-25 10:10:52'),(203,'5bcce7380ad48418b81a9eb2c11ed261','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-25 12:25:34','2010-06-25 12:25:34'),(204,'3465b95f891f915bc274da22869e5ec2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-25 15:25:59','2010-06-25 15:25:59'),(205,'5c9094c7d29bad238c8c4485e88b9ff7','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-25 20:46:50','2010-06-25 20:46:50'),(206,'c6ddf883975c7ca3a7dfcab2e551ad5c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-27 01:17:24','2010-06-27 01:17:24'),(207,'a06464d45e841963ff1ca07f6429dbbd','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-27 10:27:46','2010-06-27 10:27:46'),(208,'6d5b937f022c133a967640735016a96b','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-27 16:45:32','2010-06-27 16:45:32'),(209,'d2f0ca12ed135d37cb383f1f2a1e0bfb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-27 22:55:25','2010-06-27 22:55:25'),(210,'9e04d45ee8a96aeb8c99e3206ebc1a9d','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-29 14:19:34','2010-06-29 14:19:34'),(211,'4442f37210c1471315dc0f62e22e6ada','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-29 16:12:33','2010-06-29 16:12:33'),(212,'1be81ed3f3cb43fc41aade91567ff340','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-29 23:06:29','2010-06-29 23:06:29'),(213,'bee6c4c90011aa9f351aa9416a0a576a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-30 13:59:55','2010-06-30 13:59:55'),(214,'5de5dd5f09e0037129f46e4d30b4b92e','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-30 16:24:51','2010-06-30 16:24:51'),(215,'c33e9c93d9176f67f08fac35a052efa2','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-06-30 20:33:31','2010-06-30 20:33:31'),(216,'e2f16fe40f19060070f6710f02a2585a','BAh7CDoKcHBhZ2UiEi91c2VyL215dGVhbXM6DXByZXZwYWdlIiovdXNlci9m\naW5kL21hJUM1JTgyb3BvbHNraWU/Ynk9cmVnaW9uIgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-06-30 22:44:26','2010-06-30 22:46:42'),(217,'ce48b248f1bbd97ccf14f0ca18ce513f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-01 11:02:42','2010-07-01 11:02:42'),(218,'ee345758f39188fc50cd4a9ab766bfae','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-02 14:46:02','2010-07-02 14:46:02'),(219,'cc8b083a956dedda54358fac6c41d2b6','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-02 15:11:36','2010-07-02 15:11:36'),(220,'25d9bbf46e2d46a4b7f45986831e73ca','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-02 18:24:26','2010-07-02 18:24:26'),(221,'58af516b48b262dfc4cf9331f0e6b8bb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-02 19:22:15','2010-07-02 19:22:15'),(222,'fb497eb062fe1ee9fa4b7fe69d39d31d','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-03 19:38:04','2010-07-03 19:38:04'),(223,'56c1c3729d615e09cc888bdc67b43344','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-04 23:39:01','2010-07-04 23:39:01'),(224,'5da689de181c68394a47dc5c1648a051','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-05 13:33:44','2010-07-05 13:33:44'),(225,'765b97e49ff4783e4540a89f1472c957','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-05 17:58:12','2010-07-05 17:58:12'),(226,'4a07dace4058b752cb2be1e1ce125476','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-06 02:12:20','2010-07-06 02:12:20'),(227,'133f99b7ecff14c09e9dc2ee2047bac2','BAh7CDoKcHBhZ2UiDy91c2VyL3Nob3ciCmZsYXNoSUM6J0FjdGlvbkNvbnRy\nb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6DXByZXZwYWdl\nIgYv\n','2010-07-06 10:59:20','2010-07-06 11:00:12'),(228,'c1c9769f0bb1b9869075faa0cb469a14','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-06 15:51:16','2010-07-06 15:51:16'),(229,'1ab2bc5f0335d556b03d4033a8772474','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-06 21:49:58','2010-07-06 21:49:58'),(230,'4e29cbe69c7704ec5f245042460d8eb8','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-07 13:33:06','2010-07-07 13:33:06'),(231,'8b8a4676cbb8f692fe416979d8c08d31','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-08 10:27:13','2010-07-08 10:27:13'),(232,'f4f5cc3180e1643e274e1a7e02070af9','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-08 10:27:14','2010-07-08 10:27:14'),(233,'b732086f2f4e2c3cb0236a3cc8eb0e93','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsABjoKQHVzZWR7ADoNcHJldnBhZ2UiBi8=\n','2010-07-08 10:43:45','2010-07-08 11:01:19'),(234,'574168ac10e9e8eaa367d6df8dc033db','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-07-08 11:04:08','2010-07-08 11:11:26'),(235,'a459a9a587ac35d64ff40005b43e71b1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-08 20:37:09','2010-07-08 20:37:09'),(236,'c1b7f78055da479415c85d31e59b8792','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-08 21:59:01','2010-07-08 21:59:01'),(237,'135e6369f3b0750dd851808e2b7f4a84','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-08 22:49:24','2010-07-08 22:50:22'),(238,'3c3fcf0894708a6fb54e3a7ec3dbf6a8','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-09 11:12:50','2010-07-09 11:12:50'),(239,'09942dc50fa6c2dbcdbeb262861a8ce1','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-09 21:04:53','2010-07-09 21:04:53'),(240,'368a416a8f44886c2f925f3e5b681173','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Og1wcmV2cGFnZSIGLyIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9nb3dhbm8hBjoK\nQHVzZWR7BjsHVA==\n','2010-07-09 22:01:02','2010-07-09 22:01:45'),(241,'655ea867e03111311262df9e81c2e6af','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-11 10:24:01','2010-07-11 10:24:01'),(242,'385051c909b18360fe97f9f50cea40ef','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-11 13:00:59','2010-07-11 13:00:59'),(243,'f3eb3b6ec1ca260d7a3abf176d67bd96','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-11 13:00:59','2010-07-11 13:00:59'),(244,'7ca1fe08d1fba107e093a48640d85411','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-12 12:47:31','2010-07-12 12:47:31'),(245,'0cb1d58557fce5464e0bbaaf50ff848e','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-12 17:28:05','2010-07-12 17:28:05'),(246,'8a60d2a15bf57e742d0d01cd25ce3f3d','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-12 23:00:22','2010-07-12 23:34:00'),(247,'7272b507aec84bbf6b7e900819a40e33','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-12 23:01:15','2010-07-12 23:01:15'),(248,'3c221cb142a9c82f45b76a530af1007b','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgDRkYTU3NzFlNGM2ZGEwYzRiY2My\nNWEyYzA1ZWJiZTBhY2Q5MWRkMWIzZDNlNjZlNDkzMzI2ZTFkYTBhZTkwZDVh\nZTRiNDAxMTYyNDI5MTliY2VjNTk2ZThjZWY1ODBlYzgwYWFiZDU5NzdjMTVi\nNWM2Y2M4MTUwYzFlYzk1MzRjOg1wcmV2cGFnZSIPL3VzZXIvc2hvdyIYdXNl\ncl9jcmVkZW50aWFsc19pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-07-13 00:06:30','2010-07-13 00:07:25'),(249,'84306a3d181a807c0a6a210f909fe022','BAh7ByIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNo\nSGFzaHsGOgtub3RpY2UiGlBvcHJhd25pZSB3eWxvZ293YW5vIQY6CkB1c2Vk\newY7BlQ6DXByZXZwYWdlIgYv\n','2010-07-13 09:27:30','2010-07-13 09:51:07'),(250,'0749f725c3157b90ad0b9d53c2fee53d','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6\nCkB1c2VkewA6DXByZXZwYWdlIhIvdmlkZW8vaWRmaW5k\n','2010-07-13 12:23:34','2010-07-13 12:30:24'),(251,'3934327adb6b9154343ba312f0c9137f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-13 22:06:47','2010-07-13 22:06:47'),(252,'8da417fb3e40facc4d6447df285861cb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-14 00:03:09','2010-07-14 00:03:09'),(253,'eb6ca9dabae06f30e1f02e5f6792c9b6','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-14 15:53:22','2010-07-14 15:53:22'),(254,'211bb4254c73449b8ba1e895be59cbe0','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVy\nOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9n\nb3dhbm8hBjoKQHVzZWR7BjsGVCIYdXNlcl9jcmVkZW50aWFsc19pZGkHOg1w\ncmV2cGFnZSIGLw==\n','2010-07-14 23:46:41','2010-07-14 23:47:04'),(255,'64259acd84537da492b3426ae0ec13d0','BAh7CDoKcHBhZ2UiES9mb3J1bS9sb2dpbjoNcHJldnBhZ2UiBi8iCmZsYXNo\nSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1\nc2VkewA=\n','2010-07-15 19:09:26','2010-07-15 19:10:49'),(256,'78e1bb902b0aee7fcdde67b2a81646f4','BAh7CSIVdXNlcl9jcmVkZW50aWFscyIBgGU0MWI4ODUxODU5NDg3YTNhMmRj\nN2Q2ZjNjNjAyY2U4OGY2MGQxNjcyOWE3MTU0NGNiMjczNTNkNWVjODQzYmFi\nODBhNTUzNDgxODNhYjBiMjIwYjQ3YTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZi\nMmY3ODA2YzExNGY5M2JlMWI1Ihh1c2VyX2NyZWRlbnRpYWxzX2lkaQciCmZs\nYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoL\nbm90aWNlIhpQb3ByYXduaWUgemFsb2dvd2FubyEGOgpAdXNlZHsGOwZGOg1w\ncmV2cGFnZSIaL3VzZXJfc2Vzc2lvbnMvY3JlYXRl\n','2010-07-15 22:03:06','2010-07-15 22:16:09'),(257,'890994aefa25b6f22bc4bc539d129219','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-16 18:45:00','2010-07-16 18:53:20'),(258,'50845376af264674f14bfc847c8a3597','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-18 11:04:18','2010-07-18 11:04:18'),(259,'294cd21e4d0032c42410e959f1fd98df','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-19 13:49:04','2010-07-19 13:49:04'),(260,'8a3505b86ee86dbf53d9d145db5f7eb4','BAh7CDoKcHBhZ2UiEi91c2VyL215dGVhbXMiCmZsYXNoSUM6J0FjdGlvbkNv\nbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoKZXJyb3IiNkRvc3TEmXAg\nZG8gdGVqIGN6xJnFm2NpIHN0cm9ueSB3eW1hZ2EgemFsb2dvd2FuaWEGOgpA\ndXNlZHsGOwdUOg1wcmV2cGFnZSIQL3VzZXIvbG9naW4=\n','2010-07-19 16:11:49','2010-07-19 16:13:40'),(261,'c4cf4b2f7a1a98e74da1c357d095588b','BAh7CDoKcHBhZ2UiES91c2VyL3Nob3cvOCIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7ADoNcHJldnBh\nZ2UiEi92aWRlby9zaG93LzY=\n','2010-07-19 16:27:22','2010-07-19 17:05:14'),(262,'8927da7f7a5365dd80581297bfba758a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-21 16:29:45','2010-07-21 16:29:45'),(263,'553218a99ab545fba5388a9fc47678dd','BAh7CToNcHJldnBhZ2UiBi8iFXVzZXJfY3JlZGVudGlhbHMiAYA0MzdjZGNm\nZGVkNDYxMDA3MDY2OTgzMDdiOTBhOWFhZDc0MTdmZDFiZDM1ZWM1M2M1YWQz\nNzllNGI4NWVmZDQ2ZDE0ZTI5YzkwZDQ0MmU2NWFlMWZmOTkxZjUzYTJjZjkw\nZTdkMDg4ZGU5ZGZlYzQwZWQzZjA1NjQyMzk2ZGQzZCIYdXNlcl9jcmVkZW50\naWFsc19pZGkGIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewY6C25vdGljZSIfSGFzxYJvIHpvc3RhxYJvIHptaWVuaW9u\nZSEGOgpAdXNlZHsGOwdU\n','2010-07-21 16:29:46','2010-07-21 20:52:16'),(264,'9a33f4182ef3d12534a1b08a839a375c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-21 17:54:28','2010-07-21 17:54:28'),(265,'82d062dc23148323ec5dfeb7c30ef018','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-21 20:03:25','2010-07-21 20:03:25'),(266,'92fdf8f4a2895c04f7666b646356d609','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-21 20:07:23','2010-07-21 22:30:48'),(267,'e295290b209769ac8606e1d188c63bd2','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-22 16:27:19','2010-07-22 16:30:41'),(268,'1757e760b95e9299dbdd97295e301609','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-22 21:53:21','2010-07-22 21:53:21'),(269,'d071f63be7aa201749d7f69c63ce69aa','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-22 22:51:32','2010-07-22 22:51:32'),(270,'bdd754e01f7d1f8b6d8bac1941408e07','BAh7CToNcHJldnBhZ2UiDy91c2VyL3Nob3ciFXVzZXJfY3JlZGVudGlhbHMi\nAYA0MzdjZGNmZGVkNDYxMDA3MDY2OTgzMDdiOTBhOWFhZDc0MTdmZDFiZDM1\nZWM1M2M1YWQzNzllNGI4NWVmZDQ2ZDE0ZTI5YzkwZDQ0MmU2NWFlMWZmOTkx\nZjUzYTJjZjkwZTdkMDg4ZGU5ZGZlYzQwZWQzZjA1NjQyMzk2ZGQzZCIKZmxh\nc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoK\nQHVzZWR7ACIYdXNlcl9jcmVkZW50aWFsc19pZGkG\n','2010-07-22 23:22:47','2010-07-22 23:27:52'),(271,'bdfd1611cf28602c2347b76c3324bd78','BAh7BzoNcHJldnBhZ2UiES91c2VyL3Vsb2dpbiIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgplcnJvciIrTmllcHJh\nd2lkxYJvd2UgZGFuZSwgc3Byw7NidWogcG9ub3duaWUGOgpAdXNlZHsGOwdU\n','2010-07-23 00:33:47','2010-07-23 00:35:10'),(272,'25784fc475369b901d554a75c75d2a1d','BAh7CDoNcHJldnBhZ2UiJS91c2VyL2ZpbmQvbWF6b3dpZWNraWU/Ynk9cmVn\naW9uIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewAGOgpAdXNlZHsAOgpwcGFnZSIPL3VzZXIvc2hvdw==\n','2010-07-23 10:40:52','2010-07-23 10:51:33'),(273,'04b066751c0e2503b72330b2dc5d057b','BAh7BjoNcHJldnBhZ2UiJS91c2VyL2ZpbmQvbWF6b3dpZWNraWU/Ynk9cmVn\naW9u\n','2010-07-23 10:57:12','2010-07-23 10:57:12'),(274,'b49d249e858b7fc965bf046ffc64ad14','BAh7CToNcHJldnBhZ2UiBi86E3NpbXBsZV9jYXB0Y2hhIi1iZWY4OTAwM2Rk\nZjg1NGMyYmIzNjE1ZjNlYjczNGJkYmJmNWU5MmI2IgpmbGFzaElDOidBY3Rp\nb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSJNV3lz\nxYJhbGnFm215IHfFgmHFm25pZSBkbyBDaWViaWUgZW1haWwsIHBvc3TEmXB1\naiB6Z29kbmllIHogaW5zdHJ1a2NqYW1pBjoKQHVzZWR7BjsIVDoKcHBhZ2Ui\nEi9waG90by9zaG93Lzk=\n','2010-07-25 22:05:10','2010-07-25 22:08:44'),(275,'4ac540bc1ca7ab892376ca006ec39085','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-25 22:16:57','2010-07-25 22:18:09'),(276,'6c891dfc8a42415203fbf85fe9d7dc08','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-26 19:09:38','2010-07-26 19:09:38'),(277,'b376c41956110e423eb0040b290cfbce','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-28 08:48:10','2010-07-28 08:48:10'),(278,'48fe90dff7818b83d05351af4bdf4741','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-28 14:14:05','2010-07-28 14:14:05'),(279,'71816e37a95e11d6055c2f8d991425c9','BAh7CToNcHJldnBhZ2UiBi8iFXVzZXJfY3JlZGVudGlhbHMiAYBlNDFiODg1\nMTg1OTQ4N2EzYTJkYzdkNmYzYzYwMmNlODhmNjBkMTY3MjlhNzE1NDRjYjI3\nMzUzZDVlYzg0M2JhYjgwYTU1MzQ4MTgzYWIwYjIyMGI0N2E0OGU0OWZiMmE4\nYjgzY2E4ODNmMWI2YjJmNzgwNmMxMTRmOTNiZTFiNSIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-07-29 12:55:40','2010-07-29 13:01:22'),(280,'a2f2baa9606e249903b9e86d941a41d9','BAh7CDoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6CnBwYWdlIhIvcGhvdG8v\nc2hvdy8y\n','2010-07-30 00:15:11','2010-07-30 00:17:35'),(281,'9e27a4e75bca239aa4cf1d45301d46fb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-30 00:16:39','2010-07-30 00:16:39'),(282,'65b7ba08ee0787694659ad80dcaedb5f','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-30 19:50:44','2010-07-30 19:50:44'),(283,'c15a6373c58db3d60f6ff6cdc6f9fa6b','BAh7CDoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA6CnBwYWdlIhgvdXNlci9m\ncmllbmRzX2luZGV4\n','2010-07-30 20:58:59','2010-07-30 20:59:37'),(284,'ebc295d10bfb1d6083d6998fadeb8ab9','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-07-30 21:46:53','2010-07-30 22:59:33'),(285,'95e269882e6e759e3b2493dc4ee5320a','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-31 09:43:28','2010-07-31 09:43:28'),(286,'36585d2e6ce0111647d3ea439f26d994','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-07-31 23:47:14','2010-07-31 23:47:14'),(287,'fc1b21c1a4ca7eeed4721158626c6c7a','BAh7CToNcHJldnBhZ2UiFi9tZXNzYWdlL3JlY2VpdmVkIhV1c2VyX2NyZWRl\nbnRpYWxzIgGAZTQxYjg4NTE4NTk0ODdhM2EyZGM3ZDZmM2M2MDJjZTg4ZjYw\nZDE2NzI5YTcxNTQ0Y2IyNzM1M2Q1ZWM4NDNiYWI4MGE1NTM0ODE4M2FiMGIy\nMjBiNDdhNDhlNDlmYjJhOGI4M2NhODgzZjFiNmIyZjc4MDZjMTE0ZjkzYmUx\nYjUiGHVzZXJfY3JlZGVudGlhbHNfaWRpByIKZmxhc2hJQzonQWN0aW9uQ29u\ndHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoKQHVzZWR7AA==\n','2010-08-02 14:00:01','2010-08-02 15:08:20'),(288,'c8850d27d248c1b0c42b30212bb3d8f4','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-08-02 21:13:26','2010-08-02 21:14:56'),(289,'b968485004e50b324149eb1f9db30a65','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-03 14:04:38','2010-08-03 14:04:38'),(290,'2f1baf80a1773f6d22a6b8639e241910','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-03 23:36:28','2010-08-03 23:36:28'),(291,'6b58cdf4e0b761e805e2057d3ea5de13','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-05 10:53:40','2010-08-05 10:53:40'),(292,'0cec026e32c07bd7cfc99a9a16296403','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-08-05 14:09:29','2010-08-05 14:12:34'),(293,'ac652fdcebdf66e2ebd2338e9e06a6a8','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-06 00:10:41','2010-08-06 00:10:41'),(294,'7e1f13b126b4b41bc70ed532e2f20749','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-08-24 23:19:26','2010-08-24 23:21:15'),(295,'18140045e9069ef85aa99c52ba1d59c9','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-24 23:49:05','2010-08-24 23:49:05'),(296,'cfea710618860d75660bcf64f9ea7e05','BAh7CToNcHJldnBhZ2UiGi91c2VyX3Nlc3Npb25zL2NyZWF0ZToTc2ltcGxl\nX2NhcHRjaGEiLWY2NWU0YjZkZTRkZmYxOGNhMmMwMzkzNjI3MGViMDNjZjk0\nYzRkMWMiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFz\naEhhc2h7BjoKZXJyb3IiK05pZXByYXdpZMWCb3dlIGRhbmUsIHNwcsOzYnVq\nIHBvbm93bmllBjoKQHVzZWR7BjsIRjoKcHBhZ2UiDy9ldmVudC9uZXc=\n','2010-08-25 13:33:59','2010-08-25 13:58:56'),(297,'0975cf66f1a92fa423a124160304faca','BAh7BzoNcHJldnBhZ2UiBi8iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6\nOkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIhpQb3ByYXduaWUgd3lsb2dv\nd2FubyEGOgpAdXNlZHsGOwdU\n','2010-08-25 22:41:55','2010-08-25 22:45:18'),(298,'640f90c9965aab0629be5a1ed75f8927','BAh7CToNcHJldnBhZ2UiES9mb3J1bS9sb2dpbiIVdXNlcl9jcmVkZW50aWFs\ncyIBgGU0MWI4ODUxODU5NDg3YTNhMmRjN2Q2ZjNjNjAyY2U4OGY2MGQxNjcy\nOWE3MTU0NGNiMjczNTNkNWVjODQzYmFiODBhNTUzNDgxODNhYjBiMjIwYjQ3\nYTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZiMmY3ODA2YzExNGY5M2JlMWI1Igpm\nbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAG\nOgpAdXNlZHsAIhh1c2VyX2NyZWRlbnRpYWxzX2lkaQc=\n','2010-08-25 22:42:05','2010-08-25 23:49:20'),(299,'f1947297571e5790e0559fe5024ad4a1','BAh7CToNcHJldnBhZ2UiBi8iFXVzZXJfY3JlZGVudGlhbHMiAYBlNDFiODg1\nMTg1OTQ4N2EzYTJkYzdkNmYzYzYwMmNlODhmNjBkMTY3MjlhNzE1NDRjYjI3\nMzUzZDVlYzg0M2JhYjgwYTU1MzQ4MTgzYWIwYjIyMGI0N2E0OGU0OWZiMmE4\nYjgzY2E4ODNmMWI2YjJmNzgwNmMxMTRmOTNiZTFiNSIYdXNlcl9jcmVkZW50\naWFsc19pZGkHIgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6\nRmxhc2hIYXNoewY6C25vdGljZSIaUG9wcmF3bmllIHphbG9nb3dhbm8hBjoK\nQHVzZWR7BjsHVA==\n','2010-08-25 22:45:32','2010-08-25 22:47:38'),(300,'45a20ee37779ba2344780ed6eb6d80bf','BAh7CToNcHJldnBhZ2UiDy9zaXRlL2hlbHAiFXVzZXJfY3JlZGVudGlhbHMi\nAYBlNDFiODg1MTg1OTQ4N2EzYTJkYzdkNmYzYzYwMmNlODhmNjBkMTY3Mjlh\nNzE1NDRjYjI3MzUzZDVlYzg0M2JhYjgwYTU1MzQ4MTgzYWIwYjIyMGI0N2E0\nOGU0OWZiMmE4YjgzY2E4ODNmMWI2YjJmNzgwNmMxMTRmOTNiZTFiNSIKZmxh\nc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsABjoK\nQHVzZWR7ACIYdXNlcl9jcmVkZW50aWFsc19pZGkH\n','2010-08-25 23:14:50','2010-08-25 23:53:25'),(301,'66376e8732ff2fd97501d6dde85eefdb','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-25 23:28:49','2010-08-25 23:28:49'),(302,'8081bc69b95606904619926f39d5069a','BAh7CToNcHJldnBhZ2UiEi9ldmVudC9zaG93LzMiFXVzZXJfY3JlZGVudGlh\nbHMiAYBlNDFiODg1MTg1OTQ4N2EzYTJkYzdkNmYzYzYwMmNlODhmNjBkMTY3\nMjlhNzE1NDRjYjI3MzUzZDVlYzg0M2JhYjgwYTU1MzQ4MTgzYWIwYjIyMGI0\nN2E0OGU0OWZiMmE4YjgzY2E4ODNmMWI2YjJmNzgwNmMxMTRmOTNiZTFiNSIK\nZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsA\nBjoKQHVzZWR7ACIYdXNlcl9jcmVkZW50aWFsc19pZGkH\n','2010-08-25 23:29:13','2010-08-25 23:51:44'),(303,'9d4aa4efe1102267990b137f8aa22454','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-26 01:18:54','2010-08-26 01:18:54'),(304,'a8ea87522313fc69a16ac4943d0ca56b','BAh7CjoNcHJldnBhZ2UiES9mb3J1bS9sb2dpbiIVdXNlcl9jcmVkZW50aWFs\ncyIBgGU0MWI4ODUxODU5NDg3YTNhMmRjN2Q2ZjNjNjAyY2U4OGY2MGQxNjcy\nOWE3MTU0NGNiMjczNTNkNWVjODQzYmFiODBhNTUzNDgxODNhYjBiMjIwYjQ3\nYTQ4ZTQ5ZmIyYThiODNjYTg4M2YxYjZiMmY3ODA2YzExNGY5M2JlMWI1OhNz\naW1wbGVfY2FwdGNoYSItZTVkMjc2NWM2MDg1ODVmOGJhNmQxYzdlM2FhOGE2\nZjhiZmM3MWUxYSIYdXNlcl9jcmVkZW50aWFsc19pZGkHIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAGOgpAdXNlZHsA\n','2010-08-26 11:54:31','2010-08-26 12:03:08'),(305,'d8d72b2826e2fe2c0c7224d94670491c','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-26 16:02:24','2010-08-26 16:02:24'),(306,'eb9a9d739a717af89290d4d5a8eca2db','BAh7BjoNcHJldnBhZ2UiBi8=\n','2010-08-26 20:59:10','2010-08-26 20:59:10');
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
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
INSERT INTO `simple_captcha_data` VALUES (1,'e5d2765c608585f8ba6d1c7e3aa8a6f8bfc71e1a','JVWBKY','2010-08-26 12:01:07','2010-08-26 12:01:07');
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_teams_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'GRUPA ozgood\'a','Grupa skupiajÄ…ca w sobie miÅ‚oÅ›nikÃ³w jazdy quadowej z okolic Krakowa...:-)','2010-03-28 15:34:31','2010-03-28 15:34:31'),(2,'dgfd','dfd','2010-07-21 16:30:28','2010-07-21 16:30:28'),(3,'testowa ','testowa\r\n','2010-08-25 22:55:17','2010-08-25 22:55:17');
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
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamusers`
--

LOCK TABLES `teamusers` WRITE;
/*!40000 ALTER TABLE `teamusers` DISABLE KEYS */;
INSERT INTO `teamusers` VALUES (1,2,1,'owner','2010-03-28 15:34:31','2010-03-28 15:34:31'),(2,2,NULL,'owner','2010-05-22 17:21:35','2010-05-22 17:21:35'),(3,1,2,'owner','2010-07-21 16:30:28','2010-07-21 16:30:28'),(4,2,3,'owner','2010-08-25 22:55:17','2010-08-25 22:55:17');
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
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (1,1,'Kto chÄ™tny...?','2010-03-28 15:35:05','2010-08-25 22:55:50');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci,
  `sex` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'telpeloth','telpeloth@gmail.com',NULL,NULL,'','',NULL,NULL,NULL,'2010-03-17 17:38:01','2010-07-22 23:27:52',NULL,1,NULL,NULL,'454c0074deaaa6ac580d1e212ab70b2682b1449f83b897175131dd5e928bee7caee0fd3629d6c2f82c722e13ac2e1830eeeac08be20dd9647f81999fd83f4cdf','437cdcfded46100706698307b90a9aad7417fd1bd35ec53c5ad379e4b85efd46d14e29c90d442e65ae1ff991f53a2cf90e7d088de9dfec40ed3f05642396dd3d','KZPuqsZq11KHXxmNwsWE',23,0,'2010-07-22 23:27:52','2010-07-22 23:27:49','2010-07-21 20:52:15','213.134.188.60','213.134.188.60',1),(2,'ozgood','ozgood@o2.pl','--','--','KrakÃ³w','maÅ‚opolskie','','','','2010-03-17 22:29:13','2010-08-26 12:03:08','1976-04-28',5,'PoczÄ…tkujÄ…cy kierowca...:-)','m','0e6211409ecf0a1b53fc5451bc48c5ac977463110f236575b08247ded8c19dff8574fdf5a9ce2d2af3ba81492caa4c7618e3c479a21c2aa0104d1d027efca2f2','e41b8851859487a3a2dc7d6f3c602ce88f60d16729a71544cb27353d5ec843bab80a55348183ab0b220b47a48e49fb2a8b83ca883f1b6b2f7806c114f93be1b5','l61XbOreLgCSe6pivntP',91,0,'2010-08-26 12:03:08','2010-08-26 12:01:35','2010-08-25 23:29:46','81.219.227.202','77.236.0.4',1),(3,'kuba','jakub.barc@gmail.com',NULL,NULL,'','',NULL,NULL,NULL,'2010-03-24 23:21:24','2010-03-24 23:30:16',NULL,NULL,NULL,NULL,'454c0074deaaa6ac580d1e212ab70b2682b1449f83b897175131dd5e928bee7caee0fd3629d6c2f82c722e13ac2e1830eeeac08be20dd9647f81999fd83f4cdf','f7e580a65a4d7d934f1fd82dba51efbfd1c08dd865a518f036bf03562997544cc51c91131104eb8668914e9113349540e891303d55a323e69cc3e542d1e48ef4','gL4yXWNNRvghL11i0P18',0,0,NULL,NULL,NULL,NULL,NULL,1),(4,'quado1','quado1@o2.pl','','','Nowy SÄ…cz','maÅ‚opolskie','','','','2010-03-28 15:37:18','2010-08-25 22:47:24',NULL,9,'','k','820c703190b2c998771109d2187e352f5f2b0d605027876d8929ce3d292e5f7eca6f7953d2bc1518517498bf3389e2f07220a1cd876a2d6fc4b74c5bdf250254','9fc74fdaf660c602e8810c3caaed68e73162133f665fe5fc3e33623a1e8d171fda47a2b47cc6177b027d0445c1d8625041debcec203009dee7f8d0ea20b4f375','kvGriujah4YvoCNaZpjb',14,0,'2010-08-25 22:47:24','2010-08-25 22:44:36','2010-08-24 23:20:27','89.72.36.158','77.236.0.25',1),(5,'underdesign','agencjaunderdesign@gmail.com',NULL,NULL,'KrakÃ³w','maÅ‚opolskie',NULL,NULL,NULL,'2010-03-29 14:43:54','2010-03-29 14:43:54',NULL,NULL,NULL,NULL,'d731f823a3e787855ba2492c856bffaf51463a847537c308ba480513a36e1556bfe39f40e41eb4160d1a3df7e8f57d509a5a6e872bb18d2458d5f71a550d9513','5bc3299f9d7b12c197d1a189098ab6fc058e7175c40890f800d73b78f840f44ecb64fb0a3bef168f1c9fa2b755a5c552fc146e9ab7dcbf4aef2ac5e730a9a026','pdg97TnOsSm8f7CJXnM1',0,0,NULL,NULL,NULL,NULL,NULL,0),(6,'hosemariojaro','mjarosz@e-finansowanie.pl',NULL,NULL,'krakÃ³w','maÅ‚opolskie',NULL,NULL,NULL,'2010-04-28 00:21:29','2010-04-28 00:21:29',NULL,NULL,NULL,NULL,'21b825aa19305ecbc0de0de70131fd1e664de5c0f09d3e13b8c21dd63eaccaf9f2cb07e71eea8d2d1ac9416f77767c4927df5ebf601285c3959b5bdaaa2da7ba','f41ec7f4efcdf41a730fd7eae141a9a90b7ddb925a5ea6908ea9cd3ccee2bc75f5c34a4b1d66ac6891ea28ea60bc7b1f24f1ecc2f9c7fa4998bfe3dc8067a609','dF-Yw5NR8ea-ELEy03la',0,0,NULL,NULL,NULL,NULL,NULL,0),(7,'budyn','sebastian.nalepa@yahoo.com',NULL,NULL,'DÄ™bica','podkarpackie',NULL,NULL,NULL,'2010-05-07 21:41:06','2010-05-07 21:41:06',NULL,NULL,NULL,NULL,'c9b1a92894056a8656601ac6dc758528848bdfc4de56a7a8e5ea4340502d13ce41537898c323377aa4d742c4ec888a617d5617e1de232612576b43b6882561cd','87ceb1d4b4899097e5f4cd882cc72cd3e25333ec67f323161e88a50b5c56b22733e5a20563e6690e24aa05c34701edd549f76cad437b62e7cb839544a87162d9','_6D8T9YNna_QgJqROCcw',0,0,NULL,NULL,NULL,NULL,NULL,0),(8,'michalr','karmadstudio@gmail.com',NULL,NULL,'KrakÃ³w','maÅ‚opolskie',NULL,NULL,NULL,'2010-05-20 12:53:04','2010-05-20 12:53:04',NULL,NULL,NULL,NULL,'735b9c01f418da2f2a8f406829c19dbab309f776cf334e39a596799354ab36f0890587934e5ae3ffa06d6111e69c7ecc7b0dd4ad5dfb26aa3e4b25e7254971d8','5d8bcbd873f631828dbb0ed09e7a94d12aaf5fe66c61ca99679c613dd0dacef831e1c8b9345cc825c7ee9fb347c3cc78fcd79a7234304a9124fcc3cb4d3f8d6f','k-R7QgH4guNz9K47Vhw6',0,0,NULL,NULL,NULL,NULL,NULL,0),(9,'damian','dmarciniec@gmail.com',NULL,NULL,'Wieliczka','maÅ‚opolskie',NULL,NULL,NULL,'2010-08-25 13:45:49','2010-08-25 13:52:10',NULL,NULL,NULL,NULL,'4ed60c8dfbe3e425c6587f246fec3bc66475973dbb375d42b8069e86c39d8cca2c267aa6266f57252d0653d46bda42f9345af81fe2dd1791878737696925ed99','427a4e171feda1c5ed415179bd4ec7c913df31bee7a5006be8512c0dcef94b239a53eba81b736a68260523dc343d7936b3965688234fab393251d084126f89d1','5y4fAiH6HuV3vzS2fDxC',0,0,NULL,NULL,NULL,NULL,NULL,0),(10,'damian1','damian.marciniec@gmail.com',NULL,NULL,'wieliczka','maÅ‚opolskie',NULL,NULL,NULL,'2010-08-25 13:55:54','2010-08-25 13:55:54',NULL,NULL,NULL,NULL,'b0f7770363bcc6617cb24fed6f30cf937ac3e0f3362b3d55330aca3635912a876b7f3a00dbe58d8823c56462724ccde4b27690b3dd7db6f415243f1a3d30223b','c863367b607ba8f469fb9a05bbece4bf6d31a9e3e8b3d9817794945421f02bb46f760de64eb42552c2e02aa20f50ad41f9556b87d4c7ba37fbeea32a4209f9ee','hdrlmnoGKAAUSELs8wRB',0,0,NULL,NULL,NULL,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservrates`
--

LOCK TABLES `uservrates` WRITE;
/*!40000 ALTER TABLE `uservrates` DISABLE KEYS */;
INSERT INTO `uservrates` VALUES (1,1,9,'2010-03-24 23:20:36','2010-03-24 23:20:36'),(2,4,10,'2010-03-28 15:30:40','2010-03-28 15:30:40'),(3,4,10,'2010-03-28 15:30:50','2010-03-28 15:30:50'),(4,4,10,'2010-03-28 15:30:58','2010-03-28 15:30:58'),(5,4,10,'2010-03-28 15:31:38','2010-03-28 15:31:38'),(6,2,10,'2010-03-28 15:32:07','2010-03-28 15:32:07'),(7,2,12,'2010-08-25 23:24:16','2010-08-25 23:24:16');
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
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcomments`
--

LOCK TABLES `vcomments` WRITE;
/*!40000 ALTER TABLE `vcomments` DISABLE KEYS */;
INSERT INTO `vcomments` VALUES (1,4,2,'PiÄ™kna zima...:-)','2010-03-28 15:32:33','2010-03-28 15:32:33');
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
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,1,'data/1/1268844079338.flv','456456','2010-03-17 17:41:22','2010-07-23 10:51:01',0,4),(2,1,'data/1/1269468697743.flv','678','2010-03-24 23:11:39','2010-03-28 15:29:06',0,1),(3,1,'data/1/1269469189203.flv','547','2010-03-24 23:19:51','2010-03-24 23:19:51',0,0),(4,2,'data/2/1269782163922.flv','Maxxer zimÄ…...','2010-03-28 15:17:29','2010-07-16 18:47:49',0,8),(5,2,'data/2/1269782352395.flv','???','2010-03-28 15:19:15','2010-04-01 17:34:46',0,1),(6,4,'data/4/1271186615404.flv','JakiÅ› film','2010-04-13 21:23:51','2010-08-25 23:24:16',0,7),(7,1,'data/1/1272229509072.flv','678678','2010-04-25 23:05:14','2010-04-25 23:05:14',0,0),(8,1,'data/1/1272229952364.flv','hkhjk','2010-04-25 23:12:37','2010-08-25 23:24:54',0,6),(9,1,'data/1/1272230369005.flv','56757','2010-04-25 23:19:34','2010-04-25 23:19:34',0,0),(10,1,'data/1/1272399367803.flv','678678','2010-04-27 22:16:14','2010-08-25 23:25:12',0,1),(11,5,'data/2/1282770534961.flv','test','2010-08-25 23:09:00','2010-08-25 23:09:00',0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrates`
--

LOCK TABLES `vrates` WRITE;
/*!40000 ALTER TABLE `vrates` DISABLE KEYS */;
INSERT INTO `vrates` VALUES (1,1,0,0,'2010-03-17 17:41:19','2010-03-17 17:41:19'),(2,1,0,0,'2010-03-17 22:42:29','2010-03-17 22:42:29'),(3,1,0,0,'2010-03-17 22:47:06','2010-03-17 22:47:06'),(4,1,0,0,'2010-03-17 22:53:53','2010-03-17 22:53:53'),(5,1,0,0,'2010-03-18 23:10:07','2010-03-18 23:10:07'),(6,1,0,0,'2010-03-24 22:48:24','2010-03-24 22:48:24'),(7,1,0,0,'2010-03-24 23:08:16','2010-03-24 23:08:16'),(8,2,0,0,'2010-03-24 23:11:37','2010-03-24 23:11:39'),(9,3,4,1,'2010-03-24 23:19:49','2010-03-24 23:20:36'),(10,4,18,5,'2010-03-28 15:16:03','2010-03-28 15:32:07'),(11,5,0,0,'2010-03-28 15:19:12','2010-03-28 15:19:15'),(12,6,3,1,'2010-04-13 21:23:35','2010-08-25 23:24:16'),(13,7,0,0,'2010-04-25 23:05:08','2010-04-25 23:05:14'),(14,8,0,0,'2010-04-25 23:12:32','2010-04-25 23:12:37'),(15,9,0,0,'2010-04-25 23:19:28','2010-04-25 23:19:35'),(16,10,0,0,'2010-04-27 22:16:07','2010-04-27 22:16:14'),(17,11,0,0,'2010-07-21 22:17:54','2010-07-21 22:18:40'),(18,11,0,0,'2010-08-25 23:08:54','2010-08-25 23:09:00');
/*!40000 ALTER TABLE `vrates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-08-26 21:02:12
