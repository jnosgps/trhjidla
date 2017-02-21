-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2017 at 04:52 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trhjidla`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add group', 4, 'add_group'),
(11, 'Can change group', 4, 'change_group'),
(12, 'Can delete group', 4, 'delete_group'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add producer', 7, 'add_producer'),
(20, 'Can change producer', 7, 'change_producer'),
(21, 'Can delete producer', 7, 'delete_producer'),
(22, 'Can add category', 8, 'add_category'),
(23, 'Can change category', 8, 'change_category'),
(24, 'Can delete category', 8, 'delete_category'),
(25, 'Can add product', 9, 'add_product'),
(26, 'Can change product', 9, 'change_product'),
(27, 'Can delete product', 9, 'delete_product'),
(28, 'Can add customer', 10, 'add_customer'),
(29, 'Can change customer', 10, 'change_customer'),
(30, 'Can delete customer', 10, 'delete_customer'),
(31, 'Can add member', 11, 'add_member'),
(32, 'Can change member', 11, 'change_member'),
(33, 'Can delete member', 11, 'delete_member'),
(34, 'Can add order', 12, 'add_order'),
(35, 'Can change order', 12, 'change_order'),
(36, 'Can delete order', 12, 'delete_order'),
(37, 'Can add order item', 13, 'add_orderitem'),
(38, 'Can change order item', 13, 'change_orderitem'),
(39, 'Can delete order item', 13, 'delete_orderitem');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$30000$51GQ09Yd0p8c$1GlFLB3Jis9gNYgVOwXqiv5rnEKU7T9aoqAf2levzrE=', '2017-01-26 17:01:46.967000', 1, 'dracek', '', '', 'dracek@localhost', 1, 1, '2017-01-26 17:00:18.837000'),
(2, 'pbkdf2_sha256$30000$O5EIPm1u54IJ$RSs0/WeJJWEGS+FhCiaDnZIxZky+I1VeobHOamctgCs=', '2017-02-13 19:08:10.937000', 1, 'drak', '', '', 'baxgtx@gmail.com', 1, 1, '2017-02-13 19:07:59.686000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-01-26 17:02:31.440000', '1', 'Fast Food', 1, '[{"added": {}}]', 8, 1),
(2, '2017-01-26 17:03:20.850000', '2', 'Fresh Food', 1, '[{"added": {}}]', 8, 1),
(3, '2017-01-26 17:05:59.328000', '1', 'Rychta Fresh Food & Drink', 1, '[{"added": {}}]', 7, 1),
(4, '2017-01-26 17:07:42.818000', '2', 'Restaurace Lebeda', 1, '[{"added": {}}]', 7, 1),
(5, '2017-01-26 17:10:06.311000', '1', 'Houska s makem', 1, '[{"added": {}}]', 9, 1),
(6, '2017-01-26 17:11:23.331000', '2', 'Cheeseburger', 1, '[{"added": {}}]', 9, 1),
(7, '2017-01-26 17:12:50.305000', '3', 'Pizza Mafian', 1, '[{"added": {}}]', 9, 1),
(8, '2017-01-26 17:13:16.026000', '4', 'Salatek', 1, '[{"added": {}}]', 9, 1),
(9, '2017-02-13 19:09:15.472000', '1', 'Customer object', 1, '[{"added": {}}]', 10, 2),
(10, '2017-02-13 19:12:02.863000', '1', 'Tomas Jehova', 1, '[{"added": {}}]', 11, 2),
(11, '2017-02-16 19:43:07.117000', '1', 'fastfood', 2, '[{"changed": {"fields": ["name"]}}]', 8, 2),
(12, '2017-02-16 19:43:42.682000', '2', 'freshfood', 2, '[{"changed": {"fields": ["name"]}}]', 8, 2),
(13, '2017-02-16 19:45:35.670000', '3', 'sweets', 1, '[{"added": {}}]', 8, 2),
(14, '2017-02-16 19:47:04.918000', '4', 'raws', 1, '[{"added": {}}]', 8, 2),
(15, '2017-02-16 19:49:31.380000', '5', 'direct', 1, '[{"added": {}}]', 8, 2),
(16, '2017-02-17 13:54:31.716000', '1', 'Rychta Fresh Food & Drink', 1, '[{"added": {}}]', NULL, 2),
(17, '2017-02-17 17:54:25.478000', '1', 'Tomas Jehova (jehova.t)', 2, '[{"changed": {"fields": ["password"]}}]', 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(4, 'auth', 'group'),
(2, 'auth', 'permission'),
(3, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'shop1', 'category'),
(10, 'shop1', 'customer'),
(11, 'shop1', 'member'),
(12, 'shop1', 'order'),
(13, 'shop1', 'orderitem'),
(7, 'shop1', 'producer'),
(9, 'shop1', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-01-26 16:55:06.709000'),
(2, 'auth', '0001_initial', '2017-01-26 16:55:13.397000'),
(3, 'admin', '0001_initial', '2017-01-26 16:55:14.803000'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-01-26 16:55:14.944000'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-01-26 16:55:16.912000'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-01-26 16:55:17.334000'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-01-26 16:55:18.006000'),
(8, 'auth', '0004_alter_user_username_opts', '2017-01-26 16:55:18.147000'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-01-26 16:55:21.913000'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-01-26 16:55:21.944000'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-01-26 16:55:22.085000'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-01-26 16:55:22.507000'),
(13, 'sessions', '0001_initial', '2017-01-26 16:55:22.975000'),
(14, 'shop1', '0001_initial', '2017-01-26 16:55:25.850000'),
(15, 'shop1', '0002_customer_member', '2017-02-13 19:01:35.962000'),
(16, 'shop1', '0003_auto_20170213_2010', '2017-02-13 19:11:07.954000'),
(17, 'shop1', '0004_order_orderitem', '2017-02-16 18:26:02.331000'),
(18, 'shop1', '0005_producerdetail', '2017-02-17 13:35:35.367000'),
(19, 'shop1', '0006_auto_20170217_1445', '2017-02-17 13:45:32.761000'),
(20, 'shop1', '0007_auto_20170217_1447', '2017-02-17 13:47:07.034000'),
(21, 'shop1', '0008_auto_20170217_1447', '2017-02-17 13:47:58.021000'),
(22, 'shop1', '0009_auto_20170217_1453', '2017-02-17 13:54:13.168000'),
(23, 'shop1', '0010_auto_20170217_1508', '2017-02-17 14:08:42.934000'),
(24, 'shop1', '0011_product_picture', '2017-02-17 14:43:21.469000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ndabu3f62kob6fa903hw9y2bceqrkl3p', 'OWY0NTc3ODE4YzEyNjdiMmIyMDc1NWVjZjJkMTFjMjlkZDFlMTRlZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImE0YTM0YjUxMGRlMjc5MThkOTBiMjMwMTQzZWIwYzU0YzZkY2QwNDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-09 17:01:46.998000'),
('s3c8sjpqxw2xm5499r6b5d07j1naq8r3', 'MGM5MzY4MjAwMDQ0ZjRjNzExODI2ZDhkYjM2ODg4NDY1YjcyYjYzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFmMWVkYzJhODAxNDc0MTI2MzI2OGQyNDIzYTBlNzY1ZmE5ODdlMGUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-03-02 20:29:29.026000');

-- --------------------------------------------------------

--
-- Table structure for table `shop1_category`
--

CREATE TABLE `shop1_category` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_czech_ci NOT NULL,
  `description` longtext COLLATE utf8_czech_ci,
  `time_param` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `shop1_category`
--

INSERT INTO `shop1_category` (`id`, `name`, `description`, `time_param`) VALUES
(1, 'fastfood', 'Pokud chcete neco rychleho, je tohle pro Vas!', 45),
(2, 'freshfood', 'Cerstve i zdrave jidlo? Ano zde! :)', 90),
(3, 'sweets', 'Zákusky až k vám do pusy.', 1440),
(4, 'raws', 'ěščřžýáíé', 4320),
(5, 'direct', 'Nic nic nic a zase nic.', 10080);

-- --------------------------------------------------------

--
-- Table structure for table `shop1_customer`
--

CREATE TABLE `shop1_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `mobile` varchar(9) COLLATE utf8_czech_ci NOT NULL,
  `lat` decimal(10,6) NOT NULL,
  `lng` decimal(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `shop1_customer`
--

INSERT INTO `shop1_customer` (`id`, `name`, `mobile`, `lat`, `lng`) VALUES
(1, 'Tomas Jehova', '777333111', '0.000000', '0.000000');

-- --------------------------------------------------------

--
-- Table structure for table `shop1_member`
--

CREATE TABLE `shop1_member` (
  `id` int(11) NOT NULL,
  `login` varchar(32) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_czech_ci NOT NULL,
  `registered_date` datetime(6) NOT NULL,
  `last_active` datetime(6) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `shop1_member`
--

INSERT INTO `shop1_member` (`id`, `login`, `password`, `registered_date`, `last_active`, `address`, `customer_id`) VALUES
(1, 'jehova.t', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', '2017-02-13 19:11:17.000000', '2017-02-13 19:11:54.000000', 'Pod kopcem 27, Rakovnik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop1_order`
--

CREATE TABLE `shop1_order` (
  `id` int(11) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `delivery_time` datetime(6) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop1_orderitem`
--

CREATE TABLE `shop1_orderitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop1_producer`
--

CREATE TABLE `shop1_producer` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_czech_ci NOT NULL,
  `address` varchar(64) COLLATE utf8_czech_ci NOT NULL,
  `gps_point` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `time_param` int(11) NOT NULL,
  `mobile` varchar(9) COLLATE utf8_czech_ci NOT NULL,
  `login` varchar(32) COLLATE utf8_czech_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_czech_ci NOT NULL,
  `registered_date` datetime(6) NOT NULL,
  `last_active` datetime(6) DEFAULT NULL,
  `online` int(11) NOT NULL,
  `picture` varchar(100) COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `shop1_producer`
--

INSERT INTO `shop1_producer` (`id`, `name`, `address`, `gps_point`, `time_param`, `mobile`, `login`, `password`, `registered_date`, `last_active`, `online`, `picture`) VALUES
(1, 'Rychta Fresh Food & Drink', 'Pod kopcem 27, Rakovnik', '[51.000233299412345,34.222001233212345]', 0, '111222333', 'rychtafresh', 'fooddrink', '2017-01-26 17:03:34.000000', '2017-01-26 17:05:53.000000', 0, NULL),
(2, 'Restaurace Lebeda', 'Naproti nadrazi 1, Luzna u Rakovnika', '[52.008873459412345,31.222001244512345]', 20, '222333111', 'lebeda', 'restaurace', '2017-01-26 17:06:00.000000', '2017-01-26 17:07:38.000000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop1_product`
--

CREATE TABLE `shop1_product` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_czech_ci NOT NULL,
  `time_param` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `picture` varchar(100) COLLATE utf8_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Dumping data for table `shop1_product`
--

INSERT INTO `shop1_product` (`id`, `name`, `description`, `time_param`, `cost`, `category_id`, `producer_id`, `picture`) VALUES
(1, 'Houska s makem', 'Alergeny ( 1, 5, 7 )', 0, 78, 1, 1, NULL),
(2, 'Cheeseburger', 'Alergeny ( 1, 3, 7 )', 0, 130, 1, 1, NULL),
(3, 'Pizza Mafian', 'Alergeny ( 1, 3, 7 )', 0, 96, 1, 2, NULL),
(4, 'Salatek', 'Fuj nejez to!', 0, 45, 2, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `shop1_category`
--
ALTER TABLE `shop1_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop1_customer`
--
ALTER TABLE `shop1_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop1_member`
--
ALTER TABLE `shop1_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop1_member_customer_id_d97ebd34_fk_shop1_customer_id` (`customer_id`);

--
-- Indexes for table `shop1_order`
--
ALTER TABLE `shop1_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop1_order_customer_id_8c0a41e2_fk_shop1_customer_id` (`customer_id`),
  ADD KEY `shop1_order_member_id_eaa4fe8b_fk_shop1_member_id` (`member_id`);

--
-- Indexes for table `shop1_orderitem`
--
ALTER TABLE `shop1_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop1_orderitem_order_id_c3482585_fk_shop1_order_id` (`order_id`),
  ADD KEY `shop1_orderitem_product_id_646f6792_fk_shop1_product_id` (`product_id`);

--
-- Indexes for table `shop1_producer`
--
ALTER TABLE `shop1_producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop1_product`
--
ALTER TABLE `shop1_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop1_product_category_id_7dce323d_fk_shop1_category_id` (`category_id`),
  ADD KEY `shop1_product_producer_id_1bcfcece_fk_shop1_producer_id` (`producer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `shop1_category`
--
ALTER TABLE `shop1_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `shop1_customer`
--
ALTER TABLE `shop1_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shop1_member`
--
ALTER TABLE `shop1_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shop1_order`
--
ALTER TABLE `shop1_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop1_orderitem`
--
ALTER TABLE `shop1_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `shop1_producer`
--
ALTER TABLE `shop1_producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `shop1_product`
--
ALTER TABLE `shop1_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `shop1_member`
--
ALTER TABLE `shop1_member`
  ADD CONSTRAINT `shop1_member_customer_id_d97ebd34_fk_shop1_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop1_customer` (`id`);

--
-- Constraints for table `shop1_order`
--
ALTER TABLE `shop1_order`
  ADD CONSTRAINT `shop1_order_customer_id_8c0a41e2_fk_shop1_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `shop1_customer` (`id`),
  ADD CONSTRAINT `shop1_order_member_id_eaa4fe8b_fk_shop1_member_id` FOREIGN KEY (`member_id`) REFERENCES `shop1_member` (`id`);

--
-- Constraints for table `shop1_orderitem`
--
ALTER TABLE `shop1_orderitem`
  ADD CONSTRAINT `shop1_orderitem_order_id_c3482585_fk_shop1_order_id` FOREIGN KEY (`order_id`) REFERENCES `shop1_order` (`id`),
  ADD CONSTRAINT `shop1_orderitem_product_id_646f6792_fk_shop1_product_id` FOREIGN KEY (`product_id`) REFERENCES `shop1_product` (`id`);

--
-- Constraints for table `shop1_product`
--
ALTER TABLE `shop1_product`
  ADD CONSTRAINT `shop1_product_category_id_7dce323d_fk_shop1_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop1_category` (`id`),
  ADD CONSTRAINT `shop1_product_producer_id_1bcfcece_fk_shop1_producer_id` FOREIGN KEY (`producer_id`) REFERENCES `shop1_producer` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
