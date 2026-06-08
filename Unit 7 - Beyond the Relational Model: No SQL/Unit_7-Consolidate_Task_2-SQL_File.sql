-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2026 at 02:28 AM
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
-- Database: `unit_7-consolidation_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `department`, `credits`) VALUES
(1, 'Introduction to Computer Science', 'Computer Science', 3),
(2, 'Calculus I', 'Mathematics', 4),
(3, 'Principles of Marketing', 'Business', 3),
(4, 'Introduction to Psychology', 'Psychology', 3),
(5, 'Organic Chemistry', 'Chemistry', 4);

-- --------------------------------------------------------

--
-- Table structure for table `courses2`
--

DROP TABLE IF EXISTS `courses2`;
CREATE TABLE IF NOT EXISTS `courses2` (
  `sid` int DEFAULT NULL,
  `cname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cyear` int DEFAULT NULL,
  `grade` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses2`
--

INSERT INTO `courses2` (`sid`, `cname`, `cyear`, `grade`) VALUES
(5023, 'Software Development', 2, 85),
(4225, 'Artificial Intelligence', 3, 42),
(6292, 'Software Development', 2, 82),
(5023, 'Databases', 2, 85),
(9349, 'Project', 3, 56),
(6292, 'Databases', 2, 55),
(5303, 'Artificial Intelligence', 2, 69),
(2340, 'Software Development', 2, 51);

-- --------------------------------------------------------

--
-- Table structure for table `crews`
--

DROP TABLE IF EXISTS `crews`;
CREATE TABLE IF NOT EXISTS `crews` (
  `id` int NOT NULL,
  `spacecraft` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `astronaut` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crews`
--

INSERT INTO `crews` (`id`, `spacecraft`, `astronaut`) VALUES
(1, 'Apollo 11', 'Neil Armstrong'),
(2, 'Apollo 11', 'Buzz Aldrin'),
(3, 'Apollo 11', 'Michael Collins'),
(4, 'Apollo 13', 'Jim Lovell'),
(5, 'Apollo 13', 'Fred Haise'),
(6, 'Apollo 13', 'Jack Swigert'),
(7, 'Apollo 14', 'Alan Shepard'),
(8, 'Apollo 14', 'Stuart Roosa'),
(9, 'Apollo 14', 'Edgar Mitchell'),
(10, 'Apollo 15', 'David Scott'),
(11, 'Apollo 15', 'James Irwin'),
(12, 'Apollo 15', 'Alfred Worden'),
(13, 'Apollo 16', 'John Young'),
(14, 'Apollo 16', 'Charles Duke'),
(15, 'Apollo 16', 'Thomas Mattingly'),
(16, 'Apollo 17', 'Eugene Cernan'),
(17, 'Apollo 17', 'Harrison Schmitt'),
(18, 'Apollo 17', 'Ronald Evans'),
(19, 'Soyuz TM-31', 'Sergei Krikalev'),
(20, 'Soyuz TM-31', 'Yuri Gidzenko'),
(21, 'Soyuz TM-31', 'William Shepherd');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int NOT NULL,
  `course_id` int NOT NULL,
  `exam_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_date` date DEFAULT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`exam_id`, `course_id`, `exam_name`, `exam_date`) VALUES
(1, 1, 'Midterm Exam', '2023-03-15'),
(2, 1, 'Final Exam', '2023-05-20'),
(3, 2, 'Midterm Exam', '2023-03-10'),
(4, 3, 'Final Project', '2023-05-25'),
(5, 4, 'Term Paper', '2023-04-30'),
(6, 5, 'Lab Practical', '2023-04-18');

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
CREATE TABLE IF NOT EXISTS `missions` (
  `id` int NOT NULL,
  `spacecraft` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `launch` date DEFAULT NULL,
  `recovery` date DEFAULT NULL,
  `destination` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `missions`
--

INSERT INTO `missions` (`id`, `spacecraft`, `launch`, `recovery`, `destination`) VALUES
(1, 'Apollo 11', '1969-07-16', '1969-07-24', 'Moon'),
(2, 'Apollo 13', '1970-04-11', '1970-04-17', 'Moon'),
(3, 'Apollo 14', '1971-01-31', '1971-02-09', 'Moon'),
(4, 'Apollo 15', '1971-07-26', '1971-08-07', 'Moon'),
(5, 'Apollo 16', '1972-04-16', '1972-04-27', 'Moon'),
(6, 'Apollo 17', '1972-12-07', '1972-12-19', 'Moon'),
(7, 'Soyuz TM-31', '2000-10-31', '2001-03-21', 'International Space Station'),
(8, 'SpaceX Crew-1', '2020-11-15', '2021-05-02', 'International Space Station'),
(9, 'SpaceX Crew-2', '2021-04-23', '2021-11-08', 'International Space Station'),
(10, 'SpaceX Crew-3', '2021-11-10', '2022-05-06', 'International Space Station'),
(11, 'SpaceX Crew-4', '2022-04-27', '2022-10-14', 'International Space Station'),
(12, 'SpaceX Crew-5', '2022-10-05', '2023-03-11', 'International Space Station'),
(13, 'SpaceX Crew-6', '2023-03-02', NULL, 'International Space Station'),
(14, 'Soyuz MS-21', '2022-03-18', '2022-10-13', 'International Space Station'),
(15, 'Soyuz MS-22', '2022-09-21', '2023-03-28', 'International Space Station'),
(16, 'Soyuz MS-23', '2023-02-24', NULL, 'International Space Station'),
(17, 'Shenzhou 13', '2021-10-16', '2022-04-16', 'Tiangong Space Station'),
(18, 'Shenzhou 14', '2022-06-05', '2022-12-04', 'Tiangong Space Station'),
(19, 'Shenzhou 15', '2022-11-29', NULL, 'Tiangong Space Station'),
(20, 'Artemis 1', '2022-11-16', '2022-12-11', 'Moon');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `grade` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`name`, `birthdate`, `sid`, `year`, `grade`) VALUES
('Frank Mills', '4-3-2005', 2340, 2, '55'),
('Maria Odunewe', '30-7-2000', 5303, 2, '71'),
('Charles Saputra', '14-6-2001', 4225, 3, '65'),
('Philippa Brock', '2-2-2003', 6292, 3, '59'),
('Faith Kipruto', '21-10-2002', 9349, 2, '75'),
('Amos Tomao', '15-11-2004', 3240, 3, '52'),
('Shai-lin He', '10-1-2002', 5023, 2, '80'),
('Marcelle Dubois', '6-8-2003', 2929, 3, '90');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
