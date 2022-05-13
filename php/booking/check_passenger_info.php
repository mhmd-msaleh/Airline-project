<?php 
require("database.php"); 
$db = new Database(); 
$ssn; 
$flight_id = $_POST["flight-id"]; 

if(isset($_COOKIE["user_data"])){
    $ssn=json_decode($_COOKIE["user_data"])->SSN; 
}
else{
    // we must add the user information to the database
    $ssn = $_POST["SSN"]; 
    $name = $_POST["Name"]; 
    $dob = $_POST["DoB"]; 
    $gender = $_POST["Gender"]; 
    $phone = $_POST["phone"]; 
    $email = $_POST["email"]; 
    $db->addPassenger($ssn, $name, $dob, $gender, $phone, $email); 
}
// now we can make book the ticket with the flight_no and ssn
setcookie("passenger_ssn", $ssn, 0, "/php/booking/"); 
setcookie("flight_no", $flight_id, 0, "/php/booking/"); 

header("Location: ./seat_page.php"); 


