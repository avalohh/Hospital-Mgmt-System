<!DOCTYPE html>
<html>
<head>
  <title>Admin Portal</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
body
{
	background-color:transparent;
}

div.caption
{
	font-weight:bold;
	font-size:18px;
}
div.container
{	
	width:75%;
	margin-left:300px;
	margin-right:0px;
	padding:0px;
}
.datetime
{
	position: absolute;
  	right: 20px;
}
.show_calender
{
	position: absolute;
  	right: 18px;
  	top:350px;
}
.clock{
    width: 280px;
    height: 280px;
    border-radius: 50%;
    background-color: antiquewhite;
    margin: 0px 10px 0px auto;
    position: relative;
    border:20px solid cornsilk;

}
.center{
    background-color: #000;
    position: absolute;
    left: calc(50% - 10px);
    top:  calc(50% - 10px);
    width: 20px;
    height: 20px;
    border-radius: 50%;
    z-index: 20;
}
.hourHand{
    width: 10px;
    height: 75px;
    background-color: #000;
    transform-origin: bottom center;
    border-radius: 4px;
    position: absolute;
    top: 45px;
    left: 115.5px;
    z-index: 10;
    transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    transform: rotate(360deg);

}
.minuteHand{
    width: 5px;
    height: 105px;
    background-color: #000;
    transform-origin: bottom center;
    border-radius: 4px;
    position: absolute;
    top: 15px;
    left: 117px;
    z-index: 9;
    transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    transform: rotate(90deg);

}
.secondHand{
    width: 2px;
    height: 115px;
    background-color:red;
    transform-origin: bottom center;
    border-radius: 4px;
    position: absolute;
    top: 5px;
    left: 120px;
    transition: all 0.06s;
    transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    z-index: 8;  
    transform: rotate(360deg);

}
.time{
    position: absolute;
    top: 46%;
    left: 10%;
    border: 1px solid #fff8dc;
    background-color: #fff;
    padding: 2px;
    display: block;
    box-shadow: inset 0px 2px 5px rgba(0,0,0,.4);
    border-radius: 5px;
    min-width: 75px;
    height: 20px;

}
.time small{
    color:red;
    transition: all 0.05s;
    transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
}

.clock ul{
    list-style: none;
    padding: 0;

}
.clock ul li{
    position: absolute;
    width:20px;
    height:20px;
    text-align: center;
    line-height: 20px;
    font-size: 10px;
    color:red;
}
.clock ul li:nth-child(1){
    right: 22%;
    top:6.5%;
}
.clock ul li:nth-child(2){
    right: 6%;
    top:25%;
}
.clock ul li:nth-child(3){
    right: 1%;
    top:calc(50% - 10px);
    color:#000;
    font-size: 20px;
    font-weight: bold;
}
.clock ul li:nth-child(4){
    right: 6%;
    top:69%;
}
.clock ul li:nth-child(5){
    right: 22%;
    top:84%;
}
.clock ul li:nth-child(6){
    right: calc(50% - 10px);
    top:calc(99% - 20px);
    color:#000;
    font-size: 20px;
    font-weight: bold;
}
.clock ul li:nth-child(7){
    left: 22%;
    top:84%;
}
.clock ul li:nth-child(8){
    left: 6%;
    top:69%;
}
.clock ul li:nth-child(9){
    left: 1%;
    top:calc(50% - 10px);
    color:#000;
    font-size: 20px;
    font-weight: bold;
}
.clock ul li:nth-child(10){
    left: 6%;
    top:25%;
}
.clock ul li:nth-child(11){
    left: 22%;
    top:6.5%;
}
.clock ul li:nth-child(12){
    right: calc(50% - 10px);
    top:1%;
    color:#000;
    font-size: 20px;
    font-weight: bold;
}
.calendar, .calendar_weekdays, .calendar_content {
    max-width: 300px;
}
.calendar {
    margin: auto;
    font-family:'Muli', sans-serif;
    font-weight: 400;
    background-color:white;
    padding:10px;
    border-radius:5px;

}
.calendar_content, .calendar_weekdays, .calendar_header {
    position: relative;
    overflow: hidden;
}
.calendar_weekdays div {
    display:inline-block;
    vertical-align:top;
}
.calendar_weekdays div, .calendar_content div {
    width: 14.28571%;
    overflow: hidden;
    text-align: center;
    background-color: transparent;
    color: #6f6f6f;
    font-size: 14px;
}
.calendar_content div {
    border: 1px solid transparent;
    float: left;
}
.calendar_content div:hover {
    border: 1px solid #dcdcdc;
    cursor: default;
}
.calendar_content div.blank:hover {
    cursor: default;
    border: 1px solid transparent;
}
.calendar_content div.past-date {
    color: #d5d5d5;
}
.calendar_content div.today {
    font-weight: bold;
    font-size: 14px;
    color: #87b633;
    border: 1px solid red;
}
.calendar_content div.selected {
    background-color: #f0f0f0;
}
.calendar_header {
    width: 100%;
    text-align: center;
}
.calendar_header h2 {
    padding: 0 10px;
    font-family:'Muli', sans-serif;
    font-weight: 300;
    font-size: 18px;
    color: #87b633;
    float:left;
    width:70%;
    margin: 0 0 10px;
}
button.switch-month {
    background-color: transparent;
    padding: 0;
    outline: none;
    border: none;
    color: #dcdcdc;
    float: left;
    width:15%;
    transition: color .2s;
}
button.switch-month:hover {
    color: #87b633;
}
</style>
<script type="text/javascript" language="JavaScript">
window.onload = function showTime() {

	const hourHand = document.querySelector('.hourHand');
    const minuteHand = document.querySelector('.minuteHand');
    const secondHand = document.querySelector('.secondHand');
    const time = document.querySelector('.time');
    const clock = document.querySelector('.clock');

    function setDate(){
        const today = new Date();
        
        const second = today.getSeconds();
        const secondDeg = ((second / 60) * 360) + 360; 
        secondHand.style.transform = "rotate("+secondDeg+"deg)";
        
        const minute = today.getMinutes();
        const minuteDeg = ((minute / 60) * 360); 
        minuteHand.style.transform = "rotate("+minuteDeg+"deg)";

        const hour = today.getHours();
        const hourDeg = ((hour / 12 ) * 360 ); 
        hourHand.style.transform = "rotate("+hourDeg+"deg)";
        
        time.innerHTML = '<span>' + '<strong>' + hour + '</strong>' + ' : ' + minute + ' : ' + '<small>' + second +'</small>'+ '</span>';

        }
  
    setInterval(setDate, 1000);
};

