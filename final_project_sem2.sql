-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2024 at 08:37 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project_sem2`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(50) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `address` text NOT NULL DEFAULT '-',
  `dob` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `phoneNumber` varchar(12) NOT NULL DEFAULT '-',
  `points` int(100) NOT NULL DEFAULT 0,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `firstName`, `lastName`, `address`, `dob`, `email`, `phoneNumber`, `points`, `password`) VALUES
(1, 'Raysen', 'Susanto', 'Jl. Sudirman No. 1', '1994-04-24', 'raysensusanto@gmail.com', '081212341234', 550, 'raysen123'),
(13, 'Catherine', 'ang', '-', '2023-06-20', 'cath@gmail.com', '-', 0, '123'),
(14, 'Syahluna', 'Allegra', '-', '2023-06-20', 'syahluna@gmail.com', '-', 0, '12345'),
(15, 'Kaoroi', 'rrrrr', '-', '2023-06-21', 'kaoroi@gmail.com', '-', 200, '123'),
(16, 'ii', 'haris', '-', '2023-06-21', 'ii@gmail.com', '-', 350, '1234'),
(17, 'cath', 'lun', '-', '2023-06-21', 'pus@gmail.com', '-', 250, '1234'),
(18, 'raysen', 'ss', '-', '2023-06-21', 'raysenss@gmail.com', '-', 300, '1234'),
(19, 'susanto', 'r', '-', '2023-06-22', 'susantor@gmail.com', '-', 350, '1234'),
(20, 'raysen', 'winata', '-', '2023-06-22', 'raysenwinata@gmail.com', '-', 200, '1234'),
(21, 'lina', 'wati', '-', '2023-06-23', 'lina@gmail.com', '-', 400, 'lina'),
(22, 'Syahluna', 'Berry', '-', '2023-06-23', 'Syahlunaberry@gmail.com', '-', 100, '1234'),
(23, 'Kaori', 'Harris', '-', '2023-08-10', 'kaoriharris@gmail.com', '-', 150, 'kaori123');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderDetailID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `ticketTypeID` int(11) NOT NULL,
  `ticketPrice` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `subTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`orderDetailID`, `orderID`, `ticketTypeID`, `ticketPrice`, `quantity`, `subTotal`) VALUES
(1, 1, 1, 150000, 1, 150000),
(2, 2, 1, 150000, 2, 300000),
(3, 2, 2, 90000, 2, 180000),
(6, 4, 1, 150000, 3, 450000),
(7, 4, 2, 90000, 1, 90000),
(8, 5, 1, 150000, 3, 450000),
(9, 5, 2, 90000, 1, 90000),
(10, 6, 1, 150000, 2, 300000),
(11, 7, 1, 150000, 3, 450000),
(12, 7, 2, 90000, 2, 180000),
(13, 8, 1, 150000, 1, 150000),
(14, 8, 2, 90000, 1, 90000),
(15, 9, 1, 150000, 1, 150000),
(16, 10, 1, 150000, 1, 150000),
(17, 10, 2, 90000, 1, 90000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `orderStatus` enum('pending','paid','all used') NOT NULL,
  `usePointsStatus` enum('use','not use') NOT NULL,
  `totalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `orderDate`, `orderStatus`, `usePointsStatus`, `totalPrice`) VALUES
(1, 1, '2023-06-21', 'paid', 'not use', 150000),
(2, 18, '2023-06-21', 'paid', 'not use', 480000),
(4, 1, '2023-06-21', 'paid', 'not use', 539800),
(5, 19, '2023-06-22', 'paid', 'not use', 540000),
(6, 20, '2023-06-22', 'paid', 'not use', 300000),
(7, 21, '2023-06-23', 'paid', 'not use', 630000),
(8, 22, '2023-06-23', 'paid', 'not use', 240000),
(9, 22, '2023-06-23', 'paid', 'use', 149850),
(10, 23, '2023-08-10', 'paid', 'not use', 240000);

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `outletID` int(2) NOT NULL,
  `employeeID` int(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactNumber` varchar(12) NOT NULL,
  `currentCapacity` int(5) NOT NULL,
  `overallRatings` decimal(2,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`outletID`, `employeeID`, `name`, `address`, `contactNumber`, `currentCapacity`, `overallRatings`) VALUES
(1, 1, 'Paris Van Java', 'Paris Van Java, Jl. Sukajadi No. 13', '081201230123', 23, '9'),
(2, 2, 'AEON Mall Sentul', 'AEON Mall Sentul, Jl. MH. Thamrin', '081223452345', 43, '9');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `methodID` int(11) NOT NULL,
  `totalPrice` double NOT NULL,
  `paymentStatus` enum('waiting','paid') NOT NULL,
  `virtualAcc` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `orderID`, `methodID`, `totalPrice`, `paymentStatus`, `virtualAcc`) VALUES
(1, 1, 2, 150000, 'paid', '4564561'),
(2, 2, 2, 480000, 'paid', '45645618'),
(4, 4, 2, 539800, 'paid', '4564561'),
(5, 5, 2, 540000, 'paid', '45645619'),
(6, 6, 2, 300000, 'paid', '45645620'),
(7, 7, 1, 630000, 'paid', '12312321'),
(8, 8, 1, 240000, 'paid', '12312322'),
(9, 9, 1, 149850, 'paid', '12312322'),
(10, 10, 1, 240000, 'paid', '12312323');

