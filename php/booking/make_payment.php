<?php 
// to record the payment we need: 
// Amount , Card_NO
require("../database.php"); 
$db = new Database(); 
$amount = $db->getPriceSeat($_COOKIE["seat_no"]); 
$card_no = $_POST["cardNumber"]; 

$db->makePayment($amount, $card_no); 