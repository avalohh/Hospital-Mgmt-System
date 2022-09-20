<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Neurology</title>
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
<h1>Neurology</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="neurology" src="https://media.istockphoto.com/photos/neurologist-staring-at-the-patient-brain-images-picture-id1283575958?k=20&m=1283575958&s=612x612&w=0&h=MjBcP9cXL32xsRrrdqtfdtItCafSW4YBXikiaWWUzsA="/>
  </div>
  
  <div class="flex-child">
	<p>Neurology is the branch of medicine concerned with the study, diagnosis and treatment of disorders 
	related to the nervous system affecting the brain, spinal cord, nerves and other neural elements 
	such as eyes, ears skin and other Sensory Receptors.
	</p>
	
	<p>Some of the commonly encountered conditions treated by neurologists include:</p>
	<ul>
		<li>Headaches</li>
		<li>Stroke</li>
		<li>Stroke</li>
		<li>Neuromuscular Diseases</li>
		<li>Alzheimer's Disease</li>
		<li>Parkinson's Disease</li>
	</ul>

  </div>
  
</div>
</body>
</html>