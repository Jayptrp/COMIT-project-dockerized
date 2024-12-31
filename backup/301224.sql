-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 07:01 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `d67g7`
--
CREATE DATABASE IF NOT EXISTS `d67g7` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `d67g7`;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `ad_name` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `days` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `name`, `days`, `agency_id`, `station_id`) VALUES
(1, 'Hi', 10, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE `agencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`id`, `name`, `phone`) VALUES
(2, 'hooho', '192'),
(3, 'hihi', '3336');

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` int(11) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `agency_name`, `phone_number`) VALUES
(3, 'IE', '01111111'),
(4, 'CU', '022222222');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(5, 'Gunkan'),
(3, 'Maki'),
(1, 'Nigiri'),
(6, 'Roll'),
(2, 'Sashimi'),
(4, 'Temaki');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` enum('Emergency','Urgent','Normal') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `priority`, `created_at`) VALUES
(15, 'Computer', 'Emergency', '2024-12-12 16:35:37'),
(16, 'Plumber', 'Emergency', '2024-12-12 16:35:37'),
(17, 'Air-conditioner', 'Urgent', '2024-12-12 16:35:37'),
(18, 'Electricity Outage', 'Emergency', '2024-12-12 16:35:37'),
(19, 'Internet Issue', 'Urgent', '2024-12-12 16:35:37'),
(20, 'Water Leakage', 'Emergency', '2024-12-12 16:35:37'),
(21, 'Door Lock Issue', 'Urgent', '2024-12-12 16:35:37'),
(22, 'Furniture Repair', 'Normal', '2024-12-12 16:35:37'),
(23, 'Cleaning Service Request', 'Normal', '2024-12-12 16:35:37'),
(24, 'Pest Control', 'Urgent', '2024-12-12 16:35:37'),
(25, 'Fire Alarm Malfunction', 'Emergency', '2024-12-12 16:35:37'),
(26, 'Elevator Not Working', 'Emergency', '2024-12-12 16:35:37'),
(27, 'Heating System Issue', 'Urgent', '2024-12-12 16:35:37'),
(28, 'Lighting Replacement', 'Normal', '2024-12-12 16:35:37'),
(29, 'Parking Lot Complaint', 'Normal', '2024-12-12 16:35:37'),
(30, 'Other Issue', 'Normal', '2024-12-13 16:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `com_id` int(11) NOT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_detail` varchar(2000) DEFAULT NULL,
  `com_status` varchar(200) NOT NULL,
  `com_level` enum('Normal','Urgent','Emergency') DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `com_time` varchar(100) NOT NULL,
  `dep_code` varchar(3) NOT NULL,
  `com_type` varchar(100) DEFAULT 'Other',
  `com_update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`com_id`, `com_name`, `com_detail`, `com_status`, `com_level`, `emp_id`, `com_time`, `dep_code`, `com_type`, `com_update_time`) VALUES
(49, 'Complaint1', 'This complaint created by technician Nine.', 'In-Progress', 'Emergency', 501, '2024-11-18 20:06:28', 'ENG', 'Other', '2024-12-13 11:37:06'),
(52, 'Noisy worker', 'kwang and arm always yelling at each other', 'In-Progress', 'Normal', 601, '2024-11-18 22:08:01', 'HR', 'Other', '2024-12-13 11:28:07'),
(57, 'Complaint2', 'this complaint can edit only by Jay.', 'In-Progress', 'Urgent', 500, '2024-11-18 22:39:08', 'ENG', 'Other', NULL),
(58, 'John Smith', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Completed', 'Normal', 101, '2024-11-19 07:23:21', 'ENG', 'Other', NULL),
(63, 'com pang', 'at hong com', 'Completed', 'Normal', 101, '2024-11-19 14:52:48', 'ENG', 'Other', NULL),
(64, 'Virus invade computer', 'Virus invade computer GG ^-^', 'Waiting', 'Normal', 101, '2024-11-19 17:02:46', 'ENG', 'Software/Hardware', NULL),
(70, 'generator', 'gen', 'Completed', 'Normal', 101, '2024-11-21 03:09:47', 'ENG', 'Facility', NULL),
(73, 'hhh', 'jjjj', 'Waiting', 'Normal', 999, '2024-11-21 03:37:28', 'ENG', 'Electrical', NULL),
(74, 'lll', 'yukuyk', 'Completed', 'Normal', 999, '2024-11-21 03:37:42', 'ENG', 'Facility', '2024-12-13 11:33:43'),
(80, 'sss', 'ggg', 'Completed', 'Normal', 602, '2024-12-11 15:42:31', 'HR', 'Other', NULL),
(81, 'Air conditioner', 'air con at 20*c feel like hell', 'In-Progress', 'Urgent', 999, '2024-12-12 17:24:47', 'ENG', '', NULL),
(82, 'Computer Floor 5', 'computer broken due to my low skill in  eating while diving da intanet cafe at the night time chill chill liiw liiw', 'Completed', 'Normal', 999, '2024-12-12 17:26:55', 'ENG', 'Emergency', '2024-12-13 11:51:13'),
(105, 'ddd', 'dddd', 'Completed', 'Normal', 501, '2024-12-13 10:34:18', 'ENG', 'Emergency', '2024-12-13 10:34:27'),
(106, 'System Crash', 'The computer system crashed unexpectedly.', 'Completed', 'Normal', 101, '2024-01-15 10:23:00', 'ENG', 'Other', NULL),
(107, 'Network Down', 'The office network is completely down.', 'Completed', 'Urgent', 101, '2024-02-10 14:00:00', 'ENG', 'Other', NULL),
(108, 'Power Outage', 'No power in the server room.', 'Completed', 'Emergency', 101, '2024-03-05 09:00:00', 'ENG', 'Other', NULL),
(109, 'Printer Jam', 'The main printer is jammed.', 'Completed', 'Normal', 101, '2024-01-20 16:45:00', 'ENG', 'Other', NULL),
(110, 'Overheating Issue', 'The HVAC system is overheating.', 'Completed', 'Urgent', 101, '2024-02-28 08:15:00', 'ENG', 'Other', NULL),
(111, 'Data Loss', 'Critical files have been deleted accidentally.', 'Completed', 'Emergency', 101, '2024-03-15 14:30:00', 'ENG', 'Other', NULL),
(112, 'Database Error', 'Unable to connect to the company database.', 'Completed', 'Normal', 101, '2024-04-10 11:00:00', 'ENG', 'Other', NULL),
(113, 'Software Update', 'Issues encountered during software updates.', 'Completed', 'Urgent', 101, '2024-04-25 10:15:00', 'ENG', 'Other', NULL),
(114, 'Cooling Failure', 'The server cooling system has failed.', 'Completed', 'Emergency', 101, '2024-05-03 14:00:00', 'ENG', 'Other', NULL),
(115, 'Broken Monitor', 'One of the monitors in the office is broken.', 'Completed', 'Normal', 101, '2024-05-20 09:45:00', 'ENG', 'Other', NULL),
(116, 'Firewall Issue', 'Firewall rules are causing disruptions.', 'Completed', 'Urgent', 101, '2024-06-12 13:30:00', 'ENG', 'Other', NULL),
(117, 'Overloaded Circuit', 'Electrical circuits are overloaded.', 'Completed', 'Emergency', 101, '2024-06-25 08:00:00', 'ENG', 'Other', NULL),
(118, 'Slow Internet', 'Internet speed is significantly reduced.', 'Completed', 'Normal', 101, '2024-07-18 15:15:00', 'ENG', 'Other', NULL),
(119, 'Server Maintenance', 'Scheduled maintenance is overdue.', 'Completed', 'Urgent', 101, '2024-07-25 10:30:00', 'ENG', 'Other', NULL),
(120, 'Water Leak', 'Water leakage near the electrical system.', 'Completed', 'Emergency', 101, '2024-08-05 09:15:00', 'ENG', 'Other', NULL),
(121, 'Access Denied', 'Employees are unable to access secure areas.', 'Completed', 'Normal', 101, '2024-08-15 14:45:00', 'ENG', 'Other', NULL),
(122, 'Malware Detection', 'Malware detected on one of the systems.', 'Completed', 'Urgent', 101, '2024-09-08 13:00:00', 'ENG', 'Other', NULL),
(123, 'Battery Failure', 'UPS batteries are not functioning.', 'Completed', 'Emergency', 101, '2024-09-20 08:30:00', 'ENG', 'Other', NULL),
(124, 'Keyboard Malfunction', 'Office keyboards are not responding.', 'Completed', 'Normal', 101, '2024-10-10 15:45:00', 'ENG', 'Other', NULL),
(125, 'Application Crash', 'Critical application crashes frequently.', 'Completed', 'Urgent', 101, '2024-10-25 11:15:00', 'ENG', 'Other', NULL),
(126, 'Backup Failure', 'Scheduled backups are failing.', 'In-Progress', 'Emergency', 101, '2024-11-05 09:00:00', 'ENG', 'Other', NULL),
(127, 'Cable Damage', 'Network cables are physically damaged.', 'In-Progress', 'Normal', 101, '2024-11-20 14:15:00', 'ENG', 'Other', NULL),
(128, 'Unauthorized Access', 'Attempts of unauthorized access detected.', 'Completed', 'Urgent', 101, '2024-12-12 10:30:00', 'ENG', 'Other', NULL),
(130, 'Software Bug', 'Bug causing delays in processing tasks.', 'Completed', 'Normal', 101, '2024-01-10 08:15:00', 'ENG', 'Other', NULL),
(131, 'Device Overload', 'Multiple devices causing power surge.', 'Completed', 'Urgent', 101, '2024-02-14 09:30:00', 'ENG', 'Other', NULL),
(132, 'Outdated System', 'A system update is long overdue.', 'Completed', 'Normal', 101, '2024-03-18 11:45:00', 'ENG', 'Other', NULL),
(133, 'Unauthorized Software', 'Unapproved software detected.', 'Completed', 'Urgent', 101, '2024-04-01 10:15:00', 'ENG', 'Other', NULL),
(134, 'Server Reboot', 'Unexpected server reboots reported.', 'Completed', 'Emergency', 101, '2024-05-11 14:00:00', 'ENG', 'Other', NULL),
(135, 'High Latency', 'Network latency higher than usual.', 'Completed', 'Normal', 101, '2024-06-19 16:30:00', 'ENG', 'Other', NULL),
(136, 'Broken Chair', 'Office chair broken near workstation.', 'Completed', 'Normal', 101, '2024-07-06 08:15:00', 'ENG', 'Other', NULL),
(137, 'Package Delay', 'Important package has been delayed.', 'Completed', 'Urgent', 101, '2024-08-12 12:00:00', 'ENG', 'Other', NULL),
(138, 'Code Compile Issue', 'Code not compiling on CI server.', 'Completed', 'Emergency', 101, '2024-09-22 15:45:00', 'ENG', 'Other', NULL),
(139, 'Account Lockout', 'Employee accounts locked out.', 'Completed', 'Urgent', 101, '2024-10-15 09:00:00', 'ENG', 'Other', NULL),
(140, 'Network Bottleneck', 'Network bottleneck affecting workflow.', 'In-Progress', 'Normal', 101, '2024-11-03 14:00:00', 'ENG', 'Other', NULL),
(141, 'Database Timeout', 'Frequent timeouts during database queries.', 'Completed', 'Urgent', 101, '2024-12-07 11:15:00', 'ENG', 'Other', '2024-12-13 11:50:17'),
(142, 'Application Hang', 'Applications frequently hanging on load.', 'Completed', 'Normal', 101, '2024-01-22 10:30:00', 'ENG', 'Other', NULL),
(143, 'Power Surge', 'Sudden power surge in the building.', 'Completed', 'Emergency', 101, '2024-02-05 13:00:00', 'ENG', 'Other', NULL),
(144, 'Unresponsive System', 'Office system not responding.', 'Completed', 'Urgent', 101, '2024-03-11 14:30:00', 'ENG', 'Other', NULL),
(145, 'VPN Connectivity', 'Issues connecting to company VPN.', 'Completed', 'Normal', 101, '2024-04-19 09:15:00', 'ENG', 'Other', NULL),
(146, 'File Corruption', 'Key files have been corrupted.', 'Completed', 'Emergency', 101, '2024-05-30 15:30:00', 'ENG', 'Other', NULL),
(147, 'Lost Credentials', 'Employee lost access credentials.', 'Completed', 'Urgent', 101, '2024-06-01 11:00:00', 'ENG', 'Other', NULL),
(148, 'System Freeze', 'Systems freezing during operations.', 'Completed', 'Normal', 101, '2024-07-08 08:45:00', 'ENG', 'Other', NULL),
(149, 'Unauthorized Devices', 'Unauthorized devices connected to network.', 'Completed', 'Urgent', 101, '2024-08-23 14:15:00', 'ENG', 'Other', NULL),
(150, 'Cooling Unit Leak', 'Cooling unit leaking refrigerant.', 'Completed', 'Emergency', 101, '2024-09-28 13:00:00', 'ENG', 'Other', NULL),
(151, 'Desktop Crash', 'Employee desktops crashing randomly.', 'Completed', 'Urgent', 101, '2024-10-02 10:00:00', 'ENG', 'Other', NULL),
(152, 'Missed Deadline', 'Project deadlines missed due to delays.', 'In-Progress', 'Normal', 101, '2024-11-14 16:15:00', 'ENG', 'Other', NULL),
(154, 'Firewall Block', 'Critical applications blocked by firewall.', 'Completed', 'Normal', 101, '2024-01-05 09:15:00', 'ENG', 'Other', NULL),
(155, 'Device Connection Issue', 'Devices unable to connect to the network.', 'Completed', 'Urgent', 101, '2024-02-18 11:30:00', 'ENG', 'Other', NULL),
(156, 'Unauthorized Uploads', 'Unauthorized file uploads detected.', 'Completed', 'Normal', 101, '2024-03-25 10:45:00', 'ENG', 'Other', NULL),
(157, 'Application Downtime', 'Applications unavailable for long durations.', 'Completed', 'Urgent', 101, '2024-04-29 12:15:00', 'ENG', 'Other', NULL),
(158, 'Data Center Failure', 'Complete failure at the data center.', 'Completed', 'Emergency', 101, '2024-05-18 14:00:00', 'ENG', 'Other', NULL),
(159, 'Email Delays', 'Company emails experiencing significant delays.', 'Completed', 'Normal', 101, '2024-06-15 10:30:00', 'ENG', 'Other', NULL),
(160, 'Misconfigured Settings', 'Critical settings misconfigured in systems.', 'Completed', 'Urgent', 101, '2024-07-21 13:45:00', 'ENG', 'Other', NULL),
(161, 'sss', 'à¸«à¸«à¸«', 'Completed', 'Normal', 501, '2024-12-13 11:50:39', 'ENG', 'Emergency', '2024-12-13 11:50:52'),
(162, 'fff', 'fff', 'Completed', 'Normal', 1007, '2024-12-13 11:52:23', 'HR', 'Emergency', '2024-12-13 11:52:54'),
(163, '1212', '1212', 'Completed', 'Normal', 1007, '2024-12-13 11:56:50', 'HR', 'Emergency', NULL),
(164, 'kkk', 'jkkk', 'Completed', 'Emergency', 602, '2024-12-13 11:58:43', 'HR', 'Normal', NULL),
(165, 'sss', '1212', 'Completed', 'Normal', 1007, '2024-12-13 12:02:23', 'HR', 'Emergency', NULL),
(166, 'sss', 'wwww', 'Completed', 'Normal', 1007, '2024-12-13 12:03:24', 'HR', 'Emergency', NULL),
(167, 'jjcccc', 'ccccc', 'Completed', 'Normal', 1007, '2024-12-13 12:03:37', 'HR', 'Emergency', NULL),
(168, 'jjcccc', 'ccccc', 'Completed', 'Normal', 1007, '2024-12-13 12:03:38', 'HR', 'Emergency', NULL),
(169, 'ddkkk', 'llll', 'In-Progress', 'Normal', 1007, '2024-12-13 12:06:22', 'HR', 'Emergency', NULL),
(170, 'him', 'him', 'Waiting', 'Normal', 1007, '2024-12-13 12:07:44', 'HR', 'Emergency', NULL),
(171, 'sss', 'sssss', 'Waiting', 'Normal', 1007, '2024-12-13 12:09:43', 'HR', 'Emergency', NULL),
(172, 'ggggg', 'gggggg', 'Waiting', 'Normal', 1007, '2024-12-13 12:10:20', 'HR', 'Emergency', NULL),
(173, 'ggggg', 'gggggg', 'Waiting', 'Normal', 1007, '2024-12-13 12:10:22', 'HR', 'Emergency', NULL),
(174, 'ddd', 'dddd', 'In-Progress', 'Normal', 1007, '2024-12-13 12:11:47', 'HR', 'Emergency', NULL),
(175, 'Computer Floor 6', 'activate self-destruction', 'Waiting', 'Normal', 999, '2024-12-13 12:17:03', 'ENG', 'Emergency', NULL),
(176, 'à¸„à¸­à¸¡à¸„à¹‰à¸²à¸‡à¸‡à¸‡', 'à¸„à¹‰à¸²à¸‡à¸—à¸µà¹ˆà¸à¸¥à¸²à¸‡à¹ƒà¸ˆà¹€à¸—à¸­', 'Waiting', 'Normal', 101, '2024-12-13 12:19:12', 'ENG', 'Emergency', NULL),
(177, 'Computer Floor 6', 'self-destruciton', 'Waiting', 'Emergency', 999, '2024-12-13 12:20:08', 'ENG', '', NULL),
(178, 'test u', '', 'Waiting', 'Urgent', 999, '2024-12-13 12:22:20', 'ENG', '', NULL),
(179, 'My chair 2-11', 'My chari si broken oleas eheojlp  me', 'Waiting', 'Normal', 999, '2024-12-13 12:24:15', 'ENG', 'Furniture Repair', NULL),
(180, 'JayJay', 'Jay rage', 'In-Progress', 'Urgent', 500, '2024-12-13 12:27:04', 'ENG', 'Pest Control', NULL),
(181, 'tw\\est1', 'test1', 'Waiting', 'Emergency', 602, '2024-12-13 12:27:05', 'HR', 'Computer', NULL),
(182, '123', '12121121212', 'Completed', 'Emergency', 501, '2024-12-13 12:28:25', 'ENG', 'Computer', NULL),
(183, 'test112', 'wwwww', 'Waiting', 'Normal', 501, '2024-12-13 12:29:35', 'ENG', 'Emergency', NULL),
(184, 'twest22', 'ee', 'Waiting', 'Emergency', 501, '2024-12-13 12:30:25', 'ENG', 'Computer', NULL),
(185, 'tetete', 'eee', 'Waiting', 'Emergency', 501, '2024-12-13 12:39:04', 'ENG', 'Computer', NULL),
(186, 'à¹à¹à¹', 'à¹à¹', 'Waiting', 'Emergency', 501, '2024-12-13 12:40:25', 'ENG', 'Computer', NULL),
(187, 'à¹à¹', 'à¹à¹', 'Waiting', 'Emergency', 501, '2024-12-13 12:40:35', 'ENG', 'Computer', NULL),
(188, 'mbkombk', 'bijbijbi', 'Waiting', 'Emergency', 501, '2024-12-13 12:43:50', 'ENG', 'Computer', NULL),
(189, 'test3', 'test3', 'Completed', 'Emergency', 501, '2024-12-13 12:45:24', 'ENG', 'Computer', NULL),
(190, 'à¹€à¹€à¹€à¹€à¹€à¹€', 'à¹€à¹€à¹€à¹€à¹€', 'Waiting', 'Emergency', 501, '2024-12-13 12:58:25', 'ENG', 'Computer', NULL),
(191, 'huhuhu', 'hahahah', 'Completed', 'Emergency', 501, '2024-12-13 13:00:54', 'ENG', 'Computer', NULL),
(192, 'ssskkkk', 'kfofoof', 'Completed', 'Emergency', 602, '2024-12-13 13:07:23', 'HR', 'Computer', NULL),
(193, 'ffff', 'fffff', 'Completed', 'Emergency', 121, '2024-12-13 13:10:38', 'ENG', 'Computer', NULL),
(194, 'himimimi', 'jnjnjnj', 'Waiting', 'Emergency', 602, '2024-12-13 13:24:08', 'HR', 'Computer', NULL),
(195, 'ssstestetstetstet', 'ddddd', 'Completed', 'Normal', 602, '2024-12-13 13:31:40', 'HR', 'Parking Lot Complaint', NULL),
(196, 'ddd', 'ddfd', 'Waiting', 'Emergency', 602, '2024-12-13 13:32:13', 'HR', 'Elevator Not Working', NULL),
(197, 'ff', 'fff', 'Waiting', 'Emergency', 602, '2024-12-13 13:32:38', 'HR', 'Water Leakage', NULL),
(198, 'ffff4ed4d', 'ffffff', 'Waiting', 'Urgent', 602, '2024-12-13 13:32:57', 'HR', 'Door Lock Issue', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dep_code` varchar(3) NOT NULL,
  `dep_name` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dep_code`, `dep_name`) VALUES
('ENG', 'Engineering'),
('FIN', 'Finance'),
('HR', 'Human Resources'),
('MKT', 'Marketing'),
('S', 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(300) NOT NULL,
  `emp_password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `dep_code` varchar(3) NOT NULL,
  `emp_pfp` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_password`, `role_id`, `dep_code`, `emp_pfp`) VALUES
(101, 'John Smith', '123', 3, 'ENG', 'uploads/profile_pictures/101_profile_picture'),
(121, 'hh', '123', 5, 'ENG', NULL),
(123, 'Lucas Wright', '123', 1, 'MKT', NULL),
(124, 'Ella Perez', '123', 1, 'MKT', NULL),
(128, 'Luna Mitchell', '123', 4, 'S', NULL),
(130, 'Zoe Collins', '123', 3, 'S', NULL),
(191, 'hh', '123', 1, 'ENG', NULL),
(500, 'Jay', '1234', 1, 'ENG', 'uploads/profile_pictures/500_profile_picture'),
(501, 'Nine', '123', 2, 'ENG', 'uploads/profile_pictures/501_profile_picture'),
(601, 'Pann', '123', 3, 'HR', 'uploads/profile_pictures/601_profile_picture'),
(602, 'Him', '123', 4, 'HR', 'uploads/profile_pictures/602_profile_picture'),
(701, 'Arm', '123', 5, 'S', 'uploads/profile_pictures/701_profile_picture'),
(702, 'kwang', '321', 6, 'S', 'uploads/profile_pictures/702_profile_picture'),
(999, 'Admin', '123', 0, 'ENG', 'uploads/profile_pictures/999_profile_picture'),
(1000, 'hhh', '1212', 1, 'HR', NULL),
(1001, 'John S', '12121', 1, 'ENG', NULL),
(1002, 'kk', '121212', 1, 'ENG', NULL),
(1003, 'Kwangthy', '190404', 1, 'HR', NULL),
(1004, 'AddUser', '123', 1, 'ENG', NULL),
(1005, 'Christmas', '123', 1, 'HR', NULL),
(1006, 'hh12', '12', 5, 'HR', NULL),
(1007, 'gg', '12', 1, 'HR', NULL),
(1008, 'himhim', '12', 1, 'HR', NULL),
(1009, 'hihihi', '12', 3, 'HR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `com_id` int(11) NOT NULL,
  `notification_time` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `message`, `role_id`, `emp_id`, `com_id`, `notification_time`, `is_read`) VALUES
(1, 'New complaint \'dd\' added with priority Emergency.', NULL, 101, 102, '2024-12-13 16:29:19', 0),
(2, 'New complaint \'dd\' added with priority Emergency.', NULL, 121, 102, '2024-12-13 16:29:19', 0),
(3, 'New complaint \'dd\' added with priority Emergency.', NULL, 191, 102, '2024-12-13 16:29:19', 0),
(4, 'New complaint \'dd\' added with priority Emergency.', NULL, 500, 102, '2024-12-13 16:29:19', 0),
(5, 'New complaint \'dd\' added with priority Emergency.', NULL, 501, 102, '2024-12-13 16:29:20', 0),
(6, 'New complaint \'dd\' added with priority Emergency.', NULL, 999, 102, '2024-12-13 16:29:20', 0),
(7, 'New complaint \'dd\' added with priority Emergency.', NULL, 1001, 102, '2024-12-13 16:29:20', 0),
(8, 'New complaint \'dd\' added with priority Emergency.', NULL, 1002, 102, '2024-12-13 16:29:20', 0),
(9, 'New complaint \'dd\' added with priority Emergency.', NULL, 1004, 102, '2024-12-13 16:29:20', 0),
(10, 'New complaint \'dd\' added with priority Emergency.', NULL, 101, 103, '2024-12-13 16:29:20', 0),
(11, 'New complaint \'dd\' added with priority Emergency.', NULL, 121, 103, '2024-12-13 16:29:20', 0),
(12, 'New complaint \'dd\' added with priority Emergency.', NULL, 191, 103, '2024-12-13 16:29:20', 0),
(13, 'New complaint \'dd\' added with priority Emergency.', NULL, 500, 103, '2024-12-13 16:29:20', 0),
(14, 'New complaint \'dd\' added with priority Emergency.', NULL, 501, 103, '2024-12-13 16:29:20', 0),
(15, 'New complaint \'dd\' added with priority Emergency.', NULL, 999, 103, '2024-12-13 16:29:20', 0),
(16, 'New complaint \'dd\' added with priority Emergency.', NULL, 1001, 103, '2024-12-13 16:29:20', 0),
(17, 'New complaint \'dd\' added with priority Emergency.', NULL, 1002, 103, '2024-12-13 16:29:20', 0),
(18, 'New complaint \'dd\' added with priority Emergency.', NULL, 1004, 103, '2024-12-13 16:29:20', 0),
(19, 'New complaint \'sss\' added with priority Emergency.', NULL, 101, 104, '2024-12-13 16:29:34', 0),
(20, 'New complaint \'sss\' added with priority Emergency.', NULL, 121, 104, '2024-12-13 16:29:34', 0),
(21, 'New complaint \'sss\' added with priority Emergency.', NULL, 191, 104, '2024-12-13 16:29:34', 0),
(22, 'New complaint \'sss\' added with priority Emergency.', NULL, 500, 104, '2024-12-13 16:29:35', 0),
(23, 'New complaint \'sss\' added with priority Emergency.', NULL, 501, 104, '2024-12-13 16:29:35', 1),
(24, 'New complaint \'sss\' added with priority Emergency.', NULL, 999, 104, '2024-12-13 16:29:35', 0),
(25, 'New complaint \'sss\' added with priority Emergency.', NULL, 1001, 104, '2024-12-13 16:29:35', 0),
(26, 'New complaint \'sss\' added with priority Emergency.', NULL, 1002, 104, '2024-12-13 16:29:35', 0),
(27, 'New complaint \'sss\' added with priority Emergency.', NULL, 1004, 104, '2024-12-13 16:29:35', 0),
(28, 'New complaint \'ddd\' added with priority Emergency.', NULL, 101, 105, '2024-12-13 16:34:18', 0),
(29, 'New complaint \'ddd\' added with priority Emergency.', NULL, 121, 105, '2024-12-13 16:34:18', 0),
(30, 'New complaint \'ddd\' added with priority Emergency.', NULL, 191, 105, '2024-12-13 16:34:18', 0),
(31, 'New complaint \'ddd\' added with priority Emergency.', NULL, 500, 105, '2024-12-13 16:34:18', 0),
(32, 'New complaint \'ddd\' added with priority Emergency.', NULL, 501, 105, '2024-12-13 16:34:18', 0),
(33, 'New complaint \'ddd\' added with priority Emergency.', NULL, 999, 105, '2024-12-13 16:34:18', 1),
(34, 'New complaint \'ddd\' added with priority Emergency.', NULL, 1001, 105, '2024-12-13 16:34:18', 0),
(35, 'New complaint \'ddd\' added with priority Emergency.', NULL, 1002, 105, '2024-12-13 16:34:18', 0),
(36, 'New complaint \'ddd\' added with priority Emergency.', NULL, 1004, 105, '2024-12-13 16:34:18', 0),
(37, 'New complaint \'sss\' added with priority Emergency.', NULL, 101, 161, '2024-12-13 17:50:39', 0),
(38, 'New complaint \'sss\' added with priority Emergency.', NULL, 121, 161, '2024-12-13 17:50:39', 0),
(39, 'New complaint \'sss\' added with priority Emergency.', NULL, 191, 161, '2024-12-13 17:50:39', 0),
(40, 'New complaint \'sss\' added with priority Emergency.', NULL, 500, 161, '2024-12-13 17:50:39', 0),
(41, 'New complaint \'sss\' added with priority Emergency.', NULL, 501, 161, '2024-12-13 17:50:39', 0),
(42, 'New complaint \'sss\' added with priority Emergency.', NULL, 999, 161, '2024-12-13 17:50:39', 1),
(43, 'New complaint \'sss\' added with priority Emergency.', NULL, 1001, 161, '2024-12-13 17:50:39', 0),
(44, 'New complaint \'sss\' added with priority Emergency.', NULL, 1002, 161, '2024-12-13 17:50:40', 0),
(45, 'New complaint \'sss\' added with priority Emergency.', NULL, 1004, 161, '2024-12-13 17:50:40', 0),
(46, 'New complaint \'fff\' added with priority Emergency.', NULL, 101, 162, '2024-12-13 17:52:23', 0),
(47, 'New complaint \'fff\' added with priority Emergency.', NULL, 121, 162, '2024-12-13 17:52:23', 0),
(48, 'New complaint \'fff\' added with priority Emergency.', NULL, 191, 162, '2024-12-13 17:52:23', 0),
(49, 'New complaint \'fff\' added with priority Emergency.', NULL, 500, 162, '2024-12-13 17:52:23', 0),
(50, 'New complaint \'fff\' added with priority Emergency.', NULL, 501, 162, '2024-12-13 17:52:24', 0),
(51, 'New complaint \'fff\' added with priority Emergency.', NULL, 999, 162, '2024-12-13 17:52:24', 0),
(52, 'New complaint \'fff\' added with priority Emergency.', NULL, 1001, 162, '2024-12-13 17:52:24', 0),
(53, 'New complaint \'fff\' added with priority Emergency.', NULL, 1002, 162, '2024-12-13 17:52:24', 0),
(54, 'New complaint \'fff\' added with priority Emergency.', NULL, 1004, 162, '2024-12-13 17:52:24', 0),
(55, 'New complaint \'1212\' added with priority Emergency.', NULL, 101, 163, '2024-12-13 17:56:50', 0),
(56, 'New complaint \'1212\' added with priority Emergency.', NULL, 121, 163, '2024-12-13 17:56:50', 0),
(57, 'New complaint \'1212\' added with priority Emergency.', NULL, 191, 163, '2024-12-13 17:56:50', 0),
(58, 'New complaint \'1212\' added with priority Emergency.', NULL, 500, 163, '2024-12-13 17:56:50', 0),
(59, 'New complaint \'1212\' added with priority Emergency.', NULL, 501, 163, '2024-12-13 17:56:50', 0),
(60, 'New complaint \'1212\' added with priority Emergency.', NULL, 999, 163, '2024-12-13 17:56:50', 0),
(61, 'New complaint \'1212\' added with priority Emergency.', NULL, 1001, 163, '2024-12-13 17:56:50', 0),
(62, 'New complaint \'1212\' added with priority Emergency.', NULL, 1002, 163, '2024-12-13 17:56:50', 0),
(63, 'New complaint \'1212\' added with priority Emergency.', NULL, 1004, 163, '2024-12-13 17:56:51', 0),
(64, 'New complaint \'kkk\' added with priority Normal.', NULL, 101, 164, '2024-12-13 17:58:43', 0),
(65, 'New complaint \'kkk\' added with priority Normal.', NULL, 121, 164, '2024-12-13 17:58:43', 0),
(66, 'New complaint \'kkk\' added with priority Normal.', NULL, 191, 164, '2024-12-13 17:58:43', 0),
(67, 'New complaint \'kkk\' added with priority Normal.', NULL, 500, 164, '2024-12-13 17:58:43', 0),
(68, 'New complaint \'kkk\' added with priority Normal.', NULL, 501, 164, '2024-12-13 17:58:43', 0),
(69, 'New complaint \'kkk\' added with priority Normal.', NULL, 999, 164, '2024-12-13 17:58:43', 0),
(70, 'New complaint \'kkk\' added with priority Normal.', NULL, 1001, 164, '2024-12-13 17:58:43', 0),
(71, 'New complaint \'kkk\' added with priority Normal.', NULL, 1002, 164, '2024-12-13 17:58:43', 0),
(72, 'New complaint \'kkk\' added with priority Normal.', NULL, 1004, 164, '2024-12-13 17:58:43', 0),
(73, 'New complaint \'sss\' added with priority Emergency.', NULL, 101, 165, '2024-12-13 18:02:23', 0),
(74, 'New complaint \'sss\' added with priority Emergency.', NULL, 121, 165, '2024-12-13 18:02:23', 0),
(75, 'New complaint \'sss\' added with priority Emergency.', NULL, 191, 165, '2024-12-13 18:02:23', 0),
(76, 'New complaint \'sss\' added with priority Emergency.', NULL, 500, 165, '2024-12-13 18:02:23', 0),
(77, 'New complaint \'sss\' added with priority Emergency.', NULL, 501, 165, '2024-12-13 18:02:23', 0),
(78, 'New complaint \'sss\' added with priority Emergency.', NULL, 999, 165, '2024-12-13 18:02:23', 0),
(79, 'New complaint \'sss\' added with priority Emergency.', NULL, 1001, 165, '2024-12-13 18:02:23', 0),
(80, 'New complaint \'sss\' added with priority Emergency.', NULL, 1002, 165, '2024-12-13 18:02:23', 0),
(81, 'New complaint \'sss\' added with priority Emergency.', NULL, 1004, 165, '2024-12-13 18:02:23', 0),
(82, 'New complaint \'sss\' added with priority Emergency.', NULL, 101, 171, '2024-12-13 18:09:43', 0),
(83, 'New complaint \'sss\' added with priority Emergency.', NULL, 121, 171, '2024-12-13 18:09:43', 0),
(84, 'New complaint \'sss\' added with priority Emergency.', NULL, 191, 171, '2024-12-13 18:09:43', 0),
(85, 'New complaint \'sss\' added with priority Emergency.', NULL, 500, 171, '2024-12-13 18:09:43', 0),
(86, 'New complaint \'sss\' added with priority Emergency.', NULL, 501, 171, '2024-12-13 18:09:44', 0),
(87, 'New complaint \'sss\' added with priority Emergency.', NULL, 999, 171, '2024-12-13 18:09:44', 0),
(88, 'New complaint \'sss\' added with priority Emergency.', NULL, 1001, 171, '2024-12-13 18:09:44', 0),
(89, 'New complaint \'sss\' added with priority Emergency.', NULL, 1002, 171, '2024-12-13 18:09:44', 0),
(90, 'New complaint \'sss\' added with priority Emergency.', NULL, 1004, 171, '2024-12-13 18:09:44', 0),
(91, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 101, 172, '2024-12-13 18:10:21', 0),
(92, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 121, 172, '2024-12-13 18:10:21', 0),
(93, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 191, 172, '2024-12-13 18:10:21', 0),
(94, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 500, 172, '2024-12-13 18:10:21', 0),
(95, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 501, 172, '2024-12-13 18:10:21', 0),
(96, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 999, 172, '2024-12-13 18:10:21', 0),
(97, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1001, 172, '2024-12-13 18:10:21', 0),
(98, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1002, 172, '2024-12-13 18:10:21', 0),
(99, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1004, 172, '2024-12-13 18:10:21', 0),
(100, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 101, 173, '2024-12-13 18:10:22', 0),
(101, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 121, 173, '2024-12-13 18:10:22', 0),
(102, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 191, 173, '2024-12-13 18:10:22', 0),
(103, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 500, 173, '2024-12-13 18:10:22', 0),
(104, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 501, 173, '2024-12-13 18:10:22', 0),
(105, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 999, 173, '2024-12-13 18:10:22', 0),
(106, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1001, 173, '2024-12-13 18:10:22', 0),
(107, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1002, 173, '2024-12-13 18:10:22', 0),
(108, 'New complaint \'ggggg\' added with priority Emergency.', NULL, 1004, 173, '2024-12-13 18:10:22', 0),
(109, 'New complaint \'test112\' added with priority Emergency.', NULL, 101, 183, '2024-12-13 18:29:35', 0),
(110, 'New complaint \'test112\' added with priority Emergency.', NULL, 121, 183, '2024-12-13 18:29:35', 0),
(111, 'New complaint \'test112\' added with priority Emergency.', NULL, 191, 183, '2024-12-13 18:29:35', 0),
(112, 'New complaint \'test112\' added with priority Emergency.', NULL, 500, 183, '2024-12-13 18:29:35', 0),
(113, 'New complaint \'test112\' added with priority Emergency.', NULL, 501, 183, '2024-12-13 18:29:35', 1),
(114, 'New complaint \'test112\' added with priority Emergency.', NULL, 999, 183, '2024-12-13 18:29:36', 0),
(115, 'New complaint \'test112\' added with priority Emergency.', NULL, 1001, 183, '2024-12-13 18:29:36', 0),
(116, 'New complaint \'test112\' added with priority Emergency.', NULL, 1002, 183, '2024-12-13 18:29:36', 0),
(117, 'New complaint \'test112\' added with priority Emergency.', NULL, 1004, 183, '2024-12-13 18:29:36', 0),
(118, 'New complaint \'test3\' added with priority Emergency.', NULL, 501, 189, '2024-12-13 18:45:25', 1),
(119, 'New complaint \'test3\' added with priority Emergency.', NULL, 101, 189, '2024-12-13 18:45:25', 0),
(120, 'New complaint \'test3\' added with priority Emergency.', NULL, 130, 189, '2024-12-13 18:45:25', 0),
(121, 'New complaint \'test3\' added with priority Emergency.', NULL, 601, 189, '2024-12-13 18:45:25', 0),
(122, 'New complaint \'test3\' added with priority Emergency.', NULL, 128, 189, '2024-12-13 18:45:25', 0),
(123, 'New complaint \'test3\' added with priority Emergency.', NULL, 602, 189, '2024-12-13 18:45:25', 0),
(124, 'New complaint \'test3\' added with priority Emergency.', NULL, 701, 189, '2024-12-13 18:45:25', 0),
(125, 'New complaint \'test3\' added with priority Emergency.', NULL, 1006, 189, '2024-12-13 18:45:25', 0),
(126, 'New complaint \'test3\' added with priority Emergency.', NULL, 702, 189, '2024-12-13 18:45:25', 0),
(127, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 501, 190, '2024-12-13 18:58:25', 0),
(128, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 101, 190, '2024-12-13 18:58:25', 0),
(129, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 130, 190, '2024-12-13 18:58:25', 0),
(130, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 601, 190, '2024-12-13 18:58:25', 0),
(131, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 128, 190, '2024-12-13 18:58:25', 0),
(132, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 602, 190, '2024-12-13 18:58:25', 0),
(133, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 701, 190, '2024-12-13 18:58:25', 0),
(134, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 1006, 190, '2024-12-13 18:58:25', 0),
(135, 'New complaint \'à¹€à¹€à¹€à¹€à¹€à¹€\' added with priority Emergency.', NULL, 702, 190, '2024-12-13 18:58:25', 0),
(136, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 501, 191, '2024-12-13 19:00:55', 0),
(137, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 101, 191, '2024-12-13 19:00:55', 0),
(138, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 130, 191, '2024-12-13 19:00:55', 0),
(139, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 601, 191, '2024-12-13 19:00:55', 0),
(140, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 128, 191, '2024-12-13 19:00:55', 0),
(141, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 602, 191, '2024-12-13 19:00:55', 0),
(142, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 701, 191, '2024-12-13 19:00:55', 0),
(143, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 1006, 191, '2024-12-13 19:00:55', 0),
(144, 'New complaint \'huhuhu\' added with priority Emergency.', NULL, 702, 191, '2024-12-13 19:00:55', 0),
(145, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 501, 192, '2024-12-13 19:07:23', 0),
(146, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 101, 192, '2024-12-13 19:07:23', 0),
(147, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 130, 192, '2024-12-13 19:07:23', 0),
(148, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 601, 192, '2024-12-13 19:07:23', 0),
(149, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 1009, 192, '2024-12-13 19:07:23', 0),
(150, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 128, 192, '2024-12-13 19:07:24', 0),
(151, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 602, 192, '2024-12-13 19:07:24', 0),
(152, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 121, 192, '2024-12-13 19:07:24', 0),
(153, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 701, 192, '2024-12-13 19:07:24', 0),
(154, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 1006, 192, '2024-12-13 19:07:24', 0),
(155, 'New complaint \'ssskkkk\' added with priority Emergency.', NULL, 702, 192, '2024-12-13 19:07:24', 0),
(156, 'New complaint \'ffff\' added with priority Emergency.', NULL, 501, 193, '2024-12-13 19:10:38', 0),
(157, 'New complaint \'ffff\' added with priority Emergency.', NULL, 101, 193, '2024-12-13 19:10:38', 0),
(158, 'New complaint \'ffff\' added with priority Emergency.', NULL, 130, 193, '2024-12-13 19:10:38', 0),
(159, 'New complaint \'ffff\' added with priority Emergency.', NULL, 601, 193, '2024-12-13 19:10:38', 0),
(160, 'New complaint \'ffff\' added with priority Emergency.', NULL, 1009, 193, '2024-12-13 19:10:38', 0),
(161, 'New complaint \'ffff\' added with priority Emergency.', NULL, 128, 193, '2024-12-13 19:10:38', 0),
(162, 'New complaint \'ffff\' added with priority Emergency.', NULL, 602, 193, '2024-12-13 19:10:38', 0),
(163, 'New complaint \'ffff\' added with priority Emergency.', NULL, 121, 193, '2024-12-13 19:10:39', 0),
(164, 'New complaint \'ffff\' added with priority Emergency.', NULL, 701, 193, '2024-12-13 19:10:39', 0),
(165, 'New complaint \'ffff\' added with priority Emergency.', NULL, 1006, 193, '2024-12-13 19:10:39', 0),
(166, 'New complaint \'ffff\' added with priority Emergency.', NULL, 702, 193, '2024-12-13 19:10:39', 0),
(167, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 501, 194, '2024-12-13 19:24:08', 0),
(168, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 101, 194, '2024-12-13 19:24:08', 0),
(169, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 130, 194, '2024-12-13 19:24:09', 0),
(170, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 601, 194, '2024-12-13 19:24:09', 0),
(171, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 1009, 194, '2024-12-13 19:24:09', 0),
(172, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 128, 194, '2024-12-13 19:24:09', 0),
(173, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 602, 194, '2024-12-13 19:24:09', 1),
(174, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 121, 194, '2024-12-13 19:24:09', 0),
(175, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 701, 194, '2024-12-13 19:24:09', 0),
(176, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 1006, 194, '2024-12-13 19:24:09', 0),
(177, 'New complaint \'himimimi\' added with priority Emergency.', NULL, 702, 194, '2024-12-13 19:24:09', 0),
(178, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 501, 195, '2024-12-13 19:31:40', 0),
(179, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 101, 195, '2024-12-13 19:31:40', 0),
(180, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 130, 195, '2024-12-13 19:31:40', 0),
(181, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 601, 195, '2024-12-13 19:31:40', 0),
(182, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 1009, 195, '2024-12-13 19:31:40', 0),
(183, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 128, 195, '2024-12-13 19:31:40', 0),
(184, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 602, 195, '2024-12-13 19:31:40', 0),
(185, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 121, 195, '2024-12-13 19:31:40', 0),
(186, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 701, 195, '2024-12-13 19:31:40', 0),
(187, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 1006, 195, '2024-12-13 19:31:40', 0),
(188, 'New complaint \'ssstestetstetstet\' added with priority Normal.', NULL, 702, 195, '2024-12-13 19:31:40', 0),
(189, 'New complaint \'ddd\' added with priority Emergency.', NULL, 501, 196, '2024-12-13 19:32:13', 0),
(190, 'New complaint \'ddd\' added with priority Emergency.', NULL, 101, 196, '2024-12-13 19:32:13', 0),
(191, 'New complaint \'ddd\' added with priority Emergency.', NULL, 130, 196, '2024-12-13 19:32:13', 0),
(192, 'New complaint \'ddd\' added with priority Emergency.', NULL, 601, 196, '2024-12-13 19:32:13', 0),
(193, 'New complaint \'ddd\' added with priority Emergency.', NULL, 1009, 196, '2024-12-13 19:32:13', 0),
(194, 'New complaint \'ddd\' added with priority Emergency.', NULL, 128, 196, '2024-12-13 19:32:13', 0),
(195, 'New complaint \'ddd\' added with priority Emergency.', NULL, 602, 196, '2024-12-13 19:32:14', 0),
(196, 'New complaint \'ddd\' added with priority Emergency.', NULL, 121, 196, '2024-12-13 19:32:14', 0),
(197, 'New complaint \'ddd\' added with priority Emergency.', NULL, 701, 196, '2024-12-13 19:32:14', 0),
(198, 'New complaint \'ddd\' added with priority Emergency.', NULL, 1006, 196, '2024-12-13 19:32:14', 0),
(199, 'New complaint \'ddd\' added with priority Emergency.', NULL, 702, 196, '2024-12-13 19:32:14', 0),
(200, 'New complaint \'ff\' added with priority Emergency.', NULL, 501, 197, '2024-12-13 19:32:38', 0),
(201, 'New complaint \'ff\' added with priority Emergency.', NULL, 101, 197, '2024-12-13 19:32:38', 0),
(202, 'New complaint \'ff\' added with priority Emergency.', NULL, 130, 197, '2024-12-13 19:32:38', 0),
(203, 'New complaint \'ff\' added with priority Emergency.', NULL, 601, 197, '2024-12-13 19:32:38', 0),
(204, 'New complaint \'ff\' added with priority Emergency.', NULL, 1009, 197, '2024-12-13 19:32:38', 0),
(205, 'New complaint \'ff\' added with priority Emergency.', NULL, 128, 197, '2024-12-13 19:32:38', 0),
(206, 'New complaint \'ff\' added with priority Emergency.', NULL, 602, 197, '2024-12-13 19:32:38', 0),
(207, 'New complaint \'ff\' added with priority Emergency.', NULL, 121, 197, '2024-12-13 19:32:38', 0),
(208, 'New complaint \'ff\' added with priority Emergency.', NULL, 701, 197, '2024-12-13 19:32:38', 0),
(209, 'New complaint \'ff\' added with priority Emergency.', NULL, 1006, 197, '2024-12-13 19:32:38', 0),
(210, 'New complaint \'ff\' added with priority Emergency.', NULL, 702, 197, '2024-12-13 19:32:38', 0),
(211, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 501, 198, '2024-12-13 19:32:57', 0),
(212, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 101, 198, '2024-12-13 19:32:57', 0),
(213, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 130, 198, '2024-12-13 19:32:57', 0),
(214, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 601, 198, '2024-12-13 19:32:57', 0),
(215, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 1009, 198, '2024-12-13 19:32:57', 0),
(216, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 128, 198, '2024-12-13 19:32:57', 0),
(217, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 602, 198, '2024-12-13 19:32:57', 1),
(218, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 121, 198, '2024-12-13 19:32:57', 0),
(219, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 701, 198, '2024-12-13 19:32:58', 0),
(220, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 1006, 198, '2024-12-13 19:32:58', 0),
(221, 'New complaint \'ffff4ed4d\' added with priority Urgent.', NULL, 702, 198, '2024-12-13 19:32:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`) VALUES
(2, 'otoro', '200.00', 1),
(4, 'mimi sushi', '300.00', 4),
(5, 'jay sashimi', '300.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL DEFAULT 1,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role`) VALUES
(0, 'Admin'),
(1, 'Employee'),
(2, 'Electrician'),
(3, 'Plumber'),
(4, 'IT Technician'),
(5, 'General Maintenance'),
(6, 'Mechanic');

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `id` int(11) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `average_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`id`, `station_name`, `phone_number`, `average_users`) VALUES
(1, 'Chiangmai', '024444444', 1000),
(2, 'Hey', '023333333', 760),
(3, 'faef', '099999999', 500);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `average_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `phone`, `average_users`) VALUES
(5, 'wqedqd', '3423', 22),
(6, 'qwerty', '234', 123);

