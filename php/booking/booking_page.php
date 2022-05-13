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

<?php
$flight_id = $_GET["flight-id"]; 
$user_data = ""; 
$ssn = ""; 
$name =""; 
$dob = ""; 
$gender =""; 
$phone = ""; 
$email = ""; 
if(isset($_COOKIE["user_data"])){ 
    $user_data = json_decode($_COOKIE["user_data"]);
    print_r($user_data); 
    $ssn = $user_data->SSN; 
    echo($ssn); 
    $name = $user_data->Name; 
    $dob = $user_data->DoB; 
    $gender = $user_data->Gender;
    $phone = $user_data->Phone;
    $email = $user_data->Email;

}
?>

<body>
    <div class="container-fluid !direction !spacing">
        <div class="row ${1| ,row-cols-2,row-cols-3, auto,justify-content-md-center,|}">
            <div class="col-6 ">
                <form name="booking-form" action="check_passenger_info.php" method="post">
                    <div class="mb-3">
                        <label for="ssn" class="form-label">SSN</label>
                        <input type="text" name="SSN" class="form-control" id="ssn" value="<?php echo($ssn); ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" name="Name" class="form-control" id="name" value="<?php echo($name); ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="dob" class="form-label">Date of Birth</label>
                        <input type="date" name="DoB" class="form-control" id="dob" value="<?php echo($dob); ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <select id="gender" name="Gender">
                            <option value="<?php echo($gender);?>" selected hidden></option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                            <option value="">Prefer not to say</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" name="Phone" class="form-control" id="phone" value="<?php echo($phone); ?>">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" name="Email" class="form-control" id="email" value="<?php echo($email); ?>">
                    </div>
                    <input type="hidden" value="<?php echo($flight_id); ?>" name="flight-id">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>

</body>

</html>