-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `salary` float NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_fk_idx` (`id`),
  CONSTRAINT `id_fk` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$100000$FtQf3SfKTAHF$aOId9KrogKPv7TrRnLZYuIuB5lBhedWqms4dz/3gstk=','2018-05-21 12:52:33.516474',1,'admin','Zhongyu','Chen','zhongyuchen16@fudan.edu.cn',1,1,'2018-05-12 07:26:42.000000'),(3,'pbkdf2_sha256$100000$sKJ8OchfXdZU$hLSzFdBHQwb/2XrhaYMOKdi5eoQkOP4TCFecz4PuKlI=','2018-05-19 03:57:01.512819',0,'one','','','',0,1,'2018-05-16 08:14:22.398418'),(4,'pbkdf2_sha256$100000$0kCL07zvcnOY$mx1XSCh1meMKgnTcjdvSGD2bATyvlYdCsWs4OJtrgng=','2018-05-16 08:25:06.520246',0,'two','','','',0,1,'2018-05-16 08:25:06.311966'),(5,'pbkdf2_sha256$100000$7jWOenl7LBKa$2jGd6btvWRJgUjmwP33lT4T3GBwO1/d6F2UYqK4lhPk=','2018-05-16 13:41:47.098673',0,'three','','','',0,1,'2018-05-16 11:59:05.531362'),(6,'pbkdf2_sha256$100000$gXWWgGPY06Oc$PUc7WbvkwkRfeKxxzZsbiOHvj9miKrCwpn0/jeZPMJ0=','2018-05-21 11:58:48.883323',0,'admin0','','','',1,1,'2018-05-17 02:00:16.000000'),(7,'pbkdf2_sha256$100000$2tdGc0yurnOF$RTaobHpzbiL+/8NmhkIfJ8tyhK64pGYfrWLFlF7EBWc=','2018-05-21 12:38:10.793290',0,'four','','','',0,1,'2018-05-20 08:17:01.974142'),(8,'pbkdf2_sha256$100000$99mM6Nxt9cyD$0pG7loRv1bdfhhTaSuke9r0m4jVEauGd/pZOEuH7e4s=','2018-05-21 10:28:49.897412',0,'five','','','',0,1,'2018-05-21 10:28:49.609125');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `isbn` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `authors` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `isbn_fk_idx` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('1','T1','A1','McGraw-Hill',10),('11','T4','A4','Peking',20),('12','T4','A4','Peking',30),('13','T5','A5','Peking',40),('14','T6','A6','Fudan',50),('15','T7','A7','Fudan',60),('16','T8','A8','Fudan',70),('2','T1','A1','McGraw-Hill',20),('4','T2','A2','Tsinghua',40),('5','T3','A3','Tsinghua',50),('6','T3','A3','Tsinghua',60),('aafadf','adff','adsfa','adf',12.21),('isbn3','title3','author3','publisher3',123),('test1','title1','author1','publisher1',88);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmdb_userinfo`
--

DROP TABLE IF EXISTS `cmdb_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  `pos` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmdb_userinfo`
--

