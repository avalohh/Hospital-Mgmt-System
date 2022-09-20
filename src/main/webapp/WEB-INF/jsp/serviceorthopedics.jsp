<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orthopedics</title>
<style>
body{
	padding-top:30px;
    width:1100px;
    margin:auto;
}
.flex-container {
    display: flex;
	padding:30px;
	background-color:white;
	box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);
	border-radius:10px;
	background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.8)), url("https://img.freepik.com/free-photo/doctor-with-stethoscope-hands-hospital-background_1423-1.jpg?w=2000");
	background-size:cover;
}
.magenta
{
	padding-top:30px;
}
.flex-child {
    flex: 1;
}  

.flex-child:first-child {
    margin-right: 175px;
} 

.flex-child p
{
	font-size:20px;
}
li
{
	margin-bottom:8px;
	font-size:18px;
}
</style>
</head>
<body>
<h1>Orthopedics</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="orthopedics" src="https://doclists.in/wp-content/uploads/2021/07/Best-Orthopedic-Surgeon-in-Pune.jpg" width="133%"/>
  </div>
  
  <div class="flex-child">
	<p>Orthopedic surgery or orthopedics, is the branch of surgery concerned with conditions involving the musculoskeletal system.
	Orthopedic surgeons use both surgical and nonsurgical means to treat musculoskeletal trauma, 
	spine diseases, sports injuries, degenerative diseases, infections, tumors, and congenital disorders.
	</p>
	
	<p>Medical and surgical treatment that our Care Hospital offers:</p>
	<ul>
		<li>Joint replacement surgeries of the hip, knee and shoulder joints</li>
		<li>Arthroscopic surgeries of various joints</li>
		<li>Ligament injuries and sports injuries</li>
		<li>Limb reconstruction, micro-vascular and hand surgery</li>
		<li>Correction of deformities of upper and lower limbs</li>
	</ul>

  </div>
  
</div>
</body>
</html>