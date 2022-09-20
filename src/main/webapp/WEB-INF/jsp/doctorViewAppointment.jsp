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
<h2>Appointments</h2>
<div class="container text-center">

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
        <th class="col-xs-1" data-field="Patient_ID" data-sortable="true">Patient ID</th>
        <th class="col-xs-1" data-field="Patient_fname" data-sortable="true">First Name</th>
        <th class="col-xs-1" data-field="Patient_lname" data-sortable="true">Last Name</th>
        <th class="col-xs-1">Create Report</th>
    </tr>
    </thead>
    <tbody>
    
      
		<c:forEach var="app" items="${list}">
		<tr id="tr-id-2" class="tr-class-2">
	        <td>${app.idappointment}</td>
	        <td>${app.date}</td>
	        <td>${app.idregister}</td>
	        <td>${app.fname}</td>
	        <td>${app.lname}</td>
	        <td><a href="createreport/${app.idappointment}"><span class="glyphicon glyphicon-file"></span></a></td>
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
        <th class="col-xs-1">Patient ID</th>
        <th class="col-xs-1">First Name</th>
        <th class="col-xs-1">Last Name</th>
        <th class="col-xs-1">Create Report</th>
	    </tr>
	    </thead>
	    <tbody>
	    <tr>
	    	<td class="col-xs-1" colspan="6">No appointment yet...</td>
	    </tr>
		</tbody>    
	</table>
      <%} %>
    
</div>
</body>
</html>

