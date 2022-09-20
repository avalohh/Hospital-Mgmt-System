   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	background-color:black;
	color:white;
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
<h2>My Package</h2>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#live">Live</a></li>
    <li><a data-toggle="tab" href="#expired">Expired</a></li>
  </ul>

  <div class="tab-content">
    <div id="live" class="tab-pane fade in active">
    <%int live = (Integer)request.getSession().getAttribute("live");
      if(live>0)
      {%>
      <table class="table" cellspacing="0">
      <thead>
          <tr>
              <th>#</th>
              <th>Date</th>
              <th>Package Name</th>
              <th>Price</th>
              <th>Status</th>
          </tr>
      </thead>
      <tbody>
          <c:forEach var="livelist" items="${livelist}">
			<tr>
			<td>${livelist.idorder}</td>
			<td>${livelist.date}</td>
			<td>${livelist.name}</td>
			<td>$<fmt:formatNumber type = "number" minFractionDigits = "2" value = "${livelist.price}" /></td>
			<td>${livelist.status}</td>
			</tr>
			</c:forEach>
        </tbody>
    </table>
    <%} 
    else
    {%>
    <h2>LIVE package does not exist</h2>
    <a href="buypackage">Click here to view our packages</a>
    <%} %>
    </div>
    <div id="expired" class="tab-pane fade">
      <%int expired = (Integer)request.getSession().getAttribute("expired");
      if(expired>0)
      {%>
      <table class="table" cellspacing="0">
      <thead>
          <tr>
              <th>#</th>
              <th>Date</th>
              <th>Package Name</th>
              <th>Price</th>
              <th>Status</th>
          </tr>
      </thead>
      <tbody>
          <c:forEach var="exp" items="${expiredlist}">
			<tr>
			<td>${exp.idorder}</td>
			<td>${exp.date}</td>
			<td>${exp.name}</td>
			<td>${exp.price}</td>
			<td>${exp.status}</td>
			</tr>
			</c:forEach>
        </tbody>
    </table>
    <%} 
    else
    {%>
    <h2>No package EXPIRED</h2>
    <%} %>
    </div>
  </div>
</div>

</body>
</html>