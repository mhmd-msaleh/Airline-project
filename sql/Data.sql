INSERT INTO ADMIN (ID, Password) VALUES 
("12345", "pass1234"), 
("12123", "password"); 

INSERT INTO AIRCRAFT (Type, 1st_Flight_date, Prev_maint_date, Next_maint_date) VALUES
("plane", "2020-05-12", "2021-05-12", "2022-05-12"), 
("plane", "2020-07-27", "2021-07-27", "2024-11-25"); 

INSERT INTO PLANE (Serial_NO,Seats_first, Seats_bussines, Seats_economy) VALUES 
(1, 30, 0, 50), 
(2, 10, 10, 70);


INSERT INTO FLIGHT (Date, Time, Destination, Departure, Plane_NO) VALUES
("2022-10-21", "11:25:00", "New York", "Riyadh", 2), 
("2022-10-25", "23:00:00", "Riyadh", "New York", 1), 
("2022-10-25", "09:30:00", "Riyadh", "New York", 1), 
("2022-11-03", "23:00:00", "London", "Dammam", 2); 

INSERT INTO USER (Username, Password, Email) VALUES 
("moha1234", "password", "moh@gmail.com"), 
("slooh34", "pass1234", "sal1234@gmail.com"), 
('khalid34', 'khal123456', 'khalid@gmail.com'); 

INSERT INTO PASSENGER (SSN, Name, DoB, Gender, Phone, Email, User_id) VALUES
(123456789, "Mohammed Ahmad", "2000-05-01", "M", "0541234567", "moh@gmail.com", 1), 
(111111111, "Saleh Khalid", "1991-06-12", "M", "0579876483", "sal1234@gmail.com", 2); 

INSERT INTO `seat` (`Seat_NO`, `Price`, `Status`, `Class`, `Plane_NO`, `Flight_NO`)
VALUES ('1', '1000', 'available', 'economy', '1', '1');

------------------------------

insert into seat values (2, 1, 500, 'available', 'economy'), (3, 1, 500, 'available', 'economy'); 
INSERT INTO `flight` (`Flight_NO`, `Date`, `Time`, `Destination`, `Departure`, `Plane_NO`) VALUES (NULL, '2022-05-17', CURRENT_TIME(), 'Tokyo ', 'Dammam', '2');
INSERT INTO `flight` (`Flight_NO`, `Date`, `Time`, `Destination`, `Departure`, `Plane_NO`) VALUES (NULL, '2022-05-17', CURRENT_TIME(), 'Dammam', 'Jeddah', '1');