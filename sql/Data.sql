INSERT INTO ADMIN (ID, Password) VALUES 
("12345", "pass1234"), 
("12123", "password"); 

INSERT INTO AIRCRAFT (Type, 1st_Flight_date, Prev_maint_date, Next_maint_date) VALUES
("plane", "2020-05-12", "2021-05-12", "2022-05-12"), 
("plane", "2020-07-27", "2021-07-27", "2024-11-25"); 

INSERT INTO PLANE (Seats_first, Seats_bussines, Seats_economy) VALUES 
(30, 0, 50), 
(10, 10, 70), 
(15, 10, 110 ); 

INSERT INTO FLIGHT (Date, Time, Destination, Departure, Plane_NO) VALUES
("2022-10-21", "11:25:00", "New York", "Riyadh", 3), 
("2022-10-25", "23:00:00", "Riyadh", "New York", 3), 
("2022-10-25", "09:30:00", "Riyadh", "New York", 1), 
("2022-11-03", "23:00:00", "London", "Dammam", 2); 

INSERT INTO USER (Username, Password, Email) VALUES 
("moha1234", "password", "moh@gmail.com"), 
("slooh34", "pass1234", "sal1234@gmail.com"); 

INSERT INTO PASSENGER (SSN, Name, DoB, Gender, Phone, Email, User_id) VALUES
(123456789, "Mohammed Ahmad", "2000-05-01", "M", "0541234567", "moh@gmail.com", 1), 
(111111111, "Saleh Khalid", "1991-06-12", "M", "0579876483", "sal1234@gmail.com", 2); 