LOCK TABLES `cmdb_userinfo` WRITE;
/*!40000 ALTER TABLE `cmdb_userinfo` DISABLE KEYS */;
INSERT INTO `cmdb_userinfo` VALUES (1,'16307130194@fudan.edu.cn','123456',''),(2,'16307130194@fudan.edu.cn','12345',''),(3,'16307130194@fudan.edu.cn','123',''),(4,'16307130194@fudan.edu.cn','123456',''),(5,'16307130194@fudan.edu.cn','123456',''),(6,'16307130194@fudan.edu.cn','123456',''),(7,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(8,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(9,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(10,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(11,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(12,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(13,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(14,'zhongyuchen16@fudan.edu.cn','zhongyuchen',''),(15,'zhongyuchen16@fudan.edu.cn','zhongyuchen','');
/*!40000 ALTER TABLE `cmdb_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comno` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) NOT NULL,
  `text` varchar(140) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`comno`),
  KEY `isbn_fk_idx` (`isbn`),
  KEY `id_fk_idx` (`id`),
  CONSTRAINT `id_fk_com` FOREIGN KEY (`id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `isbn_fk` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (4,'1','Wonderful!',2),(6,'1','yeah',2),(7,'11','nice',2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-12 07:54:50.797606','1','admin',3,'',4,2),(2,'2018-05-15 03:59:22.238911','Zhangjiang Library','Libraries object (Zhangjiang Library)',1,'[{\"added\": {}}]',9,2),(3,'2018-05-15 04:00:02.015759','Liberal Arts Library','Libraries object (Liberal Arts Library)',1,'[{\"added\": {}}]',9,2),(4,'2018-05-15 04:00:37.287894','Science Library','Libraries object (Science Library)',1,'[{\"added\": {}}]',9,2),(5,'2018-05-15 04:01:15.975484','Lee Shau Kee Library','Libraries object (Lee Shau Kee Library)',1,'[{\"added\": {}}]',9,2),(6,'2018-05-16 17:44:53.622671','2','admin',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\", \"email\"]}}]',4,2),(7,'2018-05-17 02:00:16.921782','6','admin0',1,'[{\"added\": {}}]',4,2),(8,'2018-05-17 02:00:46.377078','6','admin0',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,2),(9,'2018-05-18 00:15:04.745072','1','Storages object (1)',1,'[{\"added\": {}}]',11,2),(10,'2018-05-18 00:15:13.512742','2','Storages object (2)',1,'[{\"added\": {}}]',11,2),(11,'2018-05-18 00:17:22.566439','3','Storages object (3)',1,'[{\"added\": {}}]',11,2),(12,'2018-05-18 00:17:49.544772','4','Storages object (4)',1,'[{\"added\": {}}]',11,2),(13,'2018-05-18 00:17:58.520137','5','Storages object (5)',1,'[{\"added\": {}}]',11,2),(14,'2018-05-18 00:18:10.320735','6','Storages object (6)',1,'[{\"added\": {}}]',11,2),(15,'2018-05-18 00:18:14.492682','7','Storages object (7)',1,'[{\"added\": {}}]',11,2),(16,'2018-05-18 00:18:17.684735','8','Storages object (8)',1,'[{\"added\": {}}]',11,2),(17,'2018-05-18 00:18:20.874855','9','Storages object (9)',1,'[{\"added\": {}}]',11,2),(18,'2018-05-18 00:18:24.378965','10','Storages object (10)',1,'[{\"added\": {}}]',11,2),(19,'2018-05-18 00:18:29.646677','11','Storages object (11)',1,'[{\"added\": {}}]',11,2),(20,'2018-05-18 00:18:33.536725','12','Storages object (12)',1,'[{\"added\": {}}]',11,2),(21,'2018-05-18 00:18:38.336957','13','Storages object (13)',1,'[{\"added\": {}}]',11,2),(22,'2018-05-18 00:18:44.008618','14','Storages object (14)',1,'[{\"added\": {}}]',11,2),(23,'2018-05-18 00:18:47.953793','15','Storages object (15)',1,'[{\"added\": {}}]',11,2),(24,'2018-05-18 00:18:52.312347','16','Storages object (16)',1,'[{\"added\": {}}]',11,2),(25,'2018-05-18 00:18:56.278693','17','Storages object (17)',1,'[{\"added\": {}}]',11,2),(26,'2018-05-18 00:23:17.298499','1','Loans object (1)',1,'[{\"added\": {}}]',12,2),(27,'2018-05-18 00:23:53.576547','2','Loans object (2)',1,'[{\"added\": {}}]',12,2),(28,'2018-05-18 01:25:33.117379','1','Comments object (1)',1,'[{\"added\": {}}]',13,2),(29,'2018-05-18 01:25:59.269380','2','Comments object (2)',1,'[{\"added\": {}}]',13,2),(30,'2018-05-18 04:30:31.551466','3','Comments object (3)',1,'[{\"added\": {}}]',13,2),(31,'2018-05-18 04:30:45.582888','4','Comments object (4)',1,'[{\"added\": {}}]',13,2),(32,'2018-05-19 03:35:43.212287','3','Loans object (3)',1,'[{\"added\": {}}]',12,2),(33,'2018-05-19 03:56:38.258905','4','Loans object (4)',1,'[{\"added\": {}}]',12,2),(34,'2018-05-19 14:57:38.818030','3','Loans object (3)',2,'[{\"changed\": {\"fields\": [\"stono\"]}}]',12,2),(35,'2018-05-20 14:52:08.709116','isbn2','Books object (isbn2)',3,'',8,2),(36,'2018-05-20 14:52:11.764267','isbn1','Books object (isbn1)',3,'',8,2),(37,'2018-05-20 16:24:25.904812','19','Storages object (19)',1,'[{\"added\": {}}]',11,2),(38,'2018-05-20 16:25:07.206835','20','Storages object (20)',1,'[{\"added\": {}}]',11,2),(39,'2018-05-20 16:31:18.405656','21','Storages object (21)',1,'[{\"added\": {}}]',11,2),(40,'2018-05-20 16:33:17.879750','22','Storages object (22)',1,'[{\"added\": {}}]',11,2),(41,'2018-05-20 17:00:50.489994','5','Comments object (5)',1,'[{\"added\": {}}]',13,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'cmdb','userinfo'),(5,'contenttypes','contenttype'),(10,'library','authuser'),(8,'library','books'),(13,'library','comments'),(9,'library','libraries'),(12,'library','loans'),(11,'library','storages'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-04 10:05:27.329842'),(2,'auth','0001_initial','2018-05-04 10:05:28.349474'),(3,'admin','0001_initial','2018-05-04 10:05:28.549756'),(4,'admin','0002_logentry_remove_auto_add','2018-05-04 10:05:28.565421'),(5,'contenttypes','0002_remove_content_type_name','2018-05-04 10:05:28.724657'),(6,'auth','0002_alter_permission_name_max_length','2018-05-04 10:05:28.750162'),(7,'auth','0003_alter_user_email_max_length','2018-05-04 10:05:28.782248'),(8,'auth','0004_alter_user_username_opts','2018-05-04 10:05:28.793994'),(9,'auth','0005_alter_user_last_login_null','2018-05-04 10:05:28.850520'),(10,'auth','0006_require_contenttypes_0002','2018-05-04 10:05:28.866089'),(11,'auth','0007_alter_validators_add_error_messages','2018-05-04 10:05:28.881717'),(12,'auth','0008_alter_user_username_max_length','2018-05-04 10:05:28.912970'),(13,'auth','0009_alter_user_last_name_max_length','2018-05-04 10:05:28.934617'),(14,'cmdb','0001_initial','2018-05-04 10:05:28.984438'),(15,'sessions','0001_initial','2018-05-04 10:05:29.034611');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('gt8yv9az78pggobhf155jibd8xpfzmw8','M2UyN2VjZGI5OTY3MTRiM2UxZDVmNDM1ZTE4MjQ0ZDNmNWFiMTU2NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOGE5OWE3YTEyZjdkNzczYzYzYzAzMDljOWQxOGRkM2RjZTY3NGMxIn0=','2018-06-04 12:52:33.522593');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `empno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Jones','CA',30),(2,'Alice','SJ',33),(3,'Bob','NY',29),(4,'Jack','CN',50),(5,'J','CN',40),(6,'Ja','SH',45);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libraries`
--

DROP TABLE IF EXISTS `libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libraries` (
  `lname` varchar(50) NOT NULL,
  `laddr` varchar(50) NOT NULL,
  `lno` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lno`),
  UNIQUE KEY `lname_UNIQUE` (`lname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libraries`
--

LOCK TABLES `libraries` WRITE;
/*!40000 ALTER TABLE `libraries` DISABLE KEYS */;
INSERT INTO `libraries` VALUES ('Lee Shau Kee Library','Jiangwan Branch',1),('Liberal Arts Library','Handan Branch',2),('Science Library','Handan Branch',3),('Zhangjiang Library','Zhangjiang Branch',4);
/*!40000 ALTER TABLE `libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loans` (
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `renewed` tinyint(1) NOT NULL DEFAULT '0',
  `stono` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `loanno` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`loanno`),
  KEY `id_fk_loan_idx` (`id`),
  KEY `stono_fk_loan_idx` (`stono`),
  CONSTRAINT `id_fk_loan` FOREIGN KEY (`id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stono_fk_loan` FOREIGN KEY (`stono`) REFERENCES `storages` (`stono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES ('2018-05-18','2018-06-18',0,4,2,'2018-05-20',2,1),('2018-05-18','2018-06-18',0,10,2,'2018-05-20',2,2),('2018-05-19','2018-06-19',0,17,3,'2018-05-21',2,4),('2018-05-20','2018-06-19',0,1,2,'2018-05-20',2,5),('2018-05-20','2018-06-19',0,3,2,'2018-05-20',2,6),('2018-05-20','2018-06-19',0,1,2,'2018-05-21',2,7),('2018-05-20','2018-06-19',0,4,2,'2018-05-21',2,8),('2018-05-20','2018-07-19',1,3,7,'2018-05-21',2,9),('2018-05-21','2018-07-20',1,3,2,'2018-05-21',2,10),('2018-05-21','2018-07-20',1,1,2,NULL,NULL,11),('2018-05-21','2018-06-20',0,3,2,NULL,NULL,12);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserves` (
  `lno` int(11) NOT NULL,
  `stono` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `reno` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`reno`),
  KEY `stono_fk_idx_re` (`stono`),
  KEY `id_fk_idx_re` (`id`),
  KEY `lno_fk_idx_re` (`lno`),
  KEY `admin_id_fk_idx` (`admin_id`),
  CONSTRAINT `admin_id_re` FOREIGN KEY (`id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_fk_re` FOREIGN KEY (`id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lno_fk_re` FOREIGN KEY (`lno`) REFERENCES `libraries` (`lno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stono_fk_re` FOREIGN KEY (`stono`) REFERENCES `storages` (`stono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (4,1,2,1,2),(2,1,2,2,2),(4,4,2,3,NULL),(4,5,2,4,2),(4,5,2,5,2),(2,5,2,6,2),(2,5,2,7,2),(2,5,2,8,2),(2,5,2,9,2),(2,5,2,10,2),(1,5,2,11,6),(1,5,6,12,6),(2,5,7,13,2);
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storages`
--

DROP TABLE IF EXISTS `storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storages` (
  `stono` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) NOT NULL,
  `lno` int(11) NOT NULL,
  PRIMARY KEY (`stono`),
  KEY `isbn_fk_idx` (`isbn`),
  KEY `lno_fk_idx` (`lno`),
  CONSTRAINT `isbn_fk_sto` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `lno_fk` FOREIGN KEY (`lno`) REFERENCES `libraries` (`lno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storages`
--

LOCK TABLES `storages` WRITE;
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
INSERT INTO `storages` VALUES (1,'1',2),(3,'1',1),(4,'1',3),(5,'11',2),(6,'12',4),(7,'13',3),(8,'14',2),(9,'15',3),(10,'16',1),(12,'2',3),(13,'2',3),(15,'4',4),(16,'5',2),(17,'6',1),(23,'test1',4),(24,'aafadf',1),(25,'isbn3',3);
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `join_date` date NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uname_fk_idx` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-05-21 21:24:36
