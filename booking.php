<?php
require_once("php/header.php"); 
?>


    <!--Booking Section-->
    <div class="container rounded">

        <form action="php/search.php" method="GET" >
            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">FROM</p> <input class="inputbox" placeholder="City or Airport" type="text" name="Departure">
                    </div>
                </div>
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">TO</p> <input class="inputbox" placeholder="City or Airport" type="text" name="Destination">
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">Date</p> <input class="inputbox textmuted" type="date" name="Date">
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">CLASS</p> <select class="border-0 outline-none" name="Class">
                            <option value="" hidden selected>Class</option>
                            <option value="economy">Economy</option>
                            <option value="first">First</option>
                            <option value="business">Business</option>
                        </select>
                    </div>
                </div>
            </div>
            <input type="submit" class="btn btn-primary form-control text-center" value="SHOW FLIGHTS">
        </form>
    </div>

<?php
require_once("php/footer.php"); 
?>
