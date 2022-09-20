<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ENT</title>
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
	padding-top:24px;
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
	margin-bottom:5px;
	font-size:18px;
}
</style>
</head>
<body>
<h1>Ear, Nose and Throat</h1>

<div class="flex-container">

  <div class="flex-child magenta">
    <img alt="ent" src="https://media.istockphoto.com/photos/mature-patient-with-hearing-problem-visiting-doctor-otolaryngologist-picture-id1266812260?k=20&m=1266812260&s=612x612&w=0&h=TDpMVDFvZsKRTlUPYLUkpXBK16vIpHhOut2bpkBUq1s="/>
  </div>
  
  <div class="flex-child">
<p>Otolaryngology, more commonly known as Ear, Nose & Throat (ENT) 
is the field of medicine focused on the head and neck, the ear, nose and the throat.</p>

<p>Among the services offered by ENT Specialists at Care Hospitals include:</p>
<ul>
	<li>Otology - treatment for deafness, ear infection, facial palsy, foreign body in the ear, wax in the ear</li>
	<li>Nasal - treatment such as septoplasty, septorhinoplasty, functional endoscopic sinus surgery (FESS) for infection, polyps & tumors</li>
	<li>Oropharyngeal - tonsillectomy, snoring and sleep disorders</li>
	<li>Treatment for voice disorders</li>
	<li>Laryngoscopes for pain free noninvasive outpatient examination</li>
	<li>Screening and surgeries for head and neck cancers</li>
</ul>

  </div>
  
</div>
</body>
</html>