-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2024 at 08:08 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dynamic`
--
CREATE DATABASE IF NOT EXISTS `dynamic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dynamic`;

-- --------------------------------------------------------

--
-- Table structure for table `backup_uploadimages`
--

DROP TABLE IF EXISTS `backup_uploadimages`;
CREATE TABLE IF NOT EXISTS `backup_uploadimages` (
  `backup_id` int NOT NULL AUTO_INCREMENT,
  `img_id` int DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `id_img` int DEFAULT NULL,
  `backup_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`backup_id`),
  KEY `img_id` (`img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `backup_uploadimages`
--

INSERT INTO `backup_uploadimages` (`backup_id`, `img_id`, `image_name`, `id_img`, `backup_date`) VALUES
(1, 10, '20240923075528.png', NULL, '2024-09-23 14:59:31'),
(2, 10, '20240923075931.jpg', NULL, '2024-09-23 15:02:21'),
(3, 10, '20240923080221_0.png', NULL, '2024-09-23 15:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mmb_id` smallint NOT NULL AUTO_INCREMENT,
  `mmb_name` varchar(20) NOT NULL,
  `mmb_surname` varchar(30) NOT NULL,
  `mmb_username` varchar(20) NOT NULL,
  `mmb_pwd` varchar(50) NOT NULL,
  `mmb_addr` varchar(100) DEFAULT NULL,
  `mmb_phone` varchar(15) DEFAULT NULL,
  `mmb_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mmb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mmb_id`, `mmb_name`, `mmb_surname`, `mmb_username`, `mmb_pwd`, `mmb_addr`, `mmb_phone`, `mmb_show`) VALUES
(24, '1', '1', 'Dynamin66', '1234', '1', '1', 0),
(2, '2', '2', '2', '2', '2', '2', 1),
(1, '1', '1', '1', '1', '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prod_id` int NOT NULL,
  `prod_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prod_desc` text COLLATE utf8mb4_general_ci,
  `pty_id` int DEFAULT NULL,
  `prod_show` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prod_id`, `prod_name`, `prod_desc`, `pty_id`, `prod_show`) VALUES
(2, 'เสื้อยืด', 'เสื้อยืดคอตตอน 100% สีพื้น.', 2, 1),
(3, 'โต๊ะทำงาน', 'โต๊ะทำงานไม้เนื้อแข็ง ขนาด 120x60 ซม.', 3, 1),
(4, 'โทรศัพท์มือถือ', 'สมาร์ทโฟน 5G รุ่นใหม่ล่าสุด.', 1, 1),
(5, 'เสื้อยืด', 'เสื้อยืดคอตตอน 100% สีพื้น.', 2, 1),
(6, 'โต๊ะทำงาน', 'โต๊ะทำงานไม้เนื้อแข็ง ขนาด 120x60 ซม.', 3, 1),
(7, 'ไก่จ๊า 1', 'ไก่จ๊า', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `pty_id` int NOT NULL,
  `pty_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pty_desc` text COLLATE utf8mb4_general_ci,
  `pty_show` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`pty_id`, `pty_name`, `pty_desc`, `pty_show`) VALUES
(1, 'อิเล็กทรอนิกส์', 'อุปกรณ์และแก็ดเจ็ตต่างๆ เช่น โทรศัพท์มือถือ, แล็ปท็อป, และกล้อง.', 1),
(2, 'เสื้อผ้า', 'สิ่งของที่สวมใส่ได้ เช่น เสื้อ, กางเกง, และอุปกรณ์เสริม.', 1),
(3, 'เฟอร์นิเจอร์', 'เฟอร์นิเจอร์สำหรับบ้านและสำนักงาน เช่น โต๊ะ, เก้าอี้, และโซฟา.', 1),
(4, 'อิเล็กทรอนิกส์', 'อุปกรณ์และแก็ดเจ็ตต่างๆ เช่น โทรศัพท์มือถือ, แล็ปท็อป, และกล้อง.', 1),
(5, 'เสื้อผ้า', 'สิ่งของที่สวมใส่ได้ เช่น เสื้อ, กางเกง, และอุปกรณ์เสริม.', 1),
(6, 'เฟอร์นิเจอร์', 'เฟอร์นิเจอร์สำหรับบ้านและสำนักงาน เช่น โต๊ะ, เก้าอี้, และโซฟา.', 1),
(0, 'ประเภทสินค้าทดสอบ', 'คำอธิบายของประเภทสินค้าทดสอบ', 1),
(0, 'ประเภทสินค้าทดสอบ', 'คำอธิบายของประเภทสินค้าทดสอบ', 1),
(0, 'วัตถุดิบและชิ้นส่วน', 'วัตถุดิบและชิ้นส่วน', 1),
(0, 'วัตถุดิบและชิ้นส่วน', 'วัตถุดิบและชิ้นส่วน', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `std_id` int NOT NULL AUTO_INCREMENT,
  `std_name` varchar(50) NOT NULL,
  `std_surname` varchar(50) NOT NULL,
  `std_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`std_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_name`, `std_surname`, `std_show`) VALUES
