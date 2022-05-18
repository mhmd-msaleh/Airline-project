<?php 

require("../database.php"); 
$db = new Database();

if (isset($_POST["ticket_no"])){
    $ticket = $_POST["ticket_no"]; 
    $result = $db->deleteTicket($ticket); 
    if ($result){
        
        echo("Ticket ".$ticket." is deleted successffully"); 
        
    }
    
}
else{
    echo ("The ticket not found !"); 
}
 
?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>

<body>
    <br><br>
    <a class="btn btn-primary btn-sm " href="../../index.php" role="button">Return to Main Page</a>
</body>