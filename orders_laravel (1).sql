-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2018 at 02:46 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orders_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Egypt', 1, '2018-03-14 05:22:37', '2018-03-14 05:22:37'),
(2, 'UAE', 1, '2018-03-14 05:22:45', '2018-03-14 05:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb_page_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `country_id`, `address`, `fb_page_link`, `created_at`, `updated_at`) VALUES
(1, 'Omar Customer', '1144199331', 1, 'sheraton\r\nMaadi', 'uhguu', '2018-04-05 08:05:48', '2018-04-05 08:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '', 2),
(3, 1, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, '', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 1, 0, 1, 1, 1, 1, '', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"}}', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '', 3),
(29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '', 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '', 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '', 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '', 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '', 4),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '', 6),
(45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 7),
(46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '', 1),
(47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '', 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '', 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '', 4),
(50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '', 5),
(51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '', 14),
(52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '', 15),
(53, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '', 9),
(54, 7, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(55, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(56, 7, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 3),
(57, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 1, 1, NULL, 4),
(58, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(59, 8, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(60, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(61, 8, 'phone', 'text', 'Phone', 1, 1, 1, 1, 1, 1, NULL, 3),
(62, 8, 'country_id', 'number', 'Country Id', 1, 1, 1, 1, 1, 1, NULL, 4),
(63, 8, 'address', 'text_area', 'Address', 1, 1, 1, 1, 1, 1, NULL, 5),
(64, 8, 'fb_page_link', 'text_area', 'Fb Page Link', 1, 1, 1, 1, 1, 1, NULL, 6),
(65, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 7),
(66, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 8),
(67, 9, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(68, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(69, 9, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 3),
(70, 9, 'country_id', 'number', 'Country Id', 1, 1, 1, 1, 1, 1, NULL, 4),
(71, 9, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 5),
(72, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(73, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(74, 10, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(75, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(76, 10, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 3),
(77, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(78, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(79, 11, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(80, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(81, 11, 'value', 'number', 'Value', 1, 1, 1, 1, 1, 1, NULL, 3),
(82, 11, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(83, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(84, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(85, 12, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(86, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(87, 12, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 3),
(88, 12, 'discount_id', 'number', 'Discount Id', 1, 0, 0, 0, 0, 0, NULL, 4),
(89, 12, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 5),
(90, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(91, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(92, 13, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 0),
(93, 13, 'order_id', 'text', 'Order Id', 1, 0, 0, 0, 0, 0, NULL, 2),
(94, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 3),
(95, 13, 'full_path', 'text_area', 'Full Path', 1, 1, 1, 1, 1, 1, NULL, 4),
(96, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(97, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(98, 14, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 0),
(99, 14, 'order_id', 'checkbox', 'Order Id', 1, 0, 0, 0, 0, 0, NULL, 2),
(100, 14, 'product_id', 'checkbox', 'Product Id', 1, 0, 0, 0, 0, 0, NULL, 3),
(101, 14, 'face_id', 'checkbox', 'Face Id', 1, 0, 0, 0, 0, 0, NULL, 4),
(102, 14, 'discount_id', 'checkbox', 'Discount Id', 1, 0, 0, 0, 0, 0, NULL, 5),
(103, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(104, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(105, 15, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 0),
(106, 15, 'order_id', 'checkbox', 'Order Id', 1, 0, 0, 0, 0, 0, NULL, 2),
(107, 15, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 3),
(108, 15, 'full_path', 'text_area', 'Full Path', 1, 1, 1, 1, 1, 1, NULL, 4),
(109, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(110, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(111, 16, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(112, 16, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(113, 16, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 3),
(114, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(115, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(116, 17, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(117, 17, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(118, 17, 'country_id', 'checkbox', 'Country Id', 1, 0, 0, 0, 0, 0, NULL, 3),
(119, 17, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(120, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(121, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(122, 18, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(123, 18, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(124, 18, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 3),
(125, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(126, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(127, 19, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(128, 19, 'customer_id', 'checkbox', 'Customer Id', 1, 0, 0, 0, 0, 0, NULL, 2),
(129, 19, 'serial', 'text', 'Serial', 1, 1, 1, 1, 1, 1, NULL, 3),
(130, 19, 'country_id', 'checkbox', 'Country Id', 1, 0, 0, 0, 0, 0, NULL, 4),
(131, 19, 'work_place_id', 'checkbox', 'Work Place Id', 1, 0, 0, 0, 0, 0, NULL, 5),
(132, 19, 'urgent_id', 'checkbox', 'Urgent Id', 1, 0, 0, 0, 0, 0, NULL, 6),
(133, 19, 'discount_id', 'checkbox', 'Discount Id', 1, 0, 0, 0, 0, 0, NULL, 7),
(134, 19, 'down_payment', 'number', 'Down Payment', 1, 1, 1, 1, 1, 1, NULL, 8),
(135, 19, 'tag', 'text', 'Tag', 1, 1, 1, 1, 1, 1, NULL, 9),
(136, 19, 'status_id', 'checkbox', 'Status Id', 1, 0, 0, 0, 0, 0, NULL, 10),
(137, 19, 'status_updated_at', 'text', 'Status Updated At', 1, 1, 1, 1, 1, 1, NULL, 11),
(138, 19, 'status_updated_by', 'number', 'Status Updated By', 1, 1, 1, 1, 1, 1, NULL, 12),
(139, 19, 'order_type_id', 'checkbox', 'Order Type Id', 1, 0, 0, 0, 0, 0, NULL, 13),
(140, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 14),
(141, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 15),
(142, 19, 'added_by', 'number', 'Added By', 1, 1, 1, 1, 1, 1, NULL, 16),
(143, 19, 'ordering_type_id', 'checkbox', 'Ordering Type Id', 1, 0, 0, 0, 0, 0, NULL, 17),
(144, 19, 'ordering_location_id', 'checkbox', 'Ordering Location Id', 1, 0, 0, 0, 0, 0, NULL, 18),
(145, 19, 'delevery_type_id', 'checkbox', 'Delevery Type Id', 1, 0, 0, 0, 0, 0, NULL, 19),
(146, 19, 'delevery_date', 'text', 'Delevery Date', 1, 1, 1, 1, 1, 1, NULL, 20),
(147, 19, 'delevery_destination_id', 'checkbox', 'Delevery Destination Id', 1, 0, 0, 0, 0, 0, NULL, 21),
(148, 19, 'delevery_address', 'text_area', 'Delevery Address', 1, 1, 1, 1, 1, 1, NULL, 22),
(149, 19, 'general_note', 'rich_text_box', 'General Note', 1, 1, 1, 1, 1, 1, NULL, 23),
(150, 19, 'general_note_by', 'number', 'General Note By', 1, 1, 1, 1, 1, 1, NULL, 24),
(151, 19, 'general_note_Date', 'text', 'General Note Date', 1, 1, 1, 1, 1, 1, NULL, 25),
(152, 19, 'admin_note', 'rich_text_box', 'Admin Note', 1, 1, 1, 1, 1, 1, NULL, 26),
(153, 19, 'admin_note_by', 'number', 'Admin Note By', 1, 1, 1, 1, 1, 1, NULL, 27),
(154, 19, 'admin_note_date', 'text', 'Admin Note Date', 1, 1, 1, 1, 1, 1, NULL, 28),
(155, 19, 'designer_note', 'rich_text_box', 'Designer Note', 1, 1, 1, 1, 1, 1, NULL, 29),
(156, 19, 'designer_note_by', 'number', 'Designer Note By', 1, 1, 1, 1, 1, 1, NULL, 30),
(157, 19, 'designer_note_date', 'text', 'Designer Note Date', 1, 1, 1, 1, 1, 1, NULL, 31),
(158, 19, 'sales_note', 'rich_text_box', 'Sales Note', 1, 1, 1, 1, 1, 1, NULL, 32),
(159, 19, 'sales_note_by', 'number', 'Sales Note By', 1, 1, 1, 1, 1, 1, NULL, 33),
(160, 19, 'sales_note_date', 'text', 'Sales Note Date', 1, 1, 1, 1, 1, 1, NULL, 34),
(161, 19, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 35),
(162, 20, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(163, 20, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(164, 20, 'details', 'text_area', 'Details', 1, 1, 1, 1, 1, 1, NULL, 3),
(165, 20, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 4),
(166, 20, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 5),
(167, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(168, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(169, 21, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(170, 21, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(171, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 3),
(172, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(173, 23, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 0),
(174, 23, 'order_id', 'checkbox', 'Order Id', 1, 0, 0, 0, 0, 0, NULL, 2),
(175, 23, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 3),
(176, 23, 'full_path', 'text', 'Full Path', 1, 1, 1, 1, 1, 1, NULL, 4),
(177, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(178, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(179, 24, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(180, 24, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(181, 24, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 3),
(182, 24, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(183, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(184, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(187, 7, 'country_hasmany_customer_relationship', 'relationship', 'customers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"hasMany\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 6),
(189, 8, 'customer_belongsto_country_relationship', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 9),
(190, 9, 'delivery_area_belongsto_country_relationship', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 8),
(191, 27, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(193, 27, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 3),
(194, 27, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(195, 27, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(196, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(197, 28, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(198, 28, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 2),
(199, 28, 'country_id', 'hidden', 'Country Id', 1, 1, 1, 1, 1, 1, NULL, 3),
(200, 28, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 5),
(201, 28, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 6),
(202, 28, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(205, 28, 'face_price_belongsto_country_relationship', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 8),
(206, 31, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(207, 31, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(208, 31, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 3),
(209, 31, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 4),
(210, 31, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 5),
(211, 33, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(212, 33, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 2),
(213, 33, 'country_id', 'checkbox', 'Country Id', 1, 1, 1, 1, 1, 1, NULL, 3),
(214, 33, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(215, 33, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(216, 33, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(217, 33, 'urgent_fee_belongsto_country_relationship', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 7),
(218, 34, 'id', 'checkbox', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(219, 34, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, NULL, 2),
(220, 34, 'country_id', 'checkbox', 'Country Id', 1, 1, 1, 1, 1, 1, NULL, 3),
(221, 34, 'active', 'checkbox', 'Active', 1, 1, 1, 1, 1, 1, NULL, 4),
(222, 34, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, NULL, 5),
(223, 34, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(225, 34, 'urgent_fee_belongsto_country_relationship_1', 'relationship', 'countries', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Country\",\"table\":\"countries\",\"type\":\"belongsTo\",\"column\":\"country_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, '2018-03-13 07:14:11', '2018-03-13 07:14:11'),
(7, 'countries', 'countries', 'Country', 'Countries', NULL, 'App\\Country', NULL, NULL, NULL, 1, 0, '2018-03-13 07:19:47', '2018-03-13 07:19:47'),
(8, 'customers', 'customers', 'Customer', 'Customers', NULL, 'App\\Customer', NULL, NULL, NULL, 1, 0, '2018-03-13 07:20:41', '2018-03-13 07:20:41'),
(9, 'delivery_areas', 'delivery-areas', 'Delivery Area', 'Delivery Areas', NULL, 'App\\DeliveryArea', NULL, NULL, NULL, 1, 0, '2018-03-13 07:21:14', '2018-03-13 07:21:14'),
(10, 'delivery_types', 'delivery-types', 'Delivery Type', 'Delivery Types', NULL, 'App\\DeliveryType', NULL, NULL, NULL, 1, 0, '2018-03-13 07:21:28', '2018-03-13 07:21:28'),
(11, 'discounts', 'discounts', 'Discount', 'Discounts', NULL, 'App\\Discount', NULL, NULL, NULL, 1, 0, '2018-03-13 07:21:46', '2018-03-13 07:21:46'),
(12, 'item_faces', 'item-faces', 'Item Face', 'Item Faces', NULL, 'App\\ItemFace', NULL, NULL, NULL, 1, 0, '2018-03-13 07:22:12', '2018-03-13 07:22:12'),
(13, 'order_customer_images', 'order-customer-images', 'Order Customer Image', 'Order Customer Images', NULL, 'App\\OrderCustomerImage', NULL, NULL, NULL, 1, 0, '2018-03-13 07:23:36', '2018-03-13 07:23:36'),
(14, 'order_items', 'order-items', 'Order Item', 'Order Items', NULL, 'App\\OrderItem', NULL, NULL, NULL, 1, 0, '2018-03-13 07:24:55', '2018-03-13 07:24:55'),
(15, 'order_sample_images', 'order-sample-images', 'Order Sample Image', 'Order Sample Images', NULL, 'App\\OrderSampleImage', NULL, NULL, NULL, 1, 0, '2018-03-13 07:25:55', '2018-03-13 07:25:55'),
(16, 'order_types', 'order-types', 'Order Type', 'Order Types', NULL, 'App\\OrderType', NULL, NULL, NULL, 1, 0, '2018-03-13 07:26:23', '2018-03-13 07:26:23'),
(17, 'ordering_locations', 'ordering-locations', 'Ordering Location', 'Ordering Locations', NULL, 'App\\OrderingLocation', NULL, NULL, NULL, 1, 0, '2018-03-13 07:27:59', '2018-03-13 07:27:59'),
(18, 'ordering_types', 'ordering-types', 'Ordering Type', 'Ordering Types', NULL, 'App\\OrderingType', NULL, NULL, NULL, 1, 0, '2018-03-13 07:37:49', '2018-03-13 07:37:49'),
(19, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '2018-03-14 05:18:37', '2018-03-14 05:18:37'),
(20, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '2018-03-14 05:18:59', '2018-03-14 05:18:59'),
(21, 'statuses', 'statuses', 'Status', 'Statuses', NULL, 'App\\Status', NULL, NULL, NULL, 1, 0, '2018-03-14 05:19:16', '2018-03-14 05:19:16'),
(23, 'psd_files', 'psd-files', 'Psd File', 'Psd Files', NULL, 'App\\PsdFile', NULL, NULL, NULL, 1, 0, '2018-03-14 05:20:19', '2018-03-14 05:20:19'),
(24, 'urgents', 'urgents', 'Urgent', 'Urgents', NULL, 'App\\Urgent', NULL, NULL, NULL, 1, 0, '2018-03-14 05:20:38', '2018-03-14 05:20:38'),
(27, 'face_price', 'face-price', 'Face Price', 'Face Prices', NULL, 'App\\FacePrice', NULL, NULL, NULL, 1, 0, '2018-04-05 08:26:07', '2018-04-05 08:26:07'),
(28, 'face_prices', 'face-prices', 'Face Price', 'Face Prices', NULL, 'App\\FacePrice', NULL, NULL, NULL, 1, 0, '2018-04-05 08:31:57', '2018-04-05 08:31:57'),
(31, 'ordering_methods', 'ordering-methods', 'Ordering Method', 'Ordering Methods', NULL, 'App\\OrderingMethod', NULL, NULL, NULL, 1, 0, '2018-04-05 09:40:24', '2018-04-05 09:40:24'),
(33, 'urgent_fee', 'urgent-fee', 'Urgent Fee', 'Urgent Fees', NULL, 'App\\UrgentFee', NULL, NULL, NULL, 1, 0, '2018-04-05 11:24:15', '2018-04-05 11:24:15'),
(34, 'urgent_fees', 'urgent-fees', 'Urgent Fee', 'Urgent Fees', NULL, 'App\\UrgentFee', NULL, NULL, NULL, 1, 0, '2018-04-05 11:36:22', '2018-04-05 11:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_areas`
--

DROP TABLE IF EXISTS `delivery_areas`;
CREATE TABLE IF NOT EXISTS `delivery_areas` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `delivery_areas`
--

INSERT INTO `delivery_areas` (`id`, `name`, `price`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Nasr City', 50, 1, 1, '2018-04-05 08:07:56', '2018-04-05 08:07:56');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_types`
--

DROP TABLE IF EXISTS `delivery_types`;
CREATE TABLE IF NOT EXISTS `delivery_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `delivery_types`
--

INSERT INTO `delivery_types` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Pickup', 1, '2018-04-05 08:08:29', '2018-04-05 08:08:29'),
(2, 'Home Delivery', 1, '2018-04-05 08:08:39', '2018-04-05 08:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `name`, `value`, `active`, `created_at`, `updated_at`) VALUES
(1, '50%', 50, 1, '2018-04-05 08:15:53', '2018-04-05 08:15:53'),
(2, '20%', 20, 1, '2018-04-05 08:16:04', '2018-04-05 08:16:04');

-- --------------------------------------------------------

--
-- Table structure for table `face_prices`
--

DROP TABLE IF EXISTS `face_prices`;
CREATE TABLE IF NOT EXISTS `face_prices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `face_prices`
--

INSERT INTO `face_prices` (`id`, `price`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(2, 50, 1, 1, '2018-04-05 09:18:14', '2018-04-05 09:18:14'),
(3, 100, 2, 1, '2018-04-05 09:18:25', '2018-04-05 09:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2018-03-13 07:14:12', '2018-03-13 07:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2018-03-13 07:14:13', '2018-03-13 07:14:13', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2018-03-13 07:14:13', '2018-04-05 08:28:57', 'voyager.media.index', NULL),
(3, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2018-03-13 07:14:13', '2018-04-05 08:28:57', 'voyager.posts.index', NULL),
(4, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2018-03-13 07:14:13', '2018-03-13 07:14:13', 'voyager.users.index', NULL),
(5, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2018-03-13 07:14:13', '2018-04-05 08:28:57', 'voyager.categories.index', NULL),
(6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2018-03-13 07:14:13', '2018-04-05 08:28:57', 'voyager.pages.index', NULL),
(7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2018-03-13 07:14:13', '2018-03-13 07:14:13', 'voyager.roles.index', NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 8, '2018-03-13 07:14:13', '2018-04-05 08:28:58', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2018-03-13 07:14:13', '2018-04-05 08:28:58', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2018-03-13 07:14:13', '2018-04-05 08:28:58', 'voyager.database.index', NULL),
(11, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 8, 3, '2018-03-13 07:14:13', '2018-04-05 08:28:58', 'voyager.compass.index', NULL),
(12, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 9, '2018-03-13 07:14:13', '2018-04-05 08:28:58', 'voyager.settings.index', NULL),
(13, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 8, 4, '2018-03-13 07:14:18', '2018-04-05 08:28:58', 'voyager.hooks', NULL),
(14, 1, 'Countries', '/admin/countries', '_self', NULL, NULL, NULL, 10, '2018-03-13 07:19:47', '2018-04-05 08:28:58', NULL, NULL),
(15, 1, 'Customers', '/admin/customers', '_self', NULL, NULL, NULL, 11, '2018-03-13 07:20:42', '2018-04-05 08:28:58', NULL, NULL),
(16, 1, 'Delivery Areas', '/admin/delivery-areas', '_self', NULL, NULL, NULL, 12, '2018-03-13 07:21:14', '2018-04-05 08:28:58', NULL, NULL),
(17, 1, 'Delivery Types', '/admin/delivery-types', '_self', NULL, NULL, NULL, 13, '2018-03-13 07:21:28', '2018-04-05 08:28:58', NULL, NULL),
(18, 1, 'Discounts', '/admin/discounts', '_self', NULL, NULL, NULL, 14, '2018-03-13 07:21:46', '2018-04-05 08:28:58', NULL, NULL),
(20, 1, 'Order Customer Images', '/admin/order-customer-images', '_self', NULL, NULL, NULL, 17, '2018-03-13 07:23:36', '2018-04-05 12:15:00', NULL, NULL),
(21, 1, 'Order Items', '/admin/order-items', '_self', NULL, NULL, NULL, 18, '2018-03-13 07:24:56', '2018-04-05 12:15:00', NULL, NULL),
(22, 1, 'Order Sample Images', '/admin/order-sample-images', '_self', NULL, NULL, NULL, 19, '2018-03-13 07:25:55', '2018-04-05 12:15:00', NULL, NULL),
(23, 1, 'Order Types', '/admin/order-types', '_self', NULL, NULL, NULL, 20, '2018-03-13 07:26:24', '2018-04-05 12:15:00', NULL, NULL),
(24, 1, 'Ordering Locations', '/admin/ordering-locations', '_self', NULL, NULL, NULL, 21, '2018-03-13 07:27:59', '2018-04-05 12:15:00', NULL, NULL),
(25, 1, 'Ordering Methods', '/admin/ordering-methods', '_self', NULL, '#000000', NULL, 22, '2018-03-13 07:37:50', '2018-04-05 12:15:00', NULL, ''),
(26, 1, 'Orders', '/admin/orders', '_self', NULL, NULL, NULL, 23, '2018-03-14 05:18:37', '2018-04-05 12:15:00', NULL, NULL),
(27, 1, 'Products', '/admin/products', '_self', NULL, NULL, NULL, 24, '2018-03-14 05:18:59', '2018-04-05 12:15:00', NULL, NULL),
(28, 1, 'Statuses', '/admin/statuses', '_self', NULL, NULL, NULL, 25, '2018-03-14 05:19:16', '2018-04-05 12:15:00', NULL, NULL),
(29, 1, 'Psd Files', '/admin/psd-files', '_self', NULL, NULL, NULL, 26, '2018-03-14 05:20:19', '2018-04-05 12:15:00', NULL, NULL),
(32, 1, 'Face Prices', '/admin/face-prices', '_self', NULL, NULL, NULL, 16, '2018-04-05 08:31:58', '2018-04-05 12:15:00', NULL, NULL),
(34, 1, 'Urgent Fees', '/admin/urgent-fees', '_self', NULL, NULL, NULL, 15, '2018-04-05 11:36:22', '2018-04-05 12:15:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(70, '2014_10_12_000000_create_users_table', 1),
(71, '2014_10_12_100000_create_password_resets_table', 1),
(72, '2016_01_01_000000_add_voyager_user_fields', 1),
(73, '2016_01_01_000000_create_data_types_table', 1),
(74, '2016_01_01_000000_create_pages_table', 1),
(75, '2016_01_01_000000_create_posts_table', 1),
(76, '2016_02_15_204651_create_categories_table', 1),
(77, '2016_05_19_173453_create_menu_table', 1),
(78, '2016_10_21_190000_create_roles_table', 1),
(79, '2016_10_21_190000_create_settings_table', 1),
(80, '2016_11_30_135954_create_permission_table', 1),
(81, '2016_11_30_141208_create_permission_role_table', 1),
(82, '2016_12_26_201236_data_types__add__server_side', 1),
(83, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(84, '2017_01_14_005015_create_translations_table', 1),
(85, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(86, '2017_01_15_000000_create_permission_groups_table', 1),
(87, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(88, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(89, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(90, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(91, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(92, '2017_08_05_000000_add_group_to_settings_table', 1),
(93, '2018_03_11_140322_create_orders_table', 1),
(94, '2018_03_12_131321_create_customers_table', 1),
(95, '2018_03_12_131742_create_countries_table', 1),
(96, '2018_03_12_131917_create_work_places_table', 1),
(97, '2018_03_12_132045_create_urgents_table', 1),
(98, '2018_03_12_143409_create_discounts_table', 1),
(99, '2018_03_12_143646_create_statuses_table', 1),
(100, '2018_03_12_143737_create_order_types_table', 1),
(101, '2018_03_12_144241_create_ordering_types_table', 1),
(102, '2018_03_12_144317_create_ordering_locations_table', 1),
(103, '2018_03_12_144958_create_delivery_types_table', 1),
(104, '2018_03_12_145108_create_delivery_areas_table', 1),
(105, '2018_03_13_080105_create_order_customer_images_table', 1),
(106, '2018_03_13_080825_create_order_sample_images_table', 1),
(107, '2018_03_13_081312_create_psd_files_table', 1),
(108, '2018_03_13_081354_create_products_table', 1),
(109, '2018_03_13_081748_create_order_items_table', 1),
(110, '2018_03_13_084500_create_item_faces_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordering_locations`
--

DROP TABLE IF EXISTS `ordering_locations`;
CREATE TABLE IF NOT EXISTS `ordering_locations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `ordering_methods`
--

DROP TABLE IF EXISTS `ordering_methods`;
CREATE TABLE IF NOT EXISTS `ordering_methods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ordering_methods`
--

INSERT INTO `ordering_methods` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Partion', 1, '2018-04-05 09:40:55', '2018-04-05 09:40:55'),
(2, 'Facebook', 1, '2018-04-05 09:41:06', '2018-04-05 09:41:06'),
(3, 'Whats App', 1, '2018-04-05 09:41:00', '2018-04-05 09:41:23');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `serial` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `work_place_id` int(11) NOT NULL,
  `urgent_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `down_payment` double(8,2) NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(11) NOT NULL,
  `status_updated_at` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_updated_by` int(11) NOT NULL,
  `order_type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `ordering_type_id` int(11) NOT NULL,
  `ordering_location_id` int(11) NOT NULL,
  `delevery_type_id` int(11) NOT NULL,
  `delevery_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delevery_destination_id` int(11) NOT NULL,
  `delevery_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `general_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `general_note_by` int(11) NOT NULL,
  `general_note_Date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_note_by` int(11) NOT NULL,
  `admin_note_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designer_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `designer_note_by` int(11) NOT NULL,
  `designer_note_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sales_note_by` int(11) NOT NULL,
  `sales_note_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_customer_images`
--

DROP TABLE IF EXISTS `order_customer_images`;
CREATE TABLE IF NOT EXISTS `order_customer_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `face_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_sample_images`
--

DROP TABLE IF EXISTS `order_sample_images`;
CREATE TABLE IF NOT EXISTS `order_sample_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
CREATE TABLE IF NOT EXISTS `order_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `order_types`
--

INSERT INTO `order_types` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Normal Order', 1, '2018-04-05 12:45:37', '2018-04-05 12:45:37'),
(2, 'Co-Worker', 1, '2018-04-05 12:45:50', '2018-04-05 12:45:50'),
(3, 'Sample', 1, '2018-04-05 12:46:00', '2018-04-05 12:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(2, 'browse_database', NULL, '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(3, 'browse_media', NULL, '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(4, 'browse_compass', NULL, '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(5, 'browse_menus', 'menus', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(6, 'read_menus', 'menus', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(7, 'edit_menus', 'menus', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(8, 'add_menus', 'menus', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(9, 'delete_menus', 'menus', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(10, 'browse_pages', 'pages', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(11, 'read_pages', 'pages', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(12, 'edit_pages', 'pages', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(13, 'add_pages', 'pages', '2018-03-13 07:14:14', '2018-03-13 07:14:14', NULL),
(14, 'delete_pages', 'pages', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(15, 'browse_roles', 'roles', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(16, 'read_roles', 'roles', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(17, 'edit_roles', 'roles', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(18, 'add_roles', 'roles', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(19, 'delete_roles', 'roles', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(20, 'browse_users', 'users', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(21, 'read_users', 'users', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(22, 'edit_users', 'users', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(23, 'add_users', 'users', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(24, 'delete_users', 'users', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(25, 'browse_posts', 'posts', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(26, 'read_posts', 'posts', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(27, 'edit_posts', 'posts', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(28, 'add_posts', 'posts', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(29, 'delete_posts', 'posts', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(30, 'browse_categories', 'categories', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(31, 'read_categories', 'categories', '2018-03-13 07:14:15', '2018-03-13 07:14:15', NULL),
(32, 'edit_categories', 'categories', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(33, 'add_categories', 'categories', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(34, 'delete_categories', 'categories', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(35, 'browse_settings', 'settings', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(36, 'read_settings', 'settings', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(37, 'edit_settings', 'settings', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(38, 'add_settings', 'settings', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(39, 'delete_settings', 'settings', '2018-03-13 07:14:16', '2018-03-13 07:14:16', NULL),
(40, 'browse_hooks', NULL, '2018-03-13 07:14:18', '2018-03-13 07:14:18', NULL),
(41, 'browse_countries', 'countries', '2018-03-13 07:19:47', '2018-03-13 07:19:47', NULL),
(42, 'read_countries', 'countries', '2018-03-13 07:19:47', '2018-03-13 07:19:47', NULL),
(43, 'edit_countries', 'countries', '2018-03-13 07:19:47', '2018-03-13 07:19:47', NULL),
(44, 'add_countries', 'countries', '2018-03-13 07:19:47', '2018-03-13 07:19:47', NULL),
(45, 'delete_countries', 'countries', '2018-03-13 07:19:47', '2018-03-13 07:19:47', NULL),
(46, 'browse_customers', 'customers', '2018-03-13 07:20:41', '2018-03-13 07:20:41', NULL),
(47, 'read_customers', 'customers', '2018-03-13 07:20:41', '2018-03-13 07:20:41', NULL),
(48, 'edit_customers', 'customers', '2018-03-13 07:20:41', '2018-03-13 07:20:41', NULL),
(49, 'add_customers', 'customers', '2018-03-13 07:20:41', '2018-03-13 07:20:41', NULL),
(50, 'delete_customers', 'customers', '2018-03-13 07:20:42', '2018-03-13 07:20:42', NULL),
(51, 'browse_delivery_areas', 'delivery_areas', '2018-03-13 07:21:14', '2018-03-13 07:21:14', NULL),
(52, 'read_delivery_areas', 'delivery_areas', '2018-03-13 07:21:14', '2018-03-13 07:21:14', NULL),
(53, 'edit_delivery_areas', 'delivery_areas', '2018-03-13 07:21:14', '2018-03-13 07:21:14', NULL),
(54, 'add_delivery_areas', 'delivery_areas', '2018-03-13 07:21:14', '2018-03-13 07:21:14', NULL),
(55, 'delete_delivery_areas', 'delivery_areas', '2018-03-13 07:21:14', '2018-03-13 07:21:14', NULL),
(56, 'browse_delivery_types', 'delivery_types', '2018-03-13 07:21:28', '2018-03-13 07:21:28', NULL),
(57, 'read_delivery_types', 'delivery_types', '2018-03-13 07:21:28', '2018-03-13 07:21:28', NULL),
(58, 'edit_delivery_types', 'delivery_types', '2018-03-13 07:21:28', '2018-03-13 07:21:28', NULL),
(59, 'add_delivery_types', 'delivery_types', '2018-03-13 07:21:28', '2018-03-13 07:21:28', NULL),
(60, 'delete_delivery_types', 'delivery_types', '2018-03-13 07:21:28', '2018-03-13 07:21:28', NULL),
(61, 'browse_discounts', 'discounts', '2018-03-13 07:21:46', '2018-03-13 07:21:46', NULL),
(62, 'read_discounts', 'discounts', '2018-03-13 07:21:46', '2018-03-13 07:21:46', NULL),
(63, 'edit_discounts', 'discounts', '2018-03-13 07:21:46', '2018-03-13 07:21:46', NULL),
(64, 'add_discounts', 'discounts', '2018-03-13 07:21:46', '2018-03-13 07:21:46', NULL),
(65, 'delete_discounts', 'discounts', '2018-03-13 07:21:46', '2018-03-13 07:21:46', NULL),
(66, 'browse_item_faces', 'item_faces', '2018-03-13 07:22:12', '2018-03-13 07:22:12', NULL),
(67, 'read_item_faces', 'item_faces', '2018-03-13 07:22:12', '2018-03-13 07:22:12', NULL),
(68, 'edit_item_faces', 'item_faces', '2018-03-13 07:22:12', '2018-03-13 07:22:12', NULL),
(69, 'add_item_faces', 'item_faces', '2018-03-13 07:22:12', '2018-03-13 07:22:12', NULL),
(70, 'delete_item_faces', 'item_faces', '2018-03-13 07:22:12', '2018-03-13 07:22:12', NULL),
(71, 'browse_order_customer_images', 'order_customer_images', '2018-03-13 07:23:36', '2018-03-13 07:23:36', NULL),
(72, 'read_order_customer_images', 'order_customer_images', '2018-03-13 07:23:36', '2018-03-13 07:23:36', NULL),
(73, 'edit_order_customer_images', 'order_customer_images', '2018-03-13 07:23:36', '2018-03-13 07:23:36', NULL),
(74, 'add_order_customer_images', 'order_customer_images', '2018-03-13 07:23:36', '2018-03-13 07:23:36', NULL),
(75, 'delete_order_customer_images', 'order_customer_images', '2018-03-13 07:23:36', '2018-03-13 07:23:36', NULL),
(76, 'browse_order_items', 'order_items', '2018-03-13 07:24:56', '2018-03-13 07:24:56', NULL),
(77, 'read_order_items', 'order_items', '2018-03-13 07:24:56', '2018-03-13 07:24:56', NULL),
(78, 'edit_order_items', 'order_items', '2018-03-13 07:24:56', '2018-03-13 07:24:56', NULL),
(79, 'add_order_items', 'order_items', '2018-03-13 07:24:56', '2018-03-13 07:24:56', NULL),
(80, 'delete_order_items', 'order_items', '2018-03-13 07:24:56', '2018-03-13 07:24:56', NULL),
(81, 'browse_order_sample_images', 'order_sample_images', '2018-03-13 07:25:55', '2018-03-13 07:25:55', NULL),
(82, 'read_order_sample_images', 'order_sample_images', '2018-03-13 07:25:55', '2018-03-13 07:25:55', NULL),
(83, 'edit_order_sample_images', 'order_sample_images', '2018-03-13 07:25:55', '2018-03-13 07:25:55', NULL),
(84, 'add_order_sample_images', 'order_sample_images', '2018-03-13 07:25:55', '2018-03-13 07:25:55', NULL),
(85, 'delete_order_sample_images', 'order_sample_images', '2018-03-13 07:25:55', '2018-03-13 07:25:55', NULL),
(86, 'browse_order_types', 'order_types', '2018-03-13 07:26:24', '2018-03-13 07:26:24', NULL),
(87, 'read_order_types', 'order_types', '2018-03-13 07:26:24', '2018-03-13 07:26:24', NULL),
(88, 'edit_order_types', 'order_types', '2018-03-13 07:26:24', '2018-03-13 07:26:24', NULL),
(89, 'add_order_types', 'order_types', '2018-03-13 07:26:24', '2018-03-13 07:26:24', NULL),
(90, 'delete_order_types', 'order_types', '2018-03-13 07:26:24', '2018-03-13 07:26:24', NULL),
(91, 'browse_ordering_locations', 'ordering_locations', '2018-03-13 07:27:59', '2018-03-13 07:27:59', NULL),
(92, 'read_ordering_locations', 'ordering_locations', '2018-03-13 07:27:59', '2018-03-13 07:27:59', NULL),
(93, 'edit_ordering_locations', 'ordering_locations', '2018-03-13 07:27:59', '2018-03-13 07:27:59', NULL),
(94, 'add_ordering_locations', 'ordering_locations', '2018-03-13 07:27:59', '2018-03-13 07:27:59', NULL),
(95, 'delete_ordering_locations', 'ordering_locations', '2018-03-13 07:27:59', '2018-03-13 07:27:59', NULL),
(96, 'browse_ordering_types', 'ordering_types', '2018-03-13 07:37:49', '2018-03-13 07:37:49', NULL),
(97, 'read_ordering_types', 'ordering_types', '2018-03-13 07:37:49', '2018-03-13 07:37:49', NULL),
(98, 'edit_ordering_types', 'ordering_types', '2018-03-13 07:37:49', '2018-03-13 07:37:49', NULL),
(99, 'add_ordering_types', 'ordering_types', '2018-03-13 07:37:49', '2018-03-13 07:37:49', NULL),
(100, 'delete_ordering_types', 'ordering_types', '2018-03-13 07:37:49', '2018-03-13 07:37:49', NULL),
(101, 'browse_orders', 'orders', '2018-03-14 05:18:37', '2018-03-14 05:18:37', NULL),
(102, 'read_orders', 'orders', '2018-03-14 05:18:37', '2018-03-14 05:18:37', NULL),
(103, 'edit_orders', 'orders', '2018-03-14 05:18:37', '2018-03-14 05:18:37', NULL),
(104, 'add_orders', 'orders', '2018-03-14 05:18:37', '2018-03-14 05:18:37', NULL),
(105, 'delete_orders', 'orders', '2018-03-14 05:18:37', '2018-03-14 05:18:37', NULL),
(106, 'browse_products', 'products', '2018-03-14 05:18:59', '2018-03-14 05:18:59', NULL),
(107, 'read_products', 'products', '2018-03-14 05:18:59', '2018-03-14 05:18:59', NULL),
(108, 'edit_products', 'products', '2018-03-14 05:18:59', '2018-03-14 05:18:59', NULL),
(109, 'add_products', 'products', '2018-03-14 05:18:59', '2018-03-14 05:18:59', NULL),
(110, 'delete_products', 'products', '2018-03-14 05:18:59', '2018-03-14 05:18:59', NULL),
(111, 'browse_statuses', 'statuses', '2018-03-14 05:19:16', '2018-03-14 05:19:16', NULL),
(112, 'read_statuses', 'statuses', '2018-03-14 05:19:16', '2018-03-14 05:19:16', NULL),
(113, 'edit_statuses', 'statuses', '2018-03-14 05:19:16', '2018-03-14 05:19:16', NULL),
(114, 'add_statuses', 'statuses', '2018-03-14 05:19:16', '2018-03-14 05:19:16', NULL),
(115, 'delete_statuses', 'statuses', '2018-03-14 05:19:16', '2018-03-14 05:19:16', NULL),
(116, 'browse_psd_files', 'psd_files', '2018-03-14 05:20:19', '2018-03-14 05:20:19', NULL),
(117, 'read_psd_files', 'psd_files', '2018-03-14 05:20:19', '2018-03-14 05:20:19', NULL),
(118, 'edit_psd_files', 'psd_files', '2018-03-14 05:20:19', '2018-03-14 05:20:19', NULL),
(119, 'add_psd_files', 'psd_files', '2018-03-14 05:20:19', '2018-03-14 05:20:19', NULL),
(120, 'delete_psd_files', 'psd_files', '2018-03-14 05:20:19', '2018-03-14 05:20:19', NULL),
(121, 'browse_urgents', 'urgents', '2018-03-14 05:20:38', '2018-03-14 05:20:38', NULL),
(122, 'read_urgents', 'urgents', '2018-03-14 05:20:38', '2018-03-14 05:20:38', NULL),
(123, 'edit_urgents', 'urgents', '2018-03-14 05:20:38', '2018-03-14 05:20:38', NULL),
(124, 'add_urgents', 'urgents', '2018-03-14 05:20:38', '2018-03-14 05:20:38', NULL),
(125, 'delete_urgents', 'urgents', '2018-03-14 05:20:38', '2018-03-14 05:20:38', NULL),
(126, 'browse_face_price', 'face_price', '2018-04-05 08:26:07', '2018-04-05 08:26:07', NULL),
(127, 'read_face_price', 'face_price', '2018-04-05 08:26:07', '2018-04-05 08:26:07', NULL),
(128, 'edit_face_price', 'face_price', '2018-04-05 08:26:07', '2018-04-05 08:26:07', NULL),
(129, 'add_face_price', 'face_price', '2018-04-05 08:26:07', '2018-04-05 08:26:07', NULL),
(130, 'delete_face_price', 'face_price', '2018-04-05 08:26:07', '2018-04-05 08:26:07', NULL),
(131, 'browse_face_prices', 'face_prices', '2018-04-05 08:31:57', '2018-04-05 08:31:57', NULL),
(132, 'read_face_prices', 'face_prices', '2018-04-05 08:31:57', '2018-04-05 08:31:57', NULL),
(133, 'edit_face_prices', 'face_prices', '2018-04-05 08:31:57', '2018-04-05 08:31:57', NULL),
(134, 'add_face_prices', 'face_prices', '2018-04-05 08:31:57', '2018-04-05 08:31:57', NULL),
(135, 'delete_face_prices', 'face_prices', '2018-04-05 08:31:57', '2018-04-05 08:31:57', NULL),
(136, 'browse_ordering_methods', 'ordering_methods', '2018-04-05 09:40:24', '2018-04-05 09:40:24', NULL),
(137, 'read_ordering_methods', 'ordering_methods', '2018-04-05 09:40:24', '2018-04-05 09:40:24', NULL),
(138, 'edit_ordering_methods', 'ordering_methods', '2018-04-05 09:40:24', '2018-04-05 09:40:24', NULL),
(139, 'add_ordering_methods', 'ordering_methods', '2018-04-05 09:40:24', '2018-04-05 09:40:24', NULL),
(140, 'delete_ordering_methods', 'ordering_methods', '2018-04-05 09:40:24', '2018-04-05 09:40:24', NULL),
(141, 'browse_urgent_fee', 'urgent_fee', '2018-04-05 11:24:16', '2018-04-05 11:24:16', NULL),
(142, 'read_urgent_fee', 'urgent_fee', '2018-04-05 11:24:16', '2018-04-05 11:24:16', NULL),
(143, 'edit_urgent_fee', 'urgent_fee', '2018-04-05 11:24:16', '2018-04-05 11:24:16', NULL),
(144, 'add_urgent_fee', 'urgent_fee', '2018-04-05 11:24:16', '2018-04-05 11:24:16', NULL),
(145, 'delete_urgent_fee', 'urgent_fee', '2018-04-05 11:24:16', '2018-04-05 11:24:16', NULL),
(146, 'browse_urgent_fees', 'urgent_fees', '2018-04-05 11:36:22', '2018-04-05 11:36:22', NULL),
(147, 'read_urgent_fees', 'urgent_fees', '2018-04-05 11:36:22', '2018-04-05 11:36:22', NULL),
(148, 'edit_urgent_fees', 'urgent_fees', '2018-04-05 11:36:22', '2018-04-05 11:36:22', NULL),
(149, 'add_urgent_fees', 'urgent_fees', '2018-04-05 11:36:22', '2018-04-05 11:36:22', NULL),
(150, 'delete_urgent_fees', 'urgent_fees', '2018-04-05 11:36:22', '2018-04-05 11:36:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE IF NOT EXISTS `permission_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(139, 1),
(140, 1),
(141, 1),
(142, 1),
(143, 1),
(144, 1),
(145, 1),
(146, 1),
(147, 1),
(148, 1),
(149, 1),
(150, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `psd_files`
--

DROP TABLE IF EXISTS `psd_files`;
CREATE TABLE IF NOT EXISTS `psd_files` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2018-03-13 07:14:13', '2018-03-13 07:14:13'),
(2, 'user', 'Normal User', '2018-03-13 07:14:14', '2018-03-13 07:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `urgent_fees`
--

DROP TABLE IF EXISTS `urgent_fees`;
CREATE TABLE IF NOT EXISTS `urgent_fees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `price` double(8,2) NOT NULL,
  `country_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `urgent_fees`
--

INSERT INTO `urgent_fees` (`id`, `price`, `country_id`, `active`, `created_at`, `updated_at`) VALUES
(3, 50.00, 1, 1, '2018-04-05 12:15:22', '2018-04-05 12:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Omar', 'admin@admin.com', 'users/default.png', '$2y$10$uUhE7mZ60Bh3BIr/4VALOOkrr4LzZBRRUc0MUJduXi6plDcvyTo7G', NULL, '2018-03-13 07:15:50', '2018-03-13 07:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `work_places`
--

DROP TABLE IF EXISTS `work_places`;
CREATE TABLE IF NOT EXISTS `work_places` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
