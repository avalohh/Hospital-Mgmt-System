<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ophthalmology</title>
<style>
body{
	padding-top:30px;
    width:1100px;
    margin:auto;
}
.flex-container {
    display: flex;
	padding:25px;
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
<h1>Ophthalmology</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="ophthalmology" src="https://media.istockphoto.com/photos/eye-doctor-with-female-patient-during-an-examination-in-modern-clinic-picture-id1189362136?k=20&m=1189362136&s=612x612&w=0&h=qYC-fuPQn96vMwPpOBWrQKpGB084FW3Ge329QKpGL6c="/>
  </div>
  
  <div class="flex-child">
	<p>Ophthalmology is the practice of medical and surgical care of the eyes and any issues related to vision. 
	Our Ophthalmology department deals with the anatomy, physiology and diseases of the eye such as blepharitis, 
	conjunctivitis, dry eye syndrome, cataracts, diabetic retinopathy, macular degeneration and retinal detachment.
	</p>
	
	<p>Services that our Care Hospital offer includes:</p>
	<ul>
		<li>Eye examinations and other basic services such as prescriptions of glasses or contact lens</li>
		<li>Diagnosis, consultation and treatment of eye conditions related to diseases such as diabetes</li>
		<li>Medical care and treatment for the eyes such as glaucoma</li>
		<li>Surgical care and treatment for the eyes such as crossed eyes and cataracts</li>
		<li>Diagnosis, consultation and treatment of retina related conditions</li>
	</ul>

  </div>
  
</div>
</body>
</html>