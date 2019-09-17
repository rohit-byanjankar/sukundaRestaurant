-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2019 at 01:14 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `subein_rms`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(10) UNSIGNED NOT NULL,
  `table_id` int(11) NOT NULL,
  `booker_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booked_from` datetime NOT NULL,
  `booked_till` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(26, 4, 'image', 'text', 'Image', 0, 1, 1, 1, 1, 1, '{}', 7),
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
(53, 9, 'table_id', 'text', 'Table Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(54, 9, 'booker_name', 'text', 'Booker Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(55, 9, 'booked_from', 'text', 'Booked From', 1, 1, 1, 1, 1, 1, '{}', 5),
(56, 9, 'booked_till', 'text', 'Booked Till', 1, 1, 1, 1, 1, 1, '{}', 6),
(57, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(58, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
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
(80, 9, 'booking_belongsto_table_relationship', 'relationship', 'Table Id', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Table\",\"table\":\"tables\",\"type\":\"belongsTo\",\"column\":\"table_id\",\"key\":\"table_id\",\"label\":\"table_id\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
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
(171, 7, 'amount', 'number', 'Amount', 1, 1, 1, 1, 1, 1, '{}', 9);

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
(4, 'food_menu_items', 'food-menu-items', 'Food Menu Item', 'Food Menu Items', NULL, 'App\\FoodMenuItem', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:27:49', '2019-08-06 23:33:41'),
(5, 'menu_categories', 'menu-categories', 'Menu Category', 'Menu Categories', NULL, 'App\\MenuCategory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-05 03:30:10', '2019-08-05 03:30:10'),
(6, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:32:06', '2019-08-12 00:54:36'),
(7, 'order_lines', 'order-lines', 'Order Line', 'Order Lines', NULL, 'App\\OrderLine', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:34:04', '2019-08-22 00:03:53'),
(8, 'tables', 'tables', 'Table', 'Tables', NULL, 'App\\Table', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:38:31', '2019-08-06 23:53:36'),
(9, 'bookings', 'bookings', 'Booking', 'Bookings', NULL, 'App\\Booking', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2019-08-05 03:41:31', '2019-08-05 05:05:30'),
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
(23, 'payments', 'payments', 'Payment', 'Payments', NULL, 'App\\Payment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2019-08-21 04:56:12', '2019-08-21 04:56:12');

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
  `recipe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_menu_items`
--

INSERT INTO `food_menu_items` (`food_menu_item_id`, `category_id`, `item_name`, `image`, `price`, `description`, `created_at`, `updated_at`, `recipe_id`) VALUES
(2, 1, 'Wheat Flour', 'sfasdaf', 2342, 'fasdfa', '2019-08-08 02:25:50', '2019-08-08 02:25:50', 1),
(3, 1, 'Garrett Dunn', 'Voluptates fugiat qu', 271, 'Rerum quod amet ita', '2019-08-23 04:56:21', '2019-08-23 04:56:21', NULL),
(4, 3, 'Veronica Watkins', 'Id qui fugit veniam', 70, 'Consectetur consecte', '2019-08-23 04:56:35', '2019-08-23 04:56:35', NULL);

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
  `item_id` int(11) UNSIGNED NOT NULL,
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
(1, 'admin', '2019-08-05 03:19:27', '2019-08-05 03:19:27');

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
(1, 'Drinks', '2019-08-06 05:27:25', '2019-08-06 05:27:25'),
(2, 'Drinks', '2019-08-06 05:30:02', '2019-08-06 05:30:02'),
(3, 'Breakfast', '2019-08-08 02:26:27', '2019-08-08 02:26:27');

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
(22, 1, 'Out Bills', '', '_self', NULL, NULL, 27, 2, '2019-08-06 05:49:59', '2019-08-21 04:58:02', 'voyager.out-bills.index', NULL),
(24, 1, 'Restaurant', '', '_self', 'voyager-shop', '#000000', NULL, 6, '2019-08-07 00:16:51', '2019-08-21 04:58:02', NULL, ''),
(26, 1, 'Recipes', '', '_self', 'voyager-documentation', '#000000', NULL, 7, '2019-08-07 00:22:52', '2019-08-23 04:24:23', 'voyager.recipes.index', 'null'),
(27, 1, 'Bill', '', '_self', 'voyager-logbook', '#000000', NULL, 8, '2019-08-07 00:23:15', '2019-08-21 04:58:02', NULL, ''),
(28, 1, 'Food Menu Item', '', '_self', 'voyager-pizza', '#000000', NULL, 4, '2019-08-07 00:23:50', '2019-08-07 00:31:47', NULL, ''),
(30, 1, 'In Bills', '', '_self', NULL, NULL, 27, 1, '2019-08-07 00:24:57', '2019-08-07 00:29:45', 'voyager.in-bills.index', NULL),
(33, 1, 'Order Statuses', '', '_self', NULL, NULL, 37, 1, '2019-08-08 03:17:38', '2019-08-21 04:59:57', 'voyager.order-statuses.index', NULL),
(34, 1, 'Stock Entries', '', '_self', NULL, NULL, 37, 2, '2019-08-19 05:01:57', '2019-08-21 04:59:59', 'voyager.stock-entries.index', NULL),
(35, 1, 'Measuring Units', '', '_self', NULL, NULL, 37, 3, '2019-08-20 02:55:39', '2019-08-21 05:00:01', 'voyager.measuring-units.index', NULL),
(36, 1, 'Payments', '', '_self', 'voyager-dollar', '#000000', NULL, 9, '2019-08-21 04:56:12', '2019-08-21 05:01:34', 'voyager.payments.index', 'null'),
(37, 1, 'Miscellaneous', '', '_self', 'voyager-hammer', '#000000', NULL, 10, '2019-08-21 04:59:37', '2019-08-21 05:01:21', NULL, '');

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
  `order_id` int(11) UNSIGNED NOT NULL,
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
(35, 'Lacy Booker', '1990-06-23', '2019-08-23 05:04:25', '2019-08-23 05:04:25', 'pending', 0, 'Commodo natus tempor'),
(36, 'Mechelle Mckinney', '1975-07-05', '2019-08-23 05:21:49', '2019-08-23 05:21:49', 'pending', 0, 'Hic ut ullam deserun');

-- --------------------------------------------------------

--
-- Table structure for table `order_lines`
--

CREATE TABLE `order_lines` (
  `order_line_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `food_menu_item_id` int(11) NOT NULL,
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

INSERT INTO `order_lines` (`order_line_id`, `order_id`, `food_menu_item_id`, `quantity`, `rate`, `created_at`, `updated_at`, `particular_status`, `amount`) VALUES
(45, 35, 2, 763, 60, '2019-08-23 05:04:25', '2019-08-23 05:19:11', 'ready', 84),
(46, 35, 4, 413, 65, '2019-08-23 05:04:25', '2019-08-23 05:04:25', 'pending', 20),
(47, 35, 3, 605, 49, '2019-08-23 05:04:25', '2019-08-23 05:08:46', 'started cooking', 22),
(48, 35, 2, 1, 123, '2019-08-23 05:08:46', '2019-08-23 05:08:46', 'pending', 1234),
(49, 36, 4, 82, 77, '2019-08-23 05:21:49', '2019-08-23 05:21:49', 'pending', 22),
(50, 36, 4, 597, 56, '2019-08-23 05:21:49', '2019-08-23 05:21:49', 'pending', 11),
(51, 36, 3, 722, 37, '2019-08-23 05:21:50', '2019-08-23 05:21:50', 'pending', 74),
(52, 36, 4, 283, 29, '2019-08-23 05:21:50', '2019-08-23 05:21:50', 'pending', 100);

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
(4, 47, 'creditCard', 'unpaid', 31, 'Iure ut recusandae Ea iure eiusmod sit', '1', 1997, NULL, NULL, NULL, '2019-08-20 05:42:49', '2019-08-20 05:42:49'),
(5, 27, 'cash', 'unpaid', 82, 'Asperiores id qui en', '6', 1998, NULL, 'Iure incidunt elit', 48, '2019-08-23 02:04:59', '2019-08-23 02:04:59');

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
(126, 'delete_payments', 'payments', '2019-08-21 04:56:12', '2019-08-21 04:56:12');

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
(126, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `recipe_details`
--

CREATE TABLE `recipe_details` (
  `recipe_detail_id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `item_id` int(11) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `measuring_unit` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_details`
--

INSERT INTO `recipe_details` (`recipe_detail_id`, `recipe_id`, `item_id`, `quantity`, `measuring_unit`, `created_at`, `updated_at`) VALUES
(3, 2, 7, 346, 'l', '2019-08-23 02:03:30', '2019-08-23 02:03:30');

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
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Restaurant M.S.', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.currency', 'Currency', 'Rs.', NULL, 'text', 6, 'Site');

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
(1, 1, 'Sonam Sherpa', 'sonam.sherpa1980@gmail.com', 'users/default.png', NULL, '$2y$10$8VhwNIW9prWW2qtygb3gEObCH0ZRcfRkLEISP8ONONEWrpdCt257a', NULL, NULL, '2019-08-05 02:46:35', '2019-08-05 02:46:35'),
(2, 1, 'Sonam Sherpa', 'admin', 'users/default.png', NULL, '$2y$10$Dr7js50K9/cjm/sQdm2vyea4.pMX5stgbGLfF0CYyxsip6kNqnNoK', NULL, NULL, '2019-08-05 03:00:36', '2019-08-05 03:00:36'),
(3, 1, 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Q0PST8ySdvlZaGm5pBP7meUtbQiTWT5D5c4AsUQGoOLuIQg1.PBeq', NULL, '{\"locale\":\"en\"}', '2019-08-21 05:02:59', '2019-08-21 05:02:59');

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
  ADD PRIMARY KEY (`order_line_id`),
  ADD KEY `order_id` (`order_id`);

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
  ADD PRIMARY KEY (`recipe_detail_id`),
  ADD KEY `item_id` (`item_id`);

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
  MODIFY `booking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `food_menu_items`
--
ALTER TABLE `food_menu_items`
  MODIFY `food_menu_item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `item_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_categories`
--
ALTER TABLE `menu_categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_lines`
--
ALTER TABLE `order_lines`
  MODIFY `order_line_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipe_details`
--
ALTER TABLE `recipe_details`
  MODIFY `recipe_detail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
-- Constraints for table `recipe_details`
--
ALTER TABLE `recipe_details`
  ADD CONSTRAINT `fk_i_recipe_detail` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
