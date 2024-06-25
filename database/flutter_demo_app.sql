-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 02:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter_demo_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(25) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `PhoneNumber` int(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Volunteer_exp` int(25) NOT NULL,
  `Image` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `LastName`, `Email`, `Password`, `PhoneNumber`, `Address`, `Volunteer_exp`, `Image`) VALUES
(6, 'Admin', 'Admin', 'admin@admin.com', 'Admin@123', 1111111110, 'AdminAddress', 0, ''),
(11, 'Zoro', 'Ronoro', 'zoro@gmail.com', 'Zoro@123', 1234567890, 'East Blue', 10, ''),
(12, 'Luffy', 'Monkry', 'luffy@gmail.com', 'Luffy@123', 1234567900, 'East Blue', 10, ''),
(13, 'Sanji', 'Kun', 'sanji@gmail.com', 'Sanji@321', 1144558852, 'West Blue', 10, ''),
(14, 'Nami', 'Belumelu', 'nami@gmail.com', 'Nami@123', 2147483647, 'East Blue', 10, ''),
(16, 'Aagash', 'PSA', 'psaextra2@gmail.com', 'Psa@123', 717474448, 'Badulla', 10, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`,`Email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
