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
