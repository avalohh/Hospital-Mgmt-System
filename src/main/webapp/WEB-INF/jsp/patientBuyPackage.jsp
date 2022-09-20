<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Buy Package</title>
<style>
body {
    margin-top: 20px;
    background-color:transparent;
}

.block-7 {
    border-radius: 4px;
    margin-bottom: 10px;
    width:85%;
    padding: 0;
    overflow: hidden;
    background: #fff;
    -webkit-box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.05);
    -moz-box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.05);
    box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.05);
    -moz-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    transition: all 0.3s ease;
}

@media (max-width: 991.98px) {
    .block-7 {
        margin-top: 10px;
    }
}

.block-7 .img {
    height: 200px;
}

.block-7 .heading-2 {
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 1px;
    font-weight: 600;
}

.block-7 .price {
    margin: 0;
    padding: 0;
    display: block;
}

.block-7 .price sup {
    font-size: 20px;
    color: #b3b3b3;
}

.block-7 .price .number {
    font-size: 30px;
    font-weight: 600;
    color: #000000;
}

.block-7 .excerpt {
    margin-bottom: 0px;
    color: #00bd56;
    font-size: 16px;
    font-weight: 600;
    text-transform: uppercase;
}

.block-7 .label2 {
    text-transform: uppercase;
}

.block-7 .btn-primary {
    color: #fff;
    text-transform: uppercase;
    font-size: 12px;
    font-weight: 600;
    letter-spacing: 1px;
    width: 150px;
    margin: 0 auto;
}

.block-7 .btn-primary:hover,
.block-7 .btn-primary:focus {
    background: #00bd56 !important;
    color: #fff;
}

.block-7:hover,
.block-7:focus {
    -webkit-box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.11);
    -moz-box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.11);
    box-shadow: 0px 24px 48px -13px rgba(0, 0, 0, 0.11);
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
<head>
</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-package-with-ct-coronary-angiogram-medicover-hospitals.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">CT Coronary</span>
                        <span class="price"><sup>$</sup> <span class="number">2550</span></span>
                        
                        <a href="#myModal_1" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/bone-checkup-medicover-hospitals.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">Bone Checkup</span>
                        <span class="price"><sup>$</sup> <span class="number">2058</span></span>
                        
                        <a href="#myModal_2" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/basic-health-checkup-package-medicover-hospitals.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">Basic Health Checkup</span>
                        <span class="price"><sup>$</sup> <span class="number">499</span></span>
                        
                        <a href="#myModal_3" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
        
         <div class="row">
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/liver-health-checkup-package.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">Liver Health Checkup</span>
                        <span class="price"><sup>$</sup> <span class="number">3120</span></span>
                        
                        <a href="#myModal_4" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/diabetic-health-check-package-medicover-hospitals.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">Diabetic Health Checkup</span>
                        <span class="price"><sup>$</sup> <span class="number">250</span></span>
                        
                        <a href="#myModal_5" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate fadeInUp ftco-animated">
                <div class="block-7">
                    <div class="img"><img src="https://www.medicoverhospitals.in/preventive-health-checkups/images/heart-checkup-medicover-hospitals.jpg" height="100%" width="100%"></div>
                    <div class="text-center p-2">
                        <span class="excerpt d-block">Heart Checkup</span>
                        <span class="price"><sup>$</sup> <span class="number">720</span></span>
                        
                        <a href="#myModal_6" data-toggle="modal" class="btn btn-primary d-block px-2 py-2">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Modal -->
  <div class="modal fade" id="myModal_1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">CT Coronary Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
		<br><br>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/1" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="myModal_2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Bone Checkup Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
		<br><br>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/2" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="myModal_3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Basic Health Checkup Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/3" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="myModal_4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Liver Health Checkup Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
		<br><br>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/4" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="myModal_5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">Diabetic Health Checkup Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/5" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="myModal_6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">Heart Checkup Package</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
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
          <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger"><a href="patientbuypackage/6" title="Purchase" style='color:white;text-decoration:none;'>Purchase</a></button>

        </div>
      </div>
    </div>
  </div>
</body>
</html>