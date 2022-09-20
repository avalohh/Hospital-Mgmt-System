<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Appointments</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>    
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
</head>
<style>
thead
{
	background-color:darkblue;
	color:white;
}
.container
{
	width:80%;
	background-color:white;
	padding:40px;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
}

body
{
	background-color: transparent;
	text-align:center;
}
th
{
	text-align:center;
}
.search
{
	margin:auto;
}
.message
{
	font-size:20px;
	color:red;
}
</style>
<body>
<h2>Appointments</h2>
<div class="container">
<c:if test="${not empty message}">
<span class="message"><c:out value="${message}"></c:out></span>
<br><br>
</c:if>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#consultation">Consultation</a></li>
    <li><a data-toggle="tab" href="#package">Package</a></li>
  </ul>

  <div class="tab-content">
    <div id="consultation" class="tab-pane fade in active">
      
      <%int count = (Integer)request.getSession().getAttribute("consultation");
      
  if(count>0)
  {%>
<table data-toggle="table" 
       data-classes="table table-hover table-condensed"
       data-striped="true"
       data-sort-name="Quality"
       data-sort-order="asc"
       >
    <thead>
    <tr>
        <th class="col-xs-1" data-field="Index" data-sortable="true">#</th>
        <th class="col-xs-1" data-field="Date" data-sortable="true">Date</th>
        <th class="col-xs-1" data-field="Department" data-sortable="true">Department</th>
        <th class="col-xs-1" data-field="Doctor_Name" data-sortable="true">Doctor Name</th>
        <th class="col-xs-1">Cancel Appointment</th>
    </tr>
    </thead>
    <tbody>
    
      
		<c:forEach var="app" items="${con}">
		<tr id="tr-id-2" class="tr-class-2">
	        <td>${app.idappointment}</td>
	        <td>${app.date}</td>
	        <td>${app.department}</td>
	        <td>${app.doctorName}</td>
	        <td><a href="#myModal_${app.idappointment}" data-toggle="modal"><span class="glyphicon glyphicon-trash"></span></a></td>
		</tr>
		
		<!-- Modal -->
		<div class="modal fade" id="myModal_${app.idappointment}" role="dialog">
		  <div class="modal-dialog">
		  
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Are you sure?</h4>
		      </div>
		      <div class="modal-body">
		      
		      <p>Do you really want to cancel the appointment? This process cannot be undone.</p>
		         
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">Back</button>
		        <button type="button" class="btn btn-danger"><a href="cancelappointment/${app.idappointment}" title="Cancel" style='color:white;text-decoration:none;'>Cancel Appointment</a></button>
		
		      </div>
		    </div>
		    
		  </div>
		</div>
		
		</c:forEach>
	</tbody>    
</table>
      <%}
      else
      {%>
      	<table class="table table-hover table-condensed">
      	<thead>
	    <tr>
	    <th class="col-xs-1">#</th>
        <th class="col-xs-1">Date</th>
        <th class="col-xs-1">Department</th>
        <th class="col-xs-1">Doctor Name</th>
        <th class="col-xs-1">Cancel Appointment</th>
	    </tr>
	    </thead>
	    <tbody>
	    <tr>
	    	<td class="col-xs-1" colspan="6">No appointment yet... <a href="bookappointment">Book appointment with us</a></td>
	    </tr>
		</tbody>    
	</table>
      <%} %>
      
    </div>
    <div id="package" class="tab-pane fade">
      <%int count2 = (Integer)request.getSession().getAttribute("packageCount");
      
  if(count2>0)
  {%>
<table data-toggle="table" 
       data-classes="table table-hover table-condensed"
       data-striped="true"
       data-sort-name="Quality"
       data-sort-order="asc"
       >
    <thead>
    <tr>
        <th class="col-xs-1" data-field="Index" data-sortable="true">#</th>
        <th class="col-xs-1" data-field="Date" data-sortable="true">Date</th>
        <th class="col-xs-1" data-field="Package_Name data-sortable="true">Package Name</th>
        <th class="col-xs-1">Cancel Appointment</th>
    </tr>
    </thead>
    <tbody>
    
      
		<c:forEach var="pkg" items="${pkg}">
		<tr id="tr-id-2" class="tr-class-2">
	        <td>${pkg.idappointment}</td>
	        <td>${pkg.date}</td>
	        <td>${pkg.packageName}</td>
	        <td><a href=""><span class="glyphicon glyphicon-search"></span></a></td>
		</tr>
		</c:forEach>
	</tbody>    
</table>
      <%}
      else
      {%>
      	<table class="table table-hover table-condensed">
      	<thead>
	    <tr>
	    <th class="col-xs-1">#</th>
        <th class="col-xs-1">Date</th>
        <th class="col-xs-1">Package Name</th>
        <th class="col-xs-1">Cancel Appointment</th>
	    </tr>
	    </thead>
	    <tbody>
	    <tr>
	    	<td class="col-xs-1" colspan="6">No appointment yet... <a href="bookappointment">Book appointment with us</a></td>
	    </tr>
		</tbody>    
	</table>
      <%} %>
    </div>
  </div>
</div>

</body>
</html>