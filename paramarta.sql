-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2022 at 07:21 PM
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
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(6, 4, 'Valentino Ahmad Ulza Paramarta', 'Slawi Kulon', '38319', 'Purwokerto', 'Indonesia', '08157642183'),
(7, 5, 'Claim Casino', 'Slawi Kulon', '38319', 'Purwokerto', 'Indonesia', '08157642183');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(10, 'Minuman', 'Ayo menyegarkan diri kamu!', 'Minuman', 'Minuman.png'),
(11, 'Pokok', 'Ayo Belanja!', 'Pokok', 'Kebutuhan-Pokok.png'),
(12, 'Mainan', 'Bahagiakan anak dengan banyak mainan', 'Mainan', 'Mainan.png'),
(13, 'Jajanan', 'Njajan Yuk!', 'Jajanan', 'Jajanan.png'),
(14, 'Kebutuhan Lainya', 'Lengkapi Kebutuhan Anda', 'Kebutuhan-Lainya', 'Kebutuhan-Lainya.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MessageID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`, `Feature`) VALUES
(14, 'Coca-Cola', 10, '5000.00', 50, 'Product Description', 2022, 'Coca-Cola.png', 'Coca-Cola', 1),
(15, 'Teh Pucuk Harum', 10, '4000.00', 50, 'Product Description', 2022, 'Teh-Pucuk-Harum.png', 'Teh-Pucuk-Harum', 1),
(17, 'Sprite', 10, '5000.00', 50, 'Product Description', 2022, 'Sprite.png', 'Sprite', 0),
(18, 'Minyak Goreng', 11, '25000.00', 15, 'Product Description', 2022, 'Minyak-Goreng.png', 'Minyak-Goreng', 1),
(19, 'Indomie Goreng', 11, '3500.00', 50, 'Product Description', 2022, 'Indomie.png', 'Indomie-Goreng', 1),
(20, 'Hotwheels Colour Shifters', 12, '35000.00', 10, 'Product Description', 2022, 'Hotwheels-Colour-Shifters.png', 'Hotwheels-Colour-Shifters', 1),
(21, 'Barbie Colour Reveal', 12, '46000.00', 10, 'Product Description', 2022, 'Barbie-Colour-Reveal.png', 'Barbie-Colour-Reveal', 1),
(22, 'Piatos Rasa Sapi Panggang', 13, '7000.00', 50, 'Product Description', 2022, 'Piatos-Rasa-Sapi-Panggang.png', 'Piatos-Rasa-Sapi-Panggang', 1),
(23, 'Beng-Beng', 13, '3000.00', 50, 'Product Description', 2022, 'Beng-Beng.png', 'Beng-Beng', 1),
(24, 'Sabun Mandi Lifebuoy', 14, '8000.00', 30, 'Product Description', 2022, 'Sabun-Mandi-Lifebuoy.png', 'Sabun-Mandi-Lifebuoy', 1),
(25, 'Sunlight', 14, '3000.00', 15, 'Product Description', 2022, 'Sunlight.png', 'Sunlight', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(4, 'Valentino Ahmad Ulza Paramarta', 'Slawi Kulon', '38319', 'Purwokerto', 'Indonesia', '08157642183', 'ulzaparamarta@gmail.com', 'UlzaParamarta', '$2a$10$KdHwIMRCd6VqvS6Dk7Ijre3J.caaSe0ZQjpzYVIFlpGWzeKeixD1O', 1),
(5, 'Claim Casino', 'Slawi Kulon', '38319', 'Purwokerto', 'Indonesia', '08157642183', 'claimcasino@gmail.com', 'ClaimCasino', '$2a$10$U95P9xZ4ECoXDf01qLWjSuSF1se1A0EZxIau9Z5Fi6UQeWcbCN/o2', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
