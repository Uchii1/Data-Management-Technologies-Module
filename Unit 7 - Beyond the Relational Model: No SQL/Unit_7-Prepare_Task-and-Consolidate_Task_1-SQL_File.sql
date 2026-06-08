-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2026 at 01:42 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unit_7-prepare`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CourseID` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Course Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Semester` int NOT NULL,
  `Year` date NOT NULL,
  `StudentID` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `Course Name`, `Semester`, `Year`, `StudentID`) VALUES
('C01', 'Mathematics', 1, '2025-09-01', '1'),
('C02', 'Science', 1, '2025-09-01', '2'),
('C03', 'Computer Science', 1, '2025-09-01', '3'),
('C04', 'Law', 1, '2025-09-01', '4'),
('C05', 'Accounting', 1, '2025-09-01', '0005');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `ModuleID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModuleName` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CourseID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ModuleID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ModuleID`, `ModuleName`, `CourseID`) VALUES
('M01', 'Calculus', 'C01'),
('M02', 'Algebra', 'C01'),
('M03', 'Biology', 'C02'),
('M04', 'Chemistry', 'C02'),
('M05', 'Data Processing', 'C03'),
('M06', 'Software Develo', 'C03'),
('M07', 'Cyber Security', 'C03'),
('M08', 'Webpage Design', 'C03'),
('M09', 'Commercial Law', 'C04'),
('M10', 'Land Law', 'C04'),
('M11', 'Tax Law', 'C04'),
('M12', 'Company Law', 'C04'),
('M13', 'Management Info', 'C05'),
('M14', 'Financial Repor', 'C05'),
('M15', 'Tax Compliance', 'C05'),
('M16', 'Business Strate', 'C05');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentFirstName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Student Surname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CourseID` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudentID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentFirstName`, `Student Surname`, `CourseID`, `Email`, `StudentID`) VALUES
('Alex', 'Fisher', 'C01', 'fisher0001@redwood-school.com', '0001'),
('Bob', 'Miller', 'C02', 'miller0002@redwood-school.com', '0002'),
('Charlie', 'Potter', 'C03', 'potter0003@redwood-school.com', '0003'),
('Duncan', 'Piper', 'C04', 'piper0004@redwood-school.com', '0004'),
('Emma', 'Baker', 'C05', 'baker0005@redwood-school.com', '0005');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
