-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 08, 2026 at 12:50 AM
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
-- Database: `term_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` enum('Mathematics','Law','Accounting','Computer Science','English','Business') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

DROP TABLE IF EXISTS `emergency_contacts`;
CREATE TABLE IF NOT EXISTS `emergency_contacts` (
  `emergency_contact_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`emergency_contact_id`),
  UNIQUE KEY `emergency_contact_id` (`emergency_contact_id`),
  KEY `emergency_contact_id_2` (`emergency_contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE IF NOT EXISTS `enrollments` (
  `enrollment_id` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enrollment_year` enum('Year 1','Year 2','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enrollment_type` enum('Core Module 1','Core Module 2','Optional Module 1','Optional Module 2') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mock_mark` tinyint DEFAULT NULL,
  `final_mark` tinyint DEFAULT NULL,
  `module_id` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `students.student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  KEY `moduleid` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extracurriculars`
--

DROP TABLE IF EXISTS `extracurriculars`;
CREATE TABLE IF NOT EXISTS `extracurriculars` (
  `activity_id` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_name` enum('Football','Basketball','Programming','Chess','No Activity') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_type` enum('Varsity','Social','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_time_1` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_time_2` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_practice` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`activity_id`),
  UNIQUE KEY `activity_id` (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` set('Business','Computer Science','English','Law','Mathematics','Accounting') COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_credit` int NOT NULL COMMENT 'Must be 20 or 40',
  `lecture_slot_1` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_slot_2` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_id` (`module_id`),
  UNIQUE KEY `module_id_2` (`module_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferred_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `enrollment_date` date NOT NULL,
  `year_group` enum('1','2','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_activity_id` enum('AC01','AC02','AC03','AC04','AC05','AC06','AC07') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact_rel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_course_id` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_activity` (`student_activity_id`),
  KEY `fk_course` (`student_course_id`),
  KEY `fk_year_group` (`year_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `staff_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` enum('Mathematics','Law','Accounting','Computer Science','Business','English') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `office_hours_1` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_hours_2` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `year_groups`
--

DROP TABLE IF EXISTS `year_groups`;
CREATE TABLE IF NOT EXISTS `year_groups` (
  `year_group_id` int NOT NULL,
  `expected_grad_date` date DEFAULT NULL,
  PRIMARY KEY (`year_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
