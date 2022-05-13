<?php 
require("../database.php"); 
$db = new Database(); 
$ssn; 
$flight_id = $_POST["flight-id"]; 
print_r($_POST); 
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
    $email = $_POST["Email"]; 
    $db->addPassenger($ssn, $name, $dob, $gender, $phone, $email); 
}
// now we can make book the ticket with the flight_no and ssn
setcookie("passenger_ssn", $ssn); 
setcookie("flight_no", $flight_id); 

print_r($ssn); 
var_dump($flight_id); 
header("Location: ./seat_page.php"); 