$(document).ready(function () {
    function c(passed_month, passed_year, calNum) {
        var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
        makeWeek(calendar.weekline);
        calendar.datesBody.empty();
        var calMonthArray = makeMonthArray(passed_month, passed_year);
        var r = 0;
        var u = false;
        while (!u) {
            if (daysArray[r] == calMonthArray[0].weekday) {
                u = true
            } else {
                calendar.datesBody.append('<div class="blank"></div>');
                r++;
            }
        }
        for (var cell = 0; cell < 42 - r; cell++) { // 42 date-cells in calendar
            if (cell >= calMonthArray.length) {
                calendar.datesBody.append('<div class="blank"></div>');
            } else {
                var shownDate = calMonthArray[cell].day;
                var iter_date = new Date(passed_year, passed_month, shownDate);
                if (
                (
                (shownDate != today.getDate() && passed_month == today.getMonth()) || passed_month != today.getMonth()) && iter_date < today) {
                    var m = '<div class="past-date">';
                } else {
                    var m = checkToday(iter_date) ? '<div class="today">' : "<div>";
                }
                calendar.datesBody.append(m + shownDate + "</div>");
            }
        }

        var color = "#444444";
        calendar.calHeader.find("h2").text(i[passed_month] + " " + passed_year);
        calendar.weekline.find("div").css("color", color);
        calendar.datesBody.find(".today").css("color", "#87b633");
    }

    function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
        var e = [];
        for (var r = 1; r < getDaysInMonth(passed_year, passed_month) + 1; r++) {
            e.push({
                day: r,
                // Later refactor -- weekday needed only for first week
                weekday: daysArray[getWeekdayNum(passed_year, passed_month, r)]
            });
        }
        return e;
    }

    function makeWeek(week) {
        week.empty();
        for (var e = 0; e < 7; e++) {
            week.append("<div>" + daysArray[e].substring(0, 3) + "</div>")
        }
    }

    function getDaysInMonth(currentYear, currentMon) {
        return (new Date(currentYear, currentMon + 1, 0)).getDate();
    }

    function getWeekdayNum(e, t, n) {
        return (new Date(e, t, n)).getDay();
    }

    function checkToday(e) {
        var todayDate = today.getFullYear() + '/' + (today.getMonth() + 1) + '/' + today.getDate();
        var checkingDate = e.getFullYear() + '/' + (e.getMonth() + 1) + '/' + e.getDate();
        return todayDate == checkingDate;

    }

    function getAdjacentMonth(curr_month, curr_year, direction) {
        var theNextMonth;
        var theNextYear;
        if (direction == "next") {
            theNextMonth = (curr_month + 1) % 12;
            theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
        } else {
            theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
            theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
        }
        return [theNextMonth, theNextYear];
    }

    function b() {
        today = new Date;
        year = today.getFullYear();
        month = today.getMonth();
        var nextDates = getAdjacentMonth(month, year, "next");
        nextMonth = nextDates[0];
        nextYear = nextDates[1];
    }

    var e = 480;

    var today;
    var year,
    month,
    nextMonth,
    nextYear;

    var r = [];
    var i = [
        "JANUARY",
        "FEBRUARY",
        "MARCH",
        "APRIL",
        "MAY",
        "JUNE",
        "JULY",
        "AUGUST",
        "SEPTEMBER",
        "OCTOBER",
        "NOVEMBER",
        "DECEMBER"];
    var daysArray = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"];

    var cal1 = $("#calendar_first");
    var calHeader1 = cal1.find(".calendar_header");
    var weekline1 = cal1.find(".calendar_weekdays");
    var datesBody1 = cal1.find(".calendar_content");

    var cal2 = $("#calendar_second");
    var calHeader2 = cal2.find(".calendar_header");
    var weekline2 = cal2.find(".calendar_weekdays");
    var datesBody2 = cal2.find(".calendar_content");

    var bothCals = $(".calendar");

    var switchButton = bothCals.find(".calendar_header").find('.switch-month');

    var calendars = {
        "cal1": {
            "name": "first",
                "calHeader": calHeader1,
                "weekline": weekline1,
                "datesBody": datesBody1
        },
            "cal2": {
            "name": "second",
                "calHeader": calHeader2,
                "weekline": weekline2,
                "datesBody": datesBody2
        }
    }

    var clickedElement;
    var firstClicked,
    secondClicked,
    thirdClicked;
    var firstClick = false;
    var secondClick = false;
    var selected = {};

    b();
    c(month, year, 0);
    c(nextMonth, nextYear, 1);
    switchButton.on("click", function () {
        var clicked = $(this);
        var generateCalendars = function (e) {
            var nextDatesFirst = getAdjacentMonth(month, year, e);
            var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
            month = nextDatesFirst[0];
            year = nextDatesFirst[1];
            nextMonth = nextDatesSecond[0];
            nextYear = nextDatesSecond[1];

            c(month, year, 0);
            c(nextMonth, nextYear, 1);
        };
        if (clicked.attr("class").indexOf("left") != -1) {
            generateCalendars("previous");
        } else {
            generateCalendars("next");
        }
        clickedElement = bothCals.find(".calendar_content").find("div");
    });
});
</script>

