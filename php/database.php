<?php 
class Database{
    private $connection; 
    
    

    //Establishing a connection to the database in the constructor
    public function __construct() {
        $host = "localhost";
        $user = "root";
        $password = ""; 
        $database = "airline"; 
        $this->connection = new mysqli($host, $user, $password, $database); 
        // print_r(this->$connection)
        if($this->connection->connect_error){
            die("Connection failed: " . mysqli_connect_error()); 
        }
    } 


    private function execQurey($sql_query, $query_type){
        if($query_type === "GET"){
            $query_result = mysqli_query($this->connection, $sql_query);
            if($query_result){ 
                return mysqli_fetch_all($query_result, MYSQLI_ASSOC);
            }
            else{
                return mysqli_error($this->connection); 
            }

        }
        elseif($query_type === "POST"){
            $query_result = mysqli_query($this->connection, $sql_query); 
            if ($query_result){
                return $query_result;  
            } else{
                return mysqli_error($this->connection); 
            }
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
    public function addUser($username, $password, $email){    // Sign up
        $hashed_password = md5($password); 
        $sql = "INSERT INTO USER (Username, Password, Email) VALUES ('$username', '$hashed_password', '$email'); "; 
        return $this->execQurey($sql, "POST"); 
    }

    public function getUserID($username, $password){
        $sql = "SELECT ID 
        FROM USER
        WHERE Username ='$username' 
        AND Password = MD5('$password'); "; 

        return $this->execQurey($sql, "GET"); 
    }

    public function getUserIDByUsername($username){
        $sql = "SELECT ID 
        FROM USER
        WHERE Username ='$username'; "; 

        return $this->execQurey($sql, "GET"); 
    }

    
    public function getUserData($id){  // Sign in 
        $sql = "SELECT * FROM PASSENGER
        WHERE User_id = '$id'; "; 
        return $this->execQurey($sql, "GET"); 
    }

    public function addPassenger($ssn, $name, $dob, $gender, $phone){
        $sql = "INSERT INTO PASSENGER (`SSN`, `Name`, `DoB`, `Gender`, `Phone`)
        VALUES ($ssn, $name, $dob, $gender, $phone);"; 
        return $this->execQurey($sql, "POST"); 
    }

    public function getFlights($date, $destination, $departure){
        // we use intersection to handle the case when a variable is null
        $conditions = array(); 
        if(!empty($date)) { $conditions[] = "Date = '$date'"; }
        if(!empty($destination)) { $conditions[] = "Destination = '$destination'"; }
        if(!empty($departure)) { $conditions[] = "Departure = '$departure'"; }
        $where = implode(' AND ', $conditions); 
        $sql = "SELECT Flight_NO, Destination, Departure, Date, Time FROM FLIGHT 
                WHERE " . $where; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getFlightInfo($flight_no){
        $sql = "SELECT * FROM FLIGHT WHERE Flight_NO = '$flight_no'; "; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getAvailableSeats($flight_no, $class){
        $sql = "SELECT Seat_NO, Price, Class
        FROM `SEAT`
        WHERE `Flight_NO` = $flight_no
        AND `Status` = 'available'"; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getPriceSeat($seat_no){
        $sql = "SELECT Price FROM SEAT WHERE Seat_NO = $seat_no; "; 
        return $this->execQurey($sql, "GET"); 
    }
    /************************************************************* */

    /************** Booking Tickets ****************************** */


    // this function will make a new ticket in the database. 
    // the ticket numbe will be sequinatialy that is automatically generated by the database
    // the wight of the ticket can be defined later 
    
    /**
     * @return ticket_NO 
     */
    public function makeBooking($ssn, $payment_no, $seat_no, $flight_no){
        $sql = "INSERT INTO BOOKING 
        (`SSN`, `Payment_NO`, `Seat_NO`, `Flight_NO`)
        VALUES ($ssn, $payment_no, $seat_no, $flight_no);"; 
        return $this->execQurey($sql, "POST");
        // $sql = "SELECT FROM TICKET WHERE Flight_NO = $flight_no AND Seat_NO = $seat_no; "; 
        // return $this->execQurey($sql, "GET"); 


    }

    public function makePayment($amount, $card_no){
        $sql = "INSERT INTO `PAYMENT` (`Amount`, `Card_NO`) 
        VALUES ('$amount', '$card_no');";
        $this->execQurey($sql, "POST"); 
        $sql = "SELECT payment_NO FROM payment ORDER BY payment_NO DESC LIMIT 1;"; 
        return $this->execQurey($sql, "GET"); 
    }

    /************************************************************* */



    /*********** Admin Functionalities **************/
    /**
     * Add ticket for passenger
     * Remove ticket for passenger
     * edit ticket for passenger 
     * Book seats for passanger
     * generate reposrt 
     * prompte waitlisted passenger
     */



    /********* Report queries **************/

    public function getActiveFlight(){
        $sql = "SELECT * FROM FLIGHT WHERE Date = current_date;"; 
        return $this->execQurey($sql, "GET"); 
    }

    public function validateAdmin($id, $password){
        $sql = "SELECT * FROM ADMIN WHERE ID = $id AND Password = $password; "; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getCancelledTicket(){
        $sql = "SELECT * FROM log_cancel_ticket; "; 
        return $this->execQurey($sql, "GET"); 
    }
    
    public function getWaitlistPassengers($flight_no){
        $sql = "SELECT p.SSN, Name, Flight_NO, Seat_NO 
        FROM PASSENGER p NATURAL JOIN WAITLIST w 
        WHERE w.Flight_NO = $flight_no;"; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getConfirmedPayments(){
        $sql = "SELECT * FROM PAYMENT WHERE Confirmed = 1;"; 
        return $this->execQurey($sql, "GET"); 
    }

    public function getPercentBooking($date){
        $sql = "SELECT Flight_NO, Used_seats,
                (`Seats_first`+`Seats_bussines`+`Seats_economy`) as Total_seat
                FROM PLANE p JOIN (
                    SELECT Flight_NO, Plane_NO, Count(Seat_NO) as Used_seats
                    FROM FLIGHT NATURAL JOIN BOOKING
                    WHERE Date = '$date'
                    group by Plane_NO
                    ) as j on p.Serial_NO = j.Plane_NO;"; 

        $query_result = $this->execQurey($sql, "GET"); 
        $outResult = array(); 

        // calcualte ALF for each plane 
        foreach($query_result as $row){
            $percent = $row["Used_seats"]/$row["Total_seat"] *100;
            array_push($outResult, array(
                "flight_no" => $row["Flight_NO"], 
                "percent" => round($percent, 0)
            )); 
        }

        return $outResult; 
    }
    

    // for the requirements: the average load factor is a ration for all planes
    public function getALF($date){
        $sql = "SELECT Sum(Used_seats) as Sum_usedSeats,
                Sum((`Seats_first`+`Seats_bussines`+`Seats_economy`)) as Sum_totalSeats
                FROM PLANE p JOIN (
                    SELECT Plane_NO, Count(Seat_NO) as Used_seats
                    FROM FLIGHT NATURAL JOIN BOOKING
                    WHERE Date = '$date'
                    group by Plane_NO
                    ) as j on p.Serial_NO = j.Plane_NO;"; 
        
        // execting the query
        $query_result = $this->execQurey($sql, "GET"); 
        $outResult = $query_result[0]["Sum_usedSeats"]/$query_result[0]["Sum_totalSeats"] * 100;  
        return round($outResult, 0); 
    }

    public function deleteTicket($ticket_no){
        $sql = "DELETE FROM TICKET WHERE T_NO = '$ticket_no'; "; 
        return $this->execQurey($sql, "POST"); 
    
    }

    public function getPassengerTickets($ssn){
        $sql = "SELECT y.T_NO, f.Flight_NO, f.Destination, f.Departure, f.Date, y.Seat_NO
                FROM FLIGHT f JOIN (
                    SELECT T_NO, t.Flight_NO, t.Seat_NO  
                    FROM TICKET t JOIN BOOKING b 
                    ON (t.Flight_NO = b.Flight_NO and t.Seat_NO = b.Seat_NO) 
                    WHERE SSN = '$ssn'
                ) 
                as y ON f.Flight_NO = y.Flight_NO;"; 
        return $this->execQurey($sql, "GET"); 
    }

    // public function getFlightOfTicket($ticket_no){
    //     $sql 
    // }

    public function updateTicketFlight($ticket, $flight, $seat){
        $sql = "UPDATE TICKET SET Flight_NO = '$flight' AND Seat_NO = '$seat' WHERE T_NO = '$ticket'; "; 
        return $this->execQurey($sql, "POST"); 
    }


}
?>