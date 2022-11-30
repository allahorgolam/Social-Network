-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2022 at 02:13 PM
-- Server version: 10.5.17-MariaDB-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grameen1_shoppingcart_advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Member','Admin') NOT NULL DEFAULT 'Member',
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_state` varchar(100) NOT NULL,
  `address_zip` varchar(50) NOT NULL,
  `address_country` varchar(100) NOT NULL,
  `registered` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `email`, `password`, `role`, `first_name`, `last_name`, `address_street`, `address_city`, `address_state`, `address_zip`, `address_country`, `registered`) VALUES
(1, 'admin@website.com', '$2y$10$pEHRAE4Ia0mE9BdLmbS.ueQsv/.WlTUSW7/cqF/T36iW.zDzSkx4y', 'Admin', 'John', 'Doe', '98 High Street', 'New York', 'NY', '10001', 'United States', '2022-01-01 00:00:00'),
(2, 'arif@gmail.com', '$2y$10$Zn.Ny2c1YRUddwdu/jC4zeAbideABUwHotfyHYmQu.03QLMbll7LK', 'Member', '', '', '', '', '', '', '', '2022-11-15 17:44:57'),
(3, 'mdmahmudor@gmail.com', '$2y$10$GAFr110LWmw/DSCAkMQVwOeFlGLmZRsOnbXKecSyhB03QAVSrvGeC', 'Member', '', '', '', '', '', '', '', '2022-11-16 04:31:24'),
(4, 'arif3@gmail.com', '$2y$10$7UaU1e7Ng4HCwmzdWUTrsueBTNBXZlk/2D19DA.06SdirnnsRjumO', 'Member', '', '', '', '', '', '', '', '2022-11-16 04:32:20'),
(5, 'arif5@gmail.com', '$2y$10$U32cb1aGDP/11hOsqhQGLuj7OccORt3mgRTf.b1wGIB0Th.bK408a', 'Member', '', '', '', '', '', '', '', '2022-11-16 05:07:36'),
(6, 'mukit@gmail.com', '$2y$10$kJKtHibLMFCgYQ5JUuyvO.WkR2jTpaAED16kFumC5hivV7jwRFEPe', 'Member', '', '', '', '', '', '', '', '2022-11-16 12:04:21'),
(7, 'arif6@gmail.com', '$2y$10$9RQHpp5JaohVI8sHTgoKTOeVRb.k6JYd9.2VMMEfR5NHY3kKV7GCy', 'Member', '', '', '', '', '', '', '', '2022-11-23 08:35:44'),
(8, 'saiful7720@gmail.com', '$2y$10$CxKI2knv9o9Khz.ZRoH2C.lUJ6Z7bYJL5NUuItXknsWthMfT9xE46', 'Member', '', '', '', '', '', '', '', '2022-11-23 09:00:54'),
(9, 'arif7@gmail.com', '$2y$10$RIEfBO14isYfvDDYgrFw6e9ZR2WUKHmgjgyIVU3ecHFXl9oNVs3NK', 'Member', '', '', '', '', '', '', '', '2022-11-23 09:10:17'),
(10, 'arif8@gmail.com', '$2y$10$3l4H9Un5GamWx/4tAl2vmeEKSy3R6f2PigCmBjzv70wBLX0RckR9S', 'Member', '', '', '', '', '', '', '', '2022-11-23 09:56:59'),
(11, 'infoarifulislam121@gmail.com', '$2y$10$Cvt0gug47w0/xRqAOeDb.O8d4W6.9lPcHUtjhixlmQ9ozbj7ULqBO', 'Member', '', '', '', '', '', '', '', '2022-11-28 14:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`) VALUES
(2, 'Watches', 0),
(4, 'Phone', 0),
(6, 'rice', 0),
(7, 'Drinks', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories2`
--

CREATE TABLE `categories2` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories2`
--

INSERT INTO `categories2` (`id`, `name`, `parent_id`) VALUES
(1, 'ACI', '0'),
(2, 'iPhone', '0'),
(3, 'PRAN', '0');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `category_ids` varchar(50) NOT NULL,
  `product_ids` varchar(50) NOT NULL,
  `discount_code` varchar(50) NOT NULL,
  `discount_type` enum('Percentage','Fixed') NOT NULL,
  `discount_value` decimal(7,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `category_ids`, `product_ids`, `discount_code`, `discount_type`, `discount_value`, `start_date`, `end_date`) VALUES
(1, '', '', 'newyear2022', 'Percentage', '5.00', '2022-01-01 00:00:00', '2022-12-31 00:00:00'),
(2, '', '', '5off', 'Fixed', '5.00', '2022-01-01 00:00:00', '2032-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `date_uploaded` datetime NOT NULL DEFAULT current_timestamp(),
  `full_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `caption`, `date_uploaded`, `full_path`) VALUES
(1, 'Watch Front', '', '2022-02-14 15:58:10', 'uploads/watch.jpg'),
(2, 'Watch Side', '', '2022-02-14 15:58:10', 'uploads/watch-2.jpg'),
(3, 'Watch Back', '', '2022-02-14 15:58:10', 'uploads/watch-3.jpg'),
(4, 'Wallet', '', '2022-02-15 02:06:00', 'uploads/wallet.jpg'),
(5, 'Camera', '', '2022-03-04 16:03:37', 'uploads/camera.jpg'),
(6, 'Headphones', '', '2022-03-04 16:03:37', 'uploads/headphones.jpg'),
(8, '1-rice.jpg', '', '2022-11-24 10:47:17', 'uploads/1-rice.jpg'),
(9, 'phone.jpg', '', '2022-11-26 08:18:51', 'uploads/phone.jpg'),
(10, 'coo.jpg', '', '2022-11-28 23:44:38', 'uploads/coo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `rrp` decimal(7,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `weight` decimal(7,2) NOT NULL DEFAULT 0.00,
  `url_slug` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `company_name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `rrp`, `quantity`, `date_added`, `weight`, `url_slug`, `status`, `company_name`) VALUES
(29, 'watch', 'watch details', '77.00', '88.00', 1, '2022-11-26 11:52:00', '2.00', 'smart-watch', 1, ''),
(40, 'Md Mahmuder', 'sdtf', '565.00', '7889.98', 2, '2022-11-26 13:14:00', '0.00', 'test3', 1, ''),
(41, 'watch33', 'w4', '65.98', '87.99', 1, '2022-11-26 13:15:00', '0.00', 'rtert', 1, ''),
(43, 'race', 'w4et', '900.00', '67867.00', 2, '2022-11-26 13:18:00', '0.00', 'test3', 1, ''),
(48, 'kajol rice5', 'ujio', '900.00', '9887.00', 1, '2022-11-26 16:13:00', '0.00', '', 1, ''),
(49, 'mobile', 'mobile description', '555.00', '776.98', 1, '2022-11-27 03:14:00', '5.00', 'mobile', 1, ''),
(50, 'mobile2', 'mobile2 description', '44.00', '54.98', 5, '2022-11-27 03:17:00', '54.00', 'mb2', 1, ''),
(51, 'mobile 3', 'mobile 3 description', '33.00', '43.98', 4, '2022-11-27 03:18:00', '0.00', 'mobile3', 1, ''),
(52, 'phone 4', 'phone 4 description', '55.00', '66.00', 4, '2022-11-27 03:25:00', '48.00', 'phone 4', 1, ''),
(53, 'phone 5', 'phone 5', '77.00', '87.97', 5, '2022-11-27 03:27:00', '0.00', 'phone 5', 1, ''),
(54, 'kajol rice', 'kajol rice', '66.00', '77.00', 2, '2022-11-27 03:36:00', '0.00', 'kajol rice', 1, ''),
(55, 'kajol rice', 'kajol rice', '66.00', '77.00', 2, '2022-11-27 03:36:00', '0.00', 'kajol rice', 1, ''),
(56, 'kajol rice 3', 'kajol rice 3', '900.00', '1111.00', 1, '2022-11-27 03:40:00', '3.00', 'kajol rice 3', 1, ''),
(57, 'kajol rice 4', 'kajol rice 4', '900.00', '1111.00', 2, '2022-11-27 03:43:00', '33.00', 'kajol rice 4', 1, ''),
(58, 'kajol rice5', 'kajol rice5', '33.00', '44.00', 2, '2022-11-27 03:52:00', '4.00', 'kajol rice5', 1, ''),
(59, 'phone6', 'phone6', '900.00', '1234.00', 1, '2022-11-27 03:55:00', '55.00', 'phone6', 1, ''),
(60, 'phone6', 'phone6', '900.00', '1234.00', 1, '2022-11-27 03:55:00', '55.00', 'phone6', 1, ''),
(61, 'kajol rice6', 'kajol rice6', '900.00', '1234.00', 1, '2022-11-27 03:58:00', '4.00', 'kajol rice6', 1, ''),
(62, 'kajol rice7', 'kajol rice7', '77.00', '88.00', 7, '2022-11-27 09:41:00', '7.00', 'kajol rice7', 1, ''),
(63, 'iphone7', 'iphone7', '0.00', '77.00', 88, '2022-11-27 10:10:00', '0.00', 'iphone7', 1, ''),
(64, 'coca cola ', 'coca cola  description', '4.00', '5.00', 1, '2022-11-28 23:44:00', '3.00', 'coca cola ', 1, ''),
(65, 'কাজল লতা চাউল ', 'গোল্ডেন কাজল লতা চাল(golden kajol lata chal) ৫ কেজি।আজকের বাজার দাম', '1600.00', '1800.00', 10, '2022-11-30 13:47:00', '50.00', 'কাজল লতা চাউল ', 1, ''),
(66, 'pran', 'pran', '99.00', '990.00', 97, '2022-11-30 13:52:00', '0.00', 'pran', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `product_id`, `category_id`) VALUES
(131, 17, 4),
(77, 29, 2),
(146, 40, 2),
(147, 41, 2),
(151, 43, 6),
(170, 49, 4),
(171, 50, 4),
(172, 51, 4),
(173, 52, 4),
(174, 53, 4),
(175, 54, 1),
(176, 55, 1),
(177, 56, 1),
(178, 57, 1),
(179, 59, 4),
(180, 60, 4),
(181, 61, 1),
(182, 62, 1),
(183, 63, 2),
(185, 64, 7),
(186, 65, 6),
(187, 66, 6);

-- --------------------------------------------------------

--
-- Table structure for table `products_categories2`
--

CREATE TABLE `products_categories2` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_categories2`
--

INSERT INTO `products_categories2` (`id`, `product_id`, `category_id`) VALUES
(1, 65, 1),
(2, 66, 3),
(3, 64, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_downloads`
--

CREATE TABLE `products_downloads` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products_media`
--

CREATE TABLE `products_media` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products_media`
--

INSERT INTO `products_media` (`id`, `product_id`, `media_id`, `position`) VALUES
(30, 29, 2, 1),
(36, 17, 9, 1),
(42, 40, 6, 1),
(43, 41, 3, 1),
(45, 43, 8, 1),
(50, 48, 8, 1),
(51, 49, 9, 1),
(52, 50, 9, 1),
(53, 51, 9, 1),
(54, 52, 9, 1),
(55, 53, 9, 1),
(56, 54, 8, 1),
(57, 55, 8, 1),
(58, 56, 8, 1),
(59, 57, 8, 1),
(60, 58, 8, 1),
(61, 59, 9, 1),
(62, 60, 9, 1),
(63, 61, 8, 1),
(64, 62, 8, 1),
(65, 63, 9, 1),
(66, 64, 10, 1),
(67, 65, 8, 1),
(68, 66, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE `products_options` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `price_modifier` enum('add','subtract') NOT NULL,
  `weight` decimal(7,2) NOT NULL,
  `weight_modifier` enum('add','subtract') NOT NULL,
  `type` enum('select','radio','checkbox','text','datetime') NOT NULL,
  `required` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `my_name` text NOT NULL,
  `dokan_name` varchar(100) NOT NULL,
  `dokan_location` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `phone_number`, `my_name`, `dokan_name`, `dokan_location`, `comment`) VALUES
(1, 'mahmud', 'mdmahmudor@gmail.com', '498d573a09f54bc9f481dfaee3ac7f35', '', ''),
(2, 'ariful5', 'healthfident@gmail.com', '0c946b12898df7bcdba4a56f0c5f6662', '', ''),
(3, '', '', '', '', ''),
(4, '', '', '', '', ''),
(5, '', '', '', '', ''),
(6, '', '', '', '', ''),
(7, '68789870', 'jkl', 'jkl', 'jhlk', 'hljk'),
(8, '', '', '', '', ''),
(9, '980', 'uyjhkhjg', 'ghkghj', 'hgjk', 'hfk'),
(10, '76879', 'gfhk', 'fjhgkhgjk', 'gjhk', 'jhgk'),
(11, '980', 'uyjhkhjg', 'ghkghj', 'hgjk', 'hfk'),
(12, '544', '', 'sssss', 'ssss', 'ssss'),
(13, '678679', 'dddd', 'dd', 'dd', 'ddd'),
(14, '789', 'gfh', 'gfhj', 'fjhg', 'fjg'),
(19, '', '', '', '', ''),
(26, '', '', '', '', ''),
(27, '67586', 'gfhk', 'ytut', 'tuyr', 'yturi'),
(28, '67586', 'gfhk', 'ytut', 'tuyr', 'yturi'),
(29, '67586', 'gfhk', 'ytut', 'tuyr', 'yturi'),
(30, '87908', 'gfhk', 'ytut', 'tuyr', 'yturi'),
(31, '56756', 'ytuytr', 'truy', 'tyur', 'truy'),
(32, '7898670', 'jhk', 'hjgk', 'gjhk', 'hjgk'),
(33, '6786797809', 'mukit@gmail.com', 'mukit@gmail.com', 'mukit@gmail.com', 'mukit@gmail.com'),
(34, '', 'njk', 'gjhljk', 'gjkl', ''),
(35, '', 'gfk', 'hfjk', 'fhk', ''),
(36, '', 'hgjkfhk', 'hkgfjf', 'fhjk', ''),
(37, '', 'hgjkfhk', 'hkgfjf', 'fhjk', ''),
(38, '', 'hgjkfhk', 'hkgfjf', 'fhjk', ''),
(39, '98098-', 'jhkgl', 'hjlk', 'hgjl', ''),
(40, '9090', 'kkkk', 'kkkk', 'kkkk', ''),
(41, '9090', 'kkkk', 'kkkk', 'kkkk', ''),
(42, '01785699069', 'dfg', 'dfg', 'gdf', ''),
(43, '01785699069', 'dfg', 'dfg', 'gdf', ''),
(44, '01785699021', 'gfhk', 'fjhgkhgjk', 'uiyo', ''),
(45, '01785699068', 'mahmud', '', '', ''),
(46, '01785699067', 'mahmud', '', '', ''),
(47, '01785699067', 'mahmud', '', '', ''),
(48, '01785699066', 'mahmud', 'mdstore', 'patta.md', ''),
(49, '01785699065', 'mahmud', 'ytut', 'dg', ''),
(50, '01785699064', 'gfhk', 'ytut', 'tuyr', ''),
(51, '01785699064', 'gfhk', 'ytut', 'tuyr', ''),
(52, '01785699063', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(53, '01785699069', 'gfhk', 'fjhgkhgjk', 'gjhk', ''),
(54, '01785699069', 'gfhk', 'fjhgkhgjk', 'tuyr', ''),
(55, '01785699064', 'gfhk', 'fjhgkhgjk', 'gjhk', ''),
(56, '01785699062', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(57, '01785699061', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(58, '01785699061', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(59, '01785699060', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(60, '01785699059', 'mahmud', 'fjhgkhgjk', 'gjhk', ''),
(61, '01785699058', 'fyu7if', 'hjfk', 'hjk', ''),
(62, '01785699057', 'mahmud', 'ytut', 'gjhk', ''),
(63, '017856990699', 'mahmud', 'fjhgkhgjk', 'gjhk', '');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Single Product','Entire Order') NOT NULL DEFAULT 'Single Product',
  `countries` varchar(255) NOT NULL DEFAULT '',
  `price_from` decimal(7,2) NOT NULL,
  `price_to` decimal(7,2) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `weight_from` decimal(7,2) NOT NULL DEFAULT 0.00,
  `weight_to` decimal(7,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `type`, `countries`, `price_from`, `price_to`, `price`, `weight_from`, `weight_to`) VALUES
(1, 'Standard', 'Entire Order', '', '0.00', '99999.00', '3.99', '0.00', '99999.00'),
(2, 'Express', 'Entire Order', '', '0.00', '99999.00', '7.99', '0.00', '99999.00');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `country`, `rate`) VALUES
(1, 'United Kingdom', '20.00');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `created` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `address_street` varchar(255) NOT NULL DEFAULT '',
  `address_city` varchar(100) NOT NULL DEFAULT '',
  `address_state` varchar(100) NOT NULL DEFAULT '',
  `address_zip` varchar(50) NOT NULL DEFAULT '',
  `address_country` varchar(100) NOT NULL DEFAULT '',
  `account_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'website',
  `shipping_method` varchar(255) NOT NULL DEFAULT '',
  `shipping_amount` decimal(7,2) NOT NULL DEFAULT 0.00,
  `discount_code` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `txn_id`, `payment_amount`, `payment_status`, `created`, `payer_email`, `first_name`, `last_name`, `address_street`, `address_city`, `address_state`, `address_zip`, `address_country`, `account_id`, `payment_method`, `shipping_method`, `shipping_amount`, `discount_code`) VALUES
(1, 'SC63737BC5F21FB9C22E', '269.99', 'Completed', '2022-11-15 12:45:09', 'arif@gmail.com', '', '', '', '', '', '', '', 2, 'website', '', '0.00', ''),
(2, 'SC63737C62D50A93CEA9', '539.98', 'Completed', '2022-11-15 12:47:46', 'arif@gmail.com', '', '', '', '', '', '', '', 2, 'website', '', '0.00', ''),
(3, 'SC637411AF7CA214CA70', '269.99', 'Completed', '2022-11-15 23:24:47', 'arif@gmail.com', '', '', '', '', '', '', '', 2, 'website', '', '0.00', ''),
(4, 'SC63747D69ADC495FED5', '269.99', 'Completed', '2022-11-16 07:04:25', 'mukit@gmail.com', '', '', '', '', '', '', '', 6, 'website', '', '0.00', ''),
(5, 'SC637D8B4B2B25E45536', '269.99', 'Pending', '2022-11-23 03:54:00', 'arif6@gmail.com', '', '', '', '', '', '', 'Afghanistan', 7, 'website', '', '0.00', ''),
(6, 'SC637F39DD34E33C5FA1', '384.93', 'Completed', '2022-11-24 10:31:09', 'admin@website.com', '', '', '', '', '', '', '', 1, 'website', '', '0.00', ''),
(7, 'SC637F3C558B65C95A7C', '39.98', 'Completed', '2022-11-24 10:41:41', 'mdmahmudor@gmail.com', '', '', '', '', '', '', '', 3, 'website', '', '0.00', ''),
(8, 'SC637F3C6657C3AA81D8', '19.99', 'Completed', '2022-11-24 10:41:58', 'mdmahmudor@gmail.com', '', '', '', '', '', '', '', 3, 'website', '', '0.00', ''),
(9, 'SC6381751BD608E6251D', '7594.96', 'Completed', '2022-11-26 03:08:27', 'admin@website.com', '', '', '', '', '', '', '', 1, 'website', '', '0.00', ''),
(10, 'SC6384C4ED0766E68AEA', '77.00', 'Shipped', '2022-11-28 14:25:00', 'infoarifulislam121@gmail.com', '', '', '', '', '', '', 'Afghanistan', 11, 'website', '', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `transactions_items`
--

CREATE TABLE `transactions_items` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_price` decimal(7,2) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_options` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions_items`
--

INSERT INTO `transactions_items` (`id`, `txn_id`, `item_id`, `item_price`, `item_quantity`, `item_options`) VALUES
(1, 'SC63737BC5F21FB9C22E', 4, '269.99', 1, ''),
(2, 'SC63737C62D50A93CEA9', 4, '269.99', 2, ''),
(3, 'SC637411AF7CA214CA70', 4, '269.99', 1, ''),
(4, 'SC63747D69ADC495FED5', 4, '269.99', 1, ''),
(5, 'SC637D8B4B2B25E45536', 4, '269.99', 1, ''),
(6, 'SC637F39DD34E33C5FA1', 4, '269.99', 1, ''),
(7, 'SC637F39DD34E33C5FA1', 2, '14.99', 1, ''),
(8, 'SC637F39DD34E33C5FA1', 3, '19.99', 5, ''),
(9, 'SC637F3C558B65C95A7C', 3, '19.99', 2, ''),
(10, 'SC637F3C6657C3AA81D8', 3, '19.99', 1, ''),
(11, 'SC6381751BD608E6251D', 2, '14.99', 2, ''),
(12, 'SC6381751BD608E6251D', 1, '64.98', 1, 'Size-Small,Type-Deluxe,Color-Red,Color-Yellow,Color-Blue,Color-Purple,Color-Brown'),
(13, 'SC6381751BD608E6251D', 6, '1500.00', 5, ''),
(14, 'SC6384C4ED0766E68AEA', 62, '77.00', 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories2`
--
ALTER TABLE `categories2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`category_id`);

--
-- Indexes for table `products_categories2`
--
ALTER TABLE `products_categories2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_downloads`
--
ALTER TABLE `products_downloads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`file_path`);

--
-- Indexes for table `products_media`
--
ALTER TABLE `products_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`title`,`name`) USING BTREE;

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `txn_id` (`txn_id`);

--
-- Indexes for table `transactions_items`
--
ALTER TABLE `transactions_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories2`
--
ALTER TABLE `categories2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `products_categories2`
--
ALTER TABLE `products_categories2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products_downloads`
--
ALTER TABLE `products_downloads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_media`
--
ALTER TABLE `products_media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `products_options`
--
ALTER TABLE `products_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions_items`
--
ALTER TABLE `transactions_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
