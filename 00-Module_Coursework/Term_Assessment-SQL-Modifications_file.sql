-- DATA MANAGEMENT TECHNOLOGIES (DMT) MODULE ASSESSMENT
-- SQL File 3: Selection of Database Updates

----- ------ session configuration --------------
-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2026 at 12:38 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
-------------------------------------------


-- MODIFICATION 1: Update Corny Alderman (Student ID: SD0074)'s first name to Cornelius, making Corny his preferred name
UPDATE students
SET first_name= 'Cornelius',
    preferred_name = 'Corny'
WHERE student_id = 'SD0074'


-- MODIFICATION 2: Update Alistair Petrov (SD0195)'s mock mark in Statistics (MD58) from 60 to 75, following a correcting in marking
UPDATE enrollments
SET mock_mark = 75
WHERE module_id = 'MD58' AND student_id = 'SD0195'  -- The record could also be found with enrollment ID EN00780


-- MODIFICATION 3: Update teacher Erica Bentley (T005)'s surname to Ford, following her marriage
UPDATE teachers
SET last_name = 'Ford'
WHERE staff_id = 'T005'


-- MODIFICATION 4:
-- Adding mock_grade column to enrollments table, which depends on mock_mark
ALTER TABLE enrollments ADD COLUMN mock_grade VARCHAR(2) AFTER mock_mark;
UPDATE enrollments
    SET mock_grade = CASE
    WHEN mock_mark >= 90 THEN 'A*'
    WHEN mock_mark >= 80 THEN 'A'
    WHEN mock_mark >= 70 THEN 'B'
    WHEN mock_mark >= 60 THEN 'C'
    WHEN mock_mark >= 50 THEN 'D'
    ELSE 'U'
END;


-- MODIFICATION 5: Normalising Student table to 2NF (Replacing course name with foreign key student_course_id)
-- Add column in students table for course id
ALTER TABLE students ADD COLUMN student_course_id CHAR(4);
-- Matching student course name to course names on course table
UPDATE students s
JOIN courses c ON s.student_course = c.course_name
SET s.student_course_id = c.course_id;

-- removing student course from students table
ALTER TABLE students DROP COLUMN student_course;
-- making student course id a foreign key
ALTER TABLE students
ADD CONSTRAINT fk_course
FOREIGN KEY (student_course_id) REFERENCES courses(course_id);


-- MODIFICATION 6: Query to check whether Student table is normalised to 2NF regarding expected graduation dates
------ Note: This query will not work on normalised database, as column expected_grad_date has been moved from table students
SELECT * FROM `students` 
WHERE (expected_grad_date = '2027-06-30' AND year_group != 1) 
OR (expected_grad_date = '2026-06-30' AND year_group != 2)
-- This returned blank output showing that the students table is NOT noramlised, because expected graduation date, a non-key variable depends wholly on year group, another non-key variable


-- MODIFICATION 7: 2NF Normalisation of year group
---- Creating year group as a new table
CREATE TABLE year_groups (
    year_group_id INT PRIMARY KEY,
    expected_grad_date DATE
);
-- Inserting columns year_group_id and expected_grad_date into new table year group. 
-- These are the distinct year groups and graduation dates from the students table
INSERT INTO year_group (year_group_id, expected_grad_date)
SELECT DISTINCT year_group, expected_grad_date
FROM students;

-- Dropping column expected_grad_date, while leaving in column year_group
ALTER TABLE students DROP COLUMN expected_grad_date;

-- Adding foreign key constraint to year group
ALTER TABLE students
ADD CONSTRAINT fk_year_group
FOREIGN KEY (year_group) REFERENCES year_group(year_group_id);


-- MODIFICATION 8: INCLUCDING TEMPORARY ADDITIONAL PRACTICE TIME FOR VARSITY SPORTS
---- The football team's request for additional practice (from Query 8 of the main document) has been approved

---- This alters the extracurriculars table to incldue a new column to record additional practice time, default value NULL
ALTER TABLE extracurriculars 
ADD COLUMN additional_practice VARCHAR(11) DEFAULT NULL;
-- Updating the new column to contain additional practice time for Varsity Football (activity id: AC01)
UPDATE extracurriculars
SET additional_practice = 'Wed18002000' WHERE activity_id = 'AC01'


-- MODIFICATION 9:
--- Discovery of a grading error reveals that all mock exam marks for the business law module (Module id: MD46) should have been 10% higher
-- updating the table to relfect this by adding 10 to each mark for the relevant module
UPDATE enrollments
SET mock_mark = mock_mark + 10
WHERE (module_id = 'MD46' and mock_mark <= 90);

SELECT * from enrollments 
where module_id = 'MD46'


-- MODIFICATION 10:
--- Computational Mathematics's (Module id: MD60) lecture slot 2 to be exteneded be extended by 30 minutes:
--- The lecture slot is currently 'Fri09001100' and is to be updated to 'Fri09001130'
UPDATE modules
SET lecture_slot_2 = 'Fri09001130'
WHERE module_id = 'MD60';

-- Printing updated module information
SELECT * from modules
where module_id = 'MD60'




-- Default character settings from pHp Admin--------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `term_assessment`
--
-- --------------------------------------------------------
