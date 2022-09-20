<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Appointments</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
body
{
	background-color:transparent;
	text-align:center;
}
.container
{
	width:80%;
	background-color:white;
	padding:40px;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
}
th
{
	text-align:center;
}

thead
{
	background-color:darkblue;
	color:white;
}
h2
{
	color:darkblue;
	font-weight:800;
	font-size:45px;
}
</style>
<body>
<h2>Appointments</h2><br>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#consultation">Consultation</a></li>
    <li><a data-toggle="tab" href="#package">Package</a></li>
  </ul>

  <div class="tab-content">
    <div id="consultation" class="tab-pane fade in active">
      <table class="table" cellspacing="0">
      <thead>
          <tr>
              <th>#</th>
              <th>Date</th>
              <th>Patient ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Department</th>
              <th>Doctor</th>
          </tr>
      </thead>
      <tbody>
          <c:forEach var="consultation" items="${consultation}">
			<tr>
			<td>${consultation.idappointment}</td>
			<td>${consultation.date}</td>
			<td>${consultation.idregister}</td>
			<td>${consultation.fname}</td>
			<td>${consultation.lname}</td>
			<td>${consultation.department}</td>
			<td>Dr. ${consultation.doctorName}</td>
			</tr>
			</c:forEach>
        </tbody>
    </table>
    </div>
    <div id="package" class="tab-pane fade">
      <table class="table" cellspacing="0">
      <thead>
          <tr>
              <th>#</th>
              <th>Date</th>
              <th>Patient ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Package Name</th>
          </tr>
      </thead>
      <tbody>
          <c:forEach var="pkg" items="${packageApp}">
			<tr>
				<td>${pkg.idappointment}</td>
				<td>${pkg.date}</td>
				<td>${pkg.idregister}</td>		
				<td>${pkg.fname}</td>
				<td>${pkg.lname}</td>
				<td>${pkg.packageName}</td>
			</tr>
			</c:forEach>
        </tbody>
    </table>
    </div>
  </div>
</div>

</body>
</html>