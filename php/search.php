<?php
require("database.php"); 
$db = new Database(); 

if(isset($_GET)){
    // var_dump($_GET); 
    $destination = $_GET["Destination"]; 
    $departure = $_GET["Departure"]; 
    $date = $_GET["Date"]; 

    $query_flights_result = $db->getFlights($date, $destination, $departure); 
    print_r($query_flights_result); 
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>