<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">




    <title>Document</title>
</head>

<body>
    <div class="container-fluid !direction !spacing">
        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">

            <div class="col-3 ">

                <form action="delete.php" method="post">
                    <div class="form-group">
                        <label for="ticket_no">Ticket Number</label>
                        <input type="text" class="form-control" id="ticket_no" name="ticket_no">
                    </div>
                    <button type="submit" class="btn btn-danger">Submit</button>
                </form>
            </div>
        </div>
    </div>

</body>

</html>