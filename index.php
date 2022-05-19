<?php
require_once("php/header.php"); 
include_once("booking.php"); 
?>

   <div class="container rounded">

   <h5>Find My Tickets</h5>
        <form action="php/ticket/find_tickets.php" method="post" >
            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">Please enter your SSN </p> <input class="inputbox" placeholder="00000000000" type="text" name="ssn">
                    </div>
                </div>
            </div>
           <input type="submit" class="btn btn-info form-control text-center" value="Find my tickets"> 
        </form>
    </div> 

    <!--About Section-->
    <div id="about" class="container rounded">

        <div class="row">
            <div class="col-md-12 ">
                <div class="titlepage">
                    <h2>About our travel agency</h2>
                    <span> fact that a reader will be distracted by the readable content of a page when looking at
                        its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution
                        of letters,</span>
                </div>
                <div class="about-box">
                    <p> <span>There are many variations of passages of Lorem Ipsum available, but the majority
                            have suffered alteration in some form, by injected humour, or randomised words which
                            don't look even slightly believable. If you are going to use a passage of Lorem
                            Ipsum, you need to be sure thereThere are many variations of passages of Lorem Ipsum
                            available, but the majority have suffered alteration in some form, by injected
                            humour, or randomised words which don't look even slightly believable. If you are
                            going to use a passage of Lorem Ipsum, you need to be sure there</span></p>
                    <div class="palne-img-area">
                        <img src="images/plane-img.png" alt="images">
                    </div>
                </div>

            </div>

        </div>

        <!--Traveling Section-->
        <div id="travel" class="traveling">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 ">
                        <div class="titlepage">
                            <h2>Select Offers For Traveling</h2>
                            <span>It is a long established fact that a reader will be distracted by the readable content
                                of
                                a page when looking at its layout. The point of using Lorem Ipsum is that it has a
                                more-or-less normal distribution of letters,</span>
                        </div>
                    </div>
                </div>
                <span></span>
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                        <div class="traveling-box">
                            <i><img src="icon/travel-icon.png" alt="icon" class="icon" /></i>
                            <h3>Different Countries</h3>
                            <p> going to use a passage of Lorem Ipsum, you need to be </p>

                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                        <div class="traveling-box">
                            <i><img src="icon/travel-icon2.png" alt="icon" class="icon" /></i>
                            <h3>Mountains Tours</h3>
                            <p> going to use a passage of Lorem Ipsum, you need to be </p>

                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                        <div class="traveling-box">
                            <i><img src="icon/travel-icon3.png" alt="icon" class="icon" /></i>
                            <h3>Bus Tours</h3>
                            <p> going to use a passage of Lorem Ipsum, you need to be </p>

                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                        <div class="traveling-box">
                            <i><img src="icon/travel-icon4.png" alt="icon" class="icon" /></i>
                            <h3>Summer Rest</h3>
                            <p> going to use a passage of Lorem Ipsum, you need to be </p>

                        </div>
                    </div>
                </div>
            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

<?php
require_once("php/footer.php"); 
?>
