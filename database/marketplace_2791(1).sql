-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 29, 2025 at 03:22 PM
-- Server version: 5.7.44
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marketplace_2791`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nama`, `email`, `password`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$oGZuG3SCHytcTj4aUFHXp.SznmkRgjdygjU6trp84vQmazIH871Cu', '2025-03-06 01:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(5, 'Fashion'),
(6, 'Alat Tulis');

-- --------------------------------------------------------

--
-- Table structure for table `kupon`
--

CREATE TABLE `kupon` (
  `id` int(11) NOT NULL,
  `kode_kupon` varchar(50) NOT NULL,
  `diskon` int(11) NOT NULL,
  `diskon_expired` date DEFAULT NULL,
  `status` enum('aktif','tidak_aktif') DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kupon`
--

INSERT INTO `kupon` (`id`, `kode_kupon`, `diskon`, `diskon_expired`, `status`, `created_at`) VALUES
(9, 'DISKON31', 31, '2025-07-31', 'aktif', '2025-07-17 12:31:35'),
(10, 'PROMO32', 32, '2025-07-23', 'aktif', '2025-07-17 12:35:24'),
(11, 'DISKON15', 15, '2025-08-15', 'aktif', '2025-07-17 12:55:12'),
(12, 'PROMO12', 12, '2025-08-12', 'aktif', '2025-07-25 02:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `merek`
--

CREATE TABLE `merek` (
  `id` int(11) NOT NULL,
  `nama_merek` varchar(100) NOT NULL,
  `gambar_merek` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merek`
--

INSERT INTO `merek` (`id`, `nama_merek`, `gambar_merek`) VALUES
(2, 'Panasonic', 'merek_1747206019.png'),
(3, 'eiger', 'merek_1747583905.png'),
(4, 'Faber-castel', 'merek_1747583981.png'),
(5, 'Nike', 'merek_1747585523.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `courier` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `status` enum('pending','success','failed','Batal') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `discount_amount` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `total_amount`, `shipping_cost`, `courier`, `service`, `status`, `created_at`, `discount_amount`) VALUES
(17, 'ORDER-1753801106', 2, 45603555, 115000, 'jne', 'JTR', 'success', '2025-07-29 14:58:26', '14137102.05'),
(18, 'ORDER-1753801401', 2, 58455555, 76000, 'jne', 'REG', 'success', '2025-07-29 15:03:21', '7014666.60'),
(19, 'ORDER-1753801817', 11, 45591555, 100000, 'jne', 'JTR', 'success', '2025-07-29 15:10:17', '14133382.05'),
(21, 'ORDER-1753802167', 2, 512000, 76000, 'jne', 'REG', 'success', '2025-07-29 15:16:07', '61440.00'),
(22, 'ORDER-1753802408', 2, 1400000, 100000, 'jne', 'JTR', 'success', '2025-07-29 15:20:08', '168000.00');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `toko_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `image`, `quantity`, `price`, `toko_id`) VALUES
(16, 'ORDER-1753801106', 5, 'pensil', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', 4, '12000.00', 1),
(17, 'ORDER-1753801106', 15, 'sepatu', '205f9c48d7332c816ced80d1dad444bc.jpg', 1, '45555555.00', 7),
(18, 'ORDER-1753801401', 15, 'sepatu', '205f9c48d7332c816ced80d1dad444bc.jpg', 1, '45555555.00', 7),
(19, 'ORDER-1753801401', 9, 'kulkas 12', 'cc67b8e9abce0b0b71eae39b7f97a532.png', 1, '12900000.00', 1),
(20, 'ORDER-1753801817', 15, 'sepatu', '205f9c48d7332c816ced80d1dad444bc.jpg', 1, '45555555.00', 7),
(21, 'ORDER-1753801817', 5, 'pensil', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', 3, '12000.00', 1),
(24, 'ORDER-1753802167', 6, 'Tas eiger', 'cd36fa1602dccba0a749275293ade66d.jpg', 1, '500000.00', 1),
(25, 'ORDER-1753802167', 5, 'pensil', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', 1, '12000.00', 1),
(26, 'ORDER-1753802408', 6, 'Tas eiger', 'cd36fa1602dccba0a749275293ade66d.jpg', 2, '500000.00', 1),
(27, 'ORDER-1753802408', 8, 'Sepatu Putih running', '2736ec0d7e5c815ce32a00e50f1b0d64.jpg', 1, '400000.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` text,
  `no_hp` varchar(15) DEFAULT NULL,
  `status` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
  `foto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id`, `nama`, `email`, `password`, `alamat`, `no_hp`, `status`, `foto`, `created_at`) VALUES
(2, 'Jokowi', 'jokowi@gmail.com', '$2y$10$nVChSdWUzmPCBptGJtJFVOkag8lzht1MS5XrI8kPuG5Nm8TZKWUKe', 'Solo', '344735652352341', 'aktif', 'profil_2_1753689669.jpg', '2025-05-07 14:34:51'),
(3, 'yafi', 'yafi@gmail.com', '$2y$10$2I/J6Y1OfWfNnNI0RsrhDOGOAmhmHYH3rwyy42KNnczoRSl5Jzbt6', 'jogja', '39863946748', 'aktif', NULL, '2025-05-19 00:12:28'),
(6, 'anton', 'anton@gmail.com', '$2y$10$HaRXeVne7UGeklq4cjbI0Ofzb7RqZF/zn344YgWS/Xg2GTRIXfJHG', 'Solo', '98676765645', 'aktif', NULL, '2025-05-21 07:56:11'),
(7, 'yanti', 'yanti@gmail.com', '$2y$10$5xG.rxBirnT5Avm0t1UmqepBEnBZp4GmHRcV4vltUP9rrI1WvTHsq', 'solo', '08976589034289', 'aktif', NULL, '2025-06-08 08:41:58'),
(8, 'jojo', 'jojo@gmail.com', '$2y$10$WeOhN2ZJJLWo/7RC7O6kTuip4AINy/NXhmXOnAAmAkvcEAdMkDEQ.', 'jkaskj', '13469146471246', 'aktif', NULL, '2025-06-08 20:40:38'),
(10, 'adit', 'adit@gmail.com', '$2y$10$KWj7lWyRimJQYqFkIj0suOKVwlO5tbMQbAIHCsP5WjQcDEamPrTN2', 'solo', '08912345678910', 'aktif', NULL, '2025-06-08 20:46:08'),
(11, 'db1', 'db1@gmail.com', '$2y$10$u3H/2kcjUD6iD/RixKLkgOVy/C0GxpBfyZo.V8APqLHawFvCe/NFe', 'amikom', '0987672656255', 'aktif', NULL, '2025-07-20 02:28:29'),
(12, 'hanif', 'hanif@gmail.com', '$2y$10$XTtalbcw0q2pANUUnA5A4ON20sOL8Pke4ExfTqkU/WA3tQldD5N2y', 'jogja', '768934693486349', 'aktif', NULL, '2025-07-28 03:05:04');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `pembeli_id` int(11) DEFAULT NULL,
  `pertanyaan` text NOT NULL,
  `jawaban` text,
  `tanggal` datetime NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `toko_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `merek_id` int(11) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `deskripsi` text,
  `harga` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `status` enum('tersedia','habis') DEFAULT 'tersedia',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pembeli_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `toko_id`, `kategori_id`, `merek_id`, `nama_produk`, `deskripsi`, `harga`, `stok`, `gambar`, `status`, `created_at`, `pembeli_id`) VALUES
(4, 1, 1, 2, 'kulkas', 'Kulkas Berkualitas', '15000000.00', 109, 'ba2d94211b9fc3179dccc40e43626e33.png', '', '2025-05-18 16:00:53', 2),
(5, 1, 6, 4, 'pensil', 'Alat tulis berkualitas', '12000.00', 97, '2599fe050ce56a6a24ef654ae7e16bfc.jpg', '', '2025-05-18 16:03:42', 2),
(6, 1, 5, 3, 'Tas eiger', 'Tas eiger', '500000.00', 581, 'cd36fa1602dccba0a749275293ade66d.jpg', '', '2025-05-18 16:07:55', 2),
(7, 1, 5, 5, 'Sepatu running', 'Sepatu Nike', '339000.00', 1208, 'a06dd7179f2ff052790844d6ea65b84f.jpg', '', '2025-05-18 16:28:15', 2),
(8, 2, 5, 5, 'Sepatu Putih running', 'Sepatu keren', '400000.00', 129, '2736ec0d7e5c815ce32a00e50f1b0d64.jpg', '', '2025-05-19 07:32:41', 3),
(9, 1, 1, 2, 'kulkas 12', 'sdjDVJ', '12900000.00', 118, 'cc67b8e9abce0b0b71eae39b7f97a532.png', '', '2025-05-19 16:27:48', 2),
(15, 7, 5, 4, 'sepatu', 'fdfgdgdg', '45555555.00', 100, '205f9c48d7332c816ced80d1dad444bc.jpg', '', '2025-07-28 04:09:31', 11);

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id_promo` int(11) NOT NULL,
  `nama_promo` varchar(100) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`id_promo`, `nama_promo`, `poster`, `status`, `link`) VALUES
