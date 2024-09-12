-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 19, 2024 at 12:00 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS `My_database`;

-- Select the database to use
USE `My_database`;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
CREATE TABLE IF NOT EXISTS `product_type` (
  `pty_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pty_name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pty_desc` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pty_show` TINYINT(1) DEFAULT '1',
  PRIMARY KEY (`pty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `prd_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prd_name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prd_desc` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pty_id` SMALLINT UNSIGNED DEFAULT NULL,
  `prd_show` TINYINT(1) DEFAULT '1',
  PRIMARY KEY (`prd_id`),
  KEY `pty_id` (`pty_id`),
  FOREIGN KEY (`pty_id`) REFERENCES `product_type`(`pty_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `mmb_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_surname` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_username` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_pwd` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mmb_addr` TEXT COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mmb_phone` VARCHAR(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mmb_show` TINYINT(1) DEFAULT '1',
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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `crt_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mmb_id` SMALLINT UNSIGNED NOT NULL,
  `prd_id` SMALLINT UNSIGNED NOT NULL,
  `pty_id` SMALLINT UNSIGNED DEFAULT NULL,
  `crt_amount` SMALLINT UNSIGNED NOT NULL,
  `crt_show` TINYINT(1) DEFAULT '1',
  PRIMARY KEY (`crt_id`),
  KEY `mmb_id` (`mmb_id`),
  KEY `prd_id` (`prd_id`),
  FOREIGN KEY (`mmb_id`) REFERENCES `member`(`mmb_id`) ON DELETE CASCADE,
  FOREIGN KEY (`prd_id`) REFERENCES `product`(`prd_id`) ON DELETE CASCADE,
  FOREIGN KEY (`pty_id`) REFERENCES `product_type`(`pty_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `std_id` INT DEFAULT NULL,
  `std_name` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
