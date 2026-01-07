-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 05:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billing system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `is_ban` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_ban,1=ban',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `is_ban`, `created_at`) VALUES
(2, 'admin', 'admin@gmail.com', '$2y$10$RJ.HvSv.GjD9KEP1wSaLmuRmGrKd3YgzOXuxoRUVeQ.aRA5p43gGW', '1234567890', 0, '2025-12-13'),
(8, 'jay', 'jehgil15@gmail.com', '$2y$10$Yt2xTO6uZWgGK2aXrOdTXetAmImUk6lWm4imTffNlIqCwpRNiA122', '09755617596', 0, '2026-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumint(9) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible, 1=hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`) VALUES
(22, 'Coffee', 0, 0),
(23, 'Foods', 0, 0),
(24, 'Cold Drinks', 0, 0),
(25, 'Dessert', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible, 1=hidden',
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `contact`, `status`, `create_at`) VALUES
(15, 'jill', '9515171087', 0, '2025-12-18'),
(16, 'jill', '9755617596', 0, '2025-12-19'),
(17, 'alek', '456789', 0, '2025-12-19'),
(18, 'si beh', '23456789', 0, '2025-12-19'),
(19, 'jay', '1', 0, '2025-12-19'),
(20, 'aleck', '1234', 0, '2026-01-05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash, online',
  `order_placed_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(1, 9, '70823', 'INV-314312', '246', '2025-12-18', 'booked', 'Cash Payment', 2),
(2, 14, '41507', 'INV-176883', '123', '2025-12-18', 'booked', 'Online Payment', 2),
(3, 14, '52550', 'INV-346358', '123', '2025-12-18', 'booked', 'Cash Payment', 2),
(4, 14, '71293', 'INV-576797', '0', '2025-12-18', 'booked', 'Cash Payment', 2),
(5, 14, '45449', 'INV-193132', '123', '2025-12-18', 'booked', 'Cash Payment', 2),
(6, 14, '89621', 'INV-945858', '123', '2025-12-18', 'booked', 'Cash Payment', 2),
(7, 15, '42042', 'INV-233804', '5000', '2025-12-18', 'booked', 'Online Payment', 2),
(8, 15, '29690', 'INV-352016', '168', '2025-12-19', 'booked', 'Cash Payment', 2),
(9, 17, '26153', 'INV-583722', '358', '2025-12-19', 'booked', 'Cash Payment', 2),
(10, 18, '23105', 'INV-641189', '297', '2025-12-19', 'booked', 'Cash Payment', 2),
(11, 19, '82623', 'INV-816437', '50', '2025-12-19', 'booked', 'Cash Payment', 2),
(12, 19, '37348', 'INV-536342', '160', '2025-12-19', 'booked', 'Cash Payment', 2),
(13, 19, '59958', 'INV-450943', '49', '2025-12-19', 'booked', 'Cash Payment', 2),
(14, 19, '20586', 'INV-487102', '50', '2025-12-19', 'booked', 'Cash Payment', 2),
(15, 19, '66811', 'INV-201071', '0', '2025-12-19', 'booked', 'Online Payment', 2),
(16, 15, '61538', 'INV-539879', '1188', '2026-01-05', 'booked', 'Cash Payment', 2),
(17, 19, '27351', 'INV-897899', '100', '2026-01-07', 'booked', 'Online Payment', 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(10) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 8, '123', '2'),
(2, 2, 8, '123', '1'),
(3, 3, 8, '123', '1'),
(4, 5, 8, '123', '1'),
(5, 6, 8, '123', '1'),
(6, 7, 11, '5000', '1'),
(7, 8, 14, '69', '1'),
(8, 8, 19, '99', '1'),
(9, 9, 17, '59', '1'),
(10, 9, 29, '299', '1'),
(11, 10, 35, '49', '1'),
(12, 10, 33, '49', '1'),
(13, 10, 28, '199', '1'),
(14, 11, 12, '50', '1'),
(15, 12, 13, '55', '2'),
(16, 12, 12, '50', '1'),
(17, 13, 33, '49', '1'),
(18, 14, 12, '50', '1'),
(19, 16, 19, '99', '12'),
(20, 17, 12, '50', '2');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(9) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible, 1=hidden',
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `quantity`, `image`, `status`, `create_at`) VALUES
(12, '22', 'Americano', '', 50, 95, '', 0, '2025-12-19'),
(13, '22', 'Cappuccino', '', 55, 98, '', 0, '2025-12-19'),
(14, '22', 'Coffee Latte', '', 69, 99, '', 0, '2025-12-19'),
(15, '22', 'Frappuccino', '', 79, 100, '', 0, '2025-12-19'),
(16, '22', 'Macchiato', '', 59, 100, '', 0, '2025-12-19'),
(17, '22', 'Caramel Latte', '', 59, 99, '', 0, '2025-12-19'),
(18, '22', 'Espresso', '', 69, 100, '', 0, '2025-12-19'),
(19, '23', 'Cinnamon Roll', '', 99, 87, '', 0, '2025-12-19'),
(20, '23', 'Glazed Donut', '', 99, 100, '', 0, '2025-12-19'),
(21, '23', 'Choco Muffin', '', 119, 100, '', 0, '2025-12-19'),
(22, '23', 'Almond Roll', '', 129, 100, '', 0, '2025-12-19'),
(23, '23', 'Chicken Bread', '', 159, 100, '', 0, '2025-12-19'),
(24, '23', 'Banana Bread', '', 89, 100, '', 0, '2025-12-19'),
(25, '23', 'Sandwich', '', 49, 100, '', 0, '2025-12-19'),
(26, '23', 'Pizza', '', 99, 100, '', 0, '2025-12-19'),
(27, '25', 'Cheesecake', '', 99, 100, '', 0, '2025-12-19'),
(28, '25', 'Brownies', '', 199, 199, '', 0, '2025-12-19'),
(29, '25', 'Red Velvet Cake', '', 299, 99, '', 0, '2025-12-19'),
(30, '25', 'Choco Fudge', '', 159, 100, '', 0, '2025-12-19'),
(31, '24', 'Orange Juice', '', 59, 100, '', 0, '2025-12-19'),
(32, '24', 'Lemon Lime Soda', '', 59, 100, '', 0, '2025-12-19'),
(33, '24', 'Pineapple Juice', '', 49, 98, '', 0, '2025-12-19'),
(34, '24', 'Mango Juice', '', 49, 100, '', 0, '2025-12-19'),
(35, '24', 'Iced Tea', '', 49, 99, '', 0, '2025-12-19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
