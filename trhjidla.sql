-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2017 at 05:05 PM
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

--
-- Dumping data for table `shop1_category`
--

INSERT INTO `shop1_category` (`id`, `name`, `description`, `time_param`) VALUES
(1, 'fastfood', 'Pokud chcete neco rychleho, je tohle pro Vas!', 45),
(2, 'freshfood', 'Cerstve i zdrave jidlo? Ano zde! :)', 90),
(3, 'sweets', 'Zákusky až k vám do pusy.', 1440),
(4, 'raws', 'ěščřžýáíé', 4320),
(5, 'direct', 'Nic nic nic a zase nic.', 10080);

--
-- Dumping data for table `shop1_customer`
--

INSERT INTO `shop1_customer` (`id`, `name`, `mobile`, `lat`, `lng`) VALUES
(1, 'Tomas Jehova', '777333111', '0.000000', '0.000000');

--
-- Dumping data for table `shop1_member`
--

INSERT INTO `shop1_member` (`id`, `login`, `password`, `registered_date`, `last_active`, `address`, `customer_id`) VALUES
(1, 'jehova.t', '4813494d137e1631bba301d5acab6e7bb7aa74ce1185d456565ef51d737677b2', '2017-02-13 19:11:17.000000', '2017-02-13 19:11:54.000000', 'Pod kopcem 27, Rakovnik', 1);

--
-- Dumping data for table `shop1_producer`
--

INSERT INTO `shop1_producer` (`id`, `name`, `address`, `gps_point`, `time_param`, `mobile`, `login`, `password`, `registered_date`, `last_active`, `online`, `picture`) VALUES
(1, 'Rychta Fresh Food & Drink', 'Pod kopcem 27, Rakovnik', '[51.000233299412345,34.222001233212345]', 0, '111222333', 'rychtafresh', 'fooddrink', '2017-01-26 17:03:34.000000', '2017-01-26 17:05:53.000000', 0, NULL),
(2, 'Restaurace Lebeda', 'Naproti nadrazi 1, Luzna u Rakovnika', '[52.008873459412345,31.222001244512345]', 20, '222333111', 'lebeda', 'restaurace', '2017-01-26 17:06:00.000000', '2017-01-26 17:07:38.000000', 0, NULL);

--
-- Dumping data for table `shop1_product`
--

INSERT INTO `shop1_product` (`id`, `name`, `description`, `time_param`, `cost`, `category_id`, `producer_id`, `picture`) VALUES
(1, 'Houska s makem', 'Alergeny ( 1, 5, 7 )', 0, 78, 1, 1, NULL),
(2, 'Cheeseburger', 'Alergeny ( 1, 3, 7 )', 0, 130, 1, 1, NULL),
(3, 'Pizza Mafian', 'Alergeny ( 1, 3, 7 )', 0, 96, 1, 2, NULL),
(4, 'Salatek', 'Fuj nejez to!', 0, 45, 2, 2, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
