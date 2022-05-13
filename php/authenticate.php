<?php
session_start(); 
require('database.php'); 
$db = new Database();

if(isset($_POST)){
    $username = $_POST["Username"]; 
    $password = $_POST["Password"]; 
    $query_id_result = $db->getUserID($username, $password);
    
    if(!empty($query_id_result)){  // User exist
        $id = $query_id_result[0]["ID"]; 
        $_SESSION["user"] = $id; 
        // now check if the user has passenger information
        $query_data_result = $db->getUserData($id); 
        if(!empty($query_data_result)){
            $user_data = json_encode($query_data_result[0]); 
            setcookie("user_data", $user_data, 0, '/'); 
        }
        header("Location: home.php"); 
    }
    else{   // the user does not exist go back to login page. 
        header("Location: ../login.php"); 
    }
}
