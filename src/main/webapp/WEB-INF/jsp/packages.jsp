<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
}
.modal-content
{
	width:800px;
}

.thumbnail
{
	width:330px;
}

.thumbnail img
{
	height:230px;
	width:90%;
}

.thumbnail:hover
{
	opacity:0.5;
}

.flex-container {
    display: flex;
	padding-top:20px;
}

.flex-child {
    flex: 1;
}  

.flex-child:first-child {
    margin-right: 20px;
} 

.price
{
	font-size:25px;
}

.text
{
	font-size:15px;
}

li
{
	font-size:15px;
}

</style>
<body>

<div class="container">
  <h2>Packages</h2>
  
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   		<img alt="ct coronary" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-package-with-ct-coronary-angiogram-medicover-hospitals.jpg" data-toggle="modal"  data-target="#myModal"/>
          <div class="caption">
            <p>CT Coronary Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">CT Coronary Package</h4>
        </div>
        <div class="modal-body">
        
        <div class="flex-container">

		<div class="flex-child magenta">
		<img alt="ct coronary" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-package-with-ct-coronary-angiogram-medicover-hospitals.jpg"/>		  
		</div>
		  
		<div class="flex-child">
		<p class="price">Get tested now at RM2,550.</p>
		
		<p class="text">Get it checked with a CT Coronary Angiogram Screening today</p>
		<ul>
			<li>X-Ray Chest PA View</li>
			<li>Ultra-fast CT scan to view your heart & blood vessels</li>
			<li>Non-Invasive way to spot heart issues early</li>
			<li>Minimal exposure to radiation</li>
		</ul>
		<br><br><br><br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
           
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    
    <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   <img alt="bone checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/bone-checkup-medicover-hospitals.jpg" data-toggle="modal"  data-target="#myModal2"/>
          <div class="caption">
            <p>Bone Checkup Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Bone Checkup Package</h4>
        </div>
        <div class="modal-body">
        <div class="flex-container">

		<div class="flex-child magenta">
		<img alt="bone checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/bone-checkup-medicover-hospitals.jpg"/>
		</div>
		 
		<div class="flex-child">
		<p class="price">Get tested now at RM2,058.</p>
		
		<p class="text">Sign up for a Bone Health Screening today</p>
		<ul>
			<li>CBP (Complete Blood Picture)</li>
			<li>FBS (Fasting Blood Glucose)</li>
			<li>Ultrasound Abdomen & Pelvis</li>
			<li>Chest X-Ray</li>
			<li>Spine & Hip bone density test</li>
			<li>Consultations with Orthopedic Specialists</li>
		</ul>
		<br><br><br><br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   <img alt="basic health" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/basic-health-checkup-package-medicover-hospitals.jpg" data-toggle="modal"  data-target="#myModal3"/>
          <div class="caption">
            <p>Basic Health Checkup Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Basic Health Checkup Package</h4>
        </div>
        <div class="modal-body">
		
		<div class="flex-container">

		<div class="flex-child magenta">
           <img alt="basic health" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/basic-health-checkup-package-medicover-hospitals.jpg"/>
		</div>
		 
		<div class="flex-child">
		<p class="price">Get tested now at RM499.</p>
		
		<p class="text">For early detection and to help you achieve good health</p>
		<ul>
			<li>Medical History and Report</li>
			<li>Physical Examination</li>
			<li>Chest X-ray</li>
			<li>Resting ECG</li>
			<li>Laboratory Screening
			<ul>
				<li>Full Blood Count</li>
				<li>Liver Function Test</li>
				<li>Renal Function Test (including Fasting Glucose)</li>
			</ul></li>
		</ul>
		<br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
       
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>

<!-- second row -->
<div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   		<img alt="liver checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/liver-health-checkup-package.jpg" data-toggle="modal"  data-target="#myModal4"/>
          <div class="caption">
            <p>Liver Health Checkup Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Liver Health Checkup Package</h4>
        </div>
        <div class="modal-body">
        
        <div class="flex-container">

		<div class="flex-child magenta">
		<img alt="liver checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/liver-health-checkup-package.jpg"/>		  
		</div>
		  
		<div class="flex-child">
		<p class="price">Get tested now at RM3,120.</p>
		
		<p class="text">Sign up for liver health checkup package today</p>
		<ul>
			<li>Blood tests(Full blood count)</li>
			<li>Cholesterol profile</li>
			<li>Glucose(fasting)</li>
			<li>Liver function</li>
			<li>Hepatitis Screen</li>
			<li>Tumor markers for Liver cancer (AFP)</li>	
		</ul>
		<br><br><br><br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
           
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
    
    <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   <img alt="diabetic checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/diabetic-health-check-package-medicover-hospitals.jpg" data-toggle="modal"  data-target="#myModal5"/>
          <div class="caption">
            <p>Diabetic Health Checkup Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Diabetic Health Checkup Package</h4>
        </div>
        <div class="modal-body">
        <div class="flex-container">

		<div class="flex-child magenta">
		<img alt="diabetic checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/diabetic-health-check-package-medicover-hospitals.jpg"/>
		</div>
		 
		<div class="flex-child">
		<p class="price">Get tested now at RM250.</p>
		
		<p class="text">Control diabetes for life with us today</p>
		<ul>
			<li>Blood & Urine Test</li>
			<li>HBA1C</li>
			<li>Urine Microalbumin</li>
			<li>Visual Acuity</li>
			<li>Nutritional Assessment & Counselling</li>
			<li>Foot Care Assessment & Counselling</li>
			<li>Physician Review</li>
		</ul>
		<br><br><br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="col-md-4">
      <div class="thumbnail">
         <!-- Trigger the modal with a button -->
   <img alt="heart checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-checkup-medicover-hospitals.jpg" data-toggle="modal"  data-target="#myModal6"/>
          <div class="caption">
            <p>Heart Checkup Package</p>
          </div>
      </div>
    </div>
    
    <!-- Modal -->
  <div class="modal fade" id="myModal6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Heart Checkup Package</h4>
        </div>
        <div class="modal-body">
		
		<div class="flex-container">

		<div class="flex-child magenta">
           <img alt="heart checkup" src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-checkup-medicover-hospitals.jpg"/>
		</div>
		 
		<div class="flex-child">
		<p class="price">Get tested now at RM720.</p>
		
		<p class="text">For early detection and to help you achieve good health</p>
		<ul>
			<li>Physical Examination</li>
			<li>Echocardiogram</li>
			<li>Chest X-ray</li>
			<li>Resting ECG</li>
			<li>Laboratory Screening</li>
			<li>Treadmill Stress Tests</li>
			<li>Blood Test (Tumor Marker)</li>
			
		</ul>
		<br><br><br>
		<p class="text">Terms and conditions:</p>
		<ol>
			<li>For self-paying outpatient only</li>
			<li>Valid till further notice</li>
			<li>Please make an appointment prior visiting</li>
		</ol>
		</div>
		  
		</div>     
       
		</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
  
</div>

</body>
</html>
