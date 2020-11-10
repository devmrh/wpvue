-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 06, 2020 at 07:37 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`) VALUES
(1, 'آذربایجان شرقی'),
(2, 'آذربایجان غربی'),
(3, 'اردبیل'),
(4, 'اصفهان'),
(5, 'البرز'),
(6, 'ایلام'),
(7, 'بوشهر'),
(8, 'تهران'),
(9, 'خراسان جنوبی'),
(10, 'خراسان رضوی'),
(11, 'خراسان شمالی'),
(12, 'خوزستان'),
(13, 'زنجان'),
(14, 'سمنان'),
(15, 'سیستان وبلوچستان'),
(16, 'فارس'),
(17, 'قزوین'),
(18, 'قم'),
(19, 'لرستان'),
(20, 'مازندران'),
(21, 'مرکزی'),
(22, 'هرمزگان'),
(23, 'همدان'),
(24, 'چهارمحال وبختیاری'),
(25, 'کردستان'),
(26, 'کرمان'),
(27, 'کرمانشاه'),
(28, 'کهگیلویه وبویراحمد'),
(29, 'گلستان'),
(30, 'گیلان'),
(31, 'یزد');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