(2, 'Ramadhan', 'What_Are_The_Different_Types_of_Knowledge_.jpg', 'aktif', '#'),
(3, 'Lebaran', 'Default_A_meal_set_for_two_with_2_pieces_of_fried_chicken_diff_3.jpg', 'aktif', '#');

-- --------------------------------------------------------

--
-- Table structure for table `sales_history`
--

CREATE TABLE `sales_history` (
  `id` int(11) NOT NULL,
  `toko_id` int(11) NOT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_history`
--

INSERT INTO `sales_history` (`id`, `toko_id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `total`, `status`, `image`, `created_at`) VALUES
(3, 1, 'ORDER-1753400857', 6, 'Tas eiger', 4, '500000.00', '2000000.00', 'success', 'cd36fa1602dccba0a749275293ade66d.jpg', '2025-07-24 23:47:53'),
(4, 1, 'ORDER-1753413372', 4, 'kulkas', 1, '15000000.00', '15000000.00', 'success', 'ba2d94211b9fc3179dccc40e43626e33.png', '2025-07-25 03:16:52'),
(5, 1, 'ORDER-1753413372', 6, 'Tas eiger', 1, '500000.00', '500000.00', 'success', 'cd36fa1602dccba0a749275293ade66d.jpg', '2025-07-25 03:16:52'),
(6, 7, 'ORDER-1753770150', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 06:22:57'),
(7, 1, 'ORDER-1753772891', 4, 'kulkas', 1, '15000000.00', '15000000.00', 'success', 'ba2d94211b9fc3179dccc40e43626e33.png', '2025-07-29 07:14:44'),
(8, 1, 'ORDER-1753773438', 5, 'pensil', 13, '12000.00', '156000.00', 'success', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', '2025-07-29 07:17:50'),
(9, 7, 'ORDER-1753797506', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 13:58:48'),
(10, 7, 'ORDER-1753798695', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 14:19:17'),
(11, 1, 'ORDER-1753801106', 5, 'pensil', 4, '12000.00', '48000.00', 'success', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', '2025-07-29 14:58:54'),
(12, 7, 'ORDER-1753801106', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 14:58:54'),
(13, 7, 'ORDER-1753801401', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 15:05:27'),
(14, 1, 'ORDER-1753801401', 9, 'kulkas 12', 1, '12900000.00', '12900000.00', 'success', 'cc67b8e9abce0b0b71eae39b7f97a532.png', '2025-07-29 15:05:28'),
(15, 7, 'ORDER-1753801817', 15, 'sepatu', 1, '45555555.00', '45555555.00', 'success', '205f9c48d7332c816ced80d1dad444bc.jpg', '2025-07-29 15:10:36'),
(16, 1, 'ORDER-1753801817', 5, 'pensil', 3, '12000.00', '36000.00', 'success', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', '2025-07-29 15:10:36'),
(17, 1, 'ORDER-1753802026', 6, 'Tas eiger', 1, '500000.00', '500000.00', 'success', 'cd36fa1602dccba0a749275293ade66d.jpg', '2025-07-29 15:14:14'),
(18, 1, 'ORDER-1753802026', 9, 'kulkas 12', 1, '12900000.00', '12900000.00', 'success', 'cc67b8e9abce0b0b71eae39b7f97a532.png', '2025-07-29 15:14:14'),
(19, 1, 'ORDER-1753802167', 6, 'Tas eiger', 1, '500000.00', '500000.00', 'success', 'cd36fa1602dccba0a749275293ade66d.jpg', '2025-07-29 15:17:02'),
(20, 1, 'ORDER-1753802167', 5, 'pensil', 1, '12000.00', '12000.00', 'success', '2599fe050ce56a6a24ef654ae7e16bfc.jpg', '2025-07-29 15:17:02'),
(21, 1, 'ORDER-1753802408', 6, 'Tas eiger', 2, '500000.00', '1000000.00', 'success', 'cd36fa1602dccba0a749275293ade66d.jpg', '2025-07-29 15:20:40'),
(22, 2, 'ORDER-1753802408', 8, 'Sepatu Putih running', 1, '400000.00', '400000.00', 'success', '2736ec0d7e5c815ce32a00e50f1b0d64.jpg', '2025-07-29 15:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id` int(11) NOT NULL,
  `pembeli_id` int(11) NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `deskripsi` text,
  `logo_toko` varchar(255) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id`, `pembeli_id`, `nama_toko`, `deskripsi`, `logo_toko`, `status`, `created_at`) VALUES
(1, 2, 'Mulyono group', 'toko milik mulyono', 'logo_toko_1_1747584862.png', 'aktif', '2025-05-07 23:21:24'),
(2, 3, 'Yafi mart', 'Toko milik yafi dan keluarga', 'Epic_Coffee_Epilog_Furniture.jpg', 'nonaktif', '2025-05-19 07:32:07'),
(3, 7, 'yanti', 'dsgsg', 'Default_A_meal_set_for_two_with_2_pieces_of_fried_chicken_diff_3.jpg', 'nonaktif', '2025-06-09 03:16:59'),
(4, 11, 'tokokita', 'toko kita', 'logo_toko_4_1753031505.jpg', 'nonaktif', '2025-07-20 17:11:20'),
(7, 11, 'febry', 'dsfsdf', 'jokowi.jpg', 'aktif', '2025-07-28 11:09:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon`
--
ALTER TABLE `kupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_kupon` (`kode_kupon`);

--
-- Indexes for table `merek`
--
ALTER TABLE `merek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `toko_id` (`toko_id`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `pembeli_id` (`pembeli_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toko_id` (`toko_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `merek_id` (`merek_id`),
  ADD KEY `pembeli_id` (`pembeli_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id_promo`);

--
-- Indexes for table `sales_history`
--
ALTER TABLE `sales_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toko_id` (`toko_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembeli_id` (`pembeli_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kupon`
--
ALTER TABLE `kupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `merek`
--
ALTER TABLE `merek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id_promo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales_history`
--
ALTER TABLE `sales_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pembeli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD CONSTRAINT `pertanyaan_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertanyaan_ibfk_2` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`merek_id`) REFERENCES `merek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sales_history`
--
ALTER TABLE `sales_history`
  ADD CONSTRAINT `sales_history_ibfk_1` FOREIGN KEY (`toko_id`) REFERENCES `toko` (`id`),
  ADD CONSTRAINT `sales_history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produk` (`id`);

--
-- Constraints for table `toko`
--
ALTER TABLE `toko`
  ADD CONSTRAINT `toko_ibfk_1` FOREIGN KEY (`pembeli_id`) REFERENCES `pembeli` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
