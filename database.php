<?php 
class Database{
    private $connection; 
    
    //Establishing a connection to the database in the constructor
    public function __construct() {
        $this->connection = mysqli_connect("localhost", "root", "", "airline"); 
        if(mysqli_connect_error){
            die(mysqli_connect_error); 
        }
    } 

    /*********** User Functionalities **************/
    /**
     * Sign in 
     * Sign up 
     * Add ticket
     * Remove ticket
     * edit ticket
     * Book seat
     * Pay
     */
    public function addUser(array $user_object){    // Sign up
        $username = $user_object["username"]; 
        $password = $user_object["password"]; 
        $email = $user_object["email"]; 

        $sql = "INSERT INTO USER VALUES('$username', '$password', '$email'); "; 
        $query_status = mysqli($this->connection, $sql); 
    }

    public function getUserData(array $user_object, $isPassenger){  // Sign in 
        $username = $user_object["username"]; 
        $password = $user_object["password"]; 
        if($isPassenger){
            $sql = "SELECT * FROM USER NATURAL JOIN PASSENGER
            WHERE Username = '$username'
            And Password = '$password'; "; 
        }
        else{
            $sql = "SELECT * FROM USER
            WHERE Username = '$username'
            And Password = '$password'; "; 
        }
        $query_result = mysqli($this->connection, $sql); 
        return mysqli_fetch_all($query_result, MYSQLI_ASSOC); 
    }





    /*********** Admin Functionalities **************/
    /**
     * Add ticket for passenger
     * Remove ticket for passenger
     * edit ticket for passenger 
     * Book seats for passanger
     * generate reposrt 
     * prompte waitlisted passenger
     */




}
?> 