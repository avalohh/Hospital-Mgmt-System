<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ page import="java.io.*,java.util.*" %>
 <%@page import="java.text.SimpleDateFormat" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<style>
body
{
	background-color: transparent;
}
.container
{
	width:60%;
	background-color:white;
	padding:20px;
	padding-top:10px;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
	background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.8)), url("https://i.pngimg.me/image_by_url?url=https://image.freepik.com/free-photo/doctor-with-a-stethoscope-in-the-hands-and-hospital-background_1423-1.jpg");
	background-size:cover;
}

.container::before {
    opacity:0.1;
}
h1
{
	color:darkblue;
	font-weight:900;
	font-size:45px;
}
.col-sm-6
{
	height:70px;
}
.gender
{
	font-size:20px;
	padding-top:3px;
}
</style>
<script>
function validateForm()
{
	var letters = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z])*$/;
	var phonecheck = /^[0-9]{8,10}$/;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var fname = document.getElementById("fname").value;
	var lname = document.getElementById("lname").value;
	var contact = document.getElementById("contact").value;
	var email = document.getElementById("email").value;
	
	if(fname == "" || fname == null)
	{
		var error = document.getElementById("fnameError");
		document.getElementById("fname").style.border = '1px solid red';
		error.innerHTML="Please Enter First Name";
		return false;
	}
	else if(!fname.match(letters))
	{
		var error = document.getElementById("fnameError");
		document.getElementById("fname").style.border = '1px solid red';
		error.innerHTML="Enter Alphabets Only";
		return false;
	}
	else
	{
		var error = document.getElementById("fnameError");
		document.getElementById("fname").style.border = 'none';
		error.innerHTML="";
	}
	if(lname == "" || lname == null)
	{
		var error = document.getElementById("lnameError");
		document.getElementById("lname").style.border = '1px solid red';
		error.innerHTML="Please Enter Last Name";
		return false;
	}
	else if(!lname.match(letters))
	{
		var error = document.getElementById("lnameError");
		document.getElementById("lname").style.border = '1px solid red';
		error.innerHTML="Enter Alphabets Only";
		return false;
	}
	else
	{
		var error = document.getElementById("lnameError");
		document.getElementById("lname").style.border = 'none';
		error.innerHTML="";
	}
	if(contact == "" || contact == null)
	{
		var error = document.getElementById("contactError");
		document.getElementById("contact").style.border = '1px solid red';
		error.innerHTML="Please Enter Contact";
		return false;
	}
	else if(!contact.match(phonecheck))
	{
		var error = document.getElementById("contactError");
		document.getElementById("contact").style.border = '1px solid red';
		error.innerHTML="Enter 8-10 digits Only";
		return false;
	}
	else
	{
		var error = document.getElementById("contactError");
		document.getElementById("contact").style.border = 'none';
		error.innerHTML="";
	}
	if(email == "" || email == null)
	{
		var error = document.getElementById("emailError");
		document.getElementById("email").style.border = '1px solid red';
		error.innerHTML="Please Enter Email";
		return false;
	}
	else if(!email.match(mailformat))
	{
		var error = document.getElementById("emailError");
		document.getElementById("email").style.border = '1px solid red';
		error.innerHTML="Invalid mail format";
		return false;
	}
	else
	{
		var error = document.getElementById("emailError");
		document.getElementById("email").style.border = 'none';
		error.innerHTML="";
	}

	if(document.getElementById("male").checked == false && document.getElementById("female").checked == false)
	{
		var error = document.getElementById("genderError");
		error.innerHTML="Please Select Gender";
		return false;
	}
	else
	{
		var error = document.getElementById("genderError");
		error.innerHTML="";
	}
}
</script>
<body>
<br><br>
<div class="container">
<div class="header">
<h1 class="text-center">Care Hospital</h1>
<h5 class="text-center">- Help you achieve good health -</h5>
<hr>
</div>
<h3 class="text-center"><b>Edit Patient Form</b></h3>
<br>
<form:form class="form-horizontal" method="post" action="/SpringMVCProject/editpatientsave" modelAttribute="register" onsubmit="return validateForm()">
<form:hidden  path="idregister" />
  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">First Name</label>
      <div class="col-sm-8">
        <form:input class="form-control" path="fname" id="fname"/>
        <font id="fnameError" style="color:red;"></font>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">Last Name</label>
      <div class="col-sm-8">
        <form:input class="form-control" path="lname" id="lname"/>
        <font id="lnameError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Contact</label>
      <div class="col-sm-8">
        <form:input class="form-control" path="contact" id="contact"/>
        <font id="contactError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Email</label>
      <div class="col-sm-8">
        <form:input class="form-control" path="email" id="email"/>
        <font id="emailError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Gender</label>
    <div class="col-sm-8 gender">
        <form:radiobutton path="gender" value="Male" id="male"/>Male &nbsp;&nbsp;
        <form:radiobutton path="gender" value="Female" id="female"/>Female <br>
        <font id="genderError" style="color:red;font-size:15px;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
        <br><br>
      </div>
    </div>
  </div>
  

  <div class="form-group text-center">
    <input type="submit" class="btn btn-primary waves-effect waves-ligh" value="Save Changes"/>
  </div>
</form:form>
</div>
</body>
</html>

