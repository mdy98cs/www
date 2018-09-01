-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 29, 2018 at 12:42 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline-booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline_staff`
--

DROP TABLE IF EXISTS `airline_staff`;
CREATE TABLE IF NOT EXISTS `airline_staff` (
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `date_of_birth` varchar(15) NOT NULL,
  `airline_name` varchar(30) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline_staff`
--

INSERT INTO `airline_staff` (`username`, `password`, `first_name`, `last_name`, `date_of_birth`, `airline_name`) VALUES
('asmita', 'password', 'Asmita', 'Srivastava', '07-mar-1984', 'Indian Airlines'),
('Manish', 'password123', 'Manish', 'Singh', '1999-11-08', 'Indigo Airlines');

-- --------------------------------------------------------

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
CREATE TABLE IF NOT EXISTS `airplane` (
  `airline_name` varchar(50) NOT NULL,
  `airplane_id` varchar(30) NOT NULL,
  `seats` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airplane`
--

INSERT INTO `airplane` (`airline_name`, `airplane_id`, `seats`) VALUES
('Indian Airlines', '1181341651961954', '350'),
('Indian Airlines', '895788993886590', '380'),
('Indian Airlines', '895788993886591', '380'),
('Indian Airlines', '1386389041670159', '250');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
CREATE TABLE IF NOT EXISTS `airport` (
  `airport_name` varchar(100) NOT NULL,
  `airport_city` varchar(50) NOT NULL,
  PRIMARY KEY (`airport_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`airport_name`, `airport_city`) VALUES
('Amausi Airport', 'Lucknow'),
('IGI Airport', 'New Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `booking_agent`
--

DROP TABLE IF EXISTS `booking_agent`;
CREATE TABLE IF NOT EXISTS `booking_agent` (
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `booking_agent_id` varchar(30) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_agent`
--

INSERT INTO `booking_agent` (`email`, `password`, `booking_agent_id`) VALUES
('asmitaptu@gmail.com', 'passwd', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `building_no` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `passport_number` varchar(30) NOT NULL,
  `passport_expiration` varchar(30) NOT NULL,
  `passport_country` varchar(30) NOT NULL,
  `date_of_birth` varchar(15) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`email`, `name`, `password`, `building_no`, `street`, `city`, `state`, `phone_number`, `passport_number`, `passport_expiration`, `passport_country`, `date_of_birth`) VALUES
('aksri389@gmail.com', 'Anil Srivastava', 'sheelnidhi@123', '3/89 Vipul Khand', 'Gomti Nagar', 'Lucknow', 'UTTAR PRADESH', '9807958008', 'up44343u4u', '2030-11-12', 'India', '1954-07-01');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE IF NOT EXISTS `flight` (
  `airline_name` varchar(30) NOT NULL,
  `flight_num` varchar(15) NOT NULL,
  `departure_airport` varchar(30) NOT NULL,
  `departure_time` varchar(30) NOT NULL,
  `arrival_airport` varchar(30) NOT NULL,
  `arrival_time` varchar(30) NOT NULL,
  `price` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `airplane_id` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`airline_name`, `flight_num`, `departure_airport`, `departure_time`, `arrival_airport`, `arrival_time`, `price`, `status`, `airplane_id`) VALUES
('Indian Airlines', '1', 'Lucknow', '2018-07-30T06:10:01', 'IGI Airport', '2018-07-30T07:25:01', '1750', 'Upcoming', '1181341651961954'),
('Indian Airlines', '2', 'Amausi Airport', '2018-07-30T12:25:01', 'IGI Airport', '2018-07-30T13:35:01', '2500', 'Upcoming', '895788993886590');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `ticket_id` varchar(30) NOT NULL,
  `customer_email` varchar(30) NOT NULL,
  `booking_agent_id` varchar(30) DEFAULT NULL,
  `purchase_date` varchar(30) NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`ticket_id`, `customer_email`, `booking_agent_id`, `purchase_date`) VALUES
('2056237083', 'aksri389@gmail.com', NULL, '2018-07-29'),
('38671790', 'manojverma@gmail.com', '1', '2018-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `ticket_id` varchar(30) NOT NULL,
  `airline_name` varchar(30) NOT NULL,
  `flight_num` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `airline_name`, `flight_num`) VALUES
('2007671029', 'Indian Airlines', '2'),
('1268902554', 'Indian Airlines', '2'),
('2056237083', 'Indian Airlines', '2'),
('38671790', 'Indian Airlines', '2');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
