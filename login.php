<?php
include_once("php/header.php")
?>

<div class="container">
    <form id="myForm" class="main-form" method="POST" name="login_form" action=php/authenticate.php>
        <h3>Find Your Flight</h3>
        <div class="row">
            <div class="col-sm-3">
                <div class="container">
                    <div class="row">
                        <label >Username</label>
                        <input class="form-control" placeholder="username1234" type="text" name="Username">
                        <label >Password</label>
                        <input class="form-control" placeholder="*********" type="text" name="Password">
                        <input class="btn" type="submit" value="Login">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- <script>
    const myForm = document.getElementById("myForm"); 
    myForm.addEventListener("submit", (e) =>{
        e.preventDefault(); 
        const request = new XMLHttpRequest(); 
        request.open("GET", "authenticate.php")
        request.onload = function() {
            colsole.log(request.responseText); 
        }
        request.send(new FormData(myForm))
    }); 
</script> -->
<?php
include_once("php/footer.php")
?>

