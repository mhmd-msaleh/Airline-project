<?php 

print("hello man"); 

incclude("php/database.php");
$db = new Database();  

array $user(
    username: "user1", 
    password: "pass1234"
); 
$data = $db->getUserData($user, NO); 

var_dump($data);  
print("hello man"); 
?>