<?php 
require("../database.php"); 
$db = new Database(); 
$ssn; 
$flight_id = $_POST["flight-id"]; 
// $db->addPassenger(11222333367, 'mohammed anwar', '1999-02-05', 'M', 5555555555); 

if(isset($_COOKIE["user_data"])){
    $ssn=json_decode($_COOKIE["user_data"])->SSN; 
}
else{
    // we must add the user information to the database
    $ssn = $_POST["SSN"]; 
    $name = $_POST["Name"]; 
    $dob = $_POST["DoB"]; 
    $gender = $_POST["Gender"]; 
    $phone = $_POST["Phone"]; 
    $status = $db->addPassenger($ssn, $name, $dob, $gender, $phone); 
}
// now we can make book the ticket with the flight_no and ssn
setcookie("passenger_ssn", $ssn); 
setcookie("flight_no", $flight_id); 

print_r($ssn); 
var_dump($flight_id); 
header("Location: ./seat_page.php"); 


