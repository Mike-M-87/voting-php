-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2022 at 09:03 AM
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
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidate`
--

CREATE TABLE `candidate` (
  `id` int(11) NOT NULL,
  `user__id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidate`
--

INSERT INTO `candidate` (`id`, `user__id`, `position_id`, `election_id`, `created_at`) VALUES
(1, 16, 1, 1, '2022-11-22 11:03:21'),
(2, 13, 1, 1, '2022-11-22 15:28:00'),
(3, 15, 2, 1, '2022-11-22 18:31:11'),
(4, 17, 2, 1, '2022-11-22 18:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `election`
--

CREATE TABLE `election` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Name of election',
  `description` varchar(255) NOT NULL COMMENT 'Details about election',
  `start_date` int(11) NOT NULL COMMENT 'Voting start date and time',
  `end_date` int(11) NOT NULL COMMENT 'Voting end date and time',
  `active` int(11) NOT NULL COMMENT 'Whether election is active is active(1) or not(0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `election`
--

INSERT INTO `election` (`id`, `name`, `description`, `start_date`, `end_date`, `active`) VALUES
(1, '8th August 2022 General Election', 'Elections on ....', 0, 0, 1),
(2, '8th August 2017 General Election', 'Election .....', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'Name for elective post',
  `description` varchar(255) DEFAULT NULL COMMENT 'Summary of the elective post'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`, `description`) VALUES
(1, 'President', ''),
(2, 'Vice President', ''),
(3, 'Secretary General', ''),
(4, 'Academic Secretary', ''),
(5, 'Sports and Entertainment', ''),
(6, 'Social Welfare Representative', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'Unique Identify for our user and also primary key and auto incrementing',
  `firstname` varchar(15) NOT NULL COMMENT 'First Name for user',
  `othernames` varchar(30) NOT NULL COMMENT 'Second / Surname for user',
  `contact` int(10) NOT NULL COMMENT 'Phone Number of user in the format 07xxxxxxxx',
  `emailaddress` varchar(50) NOT NULL COMMENT 'Email Address of the user',
  `userpassword` varchar(300) NOT NULL COMMENT 'Password for the user',
  `created` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Time and date the user was added'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `othernames`, `contact`, `emailaddress`, `userpassword`, `created`) VALUES
(13, 'John', 'Doe', 798654321, 'johndoe@gmail.com', 'vojc0QmiVWFaA', '2022-11-21 23:22:27'),
(14, 'Okore', 'Owino', 798654321, 'okorelens27@gmail.com', 'vo/ryfnCEB/Kw', '2022-11-21 23:24:42'),
(15, 'mimiMessi', 'Yeye', 798654321, 'messi@gmail.com', 'voHwUZzFQ.7I2', '2022-11-21 23:26:42'),
(16, 'Sarah', 'Johnson', 789654321, 'sarah@gmail.com', 'vocfyeVl0rdpc', '2022-11-22 10:39:28'),
(17, 'Example', 'Mkenya', 789546732, 'example@gmail.com', 'voqbo6AW6wGPE', '2022-11-22 13:27:42'),
(18, 'Example', 'Mkenya', 789546732, 'example@gmail.com', 'voqbo6AW6wGPE', '2022-11-23 08:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `vote`
--

CREATE TABLE `vote` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `election_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote`
--

INSERT INTO `vote` (`id`, `user_id`, `candidate_id`, `election_id`, `created_at`) VALUES
(8, 17, 16, 1, '2022-11-22 18:53:42'),
(9, 17, 15, 1, '2022-11-22 18:53:42'),
(10, 16, 13, 1, '2022-11-22 18:58:15'),
(11, 16, 15, 1, '2022-11-22 18:58:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `election`
--
ALTER TABLE `election`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote`
--
ALTER TABLE `vote`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `election`
--
ALTER TABLE `election`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Identify for our user and also primary key and auto incrementing', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vote`
--
ALTER TABLE `vote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
