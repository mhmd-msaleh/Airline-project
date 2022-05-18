<?php 

require("../../database.php"); 

$db = new Database(); 

setcookie("ticket_no", $_POST["ticket_no"]);
$flight_no = $_POST["flight_no"];
$seat_no = $_POST["seat_no"];


$flight_info = $db->getFlightInfo($flight_no); 

?>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<div class="container rounded">

    <form action="search_flight.php" method="GET">
        <div class="row">
            <div class="col-md-6 col-12 mb-4">
                <div class="form-control d-flex flex-column">
                    <p class="h-blue">FROM</p> <input class="inputbox"
                        placeholder="<?php echo($flight_info[0]["Departure"])?>" type="text" name="Departure"
                        value="<?php echo($flight_info[0]["Departure"])?>">
                </div>
            </div>
            <div class="col-md-6 col-12 mb-4">
                <div class="form-control d-flex flex-column">
                    <p class="h-blue">TO</p> <input class="inputbox"
                        placeholder="<?php echo($flight_info[0]["Destination"])?>" type="text" name="Destination"
                        value="<?php echo($flight_info[0]["Destination"])?>">
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-6 col-12 mb-4">
                <div class="form-control d-flex flex-column">
                    <p class="h-blue">Date</p> <input class="inputbox textmuted" type="date" name="Date"
                        value="<?php echo($flight_info[0]["Date"])?>">
                </div>
            </div>
        </div>



        <input type="submit" class="btn btn-primary form-control text-center" value="SHOW FLIGHTS">
    </form>
</div>