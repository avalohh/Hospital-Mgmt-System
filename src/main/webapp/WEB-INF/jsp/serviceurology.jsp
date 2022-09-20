<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urology</title>
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
	padding-top:16px;
}
.flex-child {
    flex: 1;
}  

.flex-child:first-child {
    margin-right: 20px;
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
<h1>Urology</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="urology" src="https://media.istockphoto.com/photos/human-kidney-cross-section-on-scientific-background-picture-id1090822430?k=20&m=1090822430&s=612x612&w=0&h=jdv1FAYLAoMX72sem2Y2XDiwHkwa-49Vgl25yPT7bbE="/>
  </div>
  
  <div class="flex-child">
	<p>Urology is the branch of surgery specializing in diseases and disorders of the human urinary tract, 
	kidneys and the male reproductive organs.
	Among the many urinary diseases and disorders are kidney stones, u
	reteral stones, painful bladder syndrome and urinal tract infections (UTIs).
	</p>
	
	<p>Services that our Care Hospital offers to treat conditions:</p>
	<ul>
		<li>Urination; urinary tract infections (UTIs)</li>
		<li>Hematuria</li>
		<li>Blood in the urine</li>
		<li>Incontinence</li>
		<li>Male infertility</li>
		<li>Erectile dysfunction and ejaculatory problems</li>
	</ul>

  </div>
  
</div>
</body>
</html>