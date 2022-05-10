<?php
require('database.php'); 
$db = new Database(); 
if(isset($_POST)){
    $username = $_POST["Username"]; 
    $password = $_POST["password"];
    
    $id = db.getUserID($username, $password);
    var_dump($id);  
}
