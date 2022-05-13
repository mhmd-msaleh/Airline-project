<?php
require("database.php"); 
$db = new Database(); 
$query_flights_result; 
include_once("header.php"); 
if(isset($_GET)){ 
    $destination = $_GET["Destination"]; 
    $departure = $_GET["Departure"]; 
    $date = $_GET["Date"]; 
    setcookie("class",  $_GET["Class"]); 

    $query_flights_result = $db->getFlights($date, $destination, $departure);
    if(empty($query_flights_result)){
        echo'<div class="container-fluid !direction !spacing">
            <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-8  ">
            <h3> No Results Found ! </h3> 
            </div>
            </div>
            </div>'; 
    }
      
}

?>
    <div class="container-fluid !direction !spacing">
        <?php foreach($query_flights_result as $table_row): ?>
        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-8  ">
                <div class="card">
                    <div class="card-body">
                        <form name="flight-<?php echo($table_row["Flight_NO"]); ?>"action="booking/booking_page.php" method="Get">
                            <h5 class="card-title"><?php echo($table_row["Destination"]);?> ==> <?php echo($table_row["Departure"]);?></h5> 
                            <p class="card-text">Date: <?php echo($table_row["Date"]);?> 
                            </p>
                            <p class="card-text">Time: <?php echo($table_row["Time"]);?>
                            </p>
                            <input type="hidden" value="<?php echo($table_row["Flight_NO"]); ?>" name="flight-id">
                            <input type="submit" value="Book Flight" class="btn btn-primary">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
<?php include_once("footer.php"); ?>