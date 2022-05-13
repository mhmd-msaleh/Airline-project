CREATE TABLE `USER` (
  `ID` INT(15) NOT NULL AUTO_INCREMENT,
  `Username` varchar(10) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
);

CREATE TABLE `PASSENGER` (
  `SSN` INT(15) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DoB` date NOT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `User_id` INT(15) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `User_id` (`User_id`),
  UNIQUE KEY `Phone` (`Phone`), 
  FOREIGN KEY (`Email`) REFERENCES `USER` (`Email`), 
  FOREIGN KEY (`User_id`) REFERENCES `USER` (`ID`)
); 

CREATE TABLE `PAYMENT` (
  `Payment_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `Amount` FLOAT NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  `Card_NO` NUMERIC(16) NOT NULL,
  PRIMARY KEY (Payment_NO)
);
CREATE TABLE `PREMIUM_MEMBER` (
  `Subscribtion_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `SSN` INT(15) NOT NULL,
  PRIMARY KEY (Subscribtion_NO),
  FOREIGN KEY (SSN) REFERENCES PASSENGER(SSN)
);

CREATE TABLE `ADMIN` (
  `ID` INT(15) NOT NULL,
  `Password` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`)
); 

CREATE TABLE `AIRCRAFT` (
  `Serial_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `Type` char(15) NOT NULL,
  `1st_Flight_date` date NOT NULL,
  `Prev_maint_date` date NOT NULL,
  `Next_maint_date` date NOT NULL,
  
  PRIMARY KEY (`Serial_NO`)
); 

CREATE TABLE `PLANE` (
  `Serial_NO` INT(15) NOT NULL,
  `Seats_first` INT(15) NOT NULL,
  `Seats_bussines` INT(15) NOT NULL,
  `Seats_economy` INT(15) NOT NULL,
  PRIMARY KEY (Serial_NO),
  FOREIGN KEY (Serial_NO) REFERENCES AIRCRAFT(Serial_NO)
);


CREATE TABLE `PRIVATE_JET` (
  `Serial_NO` INT(15) NOT NULL,
  PRIMARY KEY (Serial_NO),
  FOREIGN KEY (Serial_NO) REFERENCES AIRCRAFT(Serial_NO)
);

CREATE TABLE `HELICOPTER` (
  `Serial_NO` INT(15) NOT NULL,
  PRIMARY KEY (`Serial_NO`),
  FOREIGN KEY (`Serial_NO`) REFERENCES `AIRCRAFT` (`Serial_NO`)
);


CREATE TABLE `FLIGHT` (
  `Flight_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` char(10) NOT NULL,
  `Destination` varchar(10) NOT NULL,
  `Departure` varchar(10) NOT NULL, 
  `Plane_NO` INT(15) NOT NULL,
  PRIMARY KEY (`Flight_NO`),
  KEY `Plane_NO` (`Plane_NO`),
  FOREIGN KEY (`Plane_NO`) REFERENCES `PLANE` (`Serial_NO`)
);

CREATE TABLE `BAG` (
  `Bag_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `SSN` INT(15) NOT NULL,
  `Flight_NO` INT(15) NOT NULL,
  PRIMARY KEY (`Bag_NO`,`SSN`),
  KEY `SSN` (`SSN`),
  KEY `Flight_NO` (`Flight_NO`),
  FOREIGN KEY (`SSN`) REFERENCES `PASSENGER` (`SSN`),
  FOREIGN KEY (`Flight_NO`) REFERENCES `FLIGHT` (`Flight_NO`)
); 


CREATE TABLE `TICKET` (
  `T_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `Wieght` INT(15) NOT NULL,
  `Flight_NO` INT(15) NOT NULL,
  `Seat_NO` INT(15) NOT NULL, 
  PRIMARY KEY (T_NO, Flight_NO),
  FOREIGN KEY (Flight_NO) REFERENCES FLIGHT(Flight_NO)
  FOREIGN KEY (Seat_NO) REFERENCES SEAT(Seat_NO)
);

CREATE TABLE `Booking` (
  `SSN` INT(15) NOT NULL,
  `Payment_NO` INT(15) NOT NULL, 
  `T_NO` INT(15) NOT NULL,
  `Flight_NO` INT(15) NOT NULL,
  PRIMARY KEY (`SSN`,`Payment_NO`,`T_NO`,`Flight_NO`),
  FOREIGN KEY (`SSN`) REFERENCES `PASSENGER` (`SSN`),
  FOREIGN KEY (`Payment_NO`) REFERENCES `PAYMENT` (`Payment_NO`),
  FOREIGN KEY (`T_NO`, `Flight_NO`) REFERENCES `TICKET` (`T_NO`, `Flight_NO`)
); 


CREATE TABLE SEAT (
  `Seat_NO` INT(15) NOT NULL AUTO_INCREMENT,
  `Price` INT(15) NOT NULL,
  `Status` CHAR(10) NOT NULL,
  `Class` CHAR(10) NOT NULL,
  `Plane_NO` INT(15) NOT NULL,
  `Flight_NO` INT(15) NOT NULL,
  PRIMARY KEY (Seat_NO, Plane_NO),
  FOREIGN KEY (Plane_NO) REFERENCES PLANE(Serial_NO),
  FOREIGN KEY (Flight_NO) REFERENCES TICKET(Flight_NO)
);









