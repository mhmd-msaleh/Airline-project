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

<div class="container rounded">

        <form action="">
            <div class="row">
                <div class="col-md-3 col-sm-10">
                    <div class="btn radio-btn mb-3"> <label class="radio"> <input type="radio" value="roundTrip"
                                name="book" checked> Round Trip <span></span> </label> </div>
                </div>
                <div class="col-md-3   col-sm-10">
                    <div class="btn radio-btn mb-3"> <label class="radio"> <input type="radio" value="oneWay"
                                name="book">
                            One Way <span></span> </label> </div>
                </div>
                <div class="col-md-3   col-sm-10">
                    <div class="btn radio-btn mb-3"> <label class="radio"> <input type="radio" value="multiCity"
                                name="book">
                            Multi-City <span></span> </label> </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">FROM</p> <input class="inputbox" placeholder="City or Airport" type="text">
                    </div>
                </div>
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">TO</p> <input class="inputbox" placeholder="City or Airport" type="text">
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">DEPARTURE</p> <input class="inputbox textmuted" type="date">
                    </div>
                </div>
                <div class="col-md-6 col-12 mb-4">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">RETURN</p> <input class="inputbox textmuted " type="date">
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-3 mb-3">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">ADULTS 12+</p> <select class="border-0 outline-none">
                            <option value="" hidden selected>0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-3 mb-3">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">CHILDREN 2-11</p> <select class="border-0 outline-none">
                            <option value="" hidden selected>0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-3 mb-3">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">INFANTS < 2</p> <select class="border-0 outline-none">
                                    <option value="" hidden selected>0</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                    </div>
                </div>

                <div class="col-md-3 mb-3">
                    <div class="form-control d-flex flex-column">
                        <p class="h-blue">CLASS</p> <select class="border-0 outline-none">
                            <option value="" hidden selected>Class</option>
                            <option value="economy">Economy</option>
                            <option value="premium">Premium</option>
                            <option value="business">Business</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="btn btn-primary form-control text-center">SHOW FLIGHTS</div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>

</html>