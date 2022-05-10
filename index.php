<?php
require_once("php/header.php"); 
?>
      <section>
         <div class="banner-main">
            <img src="images/airplane_banner2.jpg" alt="#"/>
            <div class="container">
               <div class="text-bg">
                  <h1>Something<br><strong class="white">Airline</strong></h1>
                  <div class="button_section"> <a class="main_bt" href="#">Read More</a>  </div>
                  <div class="container " id="search-card">
                     <form class="main-form" action="php/search.php" method="get">
                        <h3>Find Your Flight</h3>
                        <div class="row">
                           <div class="col-md-9">
                              <div class="row">
                                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Departure</label>
                                    <input class="form-control" placeholder="" type="text" name="Departure">
                                 </div>
                                 <!-- <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Category</label>
                                    <select class="form-control" name="Any">
                                       <option>Any</option>
                                       <option>Option 1</option>
                                       <option>Option 2</option>
                                       <option>Option 3</option>
                                    </select>
                                 </div> -->
                                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Destination</label>
                                    <input class="form-control" placeholder="" type="text" name="Destination">
                                 </div>
                                 <!-- <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Duration</label>
                                    <input class="form-control" placeholder="Any" type="text" name="Any">
                                 </div> -->
                                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Date</label>
                                    <input class="form-control" placeholder="Any" type="date" name="Date">
                                 </div>
                                 <!-- <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <label >Max Price</label>
                                    <input class="form-control" placeholder="00.0" type="text" name="00.0">
                                 </div> -->
                              </div>
                           </div>
                           <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                              <input type="submit" value="submit">
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <script>
         let show_area = document.getElemntById("search-card");
          
         
      </script>
<?php
require_once("php/footer.php"); 
?>