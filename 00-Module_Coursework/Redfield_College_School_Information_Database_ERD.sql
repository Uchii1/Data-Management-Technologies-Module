CREATE TABLE `students` (
  `student_id` char(6) PRIMARY KEY,
  `first_name` varchar(15),
  `last_name` varchar(15),
  `preferred_name` varchar(15),
  `birth_date` date,
  `enrollment_date` date,
  `year_group` enum(1,2),
  `student_activity_id` char(6),
  `emergency_contact_id` char(6),
  `emergency_contact_rel` varchar(15),
  `student_course_id` char(4)
);

CREATE TABLE `enrollments` (
  `enrollment_id` char(10) PRIMARY KEY,
  `student_id` char(6),
  `course_id` char(6),
  `enrollment_year` enum(Year 1,Year 2),
  `enrollment_type` enum(Core Module 1,Core Module 2,Optional Module 1,Optional Module 2) NOT NULL,
  `mock_mark` tinyint COMMENT 'CHECK (mock_mark >= 0 AND mock_mark <= 100)',
  `final_mark` tinyint COMMENT 'CHECK (final_mark>= 0 AND final_mark <=100',
  `module_id` varchar(10)
);

CREATE TABLE `teachers` (
  `staff_id` char(6) PRIMARY KEY,
  `first_name` varchar(15),
  `last_name` varchar(15),
  `phone_number` varchar(15),
  `email_address` varchar(255),
  `birth_date` date,
  `salary` decimal(10,2),
  `office_hours_1` varchar(15),
  `office_hours_2` varchar(15),
  `teacher_course_id` varchar(6)
);

CREATE TABLE `courses` (
  `course_id` char(4) PRIMARY KEY,
  `course_name` enum(Mathematics,Law,Accounting,Computer Science,English,Business)
);

CREATE TABLE `modules` (
  `module_id` varchar(4) PRIMARY KEY,
  `module_name` varchar(25),
  `course` set(Mathematics,Law,Accounting,Computer Science,English,Business),
  `module_credit` TINYINT COMMENT 'CHECK module_credit IN (20, 40)',
  `lecture_slot_1` varchar(15),
  `lecture_slot_2` varchar(15)
);

CREATE TABLE `extracurriculars` (
  `activity_id` char(4) PRIMARY KEY,
  `activity_name` enum(Football,Basketball,Chess,Programming,No Activity),
  `activity_type` enum(Social,Varsity),
  `activity_time_1` varchar(15),
  `activity_time_2` varchar(15),
  `additional_practice` varchar(15)
);

CREATE TABLE `emergency_contacts` (
  `emergency_contact_id` char(6) PRIMARY KEY,
  `first_name` varchar(15),
  `last_name` varchar(15),
  `phone_number` varchar(15)
);

CREATE TABLE `year_groups` (
  `year_group_id` int PRIMARY KEY,
  `expected_grad_date` date
);

ALTER TABLE `students` ADD FOREIGN KEY (`year_group`) REFERENCES `year_groups` (`year_group_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`student_activity_id`) REFERENCES `extracurriculars` (`activity_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`emergency_contact_id`) REFERENCES `emergency_contacts` (`emergency_contact_id`);

ALTER TABLE `students` ADD FOREIGN KEY (`student_course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `teachers` ADD FOREIGN KEY (`teacher_course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `modules` ADD FOREIGN KEY (`course`) REFERENCES `courses` (`course_name`);
