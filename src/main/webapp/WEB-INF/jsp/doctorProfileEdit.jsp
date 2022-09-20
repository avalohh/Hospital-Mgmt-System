<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<title>Doctor Profile</title>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

</head>
<style>
body
{
	background-color: transparent;
}
.gradient-custom {
    background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));
    height:349px;
}
.edit
{
    position:absolute;
    right:50px;
}
.card
{
    width:700px;
    height:350px;
}
h1
{
	text-align:center;
}
h6, .text-muted
{
    font-size:15px;
}
.outer
{
    margin-left:auto;
    margin-right:auto;
	width:70%;
	background-color:white;
	padding:40px;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
}
.container
{
    padding-left:15%;
}
</style>
<script type="text/javascript">
function validate()
{
	var phonecheck = /^[0-9]{8,10}$/;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var contact = document.getElementById("contact").value;
	var email = document.getElementById("email").value;

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
}
</script>
<body>
<div class="outer">
<h1>Edit Profile</h1><hr>
<form:form method="post" action="doctorSaveProfile" modelAttribute="doctor" onsubmit="return validate()">
<div class="container">
<div class="row">
    <div class="col col-lg-6 mb-4 mb-lg-0">
        <div class="card mb-3" style="border-radius: .5rem;">
            <div class="row g-0">
                <div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                    <img src="https://www.nicepng.com/png/detail/128-1280406_view-user-icon-png-user-circle-icon-png.png" alt="Avatar" class="img-fluid my-5" style="width: 100px;border-radius:50px;" />
                    <h4>Dr. ${doctor.name}</h4>
                    <p>${doctor.gender}</p>
                    <i class="far fa-edit mb-5"></i>
                </div>
                
                <form:hidden path="iddoctor" />
                <div class="col-md-8">
                    <div class="card-body p-4">
                        <h4>Information</h4>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6><b>Name</b></h6>
                                <p class="text-muted">${doctor.name}</p>
                            </div>
                            <div class="col-6 mb-3">
                                <h6><b>Department</b></h6>
                                <p class="text-muted">${doctor.department}</p>
                            </div>
                        </div>
                        <h4>Contact</h4>
                        <hr class="mt-0 mb-4">
                        <div class="row pt-1">
                            <div class="col-6 mb-3">
                                <h6><b>Email</b></h6>
                                <form:input class="form-control" path="email" id="email"/>
                                <font id="emailError" style="color:red;"></font>
                            </div>
                            <div class="col-6 mb-3">
                                <h6><b>Phone</b></h6>
                            <form:input class="form-control" path="contact" id="contact"/>
                            <font id="contactError" style="color:red;"></font>
                            </div>
                        </div>
                        <div class="edit">
                            <input type="submit" class="btn btn-primary" value="Save Changes">
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
</div>
</form:form>
</div>
</body>

</html>