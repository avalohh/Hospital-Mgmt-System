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
	width:70%;
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
.reportid
{
    position: absolute;
    font-weight:700;
    font-size:15px;
}
.control-label
{
    color:darkblue;
}
.form
{
    position:absolute;
    top:5px;
    font-weight:600;
    font-size:16px;
}
.textarea
{
    height:40px;
}
</style>
<body><br>
<div class="container" id="print">
<div class="header">
<h1 class="text-center">Care Hospital</h1>
<div class="reportid">Report ID: ${report.idreport}</div>
<h5 class="text-center">- Help you achieve good health -</h5>
<hr>
</div>
<h3 class="text-center"><b>Patient Medical Report</b></h3>
<br>
<form:form class="form-horizontal" modelAttribute="report">
  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">Patient ID</label>
      <div class="col-sm-8">
      <p class="form">${report.idregister}</p>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-4">First Name</label>
      <div class="col-sm-8">
        <p class="form">${report.fname}</p>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="control-label col-sm-4">Date</label>
      <div class="col-sm-8">
        <p class="form">${report.date}</p>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-4">Last Name</label>
      <div class="col-sm-8">
        <p class="form">${report.lname}</p>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Contact</label>
      <div class="col-sm-8">
        <p class="form">${report.contact}</p>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Gender</label>
      <div class="col-sm-8">
        <p class="form">${report.gender}</p>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Doctor Name</label>
      <div class="col-sm-8">
        <p class="form">Dr. ${report.doctorName}</p>
      </div>
    </div>
  </div>
  
  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">Specialist</label>
      <div class="col-sm-8">
        <p class="form">${report.department}</p>
      </div>
    </div>
  </div>

  <div class="col-sm-6">
    <div class="form-group">
      <label class="col-sm-4 control-label">In/Outpatient</label>
    <div class="col-sm-8">
        <p class="form">${report.inoutPatient}</p>
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
        <div class="textarea"><p class="form">${report.patientDetails}</p></div>
      </div>
    </div>
  </div>
  <div class="col-sm-12">
    <div class="form-group">
      <label class="control-label col-sm-2">Treatment Details</label>
      <div class="col-sm-10">
        <div class="textarea"><p class="form">${report.treatmentDetails}</p>
      </div>
    </div>
  </div>
  </div>

  <div class="text-center">
    <button class="btn btn-primary waves-effect waves-light" ><a href="/SpringMVCProject/viewhistory" style='color:white;text-decoration:none;'>Back</a></button>
  </div>
</form:form>
</div>
</body>
</html>

