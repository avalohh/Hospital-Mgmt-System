<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<title>Patient Profile</title>
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
    height:319px;
}
.edit
{
    position:absolute;
    right:50px;
}
.card
{
    width:700px;
    height:320px;
}
.password
{
    background: transparent;
    border: none;
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
<body>
<c:if test="${not empty message}">
<div class="alert alert-success">
    <strong><c:out value="${message}"></c:out></strong>
</div>
</c:if>
    <div class="outer">
    <h1>Profile</h1><hr>
        <div class="container">
            <div class="row ">
                <div class="col col-lg-6 mb-4 mb-lg-0">
                    <div class="card mb-3" style="border-radius: .5rem;">
                        <div class="row g-0">
                            <div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                <img src="https://www.nicepng.com/png/detail/128-1280406_view-user-icon-png-user-circle-icon-png.png" alt="Avatar" class="img-fluid my-5" style="width: 100px;border-radius:50px;" />
                                <h4>${patient.fname} ${patient.lname}</h4>
                                <p>${patient.gender}</p>
                                <i class="far fa-edit mb-5"></i>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body p-4">
                                    <h4>Information</h4>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6><b>Username</b></h6>
                                            <p class="text-muted">${patient.username}</p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6><b>Password</b></h6>
                                            <p class="text-muted"> <input id="password-field" type="password" class="password" name="password" value="${patient.password}" disabled></p>
                                        </div>
                                    </div>
                                    <h4>Contact</h4>
                                    <hr class="mt-0 mb-4">
                                    <div class="row pt-1">
                                        <div class="col-6 mb-3">
                                            <h6><b>Email</b></h6>
                                            <p class="text-muted">${patient.email}</p>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6><b>Phone</b></h6>
                                            <p class="text-muted">${patient.contact}</p>
                                        </div>
                                    </div>
                                    <div class="edit">
                                        <a href="editpatientprofile"><span class="glyphicon glyphicon-pencil"></span>Edit</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>