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
th,tr
{
	text-align:center;
}
.search
{
	margin:auto;
}
.search tr
{
	background-color:transparent;
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
h1
{
	color:darkblue;
	font-weight:800;
	font-size:45px;
}
</style>
<body>
<h1>Doctors</h1>
<c:if test="${not empty message}">
<div class="alert alert-success">
    <strong><c:out value="${message}"></c:out></strong>
</div>
</c:if>
<c:if test="${not empty unsuccess}">
<div class="alert alert-danger">
    <strong><c:out value="${unsuccess}"></c:out></strong>
</div>
</c:if>
<br>
<div class="container text-center">
<form action="searchdoctor" method="post">
<table class="search">
	<tr>
		<td><input type="text" id="search" name="search" placeholder="Search ID or Name or Department" style="width:500px;height:35px" >&nbsp;&nbsp;</td>
		<td><input type="image" src="https://cdn-icons-png.flaticon.com/512/122/122932.png" alt="search" width="40" height="40"></td>
	</tr>
</table>
</form><br>
<table data-toggle="table" 
       data-classes="table table-hover table-condensed"
       data-striped="true"
       data-sort-name="Quality"
       data-sort-order="asc"
       >
    <thead>
    <tr>
        <th class="col-xs-1" data-field="Index" data-sortable="true">#</th>
        <th class="col-xs-1" data-field="Name" data-sortable="true">Name</th>
        <th class="col-xs-1" data-field="Email" data-sortable="true">Email</th>
        <th class="col-xs-1" data-field="Contact" data-sortable="true">Contact</th>
        <th class="col-xs-1" data-field="Department" data-sortable="true">Department</th>
        <th class="col-xs-1" data-field="Gender" data-sortable="false">Gender</th>
        <th class="col-xs-1">Edit</th>
        <th class="col-xs-1">Delete</th>
    </tr>
    </thead>
    <tbody>
    
      
		<c:forEach var="doctor" items="${list}">
		<tr id="tr-id-2" class="tr-class-2">
	        <td>${doctor.iddoctor}</td>
			<td>${doctor.name}</td>
			<td>${doctor.email}</td>
			<td>${doctor.contact}</td>
			<td>${doctor.department}</td>
			<td>${doctor.gender}</td>
			<td><a href="editdoctor/${doctor.iddoctor}"><span class="glyphicon glyphicon-pencil"></span></a></td>
			<td><a href="#myModal_${doctor.iddoctor}" data-toggle="modal"><span class="glyphicon glyphicon-trash"></span></a></td>
		</tr>
	<!-- Modal -->
		<div class="modal fade" id="myModal_${doctor.iddoctor}" role="dialog">
		  <div class="modal-dialog">
		  
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Are you sure?</h4>
		      </div>
		      <div class="modal-body">
		      
		      <p>Do you really want to delete these records? This process cannot be undone.</p>
		         
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
		        <button type="button" class="btn btn-danger"><a href="deletedoctor/${doctor.iddoctor}" title="Delete" style='color:white;text-decoration:none;'>Delete</a></button>
		
		      </div>
		    </div>
		    
		  </div>
		</div>
		</c:forEach>
	</tbody>    
</table>

</div>
</body>
</html>

