<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login Page</title>
<style>
body {
  margin: 0;
  padding: 0;
  background-color: transparent;
  height: 100vh;
  font-size:18px;
}
#login .container #login-row #login-column #login-box {
  margin-top: 50px;
  max-width: 600px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
  padding-top:10px;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form {
  margin-top: -85px;
}
.alert {

  /* to position it at bottom-left (dependent on the parent) */
  position: absolute;
  bottom: 4em;
  left: 2em;

  /* to position the contents within the box (ie the message text) */
  display: flex;
  justify-content: center;
  align-items: center;
  font-size:14px;

  /* to style the message box in particular ways */
  box-shadow: 4px 4px 20px rgba(0,0,0,0.3);
  width: 100%;
  max-width:290px;
 
}
</style>
<script type="text/javascript">
function validate()
{
	var role = document.getElementById("role").value;
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	
	if(role != "admin" && role != "doctor" && role != "patient")
	{
		var error = document.getElementById("roleError");
		document.getElementById("role").style.border = '1px solid red';
		error.innerHTML="Please Select Role";
		return false;
	}
	else
	{
		var error = document.getElementById("roleError");
		document.getElementById("role").style.border = 'none';
		error.innerHTML="";
	}
	
	if(username == "" || username == null)
	{
		var error = document.getElementById("usernameError");
		document.getElementById("username").style.border = '1px solid red';
		error.innerHTML="Please Enter Username";
		return false;
	}
	else
	{
		var error = document.getElementById("usernameError");
		document.getElementById("username").style.border = 'none';
		error.innerHTML="";
	}
	
	if(password == "" || password == null)
	{
		var error = document.getElementById("passwordError");
		document.getElementById("password").style.border = '1px solid red';
		error.innerHTML="Please Enter Password";
		return false;
	}
	else
	{
		var error = document.getElementById("passwordError");
		document.getElementById("password").style.border = 'none';
		error.innerHTML="";
	}
	
}
</script>
</head>
<body>
<c:if test="${not empty message}">
<div class="alert alert-danger">
    <strong>Login Failed! &nbsp;</strong><c:out value="${message}"></c:out>
  </div>
</c:if>
<div id="login">
	<div class="container">
	    <div id="login-row" class="row justify-content-center align-items-center">
	        <div id="login-column" class="col-md-6">
	            <div id="login-box" class="col-md-12">
	                <form:form action="/SpringMVCProject/userlogin" modelAttribute="login" onsubmit="return validate()">
	                    <h1 class="text-center text-info">Login</h1>
	                    <div class="form-group">
	                        <label for="role" class="text-info">Role </label>
	                        <form:select class="form-control" path="role" id="role">
	                        <option disabled selected>--Select Role--</option>
							<form:option value="admin">Admin</form:option>
							<form:option value="doctor">Doctor</form:option>
							<form:option value="patient">Patient</form:option>
							</form:select>
							<font id="roleError" style="color:red;"></font>
	                    </div>
	                    <div class="form-group">
	                        <label for="username" class="text-info">Username </label><br>
	                        <form:input class="form-control" path="username" id="username"/>
							<font id="usernameError" style="color:red;"></font>
	                    </div>
	                    <div class="form-group">
	                        <label for="password" class="text-info">Password </label><br>
	                        <form:password class="form-control" path="password" id="password"/>
	                        <font id="passwordError" style="color:red;"></font>
	                    </div>
	                    <div class="form-group">
	                       <a href="registerform" class="text-info">Not a member? Register here</a><br><br>
	                        <center><input type="submit" name="submit" class="btn btn-info btn-md" value="Login"></center>
	                    </div>
	                </form:form>
	            </div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>