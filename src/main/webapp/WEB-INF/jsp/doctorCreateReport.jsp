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
	width:80%;
	background-color:white;
	padding:20px;
	padding-top:10px;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
	background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.8)), url("https://img.freepik.com/free-photo/medical-report-with-medical-equipment_23-2148108970.jpg");
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
.form-group
{
	height:40px;
}
</style>
<script type="text/javascript">
function validate()
{
	var phonecheck = /^[0-9]{8,10}$/;
	var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/](0?[1-9]|1[012])[\/]\d{4}$/;
	var date = document.getElementById("date").value;
	var name = document.getElementById("name").value;
	var contact = document.getElementById("contact").value;
	var patient = document.getElementById("patient").value;
	var patientDetails = document.getElementById("patientDetails").value;
	var treatment = document.getElementById("treatment").value;

	if(date == "" || date == null)
	{
		var error = document.getElementById("dateError");
		document.getElementById("date").style.border = '1px solid red';
		error.innerHTML="Please Enter Today's date";
		return false;
	}
	else if(!date.match(dateformat))
	{
		var error = document.getElementById("dateError");
		document.getElementById("date").style.border = '1px solid red';
		error.innerHTML="Invalid date format Eg.31/12/2022";
		return false;
	}
	else
	{
		var error = document.getElementById("dateError");
		document.getElementById("date").style.border = 'none';
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
	if(name == "" || name == null)
	{
		var error = document.getElementById("nameError");
		document.getElementById("name").style.border = '1px solid red';
		error.innerHTML="Please Enter Name";
		return false;
	}
	else
	{
		var error = document.getElementById("nameError");
		document.getElementById("name").style.border = 'none';
		error.innerHTML="";
	}
	if(patient == "" || patient == null)
	{
		var error = document.getElementById("patientError");
		document.getElementById("patient").style.border = '1px solid red';
		error.innerHTML="Please Select In/Outpatient";
		return false;
	}
	else
	{
		var error = document.getElementById("patientError");
		document.getElementById("patient").style.border = 'none';
		error.innerHTML="";
	}
	if(patientDetails == "" || patientDetails == null)
	{
		var error = document.getElementById("patientDetailsError");
		document.getElementById("patientDetails").style.border = '1px solid red';
		error.innerHTML="Please enter details of patients";
		return false;
	}
	else
	{
		var error = document.getElementById("patientDetailsError");
		document.getElementById("patientDetails").style.border = 'none';
		error.innerHTML="";
	}
	if(treatment == "" || treatment == null)
	{
		var error = document.getElementById("treatmentError");
		document.getElementById("treatment").style.border = '1px solid red';
		error.innerHTML="Please enter treatment details";
		return false;
	}
	else
	{
		var error = document.getElementById("treatmentError");
		document.getElementById("treatment").style.border = 'none';
		error.innerHTML="";
	}
}
</script>
<body>
<div class="container">
<div class="header">
<h1 class="text-center">Care Hospital</h1>
<h5 class="text-center">- Help you achieve good health -</h5>
<hr>
</div>
<h3 class="text-center"><b>Patient Medical Report</b></h3>
<br>
<form:form class="form-horizontal" method="post" action="/SpringMVCProject/savereport" modelAttribute="report" onsubmit="return validate()">
  <form:hidden path="idappointment"/>
  <form:hidden path="idregister"/>
  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">Patient ID</label>
      <div class="col-sm-8">
      <input type="text" class="form-control" value="${report.idregister}" disabled="disabled">
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-4">First Name</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="${report.fname}" disabled="disabled">
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">Date</label>
      <div class="col-sm-8">
       <%  SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");%>
        <input type="text" name="date" class="form-control" value="<%= sdf.format(new Date())%>" id="date">
        <font id="dateError" style="color:red;"></font>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-4">Last Name</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="${report.lname}" disabled="disabled">
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Contact</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="${report.contact}" id="contact">
        <font id="contactError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Gender</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="${report.gender}" disabled="disabled">
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Doctor Name</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="Dr. ${report.doctorName}" id="name">
        <font id="nameError" style="color:red;"></font>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Specialist</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" value="${report.department}" disabled="disabled">
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">In/Outpatient</label>
    <div class="col-sm-8">
        <form:select class="form-control" path="inoutPatient" id="patient">
            <option value="" disabled selected>--Select--</option> 
            <form:option value="Outpatient">Outpatient</form:option>
            <form:option value="Inpatient">Inpatient</form:option>
        </form:select>
        <font id="patientError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label"></label>
    <div class="col-sm-8">
        <input type="hidden" class="form-control">
      </div>
    </div>
  </div>
  <div class="col-sm-12">
    <div class="form-group">
      <label class="control-label col-sm-2">Details of Patient</label>
      <div class="col-sm-10">
        <form:textarea class="form-control" rows="2" path="patientDetails" id="patientDetails"></form:textarea>
        <font id="patientDetailsError" style="color:red;"></font>
      </div>
    </div>
  </div>
  <div class="col-sm-12">
    <div class="form-group">
      <label class="control-label col-sm-2">Treatment Details</label>
      <div class="col-sm-10">
        <form:textarea class="form-control" rows="2" path="treatmentDetails" id="treatment"></form:textarea>
        <font id="treatmentError" style="color:red;"></font>
      </div>
    </div>
  </div>

  <div class="text-center">
  <input type="submit" class="btn btn-primary waves-effect waves-ligh" value="Save"/>
  </div>
</form:form>
</div>
</body>
</html>