(1, 'aa', 'bb', 1),
(2, 'aa', 'bb', 1),
(3, 'cc', 'cc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uploadimages`
--

DROP TABLE IF EXISTS `uploadimages`;
CREATE TABLE IF NOT EXISTS `uploadimages` (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `image_name` longblob NOT NULL,
  `id_img` int NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uploadimages`
--

INSERT INTO `uploadimages` (`img_id`, `image_name`, `id_img`) VALUES
(10, 0x32303234303932333038303232395f302e6a7067, 0),
(9, 0x32303234303932333037313435362e6a7067, 0),
(7, 0x32303234303932333037313434332e706e67, 0),
(8, 0x32303234303932333037313435312e706e67, 0),
(11, 0x32303234303932333037353331382e706e67, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_surname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `user_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_surname`, `user_show`) VALUES
(44, 'WWW', 'WWW', 1),
(45, 'ABC', 'ABC', 1),
(46, 'ABC', 'ABC', 0),
(47, 'ABC', 'ABC', 0),
(48, 'OOOO', 'OOOO', 0),
(49, 'OOO', 'OOO', 1),
(50, 'OOO', 'OOO', 1),
(51, 'OOO', 'OOO', 1),
(52, 'OOO', 'OOO', 1),
(53, 'OOO', 'OOO', 1),
(54, '123', '123', 0),
(55, '123', '123', 0),
(56, '11111111', '11111111', 0),
(57, '10', '10', 0),
(58, '123', '123', 0),
(59, '123', '123', 0),
(60, '1', '1', 0),
(61, '1', '1', 0),
(62, '1', '1', 0),
(63, '2', '2', 0),
(64, '555555', '55555', 1),
(65, '1', '2', 1);
--
-- Database: `dynamic 6-6`
--
CREATE DATABASE IF NOT EXISTS `dynamic 6-6` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `dynamic 6-6`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `crt_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_id` smallint UNSIGNED NOT NULL,
  `prd_id` smallint UNSIGNED NOT NULL,
  `crt_amount` smallint UNSIGNED NOT NULL,
  `crt_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crt_id`),
  KEY `mmb_id` (`mmb_id`),
  KEY `prd_id` (`prd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mmb_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_surname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_addr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mmb_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mmb_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mmb_id`),
  UNIQUE KEY `mmb_username` (`mmb_username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mmb_id`, `mmb_name`, `mmb_surname`, `mmb_username`, `mmb_pwd`, `mmb_addr`, `mmb_phone`, `mmb_show`) VALUES
(2, '', 'เย็น', 'somying', '123', 'ที่นอน', '0898765432', 1),
(3, 'สมศรี', 'งาม', 'somsri', '123', 'เตียง', '0855555555', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prd_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `prd_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prd_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pty_id` smallint UNSIGNED DEFAULT NULL,
  `prd_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`prd_id`),
  KEY `pty_id` (`pty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `pty_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pty_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pty_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pty_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pty_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `std_id` int DEFAULT NULL,
  `std_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Database: `my_database`
--
CREATE DATABASE IF NOT EXISTS `my_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `my_database`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `crt_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_id` smallint UNSIGNED NOT NULL,
  `prd_id` smallint UNSIGNED NOT NULL,
  `pty_id` smallint UNSIGNED DEFAULT NULL,
  `crt_amount` smallint UNSIGNED NOT NULL,
  `crt_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crt_id`),
  KEY `mmb_id` (`mmb_id`),
  KEY `prd_id` (`prd_id`),
  KEY `pty_id` (`pty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mmb_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_addr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mmb_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mmb_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mmb_id`),
  UNIQUE KEY `mmb_username` (`mmb_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mmb_id`, `mmb_name`, `mmb_surname`, `mmb_username`, `mmb_pwd`, `mmb_addr`, `mmb_phone`, `mmb_show`) VALUES
(1, 'สมชาย', 'ดี', 'iPhone', '123', 'บ้าน', '0812345678', 1),
(2, 'สมหญิง', 'เย็น', 'somying', '123', 'ที่นอน', '0898765432', 1),
(3, 'สมศรี', 'งาม', 'somsri', '123', 'เตียง', '0855555555', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prd_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `prd_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prd_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pty_id` smallint UNSIGNED DEFAULT NULL,
  `prd_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`prd_id`),
  KEY `pty_id` (`pty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `pty_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `pty_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pty_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pty_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `std_id` int DEFAULT NULL,
  `std_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`mmb_id`) REFERENCES `member` (`mmb_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`prd_id`) REFERENCES `product` (`prd_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`pty_id`) REFERENCES `product_type` (`pty_id`) ON DELETE SET NULL;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`pty_id`) REFERENCES `product_type` (`pty_id`) ON DELETE SET NULL;
--
-- Database: `pro-test`
--
CREATE DATABASE IF NOT EXISTS `pro-test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `pro-test`;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mmb_id` smallint NOT NULL AUTO_INCREMENT,
  `mmb_name` varchar(20) NOT NULL,
  `mmb_surname` varchar(30) NOT NULL,
  `mmb_usename` varchar(20) NOT NULL,
  `mmb_pwd` varchar(50) NOT NULL,
  `mmb_addr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mmb_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mmb_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mmb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mmb_id`, `mmb_name`, `mmb_surname`, `mmb_usename`, `mmb_pwd`, `mmb_addr`, `mmb_phone`, `mmb_show`) VALUES
(1, 'ฟฟ', 'mayuri', 'GhostCats', '12345', '=.=.=.=.=', '034-254-2514', 1),
(2, 'koko', 'lili', 'ku', 'sg', '121424001145472104', '2101245404254', 1),
(3, 'Koga', 'hoke', 'koga', '12334', '=-=-=-=', '036963658', 1),
(5, 'พีร-วัส', 'รัตนกิจ', 'กาย', '12345', '1477', '06255899', 1),
(15, 'dd', 'dd', 'dd', 'dd', 'dd', '00', 1),
(27, 'ฟฟ', 'ฟฟ', 'aa', 'ฟฟ', 'ฟฟ', '00', 1),
(17, 'dd', 'dd', 'aa', 'aa', 'aa', 'aa', 1),
(28, 'ฟหกฟหก', 'ฟหกฟหก', '', 'ฟหกกฟหฟหก', 'กฟห', 'กฟหก', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prd_id` smallint NOT NULL AUTO_INCREMENT,
  `prd_name` varchar(50) NOT NULL,
  `prd_desc` varchar(100) DEFAULT NULL,
  `pty_id` smallint DEFAULT NULL,
  `prd_show` tinyint(1) DEFAULT '1',
  `prd_show2` tinyint(1) NOT NULL COMMENT 'สินค้าแนะนำ',
  `prd_show3` tinyint(1) NOT NULL COMMENT 'สินค้าโปรชั่น',
  `prd_show4` tinyint(1) NOT NULL COMMENT 'สินค้าใหม่',
  PRIMARY KEY (`prd_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prd_id`, `prd_name`, `prd_desc`, `pty_id`, `prd_show`, `prd_show2`, `prd_show3`, `prd_show4`) VALUES
(1, 'ฟหก', 'bb', 3, 1, 0, 0, 0),
(2, 'sadasd', 'dasdasd', 2, 0, 0, 0, 0),
(3, 'adsda', 'sdasdasd', 3, 4, 0, 0, 0),
(4, 'dasdasd', 'dasdasd', 2, 1, 0, 0, 0),
(5, '44', '11', 3, 1, 0, 0, 0),
(6, 'sdasdasdasd', 'fasfa', 3, 1, 0, 0, 0),
(24, 'ฟฟ', 'ฟฟ', 3, 1, 0, 0, 0),
(23, 'ฟฟฟ', 'ฟฟฟ', 3, 1, 0, 0, 0),
(22, 'ฟฟ', 'ฟฟ', 3, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `pty_id` smallint NOT NULL AUTO_INCREMENT,
  `pty_name` varchar(50) NOT NULL,
  `pty_desc` varchar(100) DEFAULT NULL,
  `pty_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`pty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`pty_id`, `pty_name`, `pty_desc`, `pty_show`) VALUES
(2, 'sdasd', 'dasdasd', 0),
(3, 'dasdff', 'sdafcca', 1),
(4, 'ฟasda', 'asdasd', 1),
(5, 'sdasd', 'asdasda', 1),
(7, 'sdasd', 'sdasd', 0),
(8, 'ฟฟ', 'ฟฟ', 1);
--
-- Database: `projest01`
--
CREATE DATABASE IF NOT EXISTS `projest01` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `projest01`;

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
CREATE TABLE IF NOT EXISTS `home` (
  `home_id` smallint NOT NULL AUTO_INCREMENT,
  `home_name1` varchar(200) NOT NULL,
  `home_name2` varchar(200) NOT NULL,
  `home_desc` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`home_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`home_id`, `home_name1`, `home_name2`, `home_desc`) VALUES
(1, 'เมือง', 'เพชรบุรี', 'เพชรบุรีเป็นเมืองที่เคยรุ่งเรืองมาตั้งแต่สมัยโบราณและเป็นเมืองหน้าด่านที่สำคัญของไทยในกลุ่มหัวเมืองฝ่ายตะวันตก มีการติดต่อค้าขายกับต่างประเทศ มีหลักฐานชื่อเรียกปรากฏในหนังสือชาวต่างประเทศ เช่น ชาวฮอลันดาเรียกว่า พิพรีย์ ชาวฝรั่งเศสเรียกว่า พิพพีล์ และ ฟิฟรี จึงสันนิษฐานกันว่าชื่อ \"เมืองพริบพรี\" เป็นชื่อเดิมของเมืองเพชรบุรี ซึ่งสอดคล้องกับชื่อวัดพริบพลีที่เป็นวัดเก่าแก่วัดหนึ่งของจังหวัด และที่วัดแห่งนี้ยังเป็นสถานที่ตั้งเสาชิงช้าอีกด้วย\n\nเพชรบุรี (ศรีชัยวัชรบุรี) เป็นเมืองเก่าแก่มาแต่โบราณ เคยเป็นอาณาจักรเล็ก ๆ อาณาจักรหนึ่ง บางสมัยมีเจ้าผู้ครองนครหรือกษัตริย์ปกครองเป็นอิสระ บางสมัยอาจจะตกเป็นเมืองขึ้นของอาณาจักรที่เข้มแข็งกว่า เจ้าผู้ครองนครได้ส่งเครื่องบรรณาการไปยังเมืองจีนเป็นประจำ เพชรบุรีมีปรากฏเป็นหลักฐานมาตั้งแต่สมัยพระเจ้าชัยวรมันที่ 7 เช่น พระปรางค์ 5 ยอด ณ วัดมหาธาตุวรวิหาร และปราสาทหินศิลาแลง ณ วัดกำแพงแลงเป็นต้น โดยที่มาของชื่อเมืองนั้นอาจเรียกตามตำนานที่เล่าสืบกันมาว่าในสมัยโบราณเคยมีแสงระยิบระยับในเวลาค่ำคืนที่เขาแด่น ทำให้ชาวบ้านเข้าใจว่ามีเพชรพลอยบนเขานั้นจึงพากันไปค้นหาแต่ก็ไม่พบ จึงได้ออกค้นหาในเวลากลางคืนแล้วใช้ปูนที่ใช้สำหรับกินหมากป้ายเป็นตำหนิไว้เพื่อมาค้นหาในเวลากลางวัน แต่ก็ไม่พบ บ้างก็ว่าเรียกตามชื่อของแม่น้ำเพชรบุรี เมืองเพชรบุรีมีศิลปวัตถุมากมาย เป็นหลักฐานที่แสดงว่าเพชรบุรีเคยเป็นบ้านเมืองที่มีผู้คนอาศัยอยู่เป็นชุมชนถาวรมาตั้งแต่สมัยทวารวดี เช่น ศิลปะปูนปั้น ทั้งนี้ก็เป็นไปได้ที่มีการเปลี่ยนชื่อ \"วัชรปุระ\" เป็น \"เพชรบุรี\" จากแผลงคำในชื่อ \"วัชร\" เป็น \"เพชร\" โดยเปลี่ยนจาก \"ว\" เป็น \"พ\"'),
(2, 'ที่เที่ยว', 'เพชรบุรี', '1 ในจังหวัดของประเทศไทย ที่มีความสวยงามทางธรรมชาติ ทั้งภูเขา น้ำตก ทะเล แหล่งรวมความอุดมสมบูรณ์ของธรรมชาติ ดินแดนที่ขึ้นชื่อว่าเป็นประตูสู่ภาคใต้ กับจังหวัดที่มีชื่อว่า เพชรบุรี จังหวัด ที่เต็มไปด้วย ที่เที่ยวเพชรบุรี มากมายหลากแห่ง ที่สามารถเดินทางไม่ไกลจากกรุงเทพ สะดวกสบายเหมาะมากกับการมา เที่ยวเพชรบุรี 2 วัน 1 คืน ให้ได้ร่างกายของทุกท่านนั้นได้พักผ่อนกายจากการเหนื่อยจากการทำงาน ได้พักผ่อนไปกับการมา เที่ยวเพชรบุรี จังหวัดที่มีความสวยงามทั้งด้านธรรมชาติ ประวัติศาสตร์ ศิลปะวัฒนธรรม เพชรบุรีที่เที่ยว ยังมีสถานที่ท่องเที่ยวมากมายที่รอคอยต้อนรับนักท่องเที่ยวอยู่ตลอดเวลา ว่าแต่ สถานที่ท่องเที่ยวเพชรบุรี จะมีที่เที่ยวแบบไหนบ้านนั้น เราก็ได้รวบรวม ที่ท่องเที่ยวเพชรบุรีมาให้แล้ว\n\n'),
(3, 'วัฒนธรรม', 'เพชรบุรี', '         จังหวัดเพชรบุรี เป็นจังหวัดที่มีประชากรทั้งชาวไทย ชาวไทยทรงดำ ชาวมอญ และชาวกะเหรี่ยงอาศัยอยู่ร่วมกันทำให้เมืองเพชรบุรีมีความหลากหลายทั้งด้านประเพณี วัฒนธรรม อาชีพ และความเป็นอยู่มาจากชาติพันธุ์อื่น\r\n\r\nอาชีพหลักของคนพื้นเมืองเพชรบุรีมีความเกี่ยวเนื่องกับเกษตรกรรม ทั้งการทำนา นาเกลือ ทำสวน ทำน้ำตาล และผลลิตภัณฑ์จากต้นตาล เลี้ยงสัตว์ และการประมง เป็นต้น');

-- --------------------------------------------------------

--
-- Table structure for table `otop`
--

DROP TABLE IF EXISTS `otop`;
CREATE TABLE IF NOT EXISTS `otop` (
  `otop_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'ไอดี',
  `otop_name` varchar(50) NOT NULL COMMENT 'ชื่อ',
  `otop_desc` varchar(255) NOT NULL COMMENT 'ข้อมูล',
  `otop_price` decimal(10,2) NOT NULL COMMENT 'ราคา',
  `otop_img` varchar(200) DEFAULT NULL COMMENT 'รูป',
  `otop_type` varchar(200) NOT NULL,
  `otop_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'โชว์',
  PRIMARY KEY (`otop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `otop`
--

INSERT INTO `otop` (`otop_id`, `otop_name`, `otop_desc`, `otop_price`, `otop_img`, `otop_type`, `otop_show`) VALUES
(2, 'ขนมงาอ่อน / ขนมเหม่งทึ้ง', 'ขนมงาอ่อน / ขนมเหม่งทึ้ง ชมนาถขนมไทย เหนียว นุ่ม หอม หวาน มัน กำลังพอดี กล่องหนึ่ง 250g', '55.00', '18966855320231031_015033.png', 'ของหวาน', 1),
(3, 'ทอฟฟี่ถั่ว น้ำตาลโตนด', 'ยินดีต้อนรับสู่แดนขนมหวานแห่งเมืองเพชรบุรี เป็นของฝาก ก็ถูกปากถูกใจ ทอฟฟี่ถั่ว น้ำตาลโตนด แม่สมาน', '35.00', '186854867220231031_015215.jpg', 'ของหวาน', 1),
(4, 'ฝอยทองกรอบ', 'ยินดีต้อนรับสู่แดนขนมหวานแห่งเมืองเพชรบุรี เป็นของฝาก ก็ถูกปากถูกใจ ฝอยทองกรอบ แม่สมาน', '35.00', '202622800720231031_015329.jpg', 'ของหวาน', 1),
(5, 'คอมบูชาน้ำผึ้ง ', 'คอมบูชาน้ำผึ้ง ไม่มีน้ำตาล 100% เปรี้ยวซ่า หอมหวานน้ำผึ้ง เครื่องดื่มโพรไอโอติกซ์ หมักด้วยชาดำออแกนิก', '180.00', '81202777620231031_015509.jpg', 'ของหวาน', 1),
(6, 'เข็มขัดหนังแท้ ตอกลายด้วยมือ ', 'เข็มขัดหนังแท้ ตอกลายด้วยมือ \"ร้านวิชาญ เครื่องหนัง\" ครีเอทเครื่องหนังได้ตามใจ', '2300.00', '187973966420231031_015657.jpg', 'ของใช้', 1),
(7, 'สุนัขไซบีเรียน ฮัสกี', 'ตุ๊กตาเรซิ่น สีสันสดใส สามารถสั่งทำได้นะ แต่งบ้านก็น่ารัก จัดสวนก็ปัง ให้เป็นของขวัญก็เก๋ไม่ซ้ำใคร', '790.00', '71417934520231031_015818.jpg', 'ของใช้', 1),
(8, 'ที่เก็บกุญแจผ้าญี่ปุ่น มโนทำ', 'ที่เก็บกุญแจผ้าญี่ปุ่น จบทุกปัญหาเรื่องกุญแจหาย หากุญแจไม่เจอ', '150.00', '207636542820231031_015928.jpg', 'ของใช้', 1),
(9, 'หมอนฟักทอง', 'หมอนฟักทอง กลุ่มอาชีพหมอนฟักทองแฮนเมค บ้านน้อย จะใช้หนุนนอนก็ฟิน จะใช้พิงหรืออิงก็ใช่', '500.00', '156281503320231031_020041.jpg', 'ของใช้', 1),
(10, 'ยาแคปซูลยาแก้วห้าดวง ', 'แก้ไข้ร้อนใน แก้ไข้พิษและกระทุ้ง พิษไข้ ใช้ได้กับไข้ทุกชนิดไข้หวัด ไข้หวัดใหญ่ หัด สุกใส', '200.00', '27194165120231031_020139.jpg', 'ยารักษาโรค/สมุนไพร', 1),
(11, 'สเปรย์กันยุงออร์แกนิค 2in1', 'ฝนตก ยุงมาแล้ว ระวังไข้เลือดออกกันด้วย นะคะ ใครโดนยุงกัด ใช้ขวดนี้จบ!! ป้องกันและแก้คันได้', '155.00', '85589021720231031_020231.jpg', 'ยารักษาโรค/สมุนไพร', 1),
(12, 'สบู่เหลวผสมสมุนไพร ', 'สบู่เหลวผสมสมุนไพร  อาบสะอาด ไม่ทำลายผิว,ช่วยขจัดคราบไคลและจุดด่างดำ ชุ่มชื้นตลอดเวลา', '150.00', '210954574420231031_020308.jpg', 'ยารักษาโรค/สมุนไพร', 1),
(13, 'เครื่องดื่มชามะตูม ', 'ใช้ดื่มเพื่อบำรุงสุขภาพ ช่วยย่อยอาหาร บำรุงไขข้อ', '60.00', '163607455920231031_020353.jpg', 'ยารักษาโรค/สมุนไพร', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tradition`
--

DROP TABLE IF EXISTS `tradition`;
CREATE TABLE IF NOT EXISTS `tradition` (
  `td_id` smallint NOT NULL AUTO_INCREMENT,
  `td_name1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `td_name2` varchar(200) NOT NULL,
  `td_desc` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `td_img` varchar(200) NOT NULL,
  `td_show` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1),
  PRIMARY KEY (`td_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tradition`
--

INSERT INTO `tradition` (`td_id`, `td_name1`, `td_name2`, `td_desc`, `td_img`, `td_show`) VALUES
(1, ' งานพระนครคีรี', '', 'ารจัดงาน \"พระนครคีรี - เมืองเพชร\" เริ่มจัดขึ้นครั้งแรกเมื่อปี พ.ศ.2529 ในสมัยที่นายเชาว์วัศ สุดลาภา เป็นผู้ว่าราชการจังหวัดเพชรบุรี โดยมีวัตถุประสงค์เพื่อเทิดพระเกียรติ และน้อมรำลึกถึงพระมหากรุณาธิคุณของรัชกาลที่ 4 ที่ทรงสร้าง \"พระนครคีรี\" รัชกาลที่ 5 ที่ทรงสร้าง \"พระรามราชนิเวศน์\" และรัชกาลที่ 6 ที่ทรงสร้าง \"พระราชนิเวศน์มฤคทายวัน\" เพื่อเป็นที่แปรพระราชฐาน ซึ่งปัจจุบันพระราชวังทั้ง 3 แห่งนี้นับเป็นโบราณสถานที่มีคุณค่าทางศิลปะและประวัติศาสตร์ เป็นมรดกแห่งความภาคภูมิใจของประชาชนชาวจังหวัดเพชรบุรี และเป็นสถานที่ท่องเที่ยวที่สำคัญยิ่งของจังหวัดเพชรบุรี การจัดงาน \"พระนครคีรี - เมืองเพชร\" ได้มีการจัดติดต่อกันเป็นประจำทุกปี (เว้นปี พ.ศ.2539 ซึ่งตรงกับการจัดงานพระราชทางเพลิงพระบรมศพ สมเด็จพระศรีนครินทราบรมราชชนนี) โดยในปีนี้กำหนดจัดขึ้นในระหว่างวันที่ 9 - 18 กุมภาพันธ์ 2544', 'td01.jpg', '0000-00-00 00:00:00.0'),
(2, 'งาน', 'วัวลาน', 'การเล่นวัวลาน ได้มีวิวัฒนาการมาจากการใช้วัวนวดข้าว เพราะลักษณะลานนวดข้าวเป็นวงกลมเป็นดินเหนียวที่อัดแน่นเป็นพื้นเรียบ แล้วส่วนใหญ่ชาวนาจะทาพื้นด้วยมูลวัวอีกทีหนึ่ง วิธีการนวดข้าวนั้น ชาวนาจะแยกเมล็ดข้าวออกจากรวงหลังจากเกี่ยวข้าวแล้ว โดยใช้แรงวัวมาช่วยนวดข้าว ชาวนาจะผูกวัวเรียงเป็นแถวหน้ากระดานไว้กับเสากลางลานบ้าน วัวที่อยู่ใกล้จุดศูนย์กลาง ไม่ต้องใช้กำลังและฝีเท้ามาก เพราะอยู่ในช่วงหมุนรอบสั้นวนเป็นรอบ ๆ ไปเรื่อย ๆ จนกว่าข้าวจะหลุดออกจากรวงข้าวหมด แต่วัวตัวที่อยู่นอกสุดอยู่ห่างจากจุดศูนย์กลาง ระยะทางที่ต้องหมุนจะยาวกว่า จึงต้องเลือกวัวตัวที่มีกำลังและฝีเท้าดีด้วยเหตุนี้ วัวหมุนรอบและเหยียบย่ำจนเมล็ดข้าวเปลือกหลุดออกจากรวงข้าว เมล็ดข้าวเปลือก วัวหมุนรอบและเหยียบย่ำจนเมล็ดข้าวเปลือกหลุดออกจากรวงข้าว เมล็ดข้าวเปลือกจะหล่นบนพื้นลานที่ปราบไว้ดีแล้ว การนวดข้าวจึงเกิดการละเล่นพื้นบ้านวัวลาน', 'td05.jpg', '2023-11-01 10:43:31.2'),
(3, 'งานเพชรบุรี', 'ดีจัง', 'เพชรบุรีดีจังวันแรกเริ่มเกิดจากเด็กกลุ่มเล็ก ๆ ที่ชื่อ \"กลุ่มลูกหว้า\" ที่ใจใหญ่และสนใจในคุณค่าวัฒนธรรมของพื้นที่ตัวเอง เมื่อได้ความเอื้อเฟื้อจากผู้ใหญ่ไม่ว่าจะเป็นวัดใหญ่สุวรรณารามและครูจำลอง บัวสุวรรณ ที่เป็นแกนนำพาลูกศิษย์มาร่วมกิจกรรมจนเด็ก ๆ เมืองเพชรใจแกร่งเหล่านี้เติบโตมาเป็นแกนนำหรือนักขับเคลื่อนสังคม', '147042589520231101_054949.jpg', '2023-11-01 10:49:49.7'),
(4, 'ประเพณี', 'ไทยทรงดำ', '“ ไทยทรงดำ  ลาวโซ่ง หรือ ไทยโซ่ง ” หมายถึง กลุ่มชาติพันธุ์ กลุ่มหนึ่งที่พูดภาษาไทย   คนไทยเรียกชนกลุ่มนี้ว่า ลาว หรือ ลาวโซ่ง เพราะอพยพจากเมืองเดียนเบียนฟู  อยู่ทางตอนเหนือของ ประเทศเวียดนาม ผ่านมายังประเทศสาธารณรัฐประชาธิปไตยประชาชนลาว                    ผู้ไทนิยมแต่งกายด้วยสีดำ จึงเรียก ไทยทรงดำ ตามลักษณะเครื่องแต่งกาย ถิ่นฐานเดิมอยู่บริเวณ แคว้นสิบสองจุไทย อยู่ทางตอนเหนือประเทศเวียดนาม ส่วนคำว่า “ โซ่ง ” ที่เรียกกันสันนิษฐานเป็นคำที่มาจากคำว่า “ ซ่วง หรือ ทรง ” แปลว่า กางเกง ไทดำถูกกวาดต้อนและอพยพมาใน ประเทศไทย สมัยกรุงธนบุรี และกรุงรัตนโกสินทร์ตอนต้น', '78790136820231101_055934.jpg', '2023-11-01 10:59:34.6');

-- --------------------------------------------------------

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
CREATE TABLE IF NOT EXISTS `travel` (
  `tv_id` smallint NOT NULL AUTO_INCREMENT COMMENT 'ไอดี',
  `tv_name` varchar(50) NOT NULL COMMENT 'ชื่อ',
  `tv_desc` varchar(255) NOT NULL COMMENT 'ข้อมูล',
  `tv_img` int NOT NULL COMMENT 'รูป',
  `tv_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'โชว์',
  PRIMARY KEY (`tv_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `travel_add`
--

DROP TABLE IF EXISTS `travel_add`;
CREATE TABLE IF NOT EXISTS `travel_add` (
  `tr_id` smallint NOT NULL AUTO_INCREMENT,
  `tr_name1` varchar(200) NOT NULL,
  `tr_name2` varchar(200) NOT NULL,
  `tr_desc` varchar(1500) NOT NULL,
  `tr_img` varchar(200) NOT NULL,
  `tr_addr` varchar(200) NOT NULL,
  `tr_show` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `travel_add`
--

INSERT INTO `travel_add` (`tr_id`, `tr_name1`, `tr_name2`, `tr_desc`, `tr_img`, `tr_addr`, `tr_show`) VALUES
(1, 'วัด', 'พระพุทธไสยาสน์', ' วัดพระพุทธไสยาสน์ หรือ วัดพระนอน เป็นวัดเก่าแก่ของ อำเภอเมืองเพชรบุรี จังหวัดเพชรบุรี ตั้งอยู่บริเวณเชิงเขาทิศตะวันออกเฉียงใต้ของเขาวัง ไม่มีหลักฐานระบุแน่ชัดว่าสร้างขึ้นเมื่อปี พ.ศ. ใด แต่สันนิษฐานว่าสร้างขึ้นในสมัยกรุงศรีอยุธยาเพื่อเป็นที่ประดิษฐาน พระนอน หรือ พระพุทธไสยาสน์ อายุกว่า 400 ปี หลังจากสิ้นสุดสมัยกรุงศรีอยุธยา วัดแห่งนี้ก็ถูกปล่อยทิ้งร้าง จนกระทั่งถึงสมัยพระบาทสมเด็จพระจอมเกล้าเจ้าอยู่หัว รัชกาลที่ 4 ทรงทอดพระเนตรเห็นถึงความทรุดโทรมของพระพุทธรูป จึงโปรดเกล้าฯ ให้สร้างหลังคาคลุมไว้ จนในที่สุดก็กลายมาเป็น วิหารพระพุทธไสยาสน์ อย่างที่เราได้ชมในปัจจุบัน ภายใน วิหารพระพุทธไสยาสน์ นั้นเป็นที่ประดิษฐาน พระพุทธไสยาสน์ ขนาดใหญ่ มีความยาวถึง 43 เมตร ความสูงจากฐานบรรทม 15 เมตร และเป็นพระพุทธไสยาสน์ที่มีขนาดใหญ่เป็นอันดับ 4 ของประเทศไทย สร้างด้วยอิฐทั้งองค์และลงรักปิดทองเอาไว้อย่างสวยงาม เป็นที่เคารพนับถือของชาวเพชรบุรีมาอย่างยาวนาน โดยมีความเชื่อว่าหากได้มากราบท่านแล้วก็จะพบกับความเจริญรุ่งเรือง โดยเฉพาะผู้ที่เกิดวันอังคาร เนื่องจากพระพุทธไสยาสน์ หรือ พระนอน เป็นพระประจำวันเกิดของคนเกิดวันอังคาร  ด้านหน้าของพระพุทธไสยาสน์เป็นที่ประดิษฐานพระพุทธรูปอื่นๆ อีกหลายองค์ ไม่ว่าจะเป็น พระสังกัจจายน์ พระสิวลี รวมถึงพระพุทธรูปปางมารวิชัยและปางประทานพรเรียงกันอยู่เป็นจำนวนมาก ซึ่งนอกจากวิหารพระพุทธไสยาสน์แล้ว ก็ยังมี วิหารพระยืน ซึ่งมีพระพุทธฉายพระสัมมาสัมพุทธเจ้า เป็นภาพเขียนบนผนังประทับยืนพระหัตถ์ทรงแสดงปางประทานอภัย และ วิหารพระนั่ง ประดิษฐานพระพุทธรูปทรงเครื่อง ศิลปะอยุธยาตอนปลาย สมัยพระเจ้าปราสาททอง ให้เราได้กราบไหว้กัน', 'tr01.jpeg', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3885.8934255771283!2d99.94106250000002!3d13.105937500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30fd271c9b218e4b%3A0x', '2023-10-30 02:55:12'),
(2, 'วัง', 'บ้านปืน', 'ด้วยเหตุที่พระบาทสมเด็จพระจุลจอมเกล้าเจ้าอยู่หัวมีพระราชประสงค์ที่จะมีพระราชวังนอกพระนครเพื่อประทับค้างแรมได้โดยสะดวก จังหวัดเพชรบุรีที่พระองค์มีพระประสงค์จะให้เป็นพระราชวังที่ใช้ประทับยามหน้าฝน พระองค์จึงมีพระราชโครงการให้ซื้อที่ดินจากชาวบ้านที่เขตบ้านปืน ริมแม่น้ำเพชรบุรี โดยมีสมเด็จพระเจ้าบรมวงศ์เธอ กรมพระยาดำรงราชานุภาพ และสมเด็จพระเจ้าบรมวงศ์เธอ เจ้าฟ้าบริพัตรสุขุมพันธุ์ กรมพระนครสวรรค์วรพินิต เป็นแม่งานควบคุมการก่อสร้าง และมีพระบัญชาให้ คาร์ล ซีกฟรีด เดอห์ริง (Karl Siegfried Dohring) ผู้เคยออกแบบ วังบางขุนพรหม วังวรดิศ และวังพระองค์เจ้าดิลกนพรัฐมาแล้ว เป็นสถาปนิกออกแบบ\r\n\r\nนายดอห์ริงได้เลือกผู้ร่วมงานทั้งสถาปนิก วิศวกร และมัณฑนากรเป็นชาวเยอรมันทั้งสิ้น เพื่อการทำงานให้มีศิลปะเป็นแบบเดียวกันพระที่นั่งองค์นี้จึงมีรูปแบบศิลปะตะวันตกอย่างเต็มตัว ซึ่งพระบาทสมเด็จพระจุลจอมเกล้าเจ้าอยู่หัวมีพระราชประสงค์ที่ต้องการพระตำหนักแบบโมเดิร์นสไตล์ สถาปนิกจึงได้ออกแบบมาในลักษณะสถาปัตยกรรมแบบเยอรมัน โดยได้แบบแผนมาจากตำหนักในพระราชวังของพระเจ้าไกเซอร์แห่งเยอรมันที่ทรงเคยประทับ', 'tr06.jpg', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3886.0980073313162!2d99.94591607507851!3d13.092974787233636!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30fd26df3f38e86f%3A0x', '2023-10-31 07:41:24'),
(3, 'เขา', 'วัง', 'พระนครคีรีหรือเขาวัง เป็นพระราชวังที่ประทับในรัชกาลพระบาทสมเด็จพระจอมเกล้าเจ้าอยู่หัวโดยเป็นพระราชวังฤดูร้อนโดยมีสมเด็จเจ้าพระยาบรมมหาศรีสุริยวงศ์ (ช่วง บุนนาค) เป็นแม่กองในการก่อสร้างโดยก่อสร้างแล้วเสร็จในปี พ.ศ. 2405 โดยพระนครคีรีแบ่งออกเป็นเขตพระราชฐานต่าง ๆ ดังนี้\r\n\r\nเขตพระราชฐานชั้นนอก เป็นยอดเขาด้านหน้าเป็นที่ตั้งของกรมกองต่าง ๆ ของทางราชการซึ่งตามเสด็จ เขตพระราชฐานชั้นกลางและชั้นใน เป็นยอดเขาตรงกลางและด้านในเป็นที่ตั้งของพระราชมณเฑียรที่ประทับของทั้งฝ่ายหน้าและฝ่ายในรวมทั้งข้าราชบริพาร', 'tr07.jpg', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3885.842162051177!2d99.93405867507883!3d13.10918368721898!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30fd27032de68929%3A0x11', '2023-10-31 07:45:32'),
(4, 'เขา', 'พะเนินทุ่ง', 'เขาพะเนินทุ่ง เป็นส่วนหนึ่งของอุทยานแห่งชาติแก่งกระจาน มีลักษณะเป็นทุ่งหญ้าและป่าดิบ อากาศหนาวเย็นตลอดปี ประกอบด้วยทิวทัศน์ที่งดงามทั้งยามปกติและยามมีทะเลหมอกใในช่วงปลายฤดูฝนและต้นฤดูหนาวที่งดงามที่สุดแห่งหนึ่ง ซึ่งเหมาะแก่การพักแรม โดยอยู่ห่างจากที่ทำการอุทยานแห่งชาติ 50 กิโลเมตร บนยอดเขาปกคลุมด้วยทุ่งหญ้าและไม้ต้นเล็กๆ  สามารถเดินทางท่องเที่ยวได้ 2 ส่วน ได้แก่\r\n          ส่วนที่ 1 จุดชมวิวเขาพะเนินทุ่ง เป็นจุดที่สูงจากระดับน้ำทะเลปานกลาง 900 เมตร เขาพะเนินทุ่งเป็นแหล่งท่องเที่ยวที่มีศักยภาพอยู่ในระดับสูง และเป็นที่นิยมมาท่องเที่ยว เนื่องจากมีความอุดมสมบูรณ์ของทรัพยากรธรรมชาติ มีทิวทัศน์ที่สวยงามและอากาศสดชื่นเย็นสบาย โดยเฉพาะในช่วงตอนเช้าที่สามารถชมทะเลหมอกได้บริเวณจุดชมวิวของยอดเขาพะเนินทุ่ง อุทยานแห่งชาติได้กำหนดเวลาในการใช้เส้นทางสายนี้ คือ จะเปิดให้รถขึ้นเขาขาไป 2 ช่วง ได้แก่ ช่วงเวลา 05.30 - 07.30 น. และช่วงเวลา 13.00 - 15.00 น. สำหรับขาลงมี 2 ช่วง ได้แก่ ช่วงเวลา 09.00 - 10.00 น. และช่วงเวลา 16.00 - 17.00 น. ทั้งนี้เพื่อป้องกันอุบัติเหตุ\r\n          ส่วนที่ 2 ยอดเขาพะเนินทุ่ง เป็นเขาที่สูงประมาณ 1,207 เมตร จากระดับน้ำทะเลปานกลาง การเดินเท้าขึ้นยอดเขาพะเนินทุ่งมี 2 เส้นทาง เส้นทางแรกเริ่มจากกิโลเมตรที่ 27.5 ของเส้นทางสายวังวน - พะเนินทุ่ง โดยเดินข้ามลำธารหลายสายก่อนขึ้นถึงยอดเขา ใช้เวลาประมาณ 6 ชั่วโมง อีกเส้นทางหนึ่งเริ่มจากบริเวณกิโลเมตรที่ 30 ของเส้นทางสายวังวน - พะเนินทุ่ง ใช้เวลาเพียง 4 ชั่วโมง โดยต้องข้ามเนินเขาหลายลูก เป็แหล่งดูนกป่า โดยเฉพาะนกกะลิงเขียดหางหนาม ซึ่งหากินในบริเวณใกล้เคียง ผู้สนใจต้องติดต่อขอเจ้าหน้าที่ช่วยนำทาง', 'tr08.jpg', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31116.99767609327!2d99.35162256108296!3d12.867498996037403!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30fc907e02a6e48d%3A0xf', '2023-10-31 07:49:52');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'ไอดี',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ชื่อ',
  `user_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'นามสกุล',
  `user_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ชื่อผู้ใช้',
  `user_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'รหัสผ่าน',
  `user_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ที่อยู่',
  `user_phone` varchar(15) NOT NULL COMMENT 'เบอร์โทร',
  `user_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'user.jpg' COMMENT 'รูป',
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'uesr' COMMENT 'ยศ',
  `user_show` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'โชว์เวลาสมัคร',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_surname`, `user_username`, `user_pwd`, `user_addr`, `user_phone`, `user_img`, `user_type`, `user_show`) VALUES
(1, 'Shiro', 'Mayuri', 'Ghostcat', '12345', '62/8 ต.บ้านลาด อ.บ้านลาด จ.เพชรบุรี ', '0910276147', '137476519320231101_072954.jpg', 'admin', '2023-10-19 14:10:26'),
(28, 'ghost', 'fgdda', 'Rainna', '12345', '111111', 'asdasda', '165078890820231102_012713.PNG', 'user', '2023-10-31 06:36:40'),
(29, 'xzXx', 'da', 'asda', 'asd', 'sadsd', 'sadad', '10428678320231101_113523.jpg', 'admin', '2023-11-01 04:35:23'),
(30, 'sdasd', 'asdad', 'asdasd', 'dasdasd', 'sadsad', 'sdasd', '26194666520231101_113536.jpg', 'user', '2023-11-01 04:35:36'),
(31, 'sadasd', 'asdasd', 'sadasd', 'sdad', 'sadasd', 'sadsdasd', '171214644720231101_114709.jpg', 'admin', '2023-11-01 04:47:09'),
(32, 'สิรวิชญ์', 'วรรณา', 'แมวผี', '12345', '62/8 ต.บ้านลาด อ.บ้านลาด จ.เพชรบุรี ', '0910276147', '169561218220231101_034309.png', 'admin', '2023-11-01 08:43:09'),
(33, 'a', 'a', 'a', 'aaaa', 'a', 'a', '78896156220231102_125217.sql', 'user', '2023-11-02 05:46:42'),
(34, 'b', 'b', 'b', 'bbbb', '', '', 'user.jpg', 'uesr', '2023-11-02 05:47:04'),
(35, 'นายพีรวัส ', 'รัตนุกิจ', 'PP', 'Kaykay12345', '', '', 'user.jpg', 'uesr', '2024-03-12 01:48:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
