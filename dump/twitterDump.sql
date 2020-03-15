-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: twitterDB
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `body` varchar(45) NOT NULL,
  `create_time` timestamp NOT NULL,
  `tweet_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_tweet_idx` (`tweet_id`),
  KEY `fk_comment_user_idx` (`user_id`),
  CONSTRAINT `fk_comment_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`tweet_id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Some comment w/o message','2020-02-29 05:22:16',3,2),(2,'It isRealy hot this winter, so spring is now','2020-03-08 03:16:22',3,1),(3,'This is realy bad','2020-03-14 03:16:22',4,1),(4,'comment fo tweet with bitcoin text','2020-03-01 03:16:22',1,6),(5,'Gretta should cry','2020-02-29 08:16:22',3,2),(6,'Turtles ninja are realy cool','2020-03-15 17:16:22',7,5);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `followed_by_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`followed_by_id`),
  KEY `fk_follower_user_idx` (`user_id`,`followed_by_id`),
  KEY `fk_follower_user_id` (`followed_by_id`,`user_id`) /*!80000 INVISIBLE */,
  KEY `fk_follower_user_idx1` (`followed_by_id`,`user_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_followed_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_followed_user2` FOREIGN KEY (`followed_by_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (2,1),(3,1),(4,1),(3,2),(5,2),(1,3),(4,3),(5,4),(6,4),(6,5);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `tweet_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `body` varchar(280) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tweet_id`),
  KEY `fk_tweet_user1_idx` (`user_id`),
  CONSTRAINT `fk_tweet_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (1,1,'Bitcoin is an open source censorship-resistant peer-to-peer immutable network. Digital gold. Don\'t trust; verify. Not your keys; not your coins.','2020-03-07 01:14:07'),(3,3,'Spring is coming!!!!!','2020-02-29 03:16:22'),(4,2,' write today in @theAtlantic\n about the absolute trauma coming ahead when the Supreme Court hears Trumpinyo demand to cover up his tax and bank records','2020-01-30 03:16:22'),(5,6,'Some text body for tweet','2019-12-31 22:00:22'),(6,4,'Bluebeard is a wealthy and powerful nobleman who has been married several times to beautiful women who have all mysteriously vanished. When Bluebeard visits his neighbor and asks to marry one of his daughters, the girls are terrified. ','2019-02-02 00:00:22'),(7,5,'Teenage Mutant Ninja Turtles (often shortened to TMNT or Ninja Turtles) are four fictional teenaged anthropomorphic turtles named after Italian Renaissance artists.','2018-03-11 05:00:22');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'shamd','1989-03-11'),(2,'DonnyTrump','1946-06-14'),(3,'someGuy','1994-02-12'),(4,'pepper','2000-04-15'),(5,'ninja','1996-01-01'),(6,'parmezan98','1980-09-01'),(7,'JohnDoe21','1988-03-03');
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

-- Dump completed on 2020-03-15 20:59:25
