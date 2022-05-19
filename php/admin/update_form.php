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

<h5>Find Ticket</h5>
        <form action="../ticket/find_tickets.php" method="post" >
            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">Please enter passenger SSN </p> <input class="inputbox" placeholder="" type="text" name="ssn">
                    </div>
                </div>
            </div>
           <input type="submit" class="btn btn-info form-control text-center" value="Find tickets"> 
        </form>
    </div> 