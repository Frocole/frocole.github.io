-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2022 at 11:43 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `frocole`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL COMMENT 'Unique Group Number',
  `CourseName` varchar(20) NOT NULL COMMENT 'Non-unique group Nickname',
  `IPF_RD_parameters` varchar(255) NOT NULL COMMENT 'A set of up to 5 parameters on which peers can review each other',
  `GPF_RD_parameters` varchar(255) NOT NULL COMMENT 'A set of up to 5 parameters on which peers can review their collaborative product',
  `LeraarUserID` int(11) NOT NULL,
  `CourseActive` tinyint(1) NOT NULL,
  `SegmentID` int(11) NOT NULL,
  `Deadline` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedbackitems`
--

CREATE TABLE `feedbackitems` (
  `FeedBackItemID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `GroupID` int(11) NOT NULL,
  `FeedbackSuplierID` int(11) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Parameter` varchar(255) NOT NULL,
  `Score` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL COMMENT 'Unique Group Number',
  `GroupNickname` varchar(20) NOT NULL COMMENT 'Non-unique group Nickname',
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `infotexten`
--

CREATE TABLE `infotexten` (
  `infoid` int(11) NOT NULL,
  `infotext` text NOT NULL,
  `SegmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `paguidelines`
--

CREATE TABLE `paguidelines` (
  `PAGuidelineID` int(11) NOT NULL,
  `CourseID` int(20) DEFAULT NULL,
  `SubjectType` varchar(255) DEFAULT NULL,
  `Parameter` varchar(255) DEFAULT NULL,
  `Delta` int(20) DEFAULT NULL,
  `Advice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `SegmentID` int(11) NOT NULL,
  `SegmentName` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userandcourserelations`
--

CREATE TABLE `userandcourserelations` (
  `UserAndCourseRelationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userandgrouprelations`
--

CREATE TABLE `userandgrouprelations` (
  `UserAndGroupRelationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `Public` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User belongs to group';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'Unique User Number',
  `Username` varchar(20) NOT NULL COMMENT 'Unique User Name',
  `Password` varchar(255) NOT NULL COMMENT 'Encrypted password',
  `Nickname` varchar(20) NOT NULL COMMENT 'non unique user nickname',
  `SegmentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `feedbackitems`
--
ALTER TABLE `feedbackitems`
  ADD PRIMARY KEY (`FeedBackItemID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `infotexten`
--
ALTER TABLE `infotexten`
  ADD PRIMARY KEY (`infoid`),
  ADD UNIQUE KEY `SegmentID` (`SegmentID`);

--
-- Indexes for table `paguidelines`
--
ALTER TABLE `paguidelines`
  ADD PRIMARY KEY (`PAGuidelineID`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`SegmentID`),
  ADD UNIQUE KEY `SegmentName` (`SegmentName`);

--
-- Indexes for table `userandcourserelations`
--
ALTER TABLE `userandcourserelations`
  ADD PRIMARY KEY (`UserAndCourseRelationID`);

--
-- Indexes for table `userandgrouprelations`
--
ALTER TABLE `userandgrouprelations`
  ADD PRIMARY KEY (`UserAndGroupRelationID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Group Number';

--
-- AUTO_INCREMENT for table `feedbackitems`
--
ALTER TABLE `feedbackitems`
  MODIFY `FeedBackItemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique Group Number';

--
-- AUTO_INCREMENT for table `infotexten`
--
ALTER TABLE `infotexten`
  MODIFY `infoid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paguidelines`
--
ALTER TABLE `paguidelines`
  MODIFY `PAGuidelineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `SegmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userandcourserelations`
--
ALTER TABLE `userandcourserelations`
  MODIFY `UserAndCourseRelationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userandgrouprelations`
--
ALTER TABLE `userandgrouprelations`
  MODIFY `UserAndGroupRelationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique User Number';
COMMIT;

--
-- Dumping data for table `segments`
--
INSERT INTO `segments` (`SegmentID`, `SegmentName`) VALUES (1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
