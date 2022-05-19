-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2022 at 03:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(15) NOT NULL,
  `Password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `Password`) VALUES
(1234, 'pass'),
(12123, 'password'),
(12345, 'pass1234');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE `aircraft` (
  `Serial_NO` int(15) NOT NULL,
  `Type` char(15) NOT NULL,
  `1st_Flight_date` date NOT NULL,
  `Prev_maint_date` date NOT NULL,
  `Next_maint_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`Serial_NO`, `Type`, `1st_Flight_date`, `Prev_maint_date`, `Next_maint_date`) VALUES
(1, 'plane', '2020-05-12', '2021-05-12', '2022-05-12'),
(2, 'plane', '2020-07-27', '2021-07-27', '2024-11-25'),
(3, 'plane', '2022-05-09', '2022-05-18', '2022-05-20'),
(4, 'plane', '2022-05-07', '2022-05-06', '2022-05-01'),
(5, 'plane', '2022-05-01', '2022-05-26', '2022-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `bag`
--

CREATE TABLE `bag` (
  `Bag_NO` int(15) NOT NULL,
  `SSN` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ref` int(15) NOT NULL,
  `SSN` int(15) NOT NULL,
  `Payment_NO` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL,
  `Seat_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ref`, `SSN`, `Payment_NO`, `Flight_NO`, `Seat_NO`) VALUES
(2, 111111111, 2, 8, 1),
(8, 123456789, 4, 0, 2),
(3, 1718178170, 3, 9, 1),
(9, 1718178170, 5, 1, 3);

--
-- Triggers `booking`
--
DELIMITER $$
CREATE TRIGGER `booking_insertion` AFTER DELETE ON `booking` FOR EACH ROW INSERT INTO BOOKING (SSN, Payment_NO, Flight_NO, Seat_NO) 
SELECT SSN, Payment_NO, Flight_NO, Seat_NO FROM waitlist order by ID DESC LIMIT 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `release_seat` BEFORE UPDATE ON `booking` FOR EACH ROW UPDATE SEAT SET Status = 'available'
WHERE Flight_NO = OLD.Flight_NO
AND Seat_NO = OLD.Seat_NO
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ticket_generator` BEFORE INSERT ON `booking` FOR EACH ROW BEGIN
    SELECT IF(Class = "economy", 7, IF(Class = "first", 10, IF(Class = "business", 20, 0))) 
	INTO @weight 
	FROM SEAT
	WHERE Seat_NO = NEW.Seat_NO
	AND Flight_NO = NEW.Flight_NO; 
	INSERT INTO TICKET VALUES (NULL, @weight, NEW.Flight_NO, NEW.Seat_NO);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_seat_status` AFTER INSERT ON `booking` FOR EACH ROW UPDATE `seat` SET `Status` = 'occupied' WHERE `seat`.`Seat_NO` = NEW.Seat_NO AND `seat`.`Flight_NO` = NEW.Flight_NO
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `Flight_NO` int(15) NOT NULL,
  `Date` date NOT NULL,
  `Time` char(10) NOT NULL,
  `Destination` varchar(10) NOT NULL,
  `Departure` varchar(10) NOT NULL,
  `Plane_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`Flight_NO`, `Date`, `Time`, `Destination`, `Departure`, `Plane_NO`) VALUES
(1, '2022-10-21', '11:25:00', 'New York', 'Riyadh', 2),
(3, '2022-10-21', '09:30:00', 'Riyadh', 'New York', 1),
(4, '2022-11-03', '23:00:00', 'London', 'Dammam', 2),
(5, '2022-05-19', '14:19', 'Tokyo ', 'Dammam', 2),
(6, '2022-05-19', '12:35', 'Dammam', 'Jeddah', 1),
(7, '2022-10-21', '20:31:34', 'Abha', 'Madinah', 3),
(8, '2022-10-21', '20:31:34', 'Qatar', 'Dammam', 4),
(9, '2022-10-21', '20:32:25', 'Bahrain', 'Oman', 5);

-- --------------------------------------------------------

--
-- Table structure for table `helicopter`
--

CREATE TABLE `helicopter` (
  `Serial_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_cancel_ticket`
--

CREATE TABLE `log_cancel_ticket` (
  `ticket_no` int(15) NOT NULL,
  `flight_no` int(15) NOT NULL,
  `seat_no` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_cancel_ticket`
--

INSERT INTO `log_cancel_ticket` (`ticket_no`, `flight_no`, `seat_no`) VALUES
(3, 1, 1),
(6, 8, 1),
(5, 9, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `SSN` int(15) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DoB` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `User_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`SSN`, `Name`, `DoB`, `Gender`, `Phone`, `Email`, `User_id`) VALUES
(111111111, 'Saleh Khalid', '1991-06-12', 'M', '0579876483', 'sal1234@gmail.com', 2),
(123456789, 'Mohammed Ahmad', '2000-05-01', 'M', '0541234567', 'moh@gmail.com', 1),
(1718178170, 'Ibrahim Akram', '1998-10-27', 'M', '057838383', 'mail@email.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_NO` int(15) NOT NULL,
  `Amount` float NOT NULL,
  `Card_NO` decimal(16,0) NOT NULL,
  `Confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `Time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_NO`, `Amount`, `Card_NO`, `Confirmed`, `Time_stamp`) VALUES
(1, 343.88, '12121212121212', 1, '2022-05-17 16:39:13'),
(2, 447.12, '884928753028878', 0, '2022-05-17 15:02:20'),
(3, 5789, '123456789101121', 1, '2022-05-18 12:27:31'),
(4, 1028, '178817818718', 1, '2022-05-18 12:27:31'),
(5, 6747, '47834738478392', 0, '2022-05-18 12:27:31');

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `Serial_NO` int(15) NOT NULL,
  `Seats_first` int(15) NOT NULL,
  `Seats_bussines` int(15) NOT NULL,
  `Seats_economy` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`Serial_NO`, `Seats_first`, `Seats_bussines`, `Seats_economy`) VALUES
(1, 3, 3, 5),
(2, 3, 3, 5),
(3, 3, 3, 5),
(4, 3, 3, 5),
(5, 3, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `premium_member`
--

CREATE TABLE `premium_member` (
  `Subscribtion_NO` int(15) NOT NULL,
  `SSN` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `private_jet`
--

CREATE TABLE `private_jet` (
  `Serial_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `Flight_NO` int(15) NOT NULL,
  `Seat_NO` int(15) NOT NULL,
  `Price` int(15) NOT NULL,
  `Status` char(10) NOT NULL DEFAULT 'available',
  `Class` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`Flight_NO`, `Seat_NO`, `Price`, `Status`, `Class`) VALUES
(1, 1, 1000, 'available', 'first'),
(8, 1, 1234, 'ocuppied', 'first'),
(9, 1, 1287, 'occupied', 'first'),
(1, 2, 500, 'available', 'economy'),
(8, 2, 1234, 'available', 'first'),
(1, 3, 500, 'occupied', 'economy'),
(8, 3, 1234, 'available', 'first'),
(1, 4, 500, 'available', 'economy'),
(8, 4, 1234, 'available', 'first'),
(1, 31, 500, 'waitlist', 'economy');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `T_NO` int(15) NOT NULL,
  `Wieght` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL,
  `Seat_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`T_NO`, `Wieght`, `Flight_NO`, `Seat_NO`) VALUES
(4, 7, 8, 1),
(7, 10, 9, 1),
(9, 7, 0, 2),
(10, 7, 1, 3);

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `cancelled_ticket` BEFORE DELETE ON `ticket` FOR EACH ROW INSERT INTO Log_cancel_ticket values (old.T_NO, old.Flight_NO, old.Seat_NO)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_booking` BEFORE DELETE ON `ticket` FOR EACH ROW DELETE FROM BOOKING WHERE T_NO = OLD.T_NO
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_ticket_flight` BEFORE UPDATE ON `ticket` FOR EACH ROW UPDATE BOOKING SET Flight_NO = NEW.Flight_NO AND Seat_NO = NEW.Seat_NO 
WHERE Flight_NO = old.Flight_NO
and Seat_NO = old.Seat_NO
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(15) NOT NULL,
  `Username` varchar(10) NOT NULL,
  `Password` char(32) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Username`, `Password`, `Email`) VALUES
(1, 'moha1234', '5f4dcc3b5aa765d61d8327deb882cf99', 'moh@gmail.com'),
(2, 'slooh34', '5f4dcc3b5aa765d61d8327deb882cf99', 'sal1234@gmail.com'),
(3, 'khalid34', '5f4dcc3b5aa765d61d8327deb882cf99', 'khalid@gmail.com'),
(5, 'suername', '5f4dcc3b5aa765d61d8327deb882cf99', 'user@mail.com'),
(7, '7amty', '5f4dcc3b5aa765d61d8327deb882cf99', '7mty@gmail.com'),
(8, 'theUser', '5f4dcc3b5aa765d61d8327deb882cf99', 'theUser@mail.com'),
(9, 'usernmae12', '5f4dcc3b5aa765d61d8327deb882cf99', 'mail@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `waitlist`
--

CREATE TABLE `waitlist` (
  `ID` int(15) NOT NULL,
  `SSN` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL,
  `Seat_NO` int(15) DEFAULT NULL,
  `Payment_NO` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `waitlist`
--

INSERT INTO `waitlist` (`ID`, `SSN`, `Flight_NO`, `Seat_NO`, `Payment_NO`) VALUES
(1, 1718178170, 1, 31, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`Serial_NO`);

--
-- Indexes for table `bag`
--
ALTER TABLE `bag`
  ADD PRIMARY KEY (`Bag_NO`,`SSN`),
  ADD KEY `SSN` (`SSN`),
  ADD KEY `Flight_NO` (`Flight_NO`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ref`),
  ADD UNIQUE KEY `SSN` (`SSN`,`Payment_NO`,`Seat_NO`,`Flight_NO`),
  ADD KEY `Payment_NO` (`Payment_NO`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`Flight_NO`),
  ADD UNIQUE KEY `Date` (`Date`,`Plane_NO`),
  ADD KEY `Plane_NO` (`Plane_NO`);

--
-- Indexes for table `helicopter`
--
ALTER TABLE `helicopter`
  ADD PRIMARY KEY (`Serial_NO`);

--
-- Indexes for table `log_cancel_ticket`
--
ALTER TABLE `log_cancel_ticket`
  ADD KEY `flight_no` (`flight_no`),
  ADD KEY `seat_no` (`seat_no`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`SSN`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_NO`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`Serial_NO`);

--
-- Indexes for table `premium_member`
--
ALTER TABLE `premium_member`
  ADD PRIMARY KEY (`Subscribtion_NO`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `private_jet`
--
ALTER TABLE `private_jet`
  ADD PRIMARY KEY (`Serial_NO`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`Seat_NO`,`Flight_NO`),
  ADD KEY `Flight_NO` (`Flight_NO`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`T_NO`) USING BTREE,
  ADD KEY `Flight_NO` (`Flight_NO`),
  ADD KEY `Seat_NO` (`Seat_NO`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SSN` (`SSN`,`Flight_NO`,`Seat_NO`),
  ADD KEY `Flight_NO` (`Flight_NO`),
  ADD KEY `Payment_NO` (`Payment_NO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `Serial_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bag`
--
ALTER TABLE `bag`
  MODIFY `Bag_NO` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ref` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `Flight_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `premium_member`
--
ALTER TABLE `premium_member`
  MODIFY `Subscribtion_NO` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `T_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `waitlist`
--
ALTER TABLE `waitlist`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bag`
--
ALTER TABLE `bag`
  ADD CONSTRAINT `bag_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `passenger` (`SSN`),
  ADD CONSTRAINT `bag_ibfk_2` FOREIGN KEY (`Flight_NO`) REFERENCES `flight` (`Flight_NO`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `passenger` (`SSN`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Payment_NO`) REFERENCES `payment` (`Payment_NO`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`Plane_NO`) REFERENCES `plane` (`Serial_NO`);

--
-- Constraints for table `helicopter`
--
ALTER TABLE `helicopter`
  ADD CONSTRAINT `helicopter_ibfk_1` FOREIGN KEY (`Serial_NO`) REFERENCES `aircraft` (`Serial_NO`);

--
-- Constraints for table `log_cancel_ticket`
--
ALTER TABLE `log_cancel_ticket`
  ADD CONSTRAINT `log_cancel_ticket_ibfk_1` FOREIGN KEY (`flight_no`) REFERENCES `flight` (`Flight_NO`),
  ADD CONSTRAINT `log_cancel_ticket_ibfk_2` FOREIGN KEY (`seat_no`) REFERENCES `seat` (`Seat_NO`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `user` (`Email`),
  ADD CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`ID`);

--
-- Constraints for table `plane`
--
ALTER TABLE `plane`
  ADD CONSTRAINT `plane_ibfk_1` FOREIGN KEY (`Serial_NO`) REFERENCES `aircraft` (`Serial_NO`);

--
-- Constraints for table `premium_member`
--
ALTER TABLE `premium_member`
  ADD CONSTRAINT `premium_member_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `passenger` (`SSN`);

--
-- Constraints for table `private_jet`
--
ALTER TABLE `private_jet`
  ADD CONSTRAINT `private_jet_ibfk_1` FOREIGN KEY (`Serial_NO`) REFERENCES `aircraft` (`Serial_NO`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_2` FOREIGN KEY (`Flight_NO`) REFERENCES `flight` (`Flight_NO`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `seat_const_ibk1` FOREIGN KEY (`Flight_NO`,`Seat_NO`) REFERENCES `seat` (`Flight_NO`, `Seat_NO`);

--
-- Constraints for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD CONSTRAINT `waitlist_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `passenger` (`SSN`),
  ADD CONSTRAINT `waitlist_ibfk_2` FOREIGN KEY (`Flight_NO`) REFERENCES `seat` (`Flight_NO`),
  ADD CONSTRAINT `waitlist_ibfk_4` FOREIGN KEY (`Payment_NO`) REFERENCES `payment` (`Payment_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
