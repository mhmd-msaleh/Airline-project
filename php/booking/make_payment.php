<?php 
// to record the payment we need: 
// Amount , Card_NO
require("../database.php"); 
$db = new Database(); 
$amount = $db->getPriceSeat($_COOKIE["seat_no"]); 
$card_no = $_POST["cardNumber"]; 

$payment_NO = $db->makePayment($amount, $card_no); 

$ticket_no = $db->makeBooking(
    $_COOKIE["passenger_ssn"], 
    $payment_NO[0]["Payment_NO"], 
    $_COOKIE["seat_no"], 
    $_COOKIE["flight_no"]
); 

include("../header.php"); 
?> 

    <h4> Your ticket number is: <?php echo($ticket_no) ?> </h4>
</body>
</html>