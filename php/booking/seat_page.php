<?php 
// form with post method
require("../database.php"); 
$db = new Database(); 

$avail_seats = $db->getAvailableSeats($_COOKIE["flight_no"]); 
print_r($avail_seats); 

// header("Location: payment_page.php"); 