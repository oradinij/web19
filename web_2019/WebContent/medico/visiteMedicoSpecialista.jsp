<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Planner</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/card_hover.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">

<link href="../css/fullcalendar/core/main.css" rel="stylesheet" />

  <link href="../css/fullcalendar/list/main.css" rel="stylesheet" />

  <link href="../css/fullcalendar/timegrid/main.css" rel="stylesheet" />
  
  
<script src="../js/fullcalendar/core/main.js"></script>

<script src="../js/fullcalendar/list/main.js"></script>
  <script src="../js/fullcalendar/locale/locales-all.js"></script>


  <script src="../js/fullcalendar/interaction/main.js"></script>

  <script src="../js/fullcalendar/daygrid/main.js"></script>

  <script src="../js/fullcalendar/timegrid/main.js"></script>
  
  
  
   <script>

  document.addEventListener("DOMContentLoaded", function() {
    var calendarEl = document.getElementById("calendar");
    var initialLocaleCode = 'it';
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
    	      header: {
    	        left: 'prev,next today',
    	        center: 'title',
    	        right: 'dayGridMonth,timeGridMonth,timeGridDay,timeGridWeek ,listMonth'
    	      },
    	      titleFormat: { year: 'numeric', month: 'short', day: 'numeric' },
    	      businessHours: {
    	    	  // days of week. an array of zero-based day of week integers (0=Sunday)
    	    	  daysOfWeek: [ 1, 2, 3, 4, 5 ], // Monday - Thursday

    	    	  startTime: '09:00', // a start time (10am in this example)
    	    	  endTime: '18:00', // an end time (6pm in this example)
    	    	},
    	      locale: initialLocaleCode,
    	      buttonIcons: true, // show the prev/next text
    	      weekNumbers: false,
    	      height: 780, 
    	      navLinks: true, // can click day/week names to navigate views
    	      editable: false,
    	      eventLimit: true, // allow "more" link when too many events
    	      nowIndicator: true,
     		  events: ${result} 
     		
    });

    calendar.render();
  });

</script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item "> <a class="nav-link" onclick="loadingModal()" href="./homeMedicoSpecialista.jsp">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item"> <a class="nav-link " onclick="loadingModal()" href="./pazientiMedicoSpecialista"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti</a> </li>
      <li class="nav-item active"><a class="nav-link" onclick="loadingModal()" href="CalendarioVisiteSpecialista" role="button" aria-haspopup="true" aria-expanded="false"> Visite</a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="${user.immagine}"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
    </ul>
  </div>
</nav>
<br>



<div  style="z-index:950;margin-bottom:20px;"  class="container text-center">

    <div style="height:200px" id="calendar"></div>
      <br>
    
    
  <a onclick="loadingModal()" class="btn btn-success" href="./homeMedicoSpecialista.jsp"><i class="fa fa-home" style="vertical-align: middlel"></i> Vai alla home</a>

    
</div>
<br>


<div class="modal fade" id="loading_modal" style="border-radius:20px;">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
     
      <div class="modal-body text-center">
        
		<div class="spinner-border text-info" role="status">
 			 
		</div>
		<h5><span>Caricamento...</span></h5>
      </div>
     
    </div>
  </div>
  </div>

  <script type="text/javascript">

  function loadingModal() {
  
$('#loading_modal').modal({
    backdrop: 'static',
    keyboard: false
})


  
  }
  
</script>

<footer style="z-index:900;" class="text-center text-light">©2019 Oradini & Bertamini</footer>

</body>
</html>