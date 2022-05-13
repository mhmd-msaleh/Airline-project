-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2022 at 07:08 PM
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
(2, 'plane', '2020-07-27', '2021-07-27', '2024-11-25');

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
  `Seat_NO` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ref`, `SSN`, `Payment_NO`, `Seat_NO`, `Flight_NO`) VALUES
(1, 123456789, 1, 1, 1);

--
-- Triggers `booking`
--
DELIMITER $$
CREATE TRIGGER `log_new_booking` AFTER INSERT ON `booking` FOR EACH ROW INSERT INTO log_booking (Booking_ref) 
values (NEW.Booking_ref)
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
(2, '2022-10-25', '23:00:00', 'Riyadh', 'New York', 1),
(3, '2022-10-25', '09:30:00', 'Riyadh', 'New York', 1),
(4, '2022-11-03', '23:00:00', 'London', 'Dammam', 2);

-- --------------------------------------------------------

--
-- Table structure for table `helicopter`
--

CREATE TABLE `helicopter` (
  `Serial_NO` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_booking`
--

CREATE TABLE `log_booking` (
  `ID` int(15) NOT NULL,
  `Booking_ref` int(15) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log_seat`
--

CREATE TABLE `log_seat` (
  `Log_id` int(15) NOT NULL,
  `Plane` int(15) NOT NULL,
  `Seat` int(15) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_seat`
--

INSERT INTO `log_seat` (`Log_id`, `Plane`, `Seat`, `Time`) VALUES
(2, 1, 2, '2022-05-11 13:06:25');

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
(123456789, 'Mohammed Ahmad', '2000-05-01', 'M', '0541234567', 'moh@gmail.com', 1);

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
(1, 343.88, '12121212121212', 0, '2022-05-11 14:16:17');

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
(1, 30, 0, 50),
(2, 10, 10, 70);

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
  `Seat_NO` int(15) NOT NULL,
  `Flight_NO` int(15) NOT NULL,
  `Price` int(15) NOT NULL,
  `Status` char(10) NOT NULL,
  `Class` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`Seat_NO`, `Flight_NO`, `Price`, `Status`, `Class`) VALUES
(1, 1, 1000, 'available', 'first'),
(31, 1, 500, 'available', 'economy');

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
(2, 10, 1, 1),
(3, 10, 1, 1);

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
  ADD KEY `Payment_NO` (`Payment_NO`),
  ADD KEY `Seat_NO` (`Seat_NO`,`Flight_NO`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`Flight_NO`),
  ADD KEY `Plane_NO` (`Plane_NO`);

--
-- Indexes for table `helicopter`
--
ALTER TABLE `helicopter`
  ADD PRIMARY KEY (`Serial_NO`);

--
-- Indexes for table `log_booking`
--
ALTER TABLE `log_booking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Booking_ref` (`Booking_ref`);

--
-- Indexes for table `log_seat`
--
ALTER TABLE `log_seat`
  ADD PRIMARY KEY (`Log_id`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`SSN`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Email` (`Email`);

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
  ADD PRIMARY KEY (`T_NO`,`Flight_NO`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `Serial_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bag`
--
ALTER TABLE `bag`
  MODIFY `Bag_NO` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `Booking_ref` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `Flight_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log_booking`
--
ALTER TABLE `log_booking`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_seat`
--
ALTER TABLE `log_seat`
  MODIFY `Log_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `premium_member`
--
ALTER TABLE `premium_member`
  MODIFY `Subscribtion_NO` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `T_NO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Payment_NO`) REFERENCES `payment` (`Payment_NO`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`Seat_NO`,`Flight_NO`) REFERENCES `seat` (`Seat_NO`, `Flight_NO`);

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
-- Constraints for table `log_booking`
--
ALTER TABLE `log_booking`
  ADD CONSTRAINT `log_booking_ibfk_1` FOREIGN KEY (`Booking_ref`) REFERENCES `booking` (`Booking_ref`);

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
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Flight_NO`) REFERENCES `flight` (`Flight_NO`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Seat_NO`) REFERENCES `seat` (`Seat_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
