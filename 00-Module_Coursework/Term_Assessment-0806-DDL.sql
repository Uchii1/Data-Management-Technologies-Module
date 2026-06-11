-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2026 at 05:02 PM
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
  `activity_type` enum('Varsity','Social') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_time_1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_time_2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_practice` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `lecture_slot_1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_slot_2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `year_group` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_activity_id` enum('AC01','AC02','AC03','AC04','AC05','AC06','AC07') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emergency_contact_rel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_course_id` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_activity` (`student_activity_id`),
  KEY `fk_course` (`student_course_id`),
  KEY `fk_year_group` (`year_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -------------------------------------------------------
-- --------------------------------------------------------
--
-- Table structure for table `teachers`
--
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `staff_id` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `office_hours_1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_hours_2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `teacher_course_id` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `teacher_course_id` (`teacher_course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
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





-- ******** ------- ******** ------- STRUCTURE FOR VIEWS ------- ******** -------******** ------- ******** -------******** ------- ******** -------******** ------********
-- Views are detailed here alphabetically by view name, with the corresponding query indicated
-- There is no view for query 2, which was executed by a CTE and then by a subquery

-- ******** ------- ******** ------- ******** ------- ******** -------******** ------- ******** -------******** ------- ******** -------******** ------- ******** ------- 
-- ******** ------- ******** ------- ******** ------- ******** -------******** ------- ******** -------******** ------- ******** -------******** ------- ******** ------- 
-- ******** ------- ******** ------- ******** ------- ******** -------******** ------- ******** -------******** ------- ******** -------******** ------- ******** ------- 


-- Structure for view `clashing_activities_scheduling` -- QUERY 8
--
DROP TABLE IF EXISTS `clashing_activities_scheduling`;

