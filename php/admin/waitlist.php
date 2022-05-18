<?php 
require("../database.php"); 
$db = new DataBase(); 
$flight_no = $_GET["flight_no"]; 
$query_result = $db->getWaitlistPassengers($flight_no); 
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
        <?php 
        foreach($query_result as $table_row): ?>
        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-8  ">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Passenger Name: <?php echo($table_row["Name"]); ?></h5>
                        <h5 class="card-subtitle mb-2">SSN: <?php echo($table_row["SSN"]);?></h5>
                        <p class="card-text">Seat Number: <?php echo($table_row["Flight_NO"]);?>
                        </p>
                        <p class="card-text">Flight Number: <?php echo($table_row["Seat_NO"]);?>
                        </p>
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