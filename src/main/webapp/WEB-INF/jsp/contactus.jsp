<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
<title>Contact Us</title>
<style>
body
{
	background-color:transparent;
}
.contact-image {
  height:170px;
  width:100%;
  background-size:cover;
}
.alert {
  /* to position it at bottom-left (dependent on the parent) */
  position: absolute;
  bottom: 5em;
  left: 2em;

  /* to position the contents within the box (ie the message text) */
  display: flex;
  justify-content: center;
  align-items: center;
  font-size:14px;

  /* to style the message box in particular ways */
  box-shadow: 4px 4px 20px rgba(0,0,0,0.3);
  width: 100%;
  max-width:310px;
}
</style>
<script type="text/javascript">
function validate()
{
	var letters = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z])*$/;
	var phonecheck = /^[0-9]{8,10}$/;
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var name = document.getElementById("name").value;
	var contact = document.getElementById("contact").value;
	var email = document.getElementById("email").value;
	var feedback = document.getElementById("feedback").value;

	if(name == "" || name == null)
	{
		var error = document.getElementById("nameError");
		document.getElementById("name").style.border = '1px solid red';
		error.innerHTML="Please Enter Name";
		return false;
	}
	else if(!name.match(letters))
	{
		var error = document.getElementById("nameError");
		document.getElementById("name").style.border = '1px solid red';
		error.innerHTML="Enter Alphabets Only";
		return false;
	}
	else
	{
		var error = document.getElementById("nameError");
		document.getElementById("name").style.border = 'none';
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
	if(feedback == "" || feedback == null)
	{
		var error = document.getElementById("feedbackError");
		document.getElementById("feedback").style.border = '1px solid red';
		error.innerHTML="Please Enter Feedback";
		return false;
	}
	else
	{
		var error = document.getElementById("feedbackError");
		document.getElementById("feedback").style.border = 'none';
		error.innerHTML="";
	}
}
</script>
</head>
<body>
<c:if test="${not empty message}">
<div class="alert alert-success">
    <strong><c:out value="${message}"></c:out></strong>
</div>
</c:if>
<br>
<div class="box">
<div class="container">
			<div class="row">
				<div class="col-sm text-center">
				  <h1 class="div-heading display-4">Contact US</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
				<br><br>
					<form method="post" action="submitfeedback" onsubmit="return validate()">
					  <div class="form-group">
						  <input type="name" class="form-control" id="name" name="name" placeholder="Your Full Name...">
       						<font id="nameError" style="color:red;"></font>
					  </div>
            		  <div class="form-group">
						  <input type="email" class="form-control" id="email" name="email" placeholder="Your Email Address...">
						  <font id="emailError" style="color:red;"></font>
					  </div>
					  <div class="form-group">
 						  <input type="phone" class="form-control" id="contact" name="contact" placeholder="Your Contact Number...">
 						  <font id="contactError" style="color:red;"></font>
					  </div>
            <div class="form-group">
              <textarea class="form-control" name="feedback" id="feedback" With textarea" rows="10" placeholder="Send us a message..."></textarea>
              <font id="feedbackError" style="color:red;"></font>
            </div>
					  <button type="submit" class="btn btn-warning btn-lg btn-block">Send Message</button>
					</form>
			  </div>
			  <div  class="col-md-6">
          <h4>Address: <small class="text-muted">5, Kota, Persiaran Southkey 1, Southkey, 80150 Johor Bahru, Johor</small></h4>
          <h4>Email: <small class="text-muted">carehospital@example.com</small></h4>
          <h4>Contact: <small class="text-muted">+60 6666 8888 || +60 6666 9999</small></h4>
          <p><iframe width="600" height="400" frameborder="0" style="border:0"
src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15953.804545651714!2d103.74827933955078!3d1.499985099999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da6d23bbf4a29b%3A0x322efa29ffe0dbc7!2sColumbia%20Asia%20Hospital%20-%20Tebrau!5e0!3m2!1sen!2smy!4v1662046008189!5m2!1sen!2smy" allowfullscreen></iframe></p> 
       
	  		</div>
        
			</div>
		</div>

</div>
</body>
</html>