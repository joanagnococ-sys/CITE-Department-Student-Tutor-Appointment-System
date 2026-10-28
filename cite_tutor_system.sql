-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2026 at 11:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cite_tutor_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `tutor_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_type` varchar(30) NOT NULL,
  `room` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `decline_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `student_id`, `tutor_id`, `subject`, `appointment_date`, `start_time`, `end_time`, `session_type`, `room`, `note`, `status`, `created_at`, `decline_reason`) VALUES
(1, '02-2526-000036', 5, 'Object Oriented Programming', '2026-10-08', '13:30:00', '14:30:00', 'Online', '', 'I want to understand more how the neatbeans works.', 'Cancelled', '2026-10-08 00:14:30', NULL),
(2, '02-2526-000036', 1, 'IT Project Management', '2026-10-12', '07:30:00', '08:30:00', 'Face-to-Face', 'MS CL-2', 'I want to understand IT Project, and scrum.', 'Completed', '2026-10-08 08:26:03', NULL),
(3, '02-2526-000034', 1, 'IT Project Management', '2026-10-13', '07:30:00', '08:30:00', 'Face-to-Face', 'MS CL-2', 'I want to understand more about IT Project.', 'Accepted', '2026-10-10 07:46:54', NULL),
(4, '02-2526-000035', 4, 'Networking', '2026-10-13', '10:30:00', '11:30:00', 'Online', '', '', 'Declined', '2026-10-10 18:06:20', 'I\'m busy on that day, reschedule the date and time.'),
(5, '02-2526-000036', 5, 'Object Oriented Programming', '2026-10-16', '14:30:00', '15:30:00', 'Face-to-Face', 'SHS CL-2', '', 'Pending', '2026-10-11 17:27:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `tutor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `availability` varchar(100) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`tutor_id`, `user_id`, `subject`, `availability`, `start_time`, `end_time`) VALUES
(1, 1, 'IT Project Management', 'Monday-Wednesday', '07:30:00', '09:00:00'),
(2, 2, 'Data Structure & Algorithm', 'Tuesday-Thursday', '07:30:00', '09:00:00'),
(3, 3, 'Information Management', 'Tuesday-Friday', '09:00:00', '10:30:00'),
(4, 4, 'Networking', 'Tuesday-Wednesday', '10:30:00', '12:00:00'),
(5, 5, 'Object Oriented Programming', 'Thursday-Friday', '13:30:00', '16:00:00'),
(6, 11, 'Networking', 'Monday-Tuesday', '09:00:00', '10:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_initial` varchar(10) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Student','Tutor','Admin') NOT NULL,
  `contact_number` varchar(11) DEFAULT NULL,
  `account_status` varchar(20) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `student_id`, `last_name`, `first_name`, `middle_initial`, `full_name`, `email`, `password`, `role`, `contact_number`, `account_status`) VALUES
(1, NULL, 'Anches', 'Laurenze Aizel', NULL, 'Anches, Laurenz Aizel ', 'laurenz.anches.coc@phinmaed.com', 'tutor123', 'Tutor', NULL, 'Active'),
(2, NULL, 'Asesor', 'Archieliz', NULL, 'Asesor, Archieliz', 'archieliz.asesor.coc@phinmaed.com', 'tutor123', 'Tutor', NULL, 'Active'),
(3, NULL, 'Hernandez', 'Lloyd Aisne', '', 'Hernandez, Lloyd Aisne', 'lloyd.hernandez.coc@phinmaed.com', 'tutor123', 'Tutor', NULL, 'Active'),
(4, NULL, 'Turtosa', 'Fritz Gerald', NULL, 'Turtosa, Fritz Gerald', 'fritz.turtosa.coc@phinmaed.com', 'tutor123', 'Tutor', NULL, 'Active'),
(5, NULL, 'Opiso', 'Irish Muring', NULL, 'Opiso, Irish Muring', 'irish.opiso.coc@phinmaed.com', 'tutor123', 'Tutor', NULL, 'Active'),
(6, '02-2526-000036', 'Agno', 'Joshua Jovan', 'A.', 'Agno, Joshua Jovan A.', 'joan.agno.coc@phinmaed.com', 'agno123', 'Student', '09557180589', 'Active'),
(7, '02-2526-000035', 'Santan', 'Christian James', 'A.', 'Santan, Christian James A. ', 'chag.santan.coc@phinmaed.com', 'Santan@123', 'Student', '09915701618', 'Active'),
(8, '02-2526-000038', 'Balacuit', 'Clint John', 'M.', 'Balacuit, Clint John M.', 'clma.balacuit.coc@phinmaed.com', 'balacuit123', 'Student', '09984500145', 'Active'),
(9, '02-2526-000034', 'Lupiba', 'Chazzylle', 'L.', 'Lupiba, Chazzylle L.', 'chla.lupiba.coc@phinmaed.com', 'Lupiba@123', 'Student', '09051762641', 'Active'),
(10, 'ADMIN001', 'Admin', 'System', '', 'System Admin', 'admin@cite.edu', 'admin123', 'Admin', NULL, 'Active'),
(11, NULL, 'Dela Cruz', 'Michael', '', 'Dela Cruz, Michael', 'michael.delacruz.coc@phinmaed.com', 'Delacruz@123', 'Tutor', NULL, 'Inactive');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `tutor_id` (`tutor_id`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tutors`
--
ALTER TABLE `tutors`
  MODIFY `tutor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`tutor_id`);

--
-- Constraints for table `tutors`
--
ALTER TABLE `tutors`
  ADD CONSTRAINT `tutors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