<body>
<br><br>
<div class="datetime">
<div class="clock">
        <div class="hourHand"></div>
        <div class="minuteHand"></div>
        <div class="secondHand"></div>
        <div class="center"></div>
        <div class="time"></div>
        <ul>
            <li><span>1</span></li>
            <li><span>2</span></li>
            <li><span>3</span></li>
            <li><span>4</span></li>
            <li><span>5</span></li>
            <li><span>6</span></li>
            <li><span>7</span></li>
            <li><span>8</span></li>
            <li><span>9</span></li>
            <li><span>10</span></li>
            <li><span>11</span></li>
            <li><span>12</span></li>
        </ul>
    </div>
</div>
<div class="show_calender">
<div class="calendar calendar-first" id="calendar_first">
    <div class="calendar_header">
        <button class="switch-month switch-left"> <span class="glyphicon glyphicon-menu-left" style="color:darkblue"></span></button>
         <h2></h2>
        <button class="switch-month switch-right"><span class="glyphicon glyphicon-menu-right" style="color:darkblue"></span></button>
    </div>
    <div class="calendar_weekdays"></div>
    <div class="calendar_content"></div>
</div>
</div>

<div class="container">
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
          <img src="https://us.123rf.com/450wm/andreypopov/andreypopov2107/andreypopov210700477/171480665-booking-meeting-appointment-on-laptop-computer-online.jpg?ver=6" alt="manage appointment" style="width:90%"/>
          <div class="caption">
            <p>Manage Appointment</p>
            <a href="doctorviewappointment"><span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="View Appointment">View</span></a> &nbsp;&nbsp;
            <a href="doctorviewappointment"><span class="glyphicon glyphicon-edit" data-toggle="tooltip" data-placement="bottom" title="Update Report">Report</span></a>
            
          </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
      	<a href="viewhistory">
          <img src="https://us.123rf.com/450wm/andreypopov/andreypopov2107/andreypopov210700477/171480665-booking-meeting-appointment-on-laptop-computer-online.jpg?ver=6" alt="manage appointment" style="width:90%"/>
          <div class="caption">
            <p>View Medical History</p>
            <br>
          </div>
        </a>
      </div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="doctorviewpatient/1">
          <img src="https://st.depositphotos.com/1011643/1956/i/600/depositphotos_19563899-stock-photo-medical-doctor-holding-senior-patients.jpg" alt="history" style="width:90%"/>
          <div class="caption">
            <p>View Patients</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="doctorprofile">
          <img src="https://t3.ftcdn.net/jpg/03/08/26/24/360_F_308262416_WYYGheZJOwNfkUkQLt97bucHiXAxWPLt.jpg" alt="profile" style="width:90%"/>
          <div class="caption">
            <p>Edit Profile</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>



</body>
</html>


