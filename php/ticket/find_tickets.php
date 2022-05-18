<?php

require("../database.php"); 

$db = new Database(); 
$ssn = $_POST["ssn"]; 
$tickets = $db->getPassengerTickets($ssn); 

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
        foreach($tickets as $table_row): ?>

        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-8  ">
                <div class="card">
                    <div class="card-body">

                        <h5 class="card-title">Ticket Number: <?php echo($table_row["T_NO"]); ?></h5>
                        <p class="card-text">Departure: <?php echo($table_row["Departure"]);?>
                        </p>
                        <p class="card-text">Destination: <?php echo($table_row["Destination"]);?>
                        </p>
                        <p class="card-text">Date: <?php echo($table_row["Date"]); ?></p>
                        <p class="card-text">Seat_NO: <?php echo($table_row["Seat_NO"]); ?></p>
                    </div>
                    <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
                        <div class="col-3">
                            <form method="post" action="delete.php">
                                <input type="hidden" name="ticket_no" value="<?php echo($table_row["T_NO"])?>">
                                <input type="submit" class="btn btn-danger" value="Delete Ticket">
                            </form>
                        </div>
                        <div class="col-3">
                            <form method="post" action="update/change_flight.php">
                                <input type="hidden" name="ticket_no" value="<?php echo($table_row["T_NO"])?>">
                                <input type="hidden" name="flight_no" value="<?php echo($table_row["Flight_NO"])?>">
                                <input type="hidden" name="seat_no" value="<?php echo($table_row["Seat_NO"])?>">
                                <input type="submit" class="btn btn-dark" value="Change Flight">
                            </form>
                        </div>
                        <div class="col-3">
                            <form method="post" action="update/change_seat.php">
                                <input type="hidden" name="ticket_no" value="<?php echo($table_row["T_NO"])?>">
                                <input type="hidden" name="seat_no" value="<?php echo($table_row["Seat_NO"])?>">
                                <input type="submit" class="btn btn-secondary" value="Change Seat">
                            </form>
                        </div>
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