-- --------------------------------------------------------

--
-- Table structure for table `paymentmethod`
--

CREATE TABLE `paymentmethod` (
  `methodID` int(11) NOT NULL,
  `bankName` varchar(11) NOT NULL,
  `bankCode` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentmethod`
--

INSERT INTO `paymentmethod` (`methodID`, `bankName`, `bankCode`) VALUES
(1, 'BCA', '123123'),
(2, 'BNI', '456456');

-- --------------------------------------------------------

--
-- Table structure for table `purchasedticket`
--

CREATE TABLE `purchasedticket` (
  `purchasedTicketID` int(11) NOT NULL,
  `orderDetailID` int(11) NOT NULL,
  `expireDate` date NOT NULL,
  `ticketStatus` enum('ACTIVE','IN USE','INACTIVE','EXPIRED') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchasedticket`
--

INSERT INTO `purchasedticket` (`purchasedTicketID`, `orderDetailID`, `expireDate`, `ticketStatus`) VALUES
(28, 50, '2023-06-28', 'INACTIVE'),
(29, 46, '2023-06-28', 'INACTIVE'),
(30, 46, '2023-06-28', 'INACTIVE'),
(31, 47, '2023-06-28', 'INACTIVE'),
(32, 1, '2023-06-28', 'INACTIVE'),
(33, 2, '2023-06-28', 'INACTIVE'),
(34, 2, '2023-06-28', 'INACTIVE'),
(35, 3, '2023-06-28', 'INACTIVE'),
(36, 3, '2023-06-28', 'INACTIVE'),
(37, 6, '2023-06-28', 'INACTIVE'),
(38, 6, '2023-06-28', 'INACTIVE'),
(39, 6, '2023-06-28', 'INACTIVE'),
(40, 7, '2023-06-28', 'INACTIVE'),
(41, 8, '2023-06-29', 'INACTIVE'),
(42, 8, '2023-06-29', 'INACTIVE'),
(43, 8, '2023-06-29', 'INACTIVE'),
(44, 9, '2023-06-29', 'INACTIVE'),
(45, 10, '2023-06-29', 'INACTIVE'),
(46, 10, '2023-06-29', 'INACTIVE'),
(47, 11, '2023-06-30', 'ACTIVE'),
(48, 11, '2023-06-30', 'ACTIVE'),
(49, 11, '2023-06-30', 'ACTIVE'),
(50, 12, '2023-06-30', 'ACTIVE'),
(51, 12, '2023-06-30', 'ACTIVE'),
(52, 13, '2023-06-30', 'ACTIVE'),
(53, 14, '2023-06-30', 'ACTIVE'),
(54, 15, '2023-06-30', 'ACTIVE'),
(55, 16, '2023-08-17', 'ACTIVE'),
(56, 17, '2023-08-17', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `tickettype`
--

CREATE TABLE `tickettype` (
  `ticketTypeID` int(11) NOT NULL,
  `outletID` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `ticketDescription` text NOT NULL,
  `pricePerTicket` double NOT NULL,
  `giftPoint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickettype`
--

INSERT INTO `tickettype` (`ticketTypeID`, `outletID`, `name`, `ticketDescription`, `pricePerTicket`, `giftPoint`) VALUES
(1, 1, 'Child Ticket', 'This ticket can be used for kid to enter the playground. HAVE FUN!', 150000, 100),
(2, 1, 'Guardian Ticket', 'This ticket is provided for parent or guardian who wants to company their child', 90000, 50),
(3, 2, 'Child Ticket', 'This ticket can be used for kid to enter the playground. HAVE FUN!', 150000, 100),
(4, 2, 'Guardian Ticket', 'This ticket is provided for parent or guardian who wants to company their child', 90000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `virtualaccount`
--

CREATE TABLE `virtualaccount` (
  `customerID` int(11) NOT NULL,
  `methodID` int(11) NOT NULL,
  `virtualAcc` varchar(16) NOT NULL,
  `bill` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `virtualaccount`
--

INSERT INTO `virtualaccount` (`customerID`, `methodID`, `virtualAcc`, `bill`) VALUES
(1, 1, '1231231', 0),
(21, 1, '12312321', 0),
(22, 1, '12312322', 0),
(23, 1, '12312323', 0),
(1, 2, '4564561', 0),
(18, 2, '45645618', 0),
(19, 2, '45645619', 0),
(20, 2, '45645620', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderDetailID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`outletID`),
  ADD UNIQUE KEY `employeeID` (`employeeID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  ADD PRIMARY KEY (`methodID`);

--
-- Indexes for table `purchasedticket`
--
ALTER TABLE `purchasedticket`
  ADD PRIMARY KEY (`purchasedTicketID`);

--
-- Indexes for table `tickettype`
--
ALTER TABLE `tickettype`
  ADD PRIMARY KEY (`ticketTypeID`);

--
-- Indexes for table `virtualaccount`
--
ALTER TABLE `virtualaccount`
  ADD UNIQUE KEY `virtualAcc` (`virtualAcc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `outletID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `paymentmethod`
--
ALTER TABLE `paymentmethod`
  MODIFY `methodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchasedticket`
--
ALTER TABLE `purchasedticket`
  MODIFY `purchasedTicketID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tickettype`
--
ALTER TABLE `tickettype`
  MODIFY `ticketTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