-- --------------------------------------------------------

--
-- Table structure for table `sushi`
--

CREATE TABLE `sushi` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sushi`
--

INSERT INTO `sushi` (`id`, `type`, `name`, `price`) VALUES
(2, 'Nigiri', 'dasdasd', '2323.00'),
(3, 'Maki', '31231', '99999999.99'),
(4, 'Sashimi', '312312', '1231231.00'),
(5, 'Maki', 'dasdfasgfa', '312415.00');

-- --------------------------------------------------------

--
-- Table structure for table `sushi_products`
--

CREATE TABLE `sushi_products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sushi_products`
--

INSERT INTO `sushi_products` (`id`, `name`, `price`, `type_id`) VALUES
(2, 'jnwfana', '400.00', 2),
(3, 'kndlainfhokai;wjfoa', '600000.00', 2),
(4, 'sKJBFAFBAIUHF', '50.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sushi_types`
--

CREATE TABLE `sushi_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sushi_types`
--

INSERT INTO `sushi_types` (`id`, `type_name`) VALUES
(2, 'Nigiri'),
(1, 'Sashimi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `station_id` (`station_id`);

--
-- Indexes for table `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `fk_emp_id` (`emp_id`),
  ADD KEY `fk_com_dep_code` (`dep_code`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dep_code`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_dep_code` (`dep_code`),
  ADD KEY `fk_role_id` (`role_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sushi`
--
ALTER TABLE `sushi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sushi_products`
--
ALTER TABLE `sushi_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `sushi_types`
--
ALTER TABLE `sushi_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sushi`
--
ALTER TABLE `sushi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sushi_products`
--
ALTER TABLE `sushi_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sushi_types`
--
ALTER TABLE `sushi_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `advertisement_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`),
  ADD CONSTRAINT `advertisements_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`);

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `fk_com_dep_code` FOREIGN KEY (`dep_code`) REFERENCES `department` (`dep_code`),
  ADD CONSTRAINT `fk_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_dep_code` FOREIGN KEY (`dep_code`) REFERENCES `department` (`dep_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sushi_products`
--
ALTER TABLE `sushi_products`
  ADD CONSTRAINT `sushi_products_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `sushi_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
