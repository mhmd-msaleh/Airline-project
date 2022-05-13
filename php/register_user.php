<?php
session_start(); 
require('database.php'); 
$db = new Database();

if(isset($_POST)){
    $username = $_POST["Username"]; 
    $password = $_POST["Password"]; 
    $email = $_POST["Email"]; 
    $status = $db->addUser($username, $password, $email); 
    if($status){  // User exist
        $query_id_result = $db->getUserIDByUsername($username);
        $id = $query_id_result[0]["ID"]; 
        $_SESSION["user"] = $id; 
        // now check if the user has passenger information
        header("Location: home.php"); 
    }
}
