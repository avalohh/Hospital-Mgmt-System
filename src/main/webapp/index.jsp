<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
    	top.location = self.location;
    }
</script> 
<style>
body
{
	height:100%;
}

.bgimage
{
	background-image: url("https://img.freepik.com/free-vector/clean-medical-background_53876-119280.jpg?w=2000");
	
	/* Center and scale the image nicely */
	background-repeat:no-repeat;
	background-attachment:fixed;
	background-size:cover;	
}
.bgtext
{
	height:10px;
}

iframe {
    background-color: transparent;
    display: block;
    margin: 0 auto;
    width:1500px;
    height:700px;
}

div.iframe-container {
    dsiplay : flex;
    justify-content : center;
}
.navbar
{
	background-color:#fff5d1;
	border-radius:0px;
}

.dropdown:hover .dropdown-menu
{
	display:block;
}

.dropdown-menu
{
	background-color:#4f91c4;
}

.dropdown-menu a:hover
{
	background-color:#9eccf0;
}

.container-fluid
{
	font-size:20px;
}

.nav.navbar-nav.navbar-center
{
	position:absolute;
	left:50%;
	transform: translatex(-50%);
}
.navbar .navbar-header
{
	position:absolute;
	left:0%;
	background-color:white;
	width:189px;
	text-align:center;
}

li a
{
	color:#093263;
}
</style>
<body>
<div class="bgimage">

<div class="bgtext">
<nav class="navbar">  
  <div class="container-fluid">  
    <div class="navbar-header"><a href="">
      <img alt="logo" src="<c:url value='/images/logo.jpeg'/>" width="150px;" height="53px;"/></a>
    </div>
    <ul class="nav navbar-nav navbar-center">  
      <li class="active"><a href="aboutus" target="iframe">About Us</a></li>  
      <li class="dropdown"><a class="dropdown-toggle" href="services" target="iframe">Our Services <span class="caret"></span></a>  
        <ul class="dropdown-menu">  
          <li><a href="ent" target="iframe">Ear,Nose and Throat</a></li>  
          <li><a href="ophthalmology" target="iframe">Ophthalmology</a></li>  
          <li><a href="neurology" target="iframe">Neurology</a></li> 
          <li><a href="cardiology" target="iframe">Cardiology</a></li>
          <li><a href="urology" target="iframe">Urology</a></li>
          <li><a href="orthopedics" target="iframe">Orthopedics</a></li>
        </ul>  
      </li>
      <li><a href="package" target="iframe">Packages</a></li> 
      <li><a href="contact" target="iframe">Contact Us</a></li>  
    </ul>  
    <ul class="nav navbar-nav navbar-right">  
      <li><a href="registerform" target="iframe"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>  
      <li><a href="loginform" target="iframe"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>  
    </ul>  
  </div>  
</nav> 
</div>
<div class="iframe-container"><br><br>
<iframe src="home" name="iframe" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0"></iframe>
</div>

</div>
</body>
</html>
