<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.controller.PatientController,com.dao.PatientDao,com.bean.Doctor"%>
<!DOCTYPE html>
<html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body{ 
    margin-top:10px; 
    background-color:transparent;
}

.container
{
	width:70%;
	font-size:20px;
	background-color:white;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	padding:40px;
	border-radius:10px;
}

.stepwizard-step p {
    margin-top: 10px;
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 25px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;

}

.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 50px;
  height: 50px;
  text-align: center;
  padding: 13px 0;
  font-size: 15px;
  line-height: 1.428571429;
  border-radius: 30px;
}

div.booking
{
	margin:auto;
	text-align:center;
}

td
{
	font-size:20px;
	padding-right:14px;
}

#package
{
	display:none;
}
#Cardiology, #Ophthalmology, #Neurology, #Urology, #Orthopedics
{
	display:none;
}
#ENT,#Cardiology, #Ophthalmology, #Neurology, #Urology, #Orthopedics
{
	height:35px;
}
.form-control 
{
	width:85%;
	font-size:18px;
}
#purpose, #department, #package, #date
{
	height:35px;
}
.nextBtn
{
	font-size:18px;
}
font
{
	font-size:15px;
}
.alert {

  /* to position it at bottom-left (dependent on the parent) */
  position: absolute;
  bottom: 2em;
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
h1
{
	color:darkblue;
	font-weight:800;
	font-size:35px;
	padding-top:0px;
}
</style>
<script>
$(document).ready(function () {
	
	var date = new Date();
	date.setDate(date.getDate());

	$('#date').datepicker({ 
	    startDate: date
	});

    var navListItems = $('div.setup-panel div a'),
            allWells = $('.setup-content'),
            allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
                $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        var purpose = document.getElementById("purpose").value;
        var department = document.getElementById("department").value;
        var pkg = document.getElementById("package").value;
        var date = document.getElementById("date").value;
        var doctor1 = document.getElementById("ENT").value;
        var doctor2 = document.getElementById("Cardiology").value;
        var doctor3 = document.getElementById("Ophthalmology").value;
        var doctor4 = document.getElementById("Neurology").value;
        var doctor5 = document.getElementById("Urology").value;
        var doctor6 = document.getElementById("Orthopedics").value;

    	if(purpose == "" || purpose == null)
    	{
    		isValid = false;
    		var error = document.getElementById("purposeError");
    		document.getElementById("purpose").style.border = '1px solid red';
    		error.innerHTML=" Please Select Purpose";
    	}
    	else
    	{
    		var error = document.getElementById("purposeError");
    		document.getElementById("purpose").style.border = 'none';
    		error.innerHTML="";
    	}
    	if(department == "" || department == null)
    	{
    		isValid = false;
    		var error = document.getElementById("deptError");
    		document.getElementById("department").style.border = '1px solid red';
    		error.innerHTML=" Please Select Department";
    	}
    	else
    	{
    		var error = document.getElementById("deptError");
    		document.getElementById("department").style.border = 'none';
    		error.innerHTML="";
    	}
    	if(date == "" || date == null)
    	{
    		isValid = false;
    		var error = document.getElementById("dateError");
    		document.getElementById("date").style.border = '1px solid red';
    		error.innerHTML=" Please Select Date";
    	}
    	else
    	{
    		var error = document.getElementById("dateError");
    		document.getElementById("date").style.border = 'none';
    		error.innerHTML="";
    	}
    	if(doctor1 == "non" && doctor2 == "non" && doctor3 == "non" && doctor4 == "non" && doctor5 == "non" && doctor6 == "non")
    	{
    		isValid = false;
    		var error = document.getElementById("doctorError");
    		document.getElementById("ENT").style.border = '1px solid red';
    		error.innerHTML=" Please Select Doctor";
    	}
    	else
    	{
    		var error = document.getElementById("doctorError");
    		document.getElementById("ENT").style.border = 'none';
    		error.innerHTML="";
    	}
    	
        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});
</script>
<script>
function validatePurpose()
{
	let packageSelect = document.getElementById('package');
	packageSelect.style.display = 'none';
	packageSelect.required = false;
	let purposeField = document.forms['updatePurpose']['purpose'];
	let selectedField = purposeField.options[purposeField.selectedIndex];
	
	if(selectedField.value != '')
	{
		let value = document.forms['updatePurpose']['value'];
		
		if(selectedField.value == 'Consultation')
		{
			document.getElementById('value').innerHTML = "Select Specialist";
			document.getElementById("pkgError").style.display='none';
			document.getElementById("department").style.display='block';
			document.getElementById("doctor").style.display='block';
			document.getElementById("ENT").style.display='block';
			document.getElementById("package").style.display='none';
		}
		else if(selectedField.value == 'Package')
		{
			document.getElementById('value').innerHTML = "Select Package";
			document.getElementById("deptError").style.display='none';
			document.getElementById("doctorError").style.display='none';
			document.getElementById("department").style.display='none';
			document.getElementById("doctor").style.display='none';
			document.getElementById("ENT").style.display='none';
			document.getElementById("Cardiology").style.display='none';
			document.getElementById("Ophthalmology").style.display='none';
			document.getElementById("Neurology").style.display='none';
			document.getElementById("Urology").style.display='none';
			document.getElementById("Orthopedics").style.display='none';
			document.getElementById('package').style.display = 'block';
		}
	}
}

function validateDept()
{
	let deptSel = document.getElementById("department");
	
	if(deptSel.value == "ENT")
	{
		document.getElementById('Cardiology').options.disabled = true;
		document.getElementById('ENT').options.disabled = false;
		document.getElementById('Ophthalmology').options.disabled = true;
		document.getElementById('Neurology').options.disabled = true;
		document.getElementById('Urology').options.disabled = true;
		document.getElementById('Orthopedics').options.disabled = true;
		
		document.getElementById('Cardiology').style.display = 'none';
		document.getElementById('ENT').style.display = 'block';
		document.getElementById('Ophthalmology').style.display = 'none';
		document.getElementById('Neurology').style.display = 'none';
		document.getElementById('Urology').style.display = 'none';
		document.getElementById('Orthopedics').style.display = 'none';
	}
	else if(deptSel.value == "Cardiology")
	{
		document.getElementById('Cardiology').options.disabled = false;
		document.getElementById('ENT').options.disabled = true;
		document.getElementById('Ophthalmology').options.disabled = true;
		document.getElementById('Neurology').options.disabled = true;
		document.getElementById('Urology').options.disabled = true;
		document.getElementById('Orthopedics').options.disabled = true;
		
		document.getElementById('Cardiology').style.display = 'block';
		document.getElementById('ENT').style.display = 'none';
		document.getElementById('Ophthalmology').style.display = 'none';
		document.getElementById('Neurology').style.display = 'none';
		document.getElementById('Urology').style.display = 'none';
		document.getElementById('Orthopedics').style.display = 'none';
	}
	else if(deptSel.value == "Ophthalmology")
	{
		document.getElementById('Cardiology').options.disabled = true;
		document.getElementById('ENT').options.disabled = true;
		document.getElementById('Ophthalmology').options.disabled = false;
		document.getElementById('Neurology').options.disabled = true;
		document.getElementById('Urology').options.disabled = true;
		document.getElementById('Orthopedics').options.disabled = true;
		document.getElementById('Cardiology').style.display = 'none';
		document.getElementById('ENT').style.display = 'none';
		document.getElementById('Ophthalmology').style.display = 'block';
		document.getElementById('Neurology').style.display = 'none';
		document.getElementById('Urology').style.display = 'none';
		document.getElementById('Orthopedics').style.display = 'none';
	}
	else if(deptSel.value == "Neurology")
	{
		document.getElementById('Cardiology').options.disabled = true;
		document.getElementById('ENT').options.disabled = true;
		document.getElementById('Ophthalmology').options.disabled = true;
		document.getElementById('Neurology').options.disabled = false;
		document.getElementById('Urology').options.disabled = true;
		document.getElementById('Orthopedics').options.disabled = true;
		document.getElementById('Cardiology').style.display = 'none';
		document.getElementById('ENT').style.display = 'none';
		document.getElementById('Ophthalmology').style.display = 'none';
		document.getElementById('Neurology').style.display = 'block';
		document.getElementById('Urology').style.display = 'none';
		document.getElementById('Orthopedics').style.display = 'none';
	}
	else if(deptSel.value == "Urology")
	{
		document.getElementById('Cardiology').options.disabled = true;
		document.getElementById('ENT').options.disabled = true;
		document.getElementById('Ophthalmology').options.disabled = true;
		document.getElementById('Neurology').options.disabled = true;
		document.getElementById('Urology').options.disabled = false;
		document.getElementById('Orthopedics').options.disabled = true;
		document.getElementById('Cardiology').style.display = 'none';
		document.getElementById('ENT').style.display = 'none';
		document.getElementById('Ophthalmology').style.display = 'none';
		document.getElementById('Neurology').style.display = 'none';
		document.getElementById('Urology').style.display = 'block';
		document.getElementById('Orthopedics').style.display = 'none';
	}
	else if(deptSel.value == "Orthopedics")
	{
		document.getElementById('Cardiology').options.disabled = true;
		document.getElementById('ENT').options.disabled = true;
		document.getElementById('Ophthalmology').options.disabled = true;
		document.getElementById('Neurology').options.disabled = true;
		document.getElementById('Urology').options.disabled = true;
		document.getElementById('Orthopedics').options.disabled = false;
		document.getElementById('Cardiology').style.display = 'none';
		document.getElementById('ENT').style.display = 'none';
		document.getElementById('Ophthalmology').style.display = 'none';
		document.getElementById('Neurology').style.display = 'none';
		document.getElementById('Urology').style.display = 'none';
		document.getElementById('Orthopedics').style.display = 'block';
	}
}	
</script>
<title>Book Appointment</title>
<head>
</head>
<body>
<c:if test="${not empty message}">
<div class="alert alert-success">
    <strong><c:out value="${message}"></c:out></strong>
</div>
</c:if>
<h1><center>Book Appointment</center></h1><br>
<div class="container">
<div class="stepwizard">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a href="#step-1" type="button" class="btn btn-primary btn-circle"><span class="glyphicon glyphicon-calendar"></span></a>
            <p>Step 1</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled"><span class="glyphicon glyphicon-user"></span></a>
            <p>Step 2</p>
        </div>
        <div class="stepwizard-step">
            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled"><span class="glyphicon glyphicon-ok"></span></a>
            <p>Step 3</p>
        </div>
    </div>
</div>
<br>
<form:form name="updatePurpose" method="post" action="/SpringMVCProject/booking" modelAttribute="appointment">
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h2> Appointment Details</h2>
                <div class="form-group">
	             	<label class="control-label">Purpose </label><font id="purposeError" style="color:red;"></font>
                    <form:select path="purpose" class="form-control" id="purpose" name="purpose" onchange="validatePurpose()" required="required">
					<option value="" disabled selected>--Select Purpose--</option>
					<form:option value="Consultation">Consultation</form:option>
					<form:option value="Package">Package</form:option>
					</form:select>
					
                </div>
                <div class="form-group">
                    <label id="value" for="value"  class="control-label">Select Specialist </label><font id="deptError" style="color:red;"></font>
                    <form:select path="department" class="form-control" id="department" name="value" onchange="validateDept()">
                    <option value="" disabled selected>--Select Department--</option>
					<form:option value="ENT">Ear, Nose, Throat(ENT)</form:option>
					<form:option value="Ophthalmology">Ophthalmology</form:option>
					<form:option value="Neurology">Neurology</form:option>
					<form:option value="Cardiology">Cardiology</form:option>
					<form:option value="Urology">Urology</form:option>
					<form:option value="Orthopedics">Orthopedics</form:option>
					</form:select>
					
				
				 <div class="form-group">
					<select id="package" name="package" class="form-control">
	             	<option value="" disabled selected>--Select Package--</option>
	             	<%List<String> packageOrder = (List<String>)request.getSession().getAttribute("packageOrder");
	             	for(String name:packageOrder)
	             	{%>
	             		<option value="<%=name%>"><%=name%></option>
	            	<%} %></select>
	            	<font id="pkgError" style="color:red;"></font>
	            </div>
					
                </div>
                <div class="form-group">
	             	<label id="doctor" class="control-label">Select Doctor </label><font id="doctorError" style="color:red;"></font>
	             	
	             	<select id="ENT" name="doctorSelect" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	             	<div id="ENT"><%List<String> list = (List<String>)request.getSession().getAttribute("ENT");
	             	for(String name:list)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
	            	<select id="Cardiology" name="doctorSelect2" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	            	<div id="Cardiology"><%List<String> list2 = (List<String>)request.getSession().getAttribute("Cardiology");
	             	for(String name:list2)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
	            	<select id="Ophthalmology" name="doctorSelect3" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	            	<div id="Ophthalmology"><%List<String> list3 = (List<String>)request.getSession().getAttribute("Ophthalmology");
	             	for(String name:list3)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
	            	<select id="Neurology" name="doctorSelect4" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	            	<div id="Neurology"><%List<String> list4 = (List<String>)request.getSession().getAttribute("Neurology");
	             	for(String name:list4)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
	            	<select id="Urology" name="doctorSelect5" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	            	<div id="Urology"><%List<String> list5 = (List<String>)request.getSession().getAttribute("Urology");
	             	for(String name:list5)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
	            	<select id="Orthopedics" name="doctorSelect6" class="form-control">
	             	<option value="non" disabled selected>--Select Doctor--</option>
	            	<div id="Orthopedics"><%List<String> list6 = (List<String>)request.getSession().getAttribute("Orthopedics");
	             	for(String name:list6)
	             	{%>
	             		<option value="<%=name%>">Dr. <%=name%></option>
	            	<%} %></div></select>
	            	
                </div>
                <div class="form-group">
	             	<label class="control-label">Date </label><font id="dateError" style="color:red;"></font>
					<form:input path="date" id="date" data-provide="datepicker" class="form-control"/>
					
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Patient Details</h3>
                
                <input name="idregister" type="hidden" value="${patient.idregister}"/>
                <div class="form-group">
                    <label class="control-label">First Name </label>
                    <input class="form-control" type="text" value="${patient.fname}" disabled="disabled"/>
                </div>
                <div class="form-group">
                    <label class="control-label">Last Name</label>
                    <input class="form-control" type="text" value="${patient.lname}" disabled="disabled"/>
                </div>
                <div class="form-group">
                    <label class="control-label">Email </label>
                    <input class="form-control" type="text" value="${patient.email}" disabled="disabled"/>
                </div>
                <div class="form-group">
                    <label class="control-label">Contact </label>
                    <input class="form-control" type="text" value="${patient.contact}" disabled="disabled"/>
                </div>
                <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12">
                <h3> Submit</h3>
                <input type="submit" class="btn btn-success btn-lg pull-right" value="Book"/>
                
            </div>
        </div>
    </div>
</form:form>
</div>
</body>
</html>