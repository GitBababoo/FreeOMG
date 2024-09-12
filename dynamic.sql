-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 12, 2024 at 07:05 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

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

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `crt_id` smallint NOT NULL AUTO_INCREMENT,
  `mmb_id` smallint DEFAULT NULL,
  `prd_id` smallint DEFAULT NULL,
  `pty_id` smallint DEFAULT NULL,
  `crt_amount` smallint DEFAULT NULL,
  `crt_show` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`crt_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mmb_id`, `mmb_name`, `mmb_surname`, `mmb_username`, `mmb_pwd`, `mmb_addr`, `mmb_phone`, `mmb_show`) VALUES
(2, '2', '2', '2', '2', '2', '2', 1),
(1, '1', '1', '1', '1', '1', '1', 1);

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
  PRIMARY KEY (`prd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`std_id`, `std_name`, `std_surname`, `std_show`) VALUES
(1, 'aa', 'bb', 1),
(2, 'aa', 'bb', 1);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