DROP VIEW IF EXISTS `clashing_activities_scheduling`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clashing_activities_scheduling`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, `s`.`student_course_id` AS `student_course_id`, `x`.`activity_name` AS `activity_name`, `x`.`activity_type` AS `activity_type`, `m`.`module_name` AS `module_name`, `m`.`lecture_slot_1` AS `late_lecture_time`, 'lecture_slot_1' AS `slot_type` FROM (((`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) join `modules` `m` on((`e`.`module_id` = `m`.`module_id`))) join `extracurriculars` `x` on((`x`.`activity_id` = `s`.`student_activity_id`))) WHERE (regexp_like(`m`.`lecture_slot_1`,'^Wed.*1830$|^Wed.*1900$') AND (`s`.`student_activity_id` = 'AC01'))union select `s`.`student_id` AS `student_id`,`s`.`first_name` AS `first_name`,`s`.`last_name` AS `last_name`,`s`.`student_course_id` AS `student_course_id`,`x`.`activity_name` AS `activity_name`,`x`.`activity_type` AS `activity_type`,`m`.`module_name` AS `module_name`,`m`.`lecture_slot_2` AS `late_lecture_time`,'lecture_slot_2' AS `slot_type` from (((`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) join `modules` `m` on((`e`.`module_id` = `m`.`module_id`))) join `extracurriculars` `x` on((`x`.`activity_id` = `s`.`student_activity_id`))) where (regexp_like(`m`.`lecture_slot_2`,'^Wed.*1830$|^Wed.*1900$') and (`s`.`student_activity_id` = 'AC01')) order by `student_course_id`,`module_name`,`student_id`  ;

-- --------------------------------------------------------
--
-- Structure for view `fintech_final_marks_analysis` -- QUERY 9
--
DROP TABLE IF EXISTS `fintech_final_marks_analysis`;

DROP VIEW IF EXISTS `fintech_final_marks_analysis`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fintech_final_marks_analysis`  AS SELECT round(avg(`e`.`final_mark`),2) AS `Avg_Final_Mark`, max(`e`.`final_mark`) AS `Max_Final_Mark`, min(`e`.`final_mark`) AS `Min_Final_Mark`, round(std(`e`.`final_mark`),2) AS `Standard_Deviation_of_Final_Mark`, round((((count(0) * sum((`e`.`mock_mark` * `e`.`final_mark`))) - (sum(`e`.`mock_mark`) * sum(`e`.`final_mark`))) / (sqrt(((count(0) * sum((`e`.`mock_mark` * `e`.`mock_mark`))) - (sum(`e`.`mock_mark`) * sum(`e`.`mock_mark`)))) * sqrt(((count(0) * sum((`e`.`final_mark` * `e`.`final_mark`))) - (sum(`e`.`final_mark`) * sum(`e`.`final_mark`)))))),3) AS `Pearson_Correlation_Coefficient` FROM `enrollments` AS `e` WHERE (`e`.`module_id` = 'MD17') ;

-- --------------------------------------------------------
--
-- Structure for view `quiet_hours_staff`  -- QUERY 7
--
DROP TABLE IF EXISTS `quiet_hours_staff`;

DROP VIEW IF EXISTS `quiet_hours_staff`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `quiet_hours_staff`  AS SELECT `t`.`staff_id` AS `staff_id`, `t`.`first_name` AS `first_name`, `t`.`last_name` AS `last_name`, `t`.`office_hours_1` AS `quiet_hours`, 'Office Hours 1' AS `slot_type` FROM `teachers` AS `t` WHERE regexp_like(`t`.`office_hours_1`,'0700|0730|0800|0830|1830$|1900$')union all select `t`.`staff_id` AS `staff_id`,`t`.`first_name` AS `first_name`,`t`.`last_name` AS `last_name`,`t`.`office_hours_2` AS `quiet_hours`,'Office Hours 2' AS `slot_type` from `teachers` `t` where regexp_like(`t`.`office_hours_2`,'0700|0730|0800|0830|1830$|1900$')  ;

-- --------------------------------------------------------
--
-- Structure for view `staff_ages` -- QUERY 5
--
DROP TABLE IF EXISTS `staff_ages`;

DROP VIEW IF EXISTS `staff_ages`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_ages`  AS SELECT `t`.`first_name` AS `first_name`, `t`.`last_name` AS `last_name`, `t`.`staff_id` AS `staff_id`, `t`.`salary` AS `salary`, `t`.`birth_date` AS `birth_date`, year(`t`.`birth_date`) AS `teacher_birth_year`, timestampdiff(YEAR,`t`.`birth_date`,curdate()) AS `teacher_age` FROM `teachers` AS `t` ;

-- --------------------------------------------------------
--
-- Structure for view `staff_pay_by_course` -- QUERY 6
--
DROP TABLE IF EXISTS `staff_pay_by_course`;

DROP VIEW IF EXISTS `staff_pay_by_course`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staff_pay_by_course`  AS SELECT row_number() OVER (ORDER BY `t`.`course` ) AS `index_no`, `t`.`course` AS `Course`, count(`t`.`first_name`) AS `Teacher_Count`, max(`t`.`salary`) AS `Maximum_Salary`, min(`t`.`salary`) AS `Minimum_Salary`, (max(`t`.`salary`) - min(`t`.`salary`)) AS `Salary_Range`, round(std(`t`.`salary`),0) AS `Standard_Deviation`, round(avg(`t`.`salary`),0) AS `Average_Salary`, round(((std(`t`.`salary`) / avg(`t`.`salary`)) * 100),2) AS `Coefficient_of_Variation_pct` FROM `teachers` AS `t` GROUP BY `t`.`course` ORDER BY `index_no` ASC ;

-- --------------------------------------------------------
--
-- Structure for view `student_ages` -- QUERY 1
--
DROP TABLE IF EXISTS `student_ages`;

DROP VIEW IF EXISTS `student_ages`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_ages`  AS SELECT round(avg(timestampdiff(YEAR,`students`.`birth_date`,curdate())),2) AS `average_age`, max(timestampdiff(YEAR,`students`.`birth_date`,curdate())) AS `maximum_age`, min(timestampdiff(YEAR,`students`.`birth_date`,curdate())) AS `minimum_age` FROM `students` ;

-- --------------------------------------------------------
--
-- Structure for view `student_grades` -- QUERY 3
--
DROP TABLE IF EXISTS `student_grades`;

DROP VIEW IF EXISTS `student_grades`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `student_grades`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, avg(`e`.`mock_mark`) AS `mock_average`, max(`e`.`mock_mark`) AS `max_mock_grade`, min(`e`.`mock_mark`) AS `min_mock_grade`, round(std(`e`.`mock_mark`),2) AS `standard_deviation` FROM (`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) GROUP BY `s`.`student_id` ;

-- --------------------------------------------------------
--
-- Structure for view `top_performers` -- QUERY 4
--
DROP TABLE IF EXISTS `top_performers`;

DROP VIEW IF EXISTS `top_performers`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `top_performers`  AS SELECT `s`.`student_id` AS `student_id`, `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, `s`.`student_course` AS `student_course`, `s`.`year_group` AS `year_group`, round(avg(`e`.`mock_mark`),2) AS `mock_average` FROM (`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) GROUP BY `s`.`student_id` ;

-- --------------------------------------------------------
--
-- Structure for view `varsity_count` -- QUERY 10
--
DROP TABLE IF EXISTS `varsity_count`;

DROP VIEW IF EXISTS `varsity_count`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `varsity_count`  AS SELECT `s`.`student_course` AS `Course`, sum((case when (`s`.`student_activity_id` in ('AC01','AC03','AC05')) then 1 else 0 end)) AS `Students_in_Varsity_Activities`, count(`s`.`student_course`) AS `Total_Students_in_Course`, round(((sum((case when (`s`.`student_activity_id` in ('AC01','AC03','AC05')) then 1 else 0 end)) / count(`s`.`student_course`)) * 100),2) AS `Pct_in_a_Varsity_Activity` FROM ((`students` `s` left join `extracurriculars` `e` on((`e`.`activity_id` = `s`.`student_activity_id`))) left join `courses` `c` on((`c`.`course_name` = `s`.`student_course`))) GROUP BY `s`.`student_course` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
