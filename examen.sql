-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 22, 2023 at 02:29 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `examen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `status` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `login_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `status`, `deleted`, `login_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Jorge', 'jorge@mail.es', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54', 1, 0, '2022-10-11 17:26:13', '2022-10-07 18:00:41', '2022-10-11 17:27:38', NULL),
(4, 'Jaime', 'jaime@mail.es', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54', 1, 0, '2023-03-21 18:48:23', '2022-10-11 18:02:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `state` tinyint NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `send` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `payment_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `state`, `user_id`, `product_id`, `quantity`, `discount`, `send`, `date`, `product_price`, `payment_id`) VALUES
(1, 1, 1, 2, '3.00', '1.99', '2.99', '2022-10-21 18:38:02', '0.00', NULL),
(2, 1, 1, 1, '2.00', '0.99', '1.99', '2022-10-21 18:38:44', '0.00', NULL),
(13, 0, 2, 2, '1.00', '1.99', '2.99', '2023-03-22 01:55:24', '19.99', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` int NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `type`, `value`, `description`) VALUES
(1, 'adminStatus', 0, 'Inactivo'),
(2, 'adminStatus', 1, 'Activo'),
(3, 'productType', 1, 'Curso en línea'),
(4, 'productType', 2, 'Libro'),
(5, 'productStatus', 0, 'Inactivo'),
(6, 'productStatus', 1, 'Activo');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`) VALUES
(3, 'visa'),
(4, 'mastercard'),
(5, 'paypal'),
(6, 'efectivo');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `type` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `send` decimal(10,2) NOT NULL,
  `image` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `published` date NOT NULL,
  `relation1` int NOT NULL,
  `relation2` int NOT NULL,
  `relation3` int NOT NULL,
  `mostSold` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `new` char(1) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `status` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `create_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `author` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `publisher` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `pages` int NOT NULL,
  `people` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `objetives` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `necesites` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `type`, `name`, `description`, `price`, `discount`, `send`, `image`, `published`, `relation1`, `relation2`, `relation3`, `mostSold`, `new`, `status`, `deleted`, `create_at`, `updated_at`, `deleted_at`, `author`, `publisher`, `pages`, `people`, `objetives`, `necesites`) VALUES
(1, '2', 'El nombre de la rosa', '&lt;p&gt;dfvsdfv jdfd &amp;nbsp;&amp;nbsp;&lt;strong&gt;kjdfh&lt;/strong&gt; kjf &lt;i&gt;jdjgk&lt;/i&gt; vjk&lt;/p&gt;', '9.99', '0.99', '1.99', 'prueba.jpeg', '2024-10-19', 0, 0, 0, '1', '1', 0, 0, '2022-10-18 19:12:02', '2023-03-21 18:57:10', NULL, 'Pepe', 'Jos&eacute;', 100, '', '', ''),
(2, '2', 'El retorno del rey', '&lt;p&gt;dfvsdfv jdfd &amp;nbsp;&amp;nbsp;&lt;strong&gt;kjdfh&lt;/strong&gt; kjf &lt;i&gt;jdjgk&lt;/i&gt; vjk&lt;/p&gt;', '19.99', '1.99', '2.99', 'images.jpeg', '2023-10-24', 0, 0, 0, '0', '1', 0, 0, '2022-10-18 19:16:16', '2023-03-21 18:58:23', NULL, 'Pepe', 'Jos&eacute;', 100, '', '', ''),
(3, '1', 'From zero to master in PHP', '&lt;p&gt;&lt;i&gt;Mejora hasta el infinito&lt;/i&gt; tus habilidades en &lt;strong&gt;PHP&lt;/strong&gt; y programaci&oacute;n orientada a objetos, &lt;strong&gt;POO&lt;/strong&gt;.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&lt;br&gt;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,&lt;br&gt;quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&lt;br&gt;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&lt;br&gt;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&lt;br&gt;proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;', '9.99', '0.99', '0.00', '20150711-mac.jpg', '2023-10-27', 0, 0, 0, '1', '1', 1, 0, '2022-10-20 14:23:44', '2023-03-21 18:59:02', NULL, 'Pepe', 'Jos&eacute;', 100, 'Novatos', 'Desde la nada al todo en PHP', 'Ganas, muchas ganas');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `first_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `last_name_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `last_name_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `address` varchar(150) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `state` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `zipcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name_1`, `last_name_2`, `email`, `address`, `city`, `state`, `zipcode`, `country`, `password`) VALUES
(1, 'Pepe', 'Pérez', 'Sánchez', 'pepe@mail.es', 'c/ La suya 1', 'Murcia', 'Murcia', '30001', 'España', 'a69f16dbd2c154898e4bf453fd0694a11d429bc86972a26b521ffd9c2c84b9ca6253e0b10ae26c39d0d7b71f0eb973758f6b43eba1949fd9c4faaeeb18dd5b74'),
(2, 'Juan', 'García', 'Martínez', 'juan@juan.es', 'c/ La otra', 'Valencia', 'Valencia', '46001', 'España', '806cc6e9290ccac7e77a34f545b28fdf3c8a87dab0f144f3885b2411483e433df0a34d9d11355f20b74df86b9bbbe5dd95d4046be9430851b8fbdbc390dc8e54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
