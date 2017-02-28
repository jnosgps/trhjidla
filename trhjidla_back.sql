-- MySQL dump 10.15  Distrib 10.0.29-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.0.29-MariaDB-0+deb8u1

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add order',8,'add_order'),(23,'Can change order',8,'change_order'),(24,'Can delete order',8,'delete_order'),(25,'Can add producer',9,'add_producer'),(26,'Can change producer',9,'change_producer'),(27,'Can delete producer',9,'delete_producer'),(28,'Can add member',10,'add_member'),(29,'Can change member',10,'change_member'),(30,'Can delete member',10,'delete_member'),(31,'Can add order item',11,'add_orderitem'),(32,'Can change order item',11,'change_orderitem'),(33,'Can delete order item',11,'delete_orderitem'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(37,'Can add customer',13,'add_customer'),(38,'Can change customer',13,'change_customer'),(39,'Can delete customer',13,'delete_customer'),(40,'Can add page info',14,'add_pageinfo'),(41,'Can change page info',14,'change_pageinfo'),(42,'Can delete page info',14,'delete_pageinfo');
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
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$HfpE9VdiHkpr$mm7DQ0xEwqlvi7PJHUJ/WU1gq4xNIV/vK+h8uQb7j6g=','2017-02-23 15:31:12.000000',0,'milan','Milan','Horváth','milan.horvath@trhjidla.cz',1,1,'2017-02-21 15:40:31.000000'),(2,'pbkdf2_sha256$30000$naVAmaFQtPD0$avPm0WtYVXsodWbp7e9xuIHnKFzgwxKJU22f5P8SSbI=','2017-02-23 14:51:35.964771',1,'drak','Lukáš','Novotný','lukas.novotny@trhjidla.cz',1,1,'2017-02-22 20:00:50.000000');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (45,1,7),(46,1,8),(47,1,20),(48,1,25),(49,1,26),(50,1,27),(51,1,28),(52,1,29),(53,1,30),(40,1,34),(41,1,35),(42,1,36),(43,1,37),(44,1,38),(54,1,41),(1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,2,25),(26,2,26),(27,2,27),(28,2,28),(29,2,29),(30,2,30),(31,2,31),(32,2,32),(33,2,33),(34,2,34),(35,2,35),(36,2,36),(37,2,37),(38,2,38),(39,2,39);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-22 15:43:43.729400','3','Koryto Foodmaster',1,'[{\"added\": {}}]',9,1),(2,'2017-02-22 15:48:59.943233','6','Cerny mak',1,'[{\"added\": {}}]',12,1),(3,'2017-02-22 19:07:24.047342','4','Mufiny jako prase',1,'[{\"added\": {}}]',9,1),(4,'2017-02-22 19:08:23.004331','7','mufin jako prase',1,'[{\"added\": {}}]',12,1),(5,'2017-02-23 01:27:50.343380','2','drak',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"last_login\"]}}]',3,2),(6,'2017-02-23 01:30:15.494208','1','milan',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_superuser\"]}}]',3,2),(7,'2017-02-23 14:52:19.648578','1','PageInfo object',1,'[{\"added\": {}}]',14,2),(8,'2017-02-23 14:56:29.127896','1','PageInfo object',2,'[{\"changed\": {\"fields\": [\"info_text\"]}}]',14,2),(9,'2017-02-23 15:41:51.488040','1','milan',2,'[]',3,2),(10,'2017-02-23 15:49:47.990533','1','PageInfo object',2,'[{\"changed\": {\"fields\": [\"info_text\"]}}]',14,1),(11,'2017-02-23 16:16:49.476413','1','PageInfo object',2,'[{\"changed\": {\"fields\": [\"info_text\"]}}]',14,1),(12,'2017-02-23 16:32:56.472514','9','salat coleslaw',1,'[{\"added\": {}}]',12,1),(13,'2017-02-24 19:28:26.243178','9','salat coleslaw',2,'[{\"changed\": {\"fields\": [\"picture\"]}}]',12,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'shop1','category'),(13,'shop1','customer'),(10,'shop1','member'),(8,'shop1','order'),(11,'shop1','orderitem'),(14,'shop1','pageinfo'),(9,'shop1','producer'),(12,'shop1','product');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-21 15:39:36.969600'),(2,'auth','0001_initial','2017-02-21 15:39:37.638932'),(3,'admin','0001_initial','2017-02-21 15:39:37.752576'),(4,'admin','0002_logentry_remove_auto_add','2017-02-21 15:39:37.768436'),(5,'contenttypes','0002_remove_content_type_name','2017-02-21 15:39:37.838686'),(6,'auth','0002_alter_permission_name_max_length','2017-02-21 15:39:37.878675'),(7,'auth','0003_alter_user_email_max_length','2017-02-21 15:39:37.919718'),(8,'auth','0004_alter_user_username_opts','2017-02-21 15:39:37.931792'),(9,'auth','0005_alter_user_last_login_null','2017-02-21 15:39:37.959741'),(10,'auth','0006_require_contenttypes_0002','2017-02-21 15:39:37.962955'),(11,'auth','0007_alter_validators_add_error_messages','2017-02-21 15:39:37.973475'),(12,'auth','0008_alter_user_username_max_length','2017-02-21 15:39:38.017324'),(13,'sessions','0001_initial','2017-02-21 15:39:38.057958'),(14,'shop1','0001_initial','2017-02-21 15:39:38.232466'),(15,'shop1','0002_customer_member','2017-02-21 15:39:38.326752'),(16,'shop1','0003_auto_20170213_2010','2017-02-21 15:39:38.401298'),(17,'shop1','0004_order_orderitem','2017-02-21 15:39:38.632285'),(18,'shop1','0005_producerdetail','2017-02-21 15:39:38.704233'),(19,'shop1','0006_auto_20170217_1445','2017-02-21 15:39:38.717110'),(20,'shop1','0007_auto_20170217_1447','2017-02-21 15:39:38.732270'),(21,'shop1','0008_auto_20170217_1447','2017-02-21 15:39:38.745853'),(22,'shop1','0009_auto_20170217_1453','2017-02-21 15:39:38.760126'),(23,'shop1','0010_auto_20170217_1508','2017-02-21 15:39:38.875594'),(24,'shop1','0011_product_picture','2017-02-21 15:39:38.932959'),(25,'shop1','0012_pageinfo','2017-02-23 13:33:54.138654');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6f823lkg0ycb4kejkizzx5ppdl28bjc9','YWNmOTc0MjcwM2MyNWE2MjA2YWMwYmNiMmE0NmJhNDJmYjQ3MmMzODp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2ZjBjN2FmNjk2NWEyNWE0MTMyMWVhOTQ0NWZlNzllNzM4MDllNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-07 15:48:09.445123'),('j0jx0s1ryukc9i7zlpmqrwwgnzgq4vwu','NmIxYjBhNGYyYmM4YmY4YmI1NDc2ZmZjNTdhNmM3ZDQ0MjgwYTczYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjU2ZjBjN2FmNjk2NWEyNWE0MTMyMWVhOTQ0NWZlNzllNzM4MDllNjEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-03-09 17:48:53.029039'),('l32u2vinb7nho7ng6hkio4duyjr21hhw','N2U4ZDIxYzViY2M1MTcyNTU2YTEwMDc0YjcyZjQyODkzNzU4NGZmNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjQzZDI4N2Y3MTc1YTMwNWNjMWE4ZjU2MzAwNTVlZjA5NDJiZDc2OWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-03-09 15:31:12.906049'),('n1rr8z6nmt8ankkya8j2ee2y5dl39ep1','NjA2NTBmMTllZDg0MGJmNWJiY2NiMDdiNjNjYWE2NTkxMTk2MjIyMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkMWQ2ZDYxMzlhN2Q0OGJiYjUwYmY4YjA2YzAxZjBjYWRhYmE2NmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-03-09 13:36:37.111040'),('pd8a1fwvk1ck7z67w17qbsmz064ggrbb','NjA2NTBmMTllZDg0MGJmNWJiY2NiMDdiNjNjYWE2NTkxMTk2MjIyMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImRkMWQ2ZDYxMzlhN2Q0OGJiYjUwYmY4YjA2YzAxZjBjYWRhYmE2NmQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2017-03-09 14:51:35.970773');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_category`
--

DROP TABLE IF EXISTS `shop1_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` longtext,
  `time_param` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_category`
--

LOCK TABLES `shop1_category` WRITE;
/*!40000 ALTER TABLE `shop1_category` DISABLE KEYS */;
INSERT INTO `shop1_category` VALUES (1,'fastfood','Pokud chcete neco rychleho, je tohle pro Vas!',45),(2,'freshfood','Cerstve i zdrave jidlo? Ano zde! :)',90),(3,'sweets','Zákusky až k vám do pusy.',1440),(4,'raws','?š??žýáíé',4320),(5,'direct','Nic nic nic a zase nic.',10080);
/*!40000 ALTER TABLE `shop1_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_customer`
--

DROP TABLE IF EXISTS `shop1_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(9) NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_customer`
--

LOCK TABLES `shop1_customer` WRITE;
/*!40000 ALTER TABLE `shop1_customer` DISABLE KEYS */;
INSERT INTO `shop1_customer` VALUES (1,'Tomas Jehova','777333111',0.000000,0.000000);
/*!40000 ALTER TABLE `shop1_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_member`
--

DROP TABLE IF EXISTS `shop1_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `registered_date` datetime(6) NOT NULL,
  `last_active` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop1_member_customer_id_d97ebd34_fk_shop1_customer_id` (`customer_id`),
  CONSTRAINT `shop1_member_customer_id_d97ebd34_fk_shop1_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop1_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_member`
--

LOCK TABLES `shop1_member` WRITE;
/*!40000 ALTER TABLE `shop1_member` DISABLE KEYS */;
INSERT INTO `shop1_member` VALUES (1,'jehova.t','4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2','2017-02-13 19:11:17.000000','2017-02-23 17:48:53.013893','Pod kopcem 27, Rakovnik',1);
/*!40000 ALTER TABLE `shop1_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_order`
--

DROP TABLE IF EXISTS `shop1_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `delivery_time` datetime(6) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop1_order_customer_id_8c0a41e2_fk_shop1_customer_id` (`customer_id`),
  KEY `shop1_order_member_id_eaa4fe8b_fk_shop1_member_id` (`member_id`),
  CONSTRAINT `shop1_order_customer_id_8c0a41e2_fk_shop1_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop1_customer` (`id`),
  CONSTRAINT `shop1_order_member_id_eaa4fe8b_fk_shop1_member_id` FOREIGN KEY (`member_id`) REFERENCES `shop1_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_order`
--

LOCK TABLES `shop1_order` WRITE;
/*!40000 ALTER TABLE `shop1_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop1_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_orderitem`
--

DROP TABLE IF EXISTS `shop1_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop1_orderitem_order_id_c3482585_fk_shop1_order_id` (`order_id`),
  KEY `shop1_orderitem_product_id_646f6792_fk_shop1_product_id` (`product_id`),
  CONSTRAINT `shop1_orderitem_order_id_c3482585_fk_shop1_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop1_order` (`id`),
  CONSTRAINT `shop1_orderitem_product_id_646f6792_fk_shop1_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop1_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_orderitem`
--

LOCK TABLES `shop1_orderitem` WRITE;
/*!40000 ALTER TABLE `shop1_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop1_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_pageinfo`
--

DROP TABLE IF EXISTS `shop1_pageinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_pageinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_pageinfo`
--

LOCK TABLES `shop1_pageinfo` WRITE;
/*!40000 ALTER TABLE `shop1_pageinfo` DISABLE KEYS */;
INSERT INTO `shop1_pageinfo` VALUES (1,'Regionální potraviny ?ech?m. Kvalitn?, efektivn?, ekologicky a poctiv?.\r\nJsme nová služba , která si klade za cíl být maximáln? šetrná k naší planet? a zárove? vám zprost?edkovat ty nejlepší potraviny i hotová jídla z vašeho regionu.');
/*!40000 ALTER TABLE `shop1_pageinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_producer`
--

DROP TABLE IF EXISTS `shop1_producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_producer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(64) NOT NULL,
  `gps_point` varchar(200) NOT NULL,
  `time_param` int(11) NOT NULL,
  `mobile` varchar(9) NOT NULL,
  `login` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `registered_date` datetime(6) NOT NULL,
  `last_active` datetime(6) DEFAULT NULL,
  `online` int(11) NOT NULL,
  `picture` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_producer`
--

LOCK TABLES `shop1_producer` WRITE;
/*!40000 ALTER TABLE `shop1_producer` DISABLE KEYS */;
INSERT INTO `shop1_producer` VALUES (1,'Rychta Fresh Food & Drink','Pod kopcem 27, Rakovnik','[51.000233299412345,34.222001233212345]',0,'111222333','rychtafresh','fooddrink','2017-01-26 17:03:34.000000','2017-01-26 17:05:53.000000',0,NULL),(2,'Restaurace Lebeda','Naproti nadrazi 1, Luzna u Rakovnika','[52.008873459412345,31.222001244512345]',20,'222333111','lebeda','restaurace','2017-01-26 17:06:00.000000','2017-01-26 17:07:38.000000',0,NULL),(3,'Koryto Foodmaster','Fergusónova 34, Rakovník','RA',0,'888999433','koryto','prase','2017-02-22 15:42:38.000000',NULL,0,'img/producers/received_10205175131412799.jpeg'),(4,'Mufiny jako prase','st?íhalova 17','RA',45,'777666444','mufiny','mufiny','2017-02-22 19:06:21.000000',NULL,0,'');
/*!40000 ALTER TABLE `shop1_producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop1_product`
--

DROP TABLE IF EXISTS `shop1_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop1_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(200) NOT NULL,
  `time_param` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `picture` varchar(100),
  PRIMARY KEY (`id`),
  KEY `shop1_product_category_id_7dce323d_fk_shop1_category_id` (`category_id`),
  KEY `shop1_product_producer_id_1bcfcece_fk_shop1_producer_id` (`producer_id`),
  CONSTRAINT `shop1_product_category_id_7dce323d_fk_shop1_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop1_category` (`id`),
  CONSTRAINT `shop1_product_producer_id_1bcfcece_fk_shop1_producer_id` FOREIGN KEY (`producer_id`) REFERENCES `shop1_producer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop1_product`
--

LOCK TABLES `shop1_product` WRITE;
/*!40000 ALTER TABLE `shop1_product` DISABLE KEYS */;
INSERT INTO `shop1_product` VALUES (1,'Houska s makem','Alergeny ( 1, 5, 7 )',0,78,1,1,NULL),(2,'Cheeseburger','Alergeny ( 1, 3, 7 )',0,130,1,1,NULL),(3,'Pizza Mafian','Alergeny ( 1, 3, 7 )',0,96,1,2,NULL),(4,'Salatek','Fuj nejez to!',0,45,2,2,NULL),(6,'Cerny mak','Všelék',0,240,2,3,'img/products/received_10203061538655465_n9AW8E4.jpeg'),(7,'mufin jako prase','hodn? velkej mufin',45,200,3,4,''),(9,'salat coleslaw','cibule a o?íšky obalený v tofu',0,115,2,2,'img/products/stahování_XHNAuce.jpg');
/*!40000 ALTER TABLE `shop1_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-28 17:56:11
