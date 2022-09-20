<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cardiology</title>
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
	padding-top:20px;
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
<h1>Cardiology</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="cardiology" src="https://media.istockphoto.com/photos/doctor-holding-heart-against-chest-picture-id531118289?k=20&m=531118289&s=612x612&w=0&h=cla_7lPdE9tkG11f2ZGPZqJMUpT1VJ-CQBgmfFkxTtA="/>
  </div>
  
  <div class="flex-child">
	<p>Cardiology is a branch of medicine that deals with disorders of the heart and the cardiovascular system. 
	 These diseases include coronary artery disease, heart rhythm problems, and heart failure.
	 Non-invasive cardiology service focus on the detection and treatment of heart disease, using external tests
	</p>
	
	<p>Services that our Care Hospital offer includes:</p>
	<ul>
		<li>Cardiac Risk Assessment & Treatment</li>
		<li>Coronary Angiogram</li>
		<li>Coronary CT</li>
		<li>MR Angiography</li>
		<li>Coronary Angioplasty</li>
		<li>Diagnosing and Treatment of Heart Disease for Adults</li>
	</ul>

  </div>
  
</div>
</body>
</html>