<?php
include_once("php/header.php")
?>

<div class="container">
    <form class="main-form" method="POST" name="signup_form" action="">
        <h3>Find Your Flight</h3>
        <div class="row">
            <div class="col-sm-3">
                <div class="container">
                    <div class="row">
                        <label >Email</label>
                        <input class="form-control" placeholder="user1234@gmail.com" type="text" name="email">
                        <label >Username</label>
                        <input class="form-control" placeholder="username1234" type="text" name="Username">
                        <label >Password</label>
                        <input class="form-control" placeholder="*********" type="text" name="password">
                        <label >Repeat Password</label>
                        <input class="form-control" placeholder="*********" type="text" name="password-repeat">
                        <input class="btn" type="submit" value="Sign UP">
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<?php
include_once("php/footer.php")
?>

