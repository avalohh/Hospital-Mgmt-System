<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false"%>
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
	background-image: url("https://png.pngtree.com/thumb_back/fw800/background/20190222/ourmid/pngtree-blue-hospital-medical-western-medicine-poster-background-backgroundmedical-backgrounddoctor-backgroundhospital-image_63770.jpg");
	
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
	background-color:#ffcfdd;
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
    <div class="navbar-header">
      <a href="doctorfront" target="iframe">
     <img alt="logo" src="<c:url value='/images/logo.jpeg'/>" width="150px;" height="53px;"/></a>
    </div>
    <ul class="nav navbar-nav navbar-center">
    <li class="dropdown"><a class="dropdown-toggle"  target="iframe">Manage Appointment<span class="caret"></span></a>  
        <ul class="dropdown-menu">  
          <li><a href="doctorviewappointment" target="iframe">View Appointment</a></li>  
          <li><a href="doctorviewappointment" target="iframe">Create Report</a></li>  
        </ul>  
      </li>
      <li><a href="viewhistory" target="iframe">View History</a></li> 
      <li><a href="doctorviewpatient/1" target="iframe">View Patients</a></li> 
    </ul>  
    <ul class="nav navbar-nav navbar-right">
      <li><a href="doctorprofile" target="iframe" ><span class="glyphicon glyphicon-user" ></span>Profile</a></li>
      <li><a href="logout" target="iframe" ><span class="glyphicon glyphicon-log-out" ></span>Logout</a></li>
    </ul>  
  </div>  
</nav> 
</div>


<div class="iframe-container"><br><br>
  
<p>Welcome, Dr. <%=(String)request.getSession().getAttribute("doctor")%></p>
<iframe src="doctorfront" name="iframe" title="iframe" sandbox="allow-top-navigation allow-scripts allow-forms" frameBorder="0"></iframe>
</div>

</div>
</body>
</html>
