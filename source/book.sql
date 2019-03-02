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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (10,'pbkdf2_sha256$100000$GkqLZcuzDCZ7$7pVckgM1pY0vWM/MhIVjQQoe7IrpZvnqZb+Srima32M=','2019-03-02 03:53:04.837033',1,'admin000','Peter','Parker','',1,1,'2019-03-02 03:23:46.000000'),(11,'pbkdf2_sha256$100000$IVqiMpRFXEAX$+zJYp+l8JZntUe/2v4HJWPUpVIlwrj8/PaC1ECRcVYU=','2019-03-02 03:51:39.202250',0,'staff000','Mary','Jane','',1,1,'2019-03-02 03:35:39.000000'),(12,'pbkdf2_sha256$100000$SUM4xAVod9Fa$rtisf0UL/ARELwDCuztYK5S/11I+IA1Wwp29ntw0sCs=','2019-03-02 03:50:37.188844',0,'staff001','Gwen','Stacy','',1,1,'2019-03-02 03:36:13.000000'),(13,'pbkdf2_sha256$100000$jhcJlBvmLpyT$7Z25XGJqE74nJPi5zQjIXsC5uoOkXJkSck8xqwAPvNw=','2019-03-02 03:47:00.850755',0,'reader000','Bruce','Banner','',0,1,'2019-03-02 03:37:43.000000'),(14,'pbkdf2_sha256$100000$WAIUZzGGj0DA$JjawjH+pEWtKW40Nl84FCsVD8kwQ1d755OSWbUf8s6k=','2019-03-02 03:49:08.275089',0,'reader001','Steve','Rogers','',0,1,'2019-03-02 03:38:19.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (9,'12','What a great book!',10),(10,'1','It\'s nice!',13),(12,'1','Great!',11);
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (42,'2019-03-02 03:26:41.557140','14','Reserves object (14)',3,'',14,10),(43,'2019-03-02 03:26:41.565152','13','Reserves object (13)',3,'',14,10),(44,'2019-03-02 03:26:41.569157','12','Reserves object (12)',3,'',14,10),(45,'2019-03-02 03:26:41.573163','11','Reserves object (11)',3,'',14,10),(46,'2019-03-02 03:26:41.577169','10','Reserves object (10)',3,'',14,10),(47,'2019-03-02 03:26:41.581182','9','Reserves object (9)',3,'',14,10),(48,'2019-03-02 03:26:41.585179','8','Reserves object (8)',3,'',14,10),(49,'2019-03-02 03:26:41.589183','7','Reserves object (7)',3,'',14,10),(50,'2019-03-02 03:26:41.589183','6','Reserves object (6)',3,'',14,10),(51,'2019-03-02 03:26:41.593188','5','Reserves object (5)',3,'',14,10),(52,'2019-03-02 03:26:41.597194','4','Reserves object (4)',3,'',14,10),(53,'2019-03-02 03:26:41.597194','3','Reserves object (3)',3,'',14,10),(54,'2019-03-02 03:26:41.601202','2','Reserves object (2)',3,'',14,10),(55,'2019-03-02 03:26:41.605240','1','Reserves object (1)',3,'',14,10),(56,'2019-03-02 03:26:58.890990','12','Loans object (12)',3,'',12,10),(57,'2019-03-02 03:26:58.903019','11','Loans object (11)',3,'',12,10),(58,'2019-03-02 03:26:58.907319','10','Loans object (10)',3,'',12,10),(59,'2019-03-02 03:26:58.915045','9','Loans object (9)',3,'',12,10),(60,'2019-03-02 03:26:58.919117','8','Loans object (8)',3,'',12,10),(61,'2019-03-02 03:26:58.923270','7','Loans object (7)',3,'',12,10),(62,'2019-03-02 03:26:58.931371','6','Loans object (6)',3,'',12,10),(63,'2019-03-02 03:26:58.935049','5','Loans object (5)',3,'',12,10),(64,'2019-03-02 03:26:58.943063','4','Loans object (4)',3,'',12,10),(65,'2019-03-02 03:26:58.947421','2','Loans object (2)',3,'',12,10),(66,'2019-03-02 03:26:58.951344','1','Loans object (1)',3,'',12,10),(67,'2019-03-02 03:27:26.592854','8','Comments object (8)',3,'',13,10),(68,'2019-03-02 03:27:26.596808','7','Comments object (7)',3,'',13,10),(69,'2019-03-02 03:27:26.600813','6','Comments object (6)',3,'',13,10),(70,'2019-03-02 03:27:26.604854','4','Comments object (4)',3,'',13,10),(71,'2019-03-02 03:28:04.321985','9','AuthUser object (9)',3,'',10,10),(72,'2019-03-02 03:28:04.330000','8','AuthUser object (8)',3,'',10,10),(73,'2019-03-02 03:28:04.334146','7','AuthUser object (7)',3,'',10,10),(74,'2019-03-02 03:28:04.342376','6','AuthUser object (6)',3,'',10,10),(75,'2019-03-02 03:28:04.346050','5','AuthUser object (5)',3,'',10,10),(76,'2019-03-02 03:28:04.354027','4','AuthUser object (4)',3,'',10,10),(77,'2019-03-02 03:28:04.362306','3','AuthUser object (3)',3,'',10,10),(78,'2019-03-02 03:28:04.370049','2','AuthUser object (2)',3,'',10,10),(79,'2019-03-02 03:29:12.358463','2','admin',3,'',4,10),(80,'2019-03-02 03:29:12.366474','6','admin0',3,'',4,10),(81,'2019-03-02 03:29:12.370485','8','five',3,'',4,10),(82,'2019-03-02 03:29:12.370485','7','four',3,'',4,10),(83,'2019-03-02 03:29:12.374485','3','one',3,'',4,10),(84,'2019-03-02 03:29:12.378491','5','three',3,'',4,10),(85,'2019-03-02 03:29:12.378491','4','two',3,'',4,10),(86,'2019-03-02 03:29:12.382495','9','zhongyuchen',3,'',4,10),(87,'2019-03-02 03:30:26.909682','10','admin000',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\"]}}]',4,10),(88,'2019-03-02 03:35:39.476556','11','staff000',1,'[{\"added\": {}}]',4,10),(89,'2019-03-02 03:35:53.800024','11','staff000',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,10),(90,'2019-03-02 03:36:13.409290','12','staff001',1,'[{\"added\": {}}]',4,10),(91,'2019-03-02 03:36:48.809232','12','staff001',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_staff\"]}}]',4,10),(92,'2019-03-02 03:37:07.463011','11','staff000',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,10),(93,'2019-03-02 03:37:43.822123','13','reader000',1,'[{\"added\": {}}]',4,10),(94,'2019-03-02 03:37:59.541280','13','reader000',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,10),(95,'2019-03-02 03:38:19.734631','14','reader001',1,'[{\"added\": {}}]',4,10),(96,'2019-03-02 03:39:14.361400','14','reader001',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',4,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'cmdb','userinfo'),(5,'contenttypes','contenttype'),(10,'library','authuser'),(8,'library','books'),(13,'library','comments'),(9,'library','libraries'),(12,'library','loans'),(14,'library','reserves'),(11,'library','storages'),(6,'sessions','session');
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
INSERT INTO `django_session` VALUES ('22ro2g2cem6o1jm0sa46wf55l1vtq4to','ZjA1MmYzMTNmMGVlM2I3ZjM4ZGQ1NDZkMTBkZTlkNjAwZDliNzA1MDp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNmMzODc3YTI0Mjg1OWYzZWZkMzA4YjZiZTQ5NjEzMTA0YjFiMzZjIn0=','2019-02-06 15:28:25.834169'),('38thhmpecnzjqf5yxqw2qkgtgrfa4va2','M2UyN2VjZGI5OTY3MTRiM2UxZDVmNDM1ZTE4MjQ0ZDNmNWFiMTU2NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOGE5OWE3YTEyZjdkNzczYzYzYzAzMDljOWQxOGRkM2RjZTY3NGMxIn0=','2018-06-17 15:05:24.044890'),('blpy40tgnr68k4znzgzhk00k9st71vof','M2UyN2VjZGI5OTY3MTRiM2UxZDVmNDM1ZTE4MjQ0ZDNmNWFiMTU2NTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOGE5OWE3YTEyZjdkNzczYzYzYzAzMDljOWQxOGRkM2RjZTY3NGMxIn0=','2018-06-04 16:50:01.783216'),('m6d2uh9ic44b9064o2igl4iujezbir6b','YzExZjJhMzlmNGI0Yjk5NjA1ZDE0MGE1MTJhMjg5Mjc2M2Q3NWRmYTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDM3MDUyYWRmYjg1ODE2NTc5ZjI5ODMzOTU5NGJlYWQwNGRmMTUyMCJ9','2019-03-16 03:53:04.843039');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES ('2019-03-02','2019-04-01',0,3,10,'2019-03-02',10,13),('2019-03-02','2019-05-01',1,17,10,'2019-03-02',10,14),('2019-03-02','2019-05-01',1,5,13,'2019-03-02',12,15),('2019-03-02','2019-05-01',1,8,14,'2019-03-02',11,16),('2019-03-02','2019-04-01',0,4,11,'2019-03-02',11,17),('2019-03-02','2019-04-01',0,16,11,'2019-03-02',10,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (4,3,10,15,10),(1,3,13,16,12),(4,24,14,17,11);
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
INSERT INTO `storages` VALUES (1,'1',2),(3,'1',1),(4,'1',3),(5,'11',4),(6,'12',4),(7,'13',3),(8,'14',2),(9,'15',3),(10,'16',1),(12,'2',3),(13,'2',3),(15,'4',4),(16,'5',2),(17,'6',1),(23,'test1',4),(24,'aafadf',4),(25,'isbn3',3);
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

-- Dump completed on 2019-03-02 12:03:22
