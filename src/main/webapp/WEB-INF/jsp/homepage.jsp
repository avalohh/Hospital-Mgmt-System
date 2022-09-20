<!DOCTYPE html>  
<html lang="en">  
<head>  
   <title>Care Hospital</title>  
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    
</head>

<style>
body{
	background-color:transparent;
}
  .carousel-inner > .item > img,  
  .carousel-inner > .item > a > img {  
      width: 97%;  
      margin: auto;  

  }  
 .carousel-control.left, .carousel-control.right {
   background-image:none !important;
   filter:none !important;
}
.container{
	padding-top:10px;
}
.hover {
  overflow: hidden;
  position: relative;
  padding-bottom: 230px;
}

.hover-overlay {
  width: 100%;
  height: 230px;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 90;
  transition: all 0.4s;
}

.hover img {
  width: 100%;
  height:230px;
  position: absolute;
  top: 0;
  left: 0;
  transition: all 0.3s;
}

.hover-content {
  position: relative;
  z-index: 99;
}

.hover-2 .hover-overlay {
  background: linear-gradient(to top, rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.1));
}

.hover-2-title {
  position: absolute;
  top: 40%;
  left: 0;
  text-align: center;
  width: 100%;
  z-index: 99;
  transition: all 0.3s;
  font-size:27px;
}

.hover-2-description {
  width: 100%;
  position: absolute;
  bottom: 30px;
  opacity: 0;
  left: 0;
  text-align: center;
  z-index: 99;
  transition: all 0.3s;
  font-size:12px;
}

.hover-2:hover .hover-2-title {
  transform: translateY(-1.5rem);
}

.hover-2:hover .hover-2-description {
  bottom: 7rem;
  opacity: 1;
}

.hover-2:hover .hover-overlay {
  background: linear-gradient(to top, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.1));
}
a
{
	color:white;
}
a:hover
{
	color:darkblue;
}
</style>  
  
<body>  
  
<div class="container">  
  
<div id="myCarousel" class="carousel slide" data-ride="carousel">  
    <!-- Indicators -->  
    <ol class="carousel-indicators">  
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>  
      <li data-target="#myCarousel" data-slide-to="1"></li>  
      <li data-target="#myCarousel" data-slide-to="2"></li>  
    </ol>  
  
    <!-- Wrapper for slides -->  
    <div class="carousel-inner" role="listbox">  
      <div class="item active">  
        <img src="https://t4.ftcdn.net/jpg/02/75/88/05/360_F_275880540_UEZz9qPAqlowxiF1XT1gGwJYGf86HAHc.jpg" alt="jokes 1">  
      </div>  
  
      <div class="item">  
        <img src="https://www.columbiaasia.com/malaysia/sites/default/files/hospital/hospitals-seremban-services-facilities.jpg" alt="jokes 2" >  
      </div>  
      
      <div class="item">  
        <img src="https://www.columbiaasia.com/malaysia/sites/default/files/hospital/hospitals-bintulu-operating-hours.jpg" alt="jokes 3" >  
      </div>  
    </div>  
  
    <!-- Left and right controls -->  
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">  
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>  
      <span class="sr-only">Previous</span>  
    </a>  
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">  
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>  
      <span class="sr-only">Next</span>  
    </a>  
</div><!-- corousel end -->  
<br>
<div class="col-lg-6 mb-3 mb-lg-0">
   <div class="hover hover-2 text-white rounded"><img src="https://media.istockphoto.com/photos/hospital-sign-for-maternity-outpatients-wards-and-childrens-unit-picture-id1167752691?k=20&m=1167752691&s=612x612&w=0&h=2cu1_4McnnU5AazsoMxmQieZ8xqPza0zNbjOngmKOug=" alt="">
     <div class="hover-overlay"></div>
     <div class="hover-2-content px-5 py-4">
       <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"><a href="services"> <span class="font-weight-light">Our </span>Services</a></h3>
       <p class="hover-2-description text-uppercase mb-0">At Care Hospital,<br>
                        We offer medical & surgical specialties<br>
                         with experienced doctors and other healthcare professionals</p>
     </div>
   </div>
</div>
<div class="col-lg-6 mb-3 mb-lg-0">
   <div class="hover hover-2 text-white rounded"><img src="https://www.cancer.gov/sites/g/files/xnrzdm211/files/styles/cgov_article/public/cgov_image/media_image/2022-05/mammogram%20AA%20women%20with%20nurse.jpg?itok=eOf46A7l" alt="">
     <div class="hover-overlay"></div>
     <div class="hover-2-content px-5 py-4">
       <h3 class="hover-2-title text-uppercase font-weight-bold mb-0"><a href="package"> <span class="font-weight-light">Our </span>Packages</a></h3>
       <p class="hover-2-description text-uppercase mb-0">Teams of Care Hospital are here to help you<br>
       														to manage potential health risks by providing<br>
       														specific screening programmes and personalised consultation.</p>
     </div>
   </div>
</div> 
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
  </body>  
</html>  

 
