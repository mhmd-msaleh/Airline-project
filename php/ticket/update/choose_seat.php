<?php 
// form with post method
require("../../database.php"); 
$db = new Database(); 
$flight_NO = $_GET["flight_no"]; 
// $class = $_POST["class"]; 
$avail_seats = $db->getAvailableSeats($flight_NO, 'class'); 
print_r($avail_seats); 

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seats</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>
    <div class="container-fluid !direction !spacing">
        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-8  ">
                <div class="card">
                    <div class="card-header">
                        Seats
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Select available seat</h5>
                        <form method="get" action="submit_update_flight.php">
                            <select class="custom-select" multiple name="Seat_NO">
                                <option selected>Available seats</option>
                                <?php foreach($avail_seats as $row): $i = $row["Seat_NO"];?>
                                <option value="<?php echo($row["Seat_NO"])?>"><?php echo($row["Seat_NO"]." -- ".$row["Class"]." -- ".$row["Price"]."SAR")?></option>
                                <?php endforeach; ?>
                            </select>
                            <input type="hidden" name="flight_no" value="<?php echo($flight_NO); ?>">
                            <div> <input type="submit" class="btn btn-primary" value="Submit"> </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>