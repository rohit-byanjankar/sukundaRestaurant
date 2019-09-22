-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2019 at 12:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sukunda`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `no_of_people` int(11) NOT NULL,
  `booker_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booked_time` datetime NOT NULL,
  `booker_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `booker_phone_no` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `no_of_people`, `booker_name`, `booked_time`, `booker_address`, `created_at`, `updated_at`, `booker_phone_no`) VALUES
(1, 5, 'Rohit Byanjankar', '2019-09-19 00:00:00', 'Chyasal', '2019-09-19 02:43:07', '2019-09-19 02:43:07', 9861167885),
(4, 6, 'Subein Byanjankar', '2019-09-20 00:00:00', 'Teku', '2019-09-19 03:10:46', '2019-09-19 03:10:46', 9898998987),
(5, 10, 'Rohin Awale', '2019-09-21 00:00:00', 'Dolor', '2019-09-21 03:12:19', '2019-09-21 03:12:19', 1111111111),
(6, 78, 'Zenia Bray', '1983-10-16 00:00:00', 'Excepteur consectetur sunt a recusandae', '2019-09-21 03:13:26', '2019-09-21 03:13:26', 3923433),
(7, 93, 'Daria Everett', '1975-10-27 00:00:00', 'Hic', '2019-09-21 03:18:28', '2019-09-21 03:18:28', 8659207),
(8, 86, 'Grady Harmon', '2011-04-11 00:00:00', 'Exce', '2019-09-21 03:21:30', '2019-09-21 03:21:30', 7188042),
(9, 57, 'Lisandra Conley', '2004-07-22 00:00:00', 'Animi', '2019-09-21 03:26:45', '2019-09-21 03:26:45', 1042556),
(10, 21, 'Russell Hatfield', '2000-05-10 00:00:00', 'Nesciunt sint non culpa necessitatibus', '2019-09-22 04:08:19', '2019-09-22 04:08:19', 5921701);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(23, 4, 'category_id', 'text', 'Category Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(25, 4, 'item_name', 'text', 'Item Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
(27, 4, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 8),
(28, 4, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 9),
(29, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(30, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12),
(31, 5, 'category_id', 'text', 'Category Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 5, 'category_name', 'text', 'Category Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(33, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(34, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(35, 6, 'order_id', 'text', 'Order Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(37, 6, 'date', 'text', 'Date', 1, 1, 1, 1, 1, 1, '{}', 3),
(38, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(39, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(40, 7, 'order_line_id', 'text', 'Order Line Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(41, 7, 'order_id', 'text', 'Order Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(42, 7, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 4),
(43, 7, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 5),
(44, 7, 'rate', 'number', 'Rate', 1, 1, 1, 1, 1, 1, '{}', 6),
(45, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(46, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(47, 7, 'order_line_belongsto_order_relationship', 'relationship', 'Order Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"order_id\",\"label\":\"order_id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(48, 8, 'table_id', 'text', 'Table Id', 1, 1, 1, 1, 0, 0, '{}', 1),
(49, 8, 'table_space', 'text', 'Table Space', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(51, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(52, 9, 'booking_id', 'text', 'Booking Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(54, 9, 'booker_name', 'text', 'Booker Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(57, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(58, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(59, 10, 'kitchen_id', 'text', 'Kitchen Id', 1, 1, 1, 1, 0, 0, '{}', 1),
(60, 10, 'kitchen_name', 'text', 'Kitchen Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(61, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(62, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(63, 11, 'item_id', 'text', 'Item Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 11, 'item_name', 'text', 'Item Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(65, 11, 'quantity', 'text', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 3),
(66, 11, 'measuring_unit', 'text', 'Measuring Unit', 0, 1, 1, 1, 1, 1, '{}', 4),
(67, 11, 'category', 'text', 'Category', 0, 1, 1, 1, 1, 1, '{}', 5),
(68, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(69, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(70, 12, 'recipe_id', 'text', 'Recipe Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(71, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(72, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(73, 13, 'recipe_detail_id', 'text', 'Recipe Detail Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(74, 13, 'recipe_id', 'text', 'Recipe Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(75, 13, 'item_id', 'text', 'Item Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(76, 13, 'quanity', 'text', 'Quanity', 1, 1, 1, 1, 1, 1, '{}', 5),
(77, 13, 'measuring_unit', 'text', 'Measuring Unit', 0, 1, 1, 1, 1, 1, '{}', 6),
(78, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(79, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(80, 9, 'booking_belongsto_table_relationship', 'relationship', 'Table Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Table\",\"table\":\"tables\",\"type\":\"belongsTo\",\"column\":\"booking_id\",\"key\":\"table_id\",\"label\":\"table_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(81, 4, 'food_menu_item_belongsto_menu_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\MenuCategory\",\"table\":\"menu_categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"category_id\",\"label\":\"category_name\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(83, 4, 'food_menu_item_belongsto_recipe_relationship', 'relationship', 'Recipe Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Recipe\",\"table\":\"recipes\",\"type\":\"belongsTo\",\"column\":\"recipe_id\",\"key\":\"recipe_id\",\"label\":\"recipe_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(84, 4, 'recipe_id', 'text', 'Recipe Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(85, 13, 'recipe_detail_belongsto_recipe_relationship', 'relationship', 'Recipe Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Recipe\",\"table\":\"recipes\",\"type\":\"belongsTo\",\"column\":\"recipe_id\",\"key\":\"recipe_id\",\"label\":\"recipe_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(86, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 14, 'customer_name', 'text', 'Customer Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(88, 14, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 3),
(89, 14, 'phone_number', 'text', 'Phone Number', 1, 1, 1, 1, 1, 1, '{}', 4),
(90, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(91, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(92, 14, 'invoice_no', 'text', 'Invoice No', 1, 1, 1, 1, 1, 1, '{}', 6),
(93, 14, 'date', 'text', 'Date', 1, 1, 1, 1, 1, 1, '{}', 7),
(94, 14, 'taxable_amount', 'text', 'Taxable Amount', 1, 1, 1, 1, 1, 1, '{}', 8),
(95, 14, 'vat', 'text', 'Vat', 1, 1, 1, 1, 1, 1, '{}', 9),
(96, 14, 'total', 'text', 'Total', 1, 1, 1, 1, 1, 1, '{}', 10),
(97, 14, 'updated_by', 'text', 'Updated By', 1, 1, 1, 1, 1, 1, '{}', 11),
(99, 15, 'out_bill_id', 'text', 'Out Bill Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(100, 15, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 4),
(101, 15, 'quantity', 'text', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 5),
(102, 15, 'rate', 'text', 'Rate', 1, 1, 1, 1, 1, 1, '{}', 6),
(103, 15, 'amount', 'text', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 7),
(104, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(105, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(106, 15, 'out_bill_detail_belongsto_out_bill_relationship', 'relationship', 'Out Bill Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\OutBill\",\"table\":\"out_bills\",\"type\":\"belongsTo\",\"column\":\"out_bill_id\",\"key\":\"out_bill_id\",\"label\":\"out_bill_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(107, 4, 'food_menu_item_id', 'text', 'Food Menu Item Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(108, 12, 'recipe_name', 'text', 'Recipe Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(109, 15, 'out_bill_detail_id', 'text', 'Out Bill Detail Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(110, 16, 'in_bill_detail_id', 'text', 'In Bill Detail Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(111, 16, 'in_bill_id', 'text', 'In Bill Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(112, 16, 'particular', 'text', 'Particular', 1, 1, 1, 1, 1, 1, '{}', 4),
(113, 16, 'quantity', 'text', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 5),
(114, 16, 'rate', 'text', 'Rate', 1, 1, 1, 1, 1, 1, '{}', 6),
(115, 16, 'amount', 'text', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 7),
(116, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(117, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(118, 17, 'in_bill_id', 'text', 'In Bill Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(119, 17, 'customer_name', 'text', 'Customer Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(120, 17, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 3),
(121, 17, 'phone_number', 'text', 'Phone Number', 1, 1, 1, 1, 1, 1, '{}', 4),
(122, 17, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(123, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(124, 17, 'invoice_no', 'text', 'Invoice No', 1, 1, 1, 1, 1, 1, '{}', 7),
(125, 17, 'date', 'text', 'Date', 1, 1, 1, 1, 1, 1, '{}', 8),
(126, 17, 'taxable_amount', 'text', 'Taxable Amount', 1, 1, 1, 1, 1, 1, '{}', 9),
(127, 17, 'vat', 'text', 'Vat', 1, 1, 1, 1, 1, 1, '{}', 10),
(128, 17, 'total', 'text', 'Total', 1, 1, 1, 1, 1, 1, '{}', 11),
(129, 17, 'updated_by', 'text', 'Updated By', 1, 1, 1, 1, 1, 1, '{}', 12),
(130, 16, 'in_bill_detail_belongsto_in_bill_relationship', 'relationship', 'In Bill Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\InBill\",\"table\":\"in_bills\",\"type\":\"belongsTo\",\"column\":\"in_bill_id\",\"key\":\"in_bill_id\",\"label\":\"in_bill_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(131, 6, 'customer_name', 'text', 'Customer Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(133, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(134, 20, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 2),
(135, 20, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 3),
(136, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(137, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(139, 6, 'order_status', 'text', 'Order Status', 1, 1, 1, 1, 1, 1, '{}', 5),
(140, 7, 'order_line_belongsto_order_status_relationship', 'relationship', 'Particular Status', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\OrderStatus\",\"table\":\"order_statuses\",\"type\":\"belongsTo\",\"column\":\"particular_status\",\"key\":\"id\",\"label\":\"status\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(141, 7, 'particular_status', 'text', 'Particular Status', 1, 1, 1, 1, 1, 1, '{}', 8),
(142, 6, 'paid', 'text', 'Paid', 0, 1, 1, 1, 1, 1, '{}', 4),
(144, 6, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 6),
(145, 21, 'stock_entry_id', 'text', 'Stock Entry Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(146, 21, 'item_id', 'text', 'Item Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(147, 21, 'invoice_id', 'text', 'Invoice Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(148, 21, 'date', 'text', 'Date', 1, 1, 1, 1, 1, 1, '{}', 4),
(149, 21, 'item_name', 'text', 'Item Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(150, 21, 'quantity', 'text', 'Quantity', 1, 1, 1, 1, 1, 1, '{}', 6),
(151, 21, 'measuring_unit', 'text', 'Measuring Unit', 1, 1, 1, 1, 1, 1, '{}', 7),
(152, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(153, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(154, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(155, 22, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(156, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(157, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(158, 23, 'payment_id', 'text', 'Payment Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(159, 23, 'invoice_no', 'text', 'Invoice No', 0, 1, 1, 1, 1, 1, '{}', 2),
(160, 23, 'payment_mode', 'text', 'Payment Mode', 0, 1, 1, 1, 1, 1, '{}', 3),
(161, 23, 'payment_type', 'text', 'Payment Type', 0, 1, 1, 1, 1, 1, '{}', 4),
(162, 23, 'tax_amount', 'text', 'Tax Amount', 0, 1, 1, 1, 1, 1, '{}', 5),
(163, 23, 'payment_status', 'text', 'Payment Status', 0, 1, 1, 1, 1, 1, '{}', 6),
(164, 23, 'expiry_month', 'text', 'Expiry Month', 0, 1, 1, 1, 1, 1, '{}', 7),
(165, 23, 'expiry_year', 'text', 'Expiry Year', 0, 1, 1, 1, 1, 1, '{}', 8),
(166, 23, 'bank_name', 'text', 'Bank Name', 0, 1, 1, 1, 1, 1, '{}', 9),
(167, 23, 'branch', 'text', 'Branch', 0, 1, 1, 1, 1, 1, '{}', 10),
(168, 23, 'card_no', 'text', 'Card No', 0, 1, 1, 1, 1, 1, '{}', 11),
(169, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 12),
(170, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(171, 7, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 9),
(172, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(173, 25, 'author_id', 'text', 'Author Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(174, 25, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(175, 25, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 4),
(176, 25, 'seo_title', 'text', 'Seo Title', 0, 1, 1, 1, 1, 1, '{}', 5),
(177, 25, 'excerpt', 'text_area', 'Excerpt', 0, 1, 1, 1, 1, 1, '{}', 6),
(178, 25, 'body', 'rich_text_box', 'Body', 0, 1, 1, 1, 1, 1, '{}', 7),
(179, 25, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 8),
(180, 25, 'slug', 'text', 'Slug', 0, 1, 1, 1, 1, 1, '{}', 9),
(181, 25, 'meta_description', 'text', 'Meta Description', 0, 1, 1, 1, 1, 1, '{}', 10),
(182, 25, 'meta_keywords', 'text', 'Meta Keywords', 0, 1, 1, 1, 1, 1, '{}', 11),
(183, 25, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 12),
(184, 25, 'featured', 'checkbox', 'Featured', 0, 1, 1, 1, 1, 1, '{}', 13),
(185, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14),
(186, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(187, 25, 'post_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"author_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(188, 4, 'is_featured', 'checkbox', 'Is Featured', 0, 1, 1, 1, 1, 1, '{\"on\":1,\"off\":0}', 10),
(189, 9, 'no_of_people', 'text', 'No Of People', 1, 1, 1, 1, 1, 1, '{}', 3),
(190, 9, 'booked_time', 'text', 'Booked Time', 1, 1, 1, 1, 1, 1, '{}', 4),
(191, 9, 'booker_address', 'text', 'Booker Address', 1, 1, 1, 1, 1, 1, '{}', 6),
(192, 9, 'booker_phone_no', 'text', 'Booker Phone No', 1, 1, 1, 1, 1, 1, '{}', 7);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2019-08-05 03:19:20', '2019-08-05 03:19:20'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2019-08-05 03:19:21', '2019-08-05 03:19:21'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2019-08-05 03:19:21', '2019-08-05 03:19:21'),
(4, 'food_menu_items', 'food-menu-items', 'Food Menu Item', 'Food Menu Items', NULL, 'App\\FoodMenuItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:27:49', '2019-09-17 05:16:12'),
(5, 'menu_categories', 'menu-categories', 'Menu Category', 'Menu Categories', NULL, 'App\\MenuCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(6, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:32:06', '2019-08-12 00:54:36'),
(7, 'order_lines', 'order-lines', 'Order Line', 'Order Lines', NULL, 'App\\OrderLine', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:34:04', '2019-08-22 00:03:53'),
(8, 'tables', 'tables', 'Table', 'Tables', NULL, 'App\\Table', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:38:31', '2019-08-06 23:53:36'),
(9, 'bookings', 'bookings', 'Booking', 'Bookings', NULL, 'App\\Booking', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:41:31', '2019-09-19 02:56:40'),
(10, 'kitchens', 'kitchens', 'Kitchen', 'Kitchens', NULL, 'App\\Kitchen', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:52:11', '2019-08-06 23:52:58'),
(11, 'items', 'items', 'Item', 'Items', NULL, 'App\\Item', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-05 04:55:17', '2019-08-05 04:55:17'),
(12, 'recipes', 'recipes', 'Recipe', 'Recipes', NULL, 'App\\Recipe', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 04:55:46', '2019-08-06 23:37:52'),
(13, 'recipe_details', 'recipe-details', 'Recipe Detail', 'Recipe Details', NULL, 'App\\RecipeDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 05:01:01', '2019-08-06 23:39:35'),
(14, 'out_bills', 'out-bills', 'Out Bill', 'Out Bills', NULL, 'App\\OutBill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(15, 'out_bill_details', 'out-bill-details', 'Out Bill Detail', 'Out Bill Details', NULL, 'App\\OutBillDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-06 05:50:52', '2019-08-07 00:15:40'),
(16, 'in_bill_details', 'in-bill-details', 'In Bill Detail', 'In Bill Details', NULL, 'App\\InBillDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-07 00:24:46', '2019-08-07 00:25:45'),
(17, 'in_bills', 'in-bills', 'In Bill', 'In Bills', NULL, 'App\\InBill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-07 00:24:56', '2019-08-07 00:24:56'),
(19, 'order_status', 'order-status', 'Order Status', 'Order Statuses', NULL, 'App\\OrderStatus', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(20, 'order_statuses', 'order-statuses', 'Order Status', 'Order Statuses', NULL, 'App\\OrderStatus', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(21, 'stock_entries', 'stock-entries', 'Stock Entry', 'Stock Entries', NULL, 'App\\StockEntry', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(22, 'measuring_units', 'measuring-units', 'Measuring Unit', 'Measuring Units', NULL, 'App\\MeasuringUnit', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(23, 'payments', 'payments', 'Payment', 'Payments', NULL, 'App\\Payment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(25, 'posts', 'posts', 'Post', 'Posts', NULL, 'App\\Post', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-09-17 03:44:59', '2019-09-17 04:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `food_menu_items`
--

CREATE TABLE `food_menu_items` (
  `food_menu_item_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `is_featured` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_menu_items`
--

INSERT INTO `food_menu_items` (`food_menu_item_id`, `category_id`, `item_name`, `image`, `price`, `description`, `created_at`, `updated_at`, `recipe_id`, `is_featured`) VALUES
(3, 4, 'Fokso Fry', 'food-menu-items\\September2019\\0TGjFqS2p1YUP9nEGYF0.jpg', 10.5, 'Goat lungs filled with combination of Nepalese Style spices', '2019-09-16 06:24:00', '2019-09-19 22:00:58', NULL, 1),
(4, 4, 'Chicken Chilli', 'food-menu-items\\September2019\\tmMANkybVBPx5uRZVocL.png', 12.99, 'Battered chicken deep fried and infused with onion,capsicum and fresh chilli', '2019-09-16 06:27:00', '2019-09-20 01:36:35', NULL, 0),
(5, 4, 'Lamb Sukuti', 'food-menu-items\\September2019\\V52vUaPnWJy1yDbG4ROz.jpg', 13.99, 'Crispy lamb pieces finely cut and marinated with Asian spices', '2019-09-16 06:27:00', '2019-09-20 01:36:23', NULL, 0),
(6, 4, 'Goat Bhutan', 'food-menu-items\\September2019\\7HiwMkMjphswqTwenZB2.jpg', 12.5, NULL, '2019-09-16 06:28:00', '2019-09-20 01:36:14', NULL, 0),
(7, 4, 'Wai Wai Sadheko', 'food-menu-items\\September2019\\zal4BAAdAKF83aKDJ0gN.jpg', 5, 'Traditional Nepalese crunchy fried noodles', '2019-09-16 06:28:00', '2019-09-20 01:36:06', NULL, 0),
(8, 4, 'Chips Chilli', 'food-menu-items\\September2019\\xklrMHZSVR6zqKwOg2T8.jpg', 8.5, 'Beer battered chips fried', '2019-09-16 06:29:00', '2019-09-20 01:35:55', NULL, 0),
(9, 4, 'Aloo Sadheko', 'food-menu-items\\September2019\\UYHoJdejuzcFJwuAbitq.jpg', 7.99, 'Boiled potato chopped and marinated with traditional Nepalese spices', '2019-09-16 06:30:00', '2019-09-20 01:35:31', NULL, 0),
(10, 4, 'Veg Pakoda', 'food-menu-items\\September2019\\JkdeEJG1z97w8fANSJpP.jpg', 8.5, 'finely chopped mixed seasonal vegetables marinated', '2019-09-16 06:31:00', '2019-09-20 01:35:21', NULL, 0),
(11, 4, 'Bara', 'food-menu-items\\September2019\\w7D5DcOGioQT1hbserc1.jpg', 8.5, 'Nepalese style pancake', '2019-09-16 06:31:00', '2019-09-20 01:35:12', NULL, 0),
(12, 4, 'Egg Bara', 'food-menu-items\\September2019\\q8nieKlKXNFNAqi6ESu2.jpg', 10.99, 'Nepalese style pancake topped with egg', '2019-09-16 06:32:00', '2019-09-20 01:34:41', NULL, 0),
(13, 4, 'Mushroom Chhoila', 'food-menu-items\\September2019\\qFiJOiN14aR7FGWHMJCD.jpg', 9.5, 'Selected mushroom cooked to perfection', '2019-09-16 06:32:00', '2019-09-20 01:34:51', NULL, 0),
(14, 4, 'Lamb Chhoila', 'food-menu-items\\September2019\\gviINpIt56Hv0iBp5M5i.jpg', 11.5, 'Lamb pieces cooked to perfection', '2019-09-16 06:33:00', '2019-09-20 01:34:22', NULL, 0),
(15, 4, 'Chicken Chhoila', 'food-menu-items\\September2019\\QQlSqTuTYn8DAcAZytuE.jpg', 10.5, 'Chicken pieces cooked to perfection', '2019-09-16 06:33:00', '2019-09-20 01:34:09', NULL, 0),
(16, 5, 'Puri Tarkari', 'food-menu-items\\September2019\\1uVUM5nG5HSgwdeES5rM.jpg', 12.5, 'puri served with', '2019-09-16 06:35:00', '2019-09-20 01:33:56', NULL, 0),
(17, 5, 'Veg Chowmin', 'food-menu-items\\September2019\\xEbAofFJkInf8P7PUzgc.jpg', 11, 'Egg noodles stir fried', '2019-09-16 06:35:00', '2019-09-20 01:33:38', NULL, 0),
(18, 5, 'Chicken Chowmin', 'food-menu-items\\September2019\\xJyyJ1aVCvEDMLBk9wn9.jpg', 12, 'Egg noodles stir fried with mixed seasonal vegetables and tender chicken strips', '2019-09-16 06:36:00', '2019-09-20 01:33:24', NULL, 0),
(19, 5, 'Veg Momo', 'food-menu-items\\September2019\\Bl3W80P2vHa3In5EGL9Q.jpg', 10, 'Nepalese style dumplings mixed with vegetable mince', '2019-09-16 06:37:00', '2019-09-20 01:33:06', NULL, 0),
(20, 5, 'Chicken Momo', 'food-menu-items\\September2019\\GPvHmiSOeF4MyUvEuVpB.jpg', 12, 'Nepalese style dumplings mixed with chicken mince', '2019-09-16 06:37:00', '2019-09-20 01:32:56', NULL, 0),
(21, 5, 'Buff Momo', 'food-menu-items\\September2019\\m8ufpYCFNNhdIDeIQf7A.jpg', 14.5, 'Nepalese style dumplings mixed with buff mince', '2019-09-16 06:38:00', '2019-09-20 01:31:38', NULL, 0),
(22, 5, 'C-Momo', 'food-menu-items\\September2019\\NJqdwCIWZFsGEHsxNhWa.jpg', 13, 'Nepalese style dumplings - chilli momo fried', '2019-09-16 06:39:00', '2019-09-20 01:31:06', NULL, 0),
(25, 5, 'Momo Platter to Share', 'food-menu-items\\September2019\\A3K8Zn1D1QqHSZCaHxu6.jpg', 20, '4x chicken momo(steamed) 4x veg momo(steamed) 4x chicken momo(fried) 4x c-momo(steamed)', '2019-09-16 06:41:00', '2019-09-20 01:30:36', NULL, 1),
(26, 5, 'Sha Phaley', 'food-menu-items\\September2019\\O5w56hyHtXjAh3VyNP2W.jpg', 12, 'Stuffed chicken with cabbage,fashioned with semi-circular shape and deep fried', '2019-09-16 06:42:00', '2019-09-20 01:30:15', NULL, 0),
(27, 6, 'Mutton Thali', 'food-menu-items\\September2019\\UynNHKbXayx4hIT6J4rm.jpg', 20, 'Steamed rice with mutton', '2019-09-16 06:43:00', '2019-09-20 01:37:54', NULL, 0),
(28, 6, 'Chicken Thali', 'food-menu-items\\September2019\\xhteDrp8V1TsBvZXZlf8.jpg', 19, 'Steamed rice with chicken', '2019-09-16 06:44:00', '2019-09-20 01:28:20', NULL, 0),
(29, 6, 'Vegetarian Thali', 'food-menu-items\\September2019\\AbLFgquXDYTmvUTGvIsR.jpg', 18, 'Steamed rice with vegetable curry', '2019-09-16 06:45:00', '2019-09-20 01:27:15', NULL, 0),
(30, 6, 'Fish Thali', 'food-menu-items\\September2019\\nYzKj4MeNJ9yYtbhnP0W.jpg', 23.5, 'Steamed rice with fish curry', '2019-09-16 06:45:00', '2019-09-20 01:27:53', NULL, 0),
(31, 7, 'Rice', 'food-menu-items\\September2019\\G3HumDJDvzTsQ1WEehx8.jpg', 3, NULL, '2019-09-16 06:46:00', '2019-09-20 01:26:29', NULL, 0),
(32, 7, 'Bowl of chicken/mutton/veg curry', 'food-menu-items\\September2019\\TZ5AidKn3bkkZXgzLCeZ.jpg', 5, NULL, '2019-09-16 06:46:00', '2019-09-20 01:26:07', NULL, 0),
(33, 7, 'Fish Curry', 'food-menu-items\\September2019\\KBvCvyxjSyxdLFiWZTtB.png', 8, NULL, '2019-09-16 06:46:00', '2019-09-20 01:25:11', NULL, 0),
(34, 8, 'Khasiko Sekuwa', 'food-menu-items\\September2019\\jyLMgthaPhx8NMaNAPD7.jpg', 18.5, 'khasiko sekuwa with puffed rice,dalmot,cucumber,onion radish pickle', '2019-09-16 06:47:00', '2019-09-20 01:24:50', NULL, 1),
(35, 8, 'Sukuti Set', 'food-menu-items\\September2019\\z9yk7AofVnhsVSRuxBgb.png', 17, 'beaten rice,lam sukuti', '2019-09-16 06:48:00', '2019-09-20 01:24:37', NULL, 1),
(36, 8, 'Newari Khaja Set', 'food-menu-items\\September2019\\9NWcnnObuqKDEPK5QGPk.jpg', 17.5, 'beaten rice,lamb sukuti,aloo sadheko', '2019-09-16 06:49:00', '2019-09-20 01:24:22', NULL, 1),
(37, 8, 'Lamb Chhoila Set', 'food-menu-items\\September2019\\fBxwZ5MXAlfHklbQ6n2f.jpeg', 16, 'beaten rice with lamb', '2019-09-16 06:50:00', '2019-09-20 01:23:51', NULL, 0),
(38, 8, 'Chicken Chhoila Set', 'food-menu-items\\September2019\\ijF1uDzOFT5LfS58c4z8.jpeg', 14, 'beaten rice with Chicken', '2019-09-16 06:50:00', '2019-09-20 01:24:05', NULL, 1),
(39, 8, 'Lamb Taas Set', 'food-menu-items\\September2019\\C6JXcrDxFVlxdHv88v61.png', 15, 'Puffed rice,lamb tass', '2019-09-16 06:51:00', '2019-09-20 01:23:16', NULL, 1),
(40, 9, 'Homemade Rasbari', 'food-menu-items\\September2019\\xHsS7oI9AeZwiXNEEwRT.png', 5, 'Served with yogurt', '2019-09-16 06:51:00', '2019-09-20 01:23:30', NULL, 1),
(41, 9, 'Kulfi', 'food-menu-items\\September2019\\ms3mO0VnwlZ1AGnH6atF.jpg', 5, 'Homemade and contains pistachios', '2019-09-16 06:52:00', '2019-09-20 01:22:55', NULL, 1),
(42, 9, 'Kheer', 'food-menu-items\\September2019\\yUMbWrpb2OEQ3CoVGeje.jpg', 5, 'Homemade rice pudding contains dry fruits and nuts', '2019-09-16 06:53:00', '2019-09-20 01:21:04', NULL, 1),
(43, 9, 'Ice Cream', 'food-menu-items\\September2019\\qKhnvoOwPsefCE0ybPdm.jpg', 3, NULL, '2019-09-16 06:53:00', '2019-09-20 01:22:36', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `in_bills`
--

CREATE TABLE `in_bills` (
  `in_bill_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan_number` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `sub_total` int(11) NOT NULL,
  `taxable_amount` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `in_bills`
--

INSERT INTO `in_bills` (`in_bill_id`, `invoice_id`, `vendor_name`, `pan_number`, `address`, `phone_number`, `created_at`, `updated_at`, `discount`, `sub_total`, `taxable_amount`, `vat`, `total`) VALUES
(47, 79, 'Noelle Daugherty', NULL, 'Maxime cupidatat hic', '+1 (672) 587-7649', '2019-08-22 05:30:34', '2019-08-22 05:30:34', 31, 7, 42, 51, 57),
(48, 79, 'Noelle Daugherty', NULL, 'Maxime cupidatat hic', '+1 (672) 587-7649', '2019-08-22 05:31:32', '2019-08-22 05:31:32', 31, 7, 42, 51, 57),
(49, 66, 'Jescie Calhoun', NULL, 'Cupidatat eu ut sit', '+1 (995) 398-3363', '2019-08-22 05:38:13', '2019-08-22 05:38:13', 17, 2, 55, 20, 49),
(50, 19, 'Tate Andrews', NULL, 'Ipsam consequat Vel', '+1 (577) 625-5569', '2019-08-22 07:57:16', '2019-08-22 07:57:16', 83, 3, 57, 16, 88),
(51, 35, 'Alan Hoffman', NULL, 'Facere in architecto', '+1 (262) 983-3701', '2019-08-22 07:58:11', '2019-08-22 07:58:11', 66, 40, 92, 61, 25),
(52, 72, 'Suki Vazquez', NULL, 'Accusantium reprehen', '+1 (682) 345-6307', '2019-08-22 07:59:36', '2019-08-22 07:59:36', 23, 74, 77, 52, 86);

-- --------------------------------------------------------

--
-- Table structure for table `in_bill_details`
--

CREATE TABLE `in_bill_details` (
  `in_bill_detail_id` bigint(20) UNSIGNED NOT NULL,
  `in_bill_id` int(11) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `measuring_unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `in_bill_details`
--

INSERT INTO `in_bill_details` (`in_bill_detail_id`, `in_bill_id`, `item_id`, `quantity`, `rate`, `amount`, `created_at`, `updated_at`, `measuring_unit`) VALUES
(51, 49, 3, 421, 63, 100, '2019-08-22 05:38:13', '2019-08-22 05:38:13', 'ml'),
(52, 49, 8, 455, 74, 100, '2019-08-22 05:38:13', '2019-08-22 05:38:13', 'ml'),
(53, 49, 7, 176, 67, 100, '2019-08-22 05:38:13', '2019-08-22 05:38:13', 'ml'),
(54, 50, 7, 687, 41, 100, '2019-08-22 07:57:18', '2019-08-22 07:57:18', 'l'),
(55, 50, 4, 380, 61, 100, '2019-08-22 07:57:19', '2019-08-22 07:57:19', 'ml'),
(56, 50, 8, 135, 76, 100, '2019-08-22 07:57:20', '2019-08-22 07:57:20', 'l'),
(57, 51, 3, 262, 73, 100, '2019-08-22 07:58:11', '2019-08-22 07:58:11', 'l'),
(58, 51, 7, 251, 12, 100, '2019-08-22 07:58:11', '2019-08-22 07:58:11', 'ml'),
(59, 51, 8, 569, 8, 100, '2019-08-22 07:58:12', '2019-08-22 07:58:12', 'l'),
(60, 52, 6, 332, 14, 100, '2019-08-22 07:59:36', '2019-08-22 07:59:36', 'l'),
(61, 52, 5, 940, 25, 100, '2019-08-22 07:59:37', '2019-08-22 07:59:37', 'ml'),
(62, 52, 7, 118, 100, 100, '2019-08-22 07:59:38', '2019-08-22 07:59:38', 'l');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `measuring_unit` text COLLATE utf8mb4_unicode_ci,
  `category` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `quantity`, `measuring_unit`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Wheat Flour', 200, 'kg', 'Flour', '2019-08-06 23:43:09', '2019-08-06 23:43:09'),
(3, 'Water', 1513, 'l', 'Liquid', '2019-08-06 23:45:07', '2019-08-19 04:47:28'),
(4, 'Consequuntur cumque', 962, 'Dolores itaque neces', NULL, '2019-08-19 03:39:40', '2019-08-19 03:39:40'),
(5, 'Voluptas eu illo dol', 204, 'Elit qui et a digni', NULL, '2019-08-19 03:39:40', '2019-08-19 03:39:40'),
(6, 'Wheat Flour', 100, 'Doloribus sed itaque', NULL, '2019-08-19 03:40:40', '2019-08-19 03:40:40'),
(7, 'Water', 100, 'asdfa', NULL, '2019-08-19 03:40:40', '2019-08-19 03:40:40'),
(8, 'Wheat Flour', 100, 'Facilis perspiciatis', NULL, '2019-08-19 03:41:50', '2019-08-19 03:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `kitchens`
--

CREATE TABLE `kitchens` (
  `kitchen_id` int(10) UNSIGNED NOT NULL,
  `kitchen_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kitchens`
--

INSERT INTO `kitchens` (`kitchen_id`, `kitchen_name`, `created_at`, `updated_at`) VALUES
(1, 'Veg Kitchen', '2019-08-06 23:51:59', '2019-08-06 23:51:59'),
(2, 'Non-Veg Kitchen', '2019-08-06 23:52:19', '2019-08-06 23:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `measuring_units`
--

CREATE TABLE `measuring_units` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `measuring_units`
--

INSERT INTO `measuring_units` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'kg', '2019-08-20 02:55:00', '2019-08-20 02:56:39'),
(2, 'l', '2019-08-20 02:56:00', '2019-08-20 02:56:20'),
(3, 'ml', '2019-08-20 02:56:12', '2019-08-20 02:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2019-08-05 03:19:27', '2019-08-05 03:19:27'),
(2, 'Site Main Menu', '2019-09-17 02:13:29', '2019-09-17 02:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `menu_categories`
--

CREATE TABLE `menu_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_categories`
--

INSERT INTO `menu_categories` (`category_id`, `category_name`, `created_at`, `updated_at`) VALUES
(4, 'Appetizers', '2019-09-16 06:23:49', '2019-09-16 06:23:49'),
(5, 'Main Meals', '2019-09-16 06:34:32', '2019-09-16 06:34:32'),
(6, 'Nepali Khana Set', '2019-09-16 06:43:19', '2019-09-16 06:43:19'),
(7, 'Extras', '2019-09-16 06:45:51', '2019-09-16 06:45:51'),
(8, 'Sukunda Specials', '2019-09-16 06:47:11', '2019-09-16 06:47:11'),
(9, 'Desserts', '2019-09-16 06:51:22', '2019-09-16 06:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2019-08-05 03:19:27', '2019-08-05 03:19:27', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 11, '2019-08-05 03:19:28', '2019-08-21 05:00:01', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2019-08-05 03:19:28', '2019-08-05 03:19:28', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2019-08-05 03:19:28', '2019-08-05 03:19:28', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 12, '2019-08-05 03:19:28', '2019-08-21 05:00:01', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2019-08-05 03:19:28', '2019-08-21 04:59:49', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2019-08-05 03:19:29', '2019-08-21 04:59:49', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2019-08-05 03:19:29', '2019-08-21 04:59:49', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2019-08-05 03:19:29', '2019-08-21 04:59:50', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 13, '2019-08-05 03:19:29', '2019-08-21 05:00:01', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2019-08-05 03:19:50', '2019-08-21 04:59:50', 'voyager.hooks', NULL),
(12, 1, 'Food Menu Items', '', '_self', NULL, NULL, 28, 1, '2019-08-05 03:27:50', '2019-08-07 00:24:08', 'voyager.food-menu-items.index', NULL),
(13, 1, 'Menu Categories', '', '_self', NULL, NULL, 28, 2, '2019-08-05 03:30:10', '2019-08-07 00:24:11', 'voyager.menu-categories.index', NULL),
(14, 1, 'Orders', '', '_self', 'voyager-list', '#000000', NULL, 5, '2019-08-05 03:32:06', '2019-08-12 00:52:46', 'voyager.orders.index', 'null'),
(16, 1, 'Tables', '', '_self', NULL, NULL, 24, 1, '2019-08-05 03:38:31', '2019-08-07 00:17:07', 'voyager.tables.index', NULL),
(17, 1, 'Bookings', '', '_self', NULL, NULL, 24, 2, '2019-08-05 03:41:32', '2019-08-07 00:17:14', 'voyager.bookings.index', NULL),
(18, 1, 'Kitchens', '', '_self', NULL, NULL, 24, 3, '2019-08-05 03:52:11', '2019-08-07 00:17:15', 'voyager.kitchens.index', NULL),
(19, 1, 'Items', '', '_self', NULL, NULL, 24, 4, '2019-08-05 04:55:18', '2019-08-07 00:22:36', 'voyager.items.index', NULL),
(20, 1, 'Recipes', '', '_self', NULL, NULL, 26, 1, '2019-08-05 04:55:47', '2019-08-07 00:22:59', 'voyager.recipes.index', NULL),
(21, 1, 'Recipe Details', '', '_self', NULL, NULL, 26, 2, '2019-08-05 05:01:02', '2019-08-07 00:23:02', 'voyager.recipe-details.index', NULL),
(22, 1, 'Out Bills', '', '_self', NULL, NULL, 27, 2, '2019-08-06 05:49:59', '2019-08-21 04:58:02', 'voyager.out-bills.index', NULL),
(24, 1, 'Restaurant', '', '_self', 'voyager-shop', '#000000', NULL, 6, '2019-08-07 00:16:51', '2019-08-21 04:58:02', NULL, ''),
(26, 1, 'Recipe', '', '_self', 'voyager-documentation', '#000000', NULL, 7, '2019-08-07 00:22:52', '2019-08-21 04:58:02', NULL, ''),
(27, 1, 'Bill', '', '_self', 'voyager-logbook', '#000000', NULL, 8, '2019-08-07 00:23:15', '2019-08-21 04:58:02', NULL, ''),
(28, 1, 'Food Menu Item', '', '_self', 'voyager-pizza', '#000000', NULL, 4, '2019-08-07 00:23:50', '2019-08-07 00:31:47', NULL, ''),
(30, 1, 'In Bills', '', '_self', NULL, NULL, 27, 1, '2019-08-07 00:24:57', '2019-08-07 00:29:45', 'voyager.in-bills.index', NULL),
(33, 1, 'Order Statuses', '', '_self', NULL, NULL, 37, 1, '2019-08-08 03:17:38', '2019-08-21 04:59:57', 'voyager.order-statuses.index', NULL),
(34, 1, 'Stock Entries', '', '_self', NULL, NULL, 37, 2, '2019-08-19 05:01:57', '2019-08-21 04:59:59', 'voyager.stock-entries.index', NULL),
(35, 1, 'Measuring Units', '', '_self', NULL, NULL, 37, 3, '2019-08-20 02:55:39', '2019-08-21 05:00:01', 'voyager.measuring-units.index', NULL),
(36, 1, 'Payments', '', '_self', 'voyager-dollar', '#000000', NULL, 9, '2019-08-21 04:56:12', '2019-08-21 05:01:34', 'voyager.payments.index', 'null'),
(37, 1, 'Miscellaneous', '', '_self', 'voyager-hammer', '#000000', NULL, 10, '2019-08-21 04:59:37', '2019-08-21 05:01:21', NULL, ''),
(38, 2, 'Home', '/#home', '_self', NULL, '#000000', NULL, 14, '2019-09-17 02:14:11', '2019-09-17 02:32:27', NULL, ''),
(39, 2, 'About Us', '/#about', '_self', NULL, '#000000', NULL, 15, '2019-09-17 02:14:56', '2019-09-17 02:14:56', NULL, ''),
(40, 2, 'Menu', '/#menu', '_self', NULL, '#000000', NULL, 16, '2019-09-17 02:15:23', '2019-09-17 02:15:23', NULL, ''),
(41, 2, 'Contact', '/#contact', '_self', NULL, '#000000', NULL, 17, '2019-09-17 02:16:03', '2019-09-17 06:15:38', NULL, ''),
(42, 1, 'Posts', '', '_self', NULL, NULL, NULL, 18, '2019-09-17 03:44:59', '2019-09-17 03:44:59', 'voyager.posts.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid` int(11) DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `date`, `created_at`, `updated_at`, `order_status`, `paid`, `note`) VALUES
(14, 'Test Name', '2014-07-24', '2019-08-07 05:47:23', '2019-08-09 02:20:48', 'started cooking', 1, NULL),
(16, 'Test Two', '2019-12-31', '2019-08-08 03:26:47', '2019-08-09 02:59:42', 'ready', 1, NULL),
(17, 'Customer 13', '2019-12-31', '2019-08-08 05:35:50', '2019-08-08 05:35:50', 'pending', 0, NULL),
(19, 'Day Two', '2019-12-31', '2019-08-09 02:21:53', '2019-08-09 02:21:53', 'pending', 0, NULL),
(21, 'Cust Test', '2019-12-31', '2019-08-12 00:59:46', '2019-08-12 00:59:46', 'pending', 0, NULL),
(22, 'Cust Test2', '2018-12-31', '2019-08-12 01:03:27', '2019-08-12 01:03:27', 'pending', 0, NULL),
(24, 'askjdfhk', '2016-12-31', '2019-08-12 01:40:39', '2019-08-12 01:40:39', 'pending', 0, NULL),
(25, 'Xander Carter', '2002-03-04', '2019-08-12 01:45:54', '2019-08-12 01:45:54', 'pending', 0, NULL),
(26, 'Barclay Austin', '1977-02-18', '2019-08-12 01:47:13', '2019-08-12 01:47:13', 'pending', 0, 'Placeat reprehender'),
(29, 'Kalia Horne', '2019-03-15', '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0, 'Libero earum volupta'),
(30, 'Preston Goodman', '1983-07-26', '2019-08-23 04:43:29', '2019-08-23 04:43:29', 'pending', 0, 'Commodo quis aut eaque qui quam'),
(31, 'Rohit Byanjankar', '2019-08-26', '2019-08-26 03:09:37', '2019-08-26 03:09:37', 'pending', 0, 'asdasdasdada'),
(32, 'Rohit Byanjankar', '2019-09-19', '2019-09-19 02:22:44', '2019-09-19 02:22:44', 'pending', 0, NULL),
(33, 'Rhona Hammond', '1985-08-07', '2019-09-19 02:23:56', '2019-09-19 02:23:56', 'pending', 0, 'In aut et quis do qui ut necessitatibus'),
(34, 'Rhona Hammond', '1985-08-07', '2019-09-19 02:24:16', '2019-09-19 02:24:16', 'pending', 0, 'In aut et quis do qui ut necessitatibus'),
(35, 'Rhona Hammond', '1985-08-07', '2019-09-19 02:25:32', '2019-09-19 02:25:32', 'pending', 0, 'In aut et quis do qui ut necessitatibus'),
(36, 'Tucker Fernandez', '1994-01-27', '2019-09-19 02:25:57', '2019-09-19 02:25:57', 'pending', 0, 'Voluptas molestiae qui aut mollit pariat');

-- --------------------------------------------------------

--
-- Table structure for table `order_lines`
--

CREATE TABLE `order_lines` (
  `order_line_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `particular` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `particular_status` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_lines`
--

INSERT INTO `order_lines` (`order_line_id`, `order_id`, `particular`, `quantity`, `rate`, `created_at`, `updated_at`, `particular_status`, `amount`) VALUES
(6, 1, 'as', 23, 200, '2019-08-07 04:03:15', '2019-08-07 04:03:15', 'pending', 0),
(8, 14, 'Dal', 20, 30, '2019-08-07 05:47:00', '2019-08-22 00:15:48', 'started cooking', 600),
(13, 15, 'Dal', 1, 200, '2019-08-08 02:19:47', '2019-08-08 02:19:47', 'pending', 0),
(14, 16, 'Chicken Soup', 1, 100, '2019-08-08 03:26:47', '2019-08-08 05:09:45', 'started cooking', 0),
(15, 17, 'Curry', 1, 100, '2019-08-08 05:35:51', '2019-08-08 05:35:51', 'pending', 0),
(22, 20, 'Cheese', 1, 100, '2019-08-12 00:59:31', '2019-08-12 00:59:31', 'pending', 0),
(23, 21, 'Cheese', 1, 100, '2019-08-12 00:59:47', '2019-08-12 00:59:47', 'pending', 0),
(24, 22, 'Curry', 1, 100, '2019-08-12 01:03:27', '2019-08-12 01:03:27', 'pending', 0),
(25, 23, 'ere', 1, 23, '2019-08-12 01:38:56', '2019-08-12 01:38:56', 'pending', 0),
(26, 24, 'asdfa', 1, 100, '2019-08-12 01:40:39', '2019-08-12 01:40:39', 'pending', 0),
(28, 26, 'Voluptatum proident', 755, 21, '2019-08-12 01:47:13', '2019-08-12 01:47:13', 'pending', 0),
(29, 27, 'Cum labore veniam d', 443, 17, '2019-08-12 02:22:17', '2019-08-12 02:22:17', 'pending', 0),
(30, 27, 'Dolores voluptatibus', 349, 83, '2019-08-12 02:22:17', '2019-08-12 02:22:17', 'pending', 0),
(31, 27, 'Qui debitis obcaecat', 30, 17, '2019-08-12 02:22:17', '2019-08-12 02:22:17', 'pending', 0),
(32, 27, 'Labore aut distincti', 953, 37, '2019-08-12 02:22:17', '2019-08-12 02:22:17', 'pending', 0),
(33, 28, 'Cum labore veniam d', 443, 17, '2019-08-12 02:22:47', '2019-08-12 02:22:47', 'pending', 0),
(34, 29, 'Anim sed et autem ex', 120, 87, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(35, 29, 'Ea quae exercitation', 666, 63, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(36, 29, 'Sunt id ea odit qu', 676, 28, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(37, 29, 'Esse et deserunt la', 887, 62, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(38, 29, 'Ad molestias culpa', 609, 24, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(39, 29, 'Perspiciatis iure o', 619, 96, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(40, 29, 'Minus voluptate offi', 918, 99, '2019-08-12 03:58:06', '2019-08-12 03:58:06', 'pending', 0),
(41, 30, 'Chiken', 740, 8, '2019-08-23 04:43:29', '2019-08-23 04:43:29', 'pending', 18),
(42, 31, '2', 3, 200, '2019-08-26 03:09:37', '2019-08-26 03:09:37', 'pending', 600),
(43, 31, '1', 4, 300, '2019-08-26 03:09:37', '2019-08-26 03:09:37', 'pending', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `status`, `color`, `created_at`, `updated_at`) VALUES
(1, 'pending', 'grey', '2019-08-08 03:18:27', '2019-08-08 03:18:27'),
(2, 'started cooking', 'orange', '2019-08-08 03:18:42', '2019-08-08 03:18:42'),
(3, 'ready', 'green', '2019-08-08 03:18:54', '2019-08-08 03:18:54'),
(4, 'served', 'red', '2019-08-08 03:19:05', '2019-08-08 03:19:05');

-- --------------------------------------------------------

--
-- Table structure for table `out_bills`
--

CREATE TABLE `out_bills` (
  `out_bill_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `sub_total` int(11) NOT NULL,
  `taxable_amount` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `out_bills`
--

INSERT INTO `out_bills` (`out_bill_id`, `item_id`, `customer_name`, `address`, `phone_number`, `created_at`, `updated_at`, `discount`, `sub_total`, `taxable_amount`, `vat`, `total`) VALUES
(1, 0, 'Rohit', 'Et provident enim vitae dolore velit in', '8387705', '2019-08-06 01:37:10', '2019-08-06 01:37:10', 5, 2147483647, 59, 0, 4),
(5, 1, 'Sonam Sherpa', 'KTM', '9583885', '2019-08-12 04:25:14', '2019-08-12 04:26:49', 35, 850, 880, 16, 430);

-- --------------------------------------------------------

--
-- Table structure for table `out_bill_details`
--

CREATE TABLE `out_bill_details` (
  `out_bill_detail_id` bigint(20) UNSIGNED NOT NULL,
  `out_bill_id` int(11) NOT NULL,
  `food_menu_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `out_bill_details`
--

INSERT INTO `out_bill_details` (`out_bill_detail_id`, `out_bill_id`, `food_menu_item_id`, `quantity`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 116, 72, 9, '2019-08-06 01:37:10', '2019-08-06 01:37:10'),
(2, 1, 0, 435, 86, 60, '2019-08-06 01:37:10', '2019-08-06 01:37:10'),
(3, 1, 0, 623, 67, 25, '2019-08-06 01:37:10', '2019-08-06 01:37:10'),
(4, 1, 0, 2, 200, 300, '2019-08-06 05:52:16', '2019-08-06 05:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `invoice_no` int(11) DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_year` year(4) DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_no` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `payment_mode`, `payment_type`, `tax_amount`, `payment_status`, `expiry_month`, `expiry_year`, `bank_name`, `branch`, `card_no`, `created_at`, `updated_at`) VALUES
(1, 25, 'cash', 'paid', 20000, 'zxc', 'Nov', 2018, 'NIC', 'Lalitpur', 987654321, '2019-08-20 04:11:27', '2019-08-20 05:13:00'),
(3, 25, 'cash', 'unpaid', 9000, 'Tenetur', 'February', 2019, NULL, 'Kathmandu', 1234567789, '2019-08-20 05:30:15', '2019-08-20 05:30:15'),
(4, 47, 'creditCard', 'unpaid', 31, 'Iure ut recusandae Ea iure eiusmod sit', '1', 1997, NULL, NULL, NULL, '2019-08-20 05:42:49', '2019-08-20 05:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2019-08-05 03:19:30', '2019-08-05 03:19:30'),
(2, 'browse_bread', NULL, '2019-08-05 03:19:30', '2019-08-05 03:19:30'),
(3, 'browse_database', NULL, '2019-08-05 03:19:30', '2019-08-05 03:19:30'),
(4, 'browse_media', NULL, '2019-08-05 03:19:31', '2019-08-05 03:19:31'),
(5, 'browse_compass', NULL, '2019-08-05 03:19:31', '2019-08-05 03:19:31'),
(6, 'browse_menus', 'menus', '2019-08-05 03:19:31', '2019-08-05 03:19:31'),
(7, 'read_menus', 'menus', '2019-08-05 03:19:31', '2019-08-05 03:19:31'),
(8, 'edit_menus', 'menus', '2019-08-05 03:19:32', '2019-08-05 03:19:32'),
(9, 'add_menus', 'menus', '2019-08-05 03:19:32', '2019-08-05 03:19:32'),
(10, 'delete_menus', 'menus', '2019-08-05 03:19:32', '2019-08-05 03:19:32'),
(11, 'browse_roles', 'roles', '2019-08-05 03:19:32', '2019-08-05 03:19:32'),
(12, 'read_roles', 'roles', '2019-08-05 03:19:33', '2019-08-05 03:19:33'),
(13, 'edit_roles', 'roles', '2019-08-05 03:19:33', '2019-08-05 03:19:33'),
(14, 'add_roles', 'roles', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(15, 'delete_roles', 'roles', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(16, 'browse_users', 'users', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(17, 'read_users', 'users', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(18, 'edit_users', 'users', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(19, 'add_users', 'users', '2019-08-05 03:19:34', '2019-08-05 03:19:34'),
(20, 'delete_users', 'users', '2019-08-05 03:19:35', '2019-08-05 03:19:35'),
(21, 'browse_settings', 'settings', '2019-08-05 03:19:35', '2019-08-05 03:19:35'),
(22, 'read_settings', 'settings', '2019-08-05 03:19:36', '2019-08-05 03:19:36'),
(23, 'edit_settings', 'settings', '2019-08-05 03:19:36', '2019-08-05 03:19:36'),
(24, 'add_settings', 'settings', '2019-08-05 03:19:37', '2019-08-05 03:19:37'),
(25, 'delete_settings', 'settings', '2019-08-05 03:19:37', '2019-08-05 03:19:37'),
(26, 'browse_hooks', NULL, '2019-08-05 03:19:50', '2019-08-05 03:19:50'),
(27, 'browse_food_menu_items', 'food_menu_items', '2019-08-05 03:27:49', '2019-08-05 03:27:49'),
(28, 'read_food_menu_items', 'food_menu_items', '2019-08-05 03:27:49', '2019-08-05 03:27:49'),
(29, 'edit_food_menu_items', 'food_menu_items', '2019-08-05 03:27:49', '2019-08-05 03:27:49'),
(30, 'add_food_menu_items', 'food_menu_items', '2019-08-05 03:27:49', '2019-08-05 03:27:49'),
(31, 'delete_food_menu_items', 'food_menu_items', '2019-08-05 03:27:49', '2019-08-05 03:27:49'),
(32, 'browse_menu_categories', 'menu_categories', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(33, 'read_menu_categories', 'menu_categories', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(34, 'edit_menu_categories', 'menu_categories', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(35, 'add_menu_categories', 'menu_categories', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(36, 'delete_menu_categories', 'menu_categories', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(37, 'browse_orders', 'orders', '2019-08-05 03:32:06', '2019-08-05 03:32:06'),
(38, 'read_orders', 'orders', '2019-08-05 03:32:06', '2019-08-05 03:32:06'),
(39, 'edit_orders', 'orders', '2019-08-05 03:32:06', '2019-08-05 03:32:06'),
(40, 'add_orders', 'orders', '2019-08-05 03:32:06', '2019-08-05 03:32:06'),
(41, 'delete_orders', 'orders', '2019-08-05 03:32:06', '2019-08-05 03:32:06'),
(42, 'browse_order_lines', 'order_lines', '2019-08-05 03:34:04', '2019-08-05 03:34:04'),
(43, 'read_order_lines', 'order_lines', '2019-08-05 03:34:04', '2019-08-05 03:34:04'),
(44, 'edit_order_lines', 'order_lines', '2019-08-05 03:34:04', '2019-08-05 03:34:04'),
(45, 'add_order_lines', 'order_lines', '2019-08-05 03:34:04', '2019-08-05 03:34:04'),
(46, 'delete_order_lines', 'order_lines', '2019-08-05 03:34:04', '2019-08-05 03:34:04'),
(47, 'browse_tables', 'tables', '2019-08-05 03:38:31', '2019-08-05 03:38:31'),
(48, 'read_tables', 'tables', '2019-08-05 03:38:31', '2019-08-05 03:38:31'),
(49, 'edit_tables', 'tables', '2019-08-05 03:38:31', '2019-08-05 03:38:31'),
(50, 'add_tables', 'tables', '2019-08-05 03:38:31', '2019-08-05 03:38:31'),
(51, 'delete_tables', 'tables', '2019-08-05 03:38:31', '2019-08-05 03:38:31'),
(52, 'browse_bookings', 'bookings', '2019-08-05 03:41:32', '2019-08-05 03:41:32'),
(53, 'read_bookings', 'bookings', '2019-08-05 03:41:32', '2019-08-05 03:41:32'),
(54, 'edit_bookings', 'bookings', '2019-08-05 03:41:32', '2019-08-05 03:41:32'),
(55, 'add_bookings', 'bookings', '2019-08-05 03:41:32', '2019-08-05 03:41:32'),
(56, 'delete_bookings', 'bookings', '2019-08-05 03:41:32', '2019-08-05 03:41:32'),
(57, 'browse_kitchens', 'kitchens', '2019-08-05 03:52:11', '2019-08-05 03:52:11'),
(58, 'read_kitchens', 'kitchens', '2019-08-05 03:52:11', '2019-08-05 03:52:11'),
(59, 'edit_kitchens', 'kitchens', '2019-08-05 03:52:11', '2019-08-05 03:52:11'),
(60, 'add_kitchens', 'kitchens', '2019-08-05 03:52:11', '2019-08-05 03:52:11'),
(61, 'delete_kitchens', 'kitchens', '2019-08-05 03:52:11', '2019-08-05 03:52:11'),
(62, 'browse_items', 'items', '2019-08-05 04:55:17', '2019-08-05 04:55:17'),
(63, 'read_items', 'items', '2019-08-05 04:55:17', '2019-08-05 04:55:17'),
(64, 'edit_items', 'items', '2019-08-05 04:55:17', '2019-08-05 04:55:17'),
(65, 'add_items', 'items', '2019-08-05 04:55:18', '2019-08-05 04:55:18'),
(66, 'delete_items', 'items', '2019-08-05 04:55:18', '2019-08-05 04:55:18'),
(67, 'browse_recipes', 'recipes', '2019-08-05 04:55:46', '2019-08-05 04:55:46'),
(68, 'read_recipes', 'recipes', '2019-08-05 04:55:46', '2019-08-05 04:55:46'),
(69, 'edit_recipes', 'recipes', '2019-08-05 04:55:46', '2019-08-05 04:55:46'),
(70, 'add_recipes', 'recipes', '2019-08-05 04:55:46', '2019-08-05 04:55:46'),
(71, 'delete_recipes', 'recipes', '2019-08-05 04:55:46', '2019-08-05 04:55:46'),
(72, 'browse_recipe_details', 'recipe_details', '2019-08-05 05:01:02', '2019-08-05 05:01:02'),
(73, 'read_recipe_details', 'recipe_details', '2019-08-05 05:01:02', '2019-08-05 05:01:02'),
(74, 'edit_recipe_details', 'recipe_details', '2019-08-05 05:01:02', '2019-08-05 05:01:02'),
(75, 'add_recipe_details', 'recipe_details', '2019-08-05 05:01:02', '2019-08-05 05:01:02'),
(76, 'delete_recipe_details', 'recipe_details', '2019-08-05 05:01:02', '2019-08-05 05:01:02'),
(77, 'browse_out_bills', 'out_bills', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(78, 'read_out_bills', 'out_bills', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(79, 'edit_out_bills', 'out_bills', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(80, 'add_out_bills', 'out_bills', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(81, 'delete_out_bills', 'out_bills', '2019-08-06 05:49:59', '2019-08-06 05:49:59'),
(82, 'browse_out_bill_details', 'out_bill_details', '2019-08-06 05:50:52', '2019-08-06 05:50:52'),
(83, 'read_out_bill_details', 'out_bill_details', '2019-08-06 05:50:52', '2019-08-06 05:50:52'),
(84, 'edit_out_bill_details', 'out_bill_details', '2019-08-06 05:50:52', '2019-08-06 05:50:52'),
(85, 'add_out_bill_details', 'out_bill_details', '2019-08-06 05:50:52', '2019-08-06 05:50:52'),
(86, 'delete_out_bill_details', 'out_bill_details', '2019-08-06 05:50:52', '2019-08-06 05:50:52'),
(87, 'browse_in_bill_details', 'in_bill_details', '2019-08-07 00:24:47', '2019-08-07 00:24:47'),
(88, 'read_in_bill_details', 'in_bill_details', '2019-08-07 00:24:47', '2019-08-07 00:24:47'),
(89, 'edit_in_bill_details', 'in_bill_details', '2019-08-07 00:24:47', '2019-08-07 00:24:47'),
(90, 'add_in_bill_details', 'in_bill_details', '2019-08-07 00:24:47', '2019-08-07 00:24:47'),
(91, 'delete_in_bill_details', 'in_bill_details', '2019-08-07 00:24:47', '2019-08-07 00:24:47'),
(92, 'browse_in_bills', 'in_bills', '2019-08-07 00:24:57', '2019-08-07 00:24:57'),
(93, 'read_in_bills', 'in_bills', '2019-08-07 00:24:57', '2019-08-07 00:24:57'),
(94, 'edit_in_bills', 'in_bills', '2019-08-07 00:24:57', '2019-08-07 00:24:57'),
(95, 'add_in_bills', 'in_bills', '2019-08-07 00:24:57', '2019-08-07 00:24:57'),
(96, 'delete_in_bills', 'in_bills', '2019-08-07 00:24:57', '2019-08-07 00:24:57'),
(102, 'browse_order_status', 'order_status', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(103, 'read_order_status', 'order_status', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(104, 'edit_order_status', 'order_status', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(105, 'add_order_status', 'order_status', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(106, 'delete_order_status', 'order_status', '2019-08-08 03:14:55', '2019-08-08 03:14:55'),
(107, 'browse_order_statuses', 'order_statuses', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(108, 'read_order_statuses', 'order_statuses', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(109, 'edit_order_statuses', 'order_statuses', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(110, 'add_order_statuses', 'order_statuses', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(111, 'delete_order_statuses', 'order_statuses', '2019-08-08 03:17:38', '2019-08-08 03:17:38'),
(112, 'browse_stock_entries', 'stock_entries', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(113, 'read_stock_entries', 'stock_entries', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(114, 'edit_stock_entries', 'stock_entries', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(115, 'add_stock_entries', 'stock_entries', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(116, 'delete_stock_entries', 'stock_entries', '2019-08-19 05:01:57', '2019-08-19 05:01:57'),
(117, 'browse_measuring_units', 'measuring_units', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(118, 'read_measuring_units', 'measuring_units', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(119, 'edit_measuring_units', 'measuring_units', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(120, 'add_measuring_units', 'measuring_units', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(121, 'delete_measuring_units', 'measuring_units', '2019-08-20 02:55:38', '2019-08-20 02:55:38'),
(122, 'browse_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(123, 'read_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(124, 'edit_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(125, 'add_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(126, 'delete_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12'),
(127, 'browse_posts', 'posts', '2019-09-17 03:44:59', '2019-09-17 03:44:59'),
(128, 'read_posts', 'posts', '2019-09-17 03:44:59', '2019-09-17 03:44:59'),
(129, 'edit_posts', 'posts', '2019-09-17 03:44:59', '2019-09-17 03:44:59'),
(130, 'add_posts', 'posts', '2019-09-17 03:44:59', '2019-09-17 03:44:59'),
(131, 'delete_posts', 'posts', '2019-09-17 03:44:59', '2019-09-17 03:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` text COLLATE utf8mb4_unicode_ci,
  `featured` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Sukunda Nepalese Cuisine', NULL, 'asdasdasdas asdasdas', '<p>&nbsp;</p>\r\n<!-- about -->\r\n<div id=\"about\" class=\"section w3ls-banner-btm-main\">\r\n<div class=\"container\">\r\n<div class=\"banner-btm\">\r\n<div class=\"col-md-6 banner-btm-g1\"><img class=\"img-responsive\" src=\"frontend/image-assets/about.jpg\" alt=\"\" /></div>\r\n<div class=\"col-md-6 banner-btm-g2\">\r\n<h3 class=\"title-main\">Welcome To Sukunda Nepalese Cuisine</h3>\r\n<h4 class=\"sub-title\">Feel the flavour, feel the aroma, feel the taste in every bite.</h4>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vitae nunc auctor, malesuada est eu, pellentesque nisi. Nam in enim lacinia, hendrerit neque non, placerat quam.Mauris eu tortor congue purus congue iaculis sit amet tincidunt neque. Aliquam suscipit nisi erat, non ultricies ex aliquet a.</p>\r\n<div class=\"find-about\"><a href=\"http://www.elit.com.np/template/bhaktapur/#\" data-toggle=\"modal\" data-target=\"#myModal\">Find out more</a></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!-- Tooltip -->\r\n<div class=\"tooltip-content\">\r\n<div id=\"myModal\" class=\"modal fade features-modal\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\r\n<div class=\"modal-dialog modal-md\">\r\n<div class=\"modal-content\">\r\n<div class=\"modal-header\"><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\r\n<h3 class=\"title-main\">Sukunda Nepalese Cuisine</h3>\r\n</div>\r\n<div class=\"modal-body\"><img class=\"img-responsive\" src=\"frontend/image-assets/logo2.jpg\" alt=\"image\" />\r\n<h4>What is Sukunda?</h4>\r\n<p>Sukunda is a traditional Nepalese oil lamp with image of lord Ganesh embossed. It has a small protruding plate at the top front that holds oil and a small cotton wick to light. In every rites and rituals lighting sukunda is said to bring good luck.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<!-- //Tooltip -->\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'PUBLISHED', 0, '2019-09-17 04:10:00', '2019-09-17 06:14:40');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recipe_name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `created_at`, `updated_at`, `recipe_name`) VALUES
(1, '2019-08-06 23:35:00', '2019-08-06 23:38:16', 'Cake Recipe');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_details`
--

CREATE TABLE `recipe_details` (
  `recipe_detail_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quanity` double NOT NULL,
  `measuring_unit` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_details`
--

INSERT INTO `recipe_details` (`recipe_detail_id`, `recipe_id`, `item_id`, `quanity`, `measuring_unit`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 'gm', '2019-08-06 23:40:11', '2019-08-06 23:40:11'),
(2, 1, 2, 200, 'ml', '2019-08-06 23:44:35', '2019-08-06 23:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-08-05 02:46:35', '2019-08-05 02:46:35'),
(2, 'user', 'Normal User', '2019-08-05 03:19:29', '2019-08-05 03:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Sukunda Nepalese Cuisine', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Website of Nepali Cuisine, Nepali restaurant in Melbourne, Victoria, Australia', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\September2019\\vxQfAKuNY10jVzmZgX4z.jpg', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Sukunda', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.currency', 'Currency', 'AUD', NULL, 'text', 6, 'Site'),
(12, 'site.keywords', 'Keywords', 'Nepali cuisine, Nepali restaurant, Newari, Newari restaurant, Nepali restaurant in Australia, Nepali Restaurant in Melbourne, best nepali food in Australia.', NULL, 'text_area', 7, 'Site'),
(13, 'site.phone_number', 'Phone Number', '+61 3 91932661', NULL, 'text', 8, 'Site'),
(14, 'site.email', 'Website Email', 'hello@sukundacuisine.com.au', NULL, 'text', 9, 'Site'),
(16, 'site.address', 'Address', '150 Lygon StBrunswick East VIC 3057, Australia', NULL, 'text', 10, 'Site'),
(17, 'site.opening_time', 'Opening Time', '<h5>Monday &ndash; Wednesday</h5>\r\n<p>4:00 PM &ndash; 10:00 PM</p>\r\n<h5>Thursday &ndash; Saturday</h5>\r\n<p>12:00 PM &ndash; 10:00 PM</p>\r\n<h5>Sunday</h5>\r\n<p>12:00 PM &ndash; 9:00 PM</p>', NULL, 'rich_text_box', 11, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `stock_entries`
--

CREATE TABLE `stock_entries` (
  `stock_entry_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `measuring_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_entries`
--

INSERT INTO `stock_entries` (`stock_entry_id`, `item_id`, `invoice_id`, `date`, `item_name`, `quantity`, `measuring_unit`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, '2019-08-21', 'Voluptas eu illo dol', 733, 'l', '2019-08-21 01:15:22', '2019-08-21 01:15:22'),
(2, 6, NULL, '2019-08-21', 'Wheat Flour', 610, 'ml', '2019-08-21 01:15:22', '2019-08-21 01:15:22'),
(3, 6, NULL, '2019-08-21', 'Wheat Flour', 658, 'l', '2019-08-21 01:15:22', '2019-08-21 01:15:22'),
(4, 5, NULL, '2019-08-21', 'Voluptas eu illo dol', 113, 'ml', '2019-08-21 01:15:22', '2019-08-21 01:15:22'),
(5, 7, NULL, '2019-08-21', 'Water', 38, 'ml', '2019-08-21 02:22:10', '2019-08-21 02:22:10'),
(6, 5, NULL, '2019-08-21', 'Voluptas eu illo dol', 243, 'ml', '2019-08-21 02:22:10', '2019-08-21 02:22:10'),
(7, 4, NULL, '2019-08-21', 'Consequuntur cumque', 312, 'l', '2019-08-21 02:22:11', '2019-08-21 02:22:11'),
(8, 7, NULL, '2019-08-21', 'Water', 598, 'ml', '2019-08-21 02:23:49', '2019-08-21 02:23:49'),
(9, 7, NULL, '2019-08-21', 'Water', 446, 'ml', '2019-08-21 02:23:50', '2019-08-21 02:23:50'),
(10, 8, NULL, '2019-08-21', 'Wheat Flour', 591, 'ml', '2019-08-21 04:44:23', '2019-08-21 04:44:23'),
(11, 7, NULL, '2019-08-21', 'Water', 763, 'ml', '2019-08-21 04:44:24', '2019-08-21 04:44:24'),
(12, 8, NULL, '2019-08-21', 'Wheat Flour', 108, 'l', '2019-08-21 04:44:24', '2019-08-21 04:44:24'),
(13, 7, NULL, '2019-08-22', 'Water', 398, 'ml', '2019-08-22 00:18:12', '2019-08-22 00:18:12'),
(14, 6, NULL, '2019-08-22', 'Wheat Flour', 556, 'l', '2019-08-22 00:18:12', '2019-08-22 00:18:12'),
(15, 3, NULL, '2019-08-22', 'Water', 421, 'ml', '2019-08-22 05:38:13', '2019-08-22 05:38:13'),
(16, 8, NULL, '2019-08-22', 'Wheat Flour', 455, 'ml', '2019-08-22 05:38:13', '2019-08-22 05:38:13'),
(17, 7, NULL, '2019-08-22', 'Water', 176, 'ml', '2019-08-22 05:38:13', '2019-08-22 05:38:13'),
(18, 7, NULL, '2019-08-22', 'Water', 687, 'l', '2019-08-22 07:57:18', '2019-08-22 07:57:18'),
(19, 4, NULL, '2019-08-22', 'Consequuntur cumque', 380, 'ml', '2019-08-22 07:57:20', '2019-08-22 07:57:20'),
(20, 8, NULL, '2019-08-22', 'Wheat Flour', 135, 'l', '2019-08-22 07:57:20', '2019-08-22 07:57:20'),
(21, 3, NULL, '2019-08-22', 'Water', 262, 'l', '2019-08-22 07:58:11', '2019-08-22 07:58:11'),
(22, 7, NULL, '2019-08-22', 'Water', 251, 'ml', '2019-08-22 07:58:11', '2019-08-22 07:58:11'),
(23, 8, NULL, '2019-08-22', 'Wheat Flour', 569, 'l', '2019-08-22 07:58:12', '2019-08-22 07:58:12'),
(24, 6, NULL, '2019-08-22', 'Wheat Flour', 332, 'l', '2019-08-22 07:59:37', '2019-08-22 07:59:37'),
(25, 5, NULL, '2019-08-22', 'Voluptas eu illo dol', 940, 'ml', '2019-08-22 07:59:38', '2019-08-22 07:59:38'),
(26, 7, NULL, '2019-08-22', 'Water', 118, 'l', '2019-08-22 07:59:38', '2019-08-22 07:59:38');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `table_id` int(10) UNSIGNED NOT NULL,
  `table_space` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `table_space`, `created_at`, `updated_at`) VALUES
(1, 4, '2019-08-06 23:45:34', '2019-08-06 23:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 2, 'Sonam Sherpa', 'sonam.sherpa1980@gmail.com', 'users/default.png', NULL, '$2y$10$8VhwNIW9prWW2qtygb3gEObCH0ZRcfRkLEISP8ONONEWrpdCt257a', NULL, '{\"locale\":\"en\"}', '2019-08-05 02:46:35', '2019-09-19 03:01:16'),
(2, 1, 'Rohit Byanjankar', 'rohitbenz09@gmail.com', 'users\\September2019\\5C5lAPTA5qgWhyzIC2fI.jpg', NULL, '$2y$10$YG0TJyJuvJbFyQlfOjoLOeIHNwPcJIY9PC0IvOA6ijebU3dTdzvXu', NULL, '{\"locale\":\"en\"}', '2019-08-05 03:00:36', '2019-09-19 03:00:27'),
(3, 2, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Q0PST8ySdvlZaGm5pBP7meUtbQiTWT5D5c4AsUQGoOLuIQg1.PBeq', 'wG6Q47clUS0V3kMhchO65SCEYhzU8hbAlSpWcpN6Yv13ObrWNyHo9oEDO4fP', '{\"locale\":\"en\"}', '2019-08-21 05:02:59', '2019-08-21 05:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `food_menu_items`
--
ALTER TABLE `food_menu_items`
  ADD PRIMARY KEY (`food_menu_item_id`);

--
-- Indexes for table `in_bills`
--
ALTER TABLE `in_bills`
  ADD PRIMARY KEY (`in_bill_id`);

--
-- Indexes for table `in_bill_details`
--
ALTER TABLE `in_bill_details`
  ADD PRIMARY KEY (`in_bill_detail_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `kitchens`
--
ALTER TABLE `kitchens`
  ADD PRIMARY KEY (`kitchen_id`);

--
-- Indexes for table `measuring_units`
--
ALTER TABLE `measuring_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_categories`
--
ALTER TABLE `menu_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_lines`
--
ALTER TABLE `order_lines`
  ADD PRIMARY KEY (`order_line_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `out_bills`
--
ALTER TABLE `out_bills`
  ADD PRIMARY KEY (`out_bill_id`);

--
-- Indexes for table `out_bill_details`
--
ALTER TABLE `out_bill_details`
  ADD PRIMARY KEY (`out_bill_detail_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `recipe_details`
--
ALTER TABLE `recipe_details`
  ADD PRIMARY KEY (`recipe_detail_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `stock_entries`
--
ALTER TABLE `stock_entries`
  ADD PRIMARY KEY (`stock_entry_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `food_menu_items`
--
ALTER TABLE `food_menu_items`
  MODIFY `food_menu_item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `in_bills`
--
ALTER TABLE `in_bills`
  MODIFY `in_bill_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `in_bill_details`
--
ALTER TABLE `in_bill_details`
  MODIFY `in_bill_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kitchens`
--
ALTER TABLE `kitchens`
  MODIFY `kitchen_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `measuring_units`
--
ALTER TABLE `measuring_units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_lines`
--
ALTER TABLE `order_lines`
  MODIFY `order_line_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `out_bills`
--
ALTER TABLE `out_bills`
  MODIFY `out_bill_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `out_bill_details`
--
ALTER TABLE `out_bill_details`
  MODIFY `out_bill_detail_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `recipe_details`
--
ALTER TABLE `recipe_details`
  MODIFY `recipe_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stock_entries`
--
ALTER TABLE `stock_entries`
  MODIFY `stock_entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `table_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `in_bill_details`
--
ALTER TABLE `in_bill_details`
  ADD CONSTRAINT `fk_i_in_bill` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
