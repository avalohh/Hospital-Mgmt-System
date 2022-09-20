<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<h2>Medical History</h2>
<div class="container text-center">
<c:if test="${not empty message}">
<span class="message"><c:out value="${message}"></c:out></span>
<br><br>
</c:if>
<form action="patientsearchhistory" method="post">
<table class="search">
	<tr>
		<td><input type="text" id="search" name="search" placeholder="Search ID or Department" style="width:500px;height:35px" >&nbsp;&nbsp;</td>
		<td><input type="image" src="https://cdn-icons-png.flaticon.com/512/122/122932.png" alt="search" width="40" height="40"></td>
	</tr>
</table>
</form>
<br>
<%int count = (Integer)request.getSession().getAttribute("count");
      
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
        <th class="col-xs-1">View Report</th>
    </tr>
    </thead>
    <tbody>
    
      
		<c:forEach var="app" items="${list}">
		<tr id="tr-id-2" class="tr-class-2">
	        <td>${app.idappointment}</td>
	        <td>${app.date}</td>
	        <td>${app.department}</td>
	        <td>${app.doctorName}</td>
	        <c:if test="${app.status == 'expired'}">
			<td><a href="patientviewreport/${app.idappointment}"><span class="glyphicon glyphicon-search"></span></a></td>
			</c:if>
			<c:if test="${app.status == 'cancelled'}">
			<td>Cancelled</td>
			</c:if>       
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
        <th class="col-xs-1">Department</th>
        <th class="col-xs-1">Doctor Name</th>
        <th class="col-xs-1">View Report</th>
	    </tr>
	    </thead>
	    <tbody>
	    <tr>
	    	<td class="col-xs-1" colspan="6">No history yet...</td>
	    </tr>
		</tbody>    
	</table>
      <%} %>
    
</div>
</body>
</html>

