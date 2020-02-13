<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/card_hover.css">
<link rel="stylesheet" href="../css/normalize.min.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">

<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"> <a class="nav-link"  onclick="loadingModal()" href="./homeMedicoBase.jsp">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item"> <a class="nav-link "  onclick="loadingModal()" href="./pazientiMedicoBase.jsp"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti</a> </li>
      <li class="nav-item"><a class="nav-link"  onclick="loadingModal()" href="CalendarioVisiteBase" role="button" aria-haspopup="true" aria-expanded="false"> Visite</a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="${user.immagine}"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container bg-faded" style="background-color: #C1D4D9; padding:20px; border-radius: 20px; max-width: 50%;">
  <div class="text-center container" style="padding:20px; border-radius: 20px; max-width: 90%; background-color: white;">
    <div class="container">
      <div class="media">
        <div class="media-body text-center" style="background-color:  "> <img class="rounded-circle " src="${user.immagine}" width="150" height="150" alt="user">
          <h3 class="mt-0">${user.nome} ${user.cognome} </h3>
        </div>
      </div>
    </div>
  </div>
</div>
&nbsp;
<hr>
<div class="container text-center">
  <div class="card">
    <div class="card-img"> <img src="../images/people.jpg" alt="people" style="height:220px;">
      <div class="overlay">
        <div class="overlay-content"> <a onclick="loadingModal()"  href="./pazientiMedicoBase.jsp">Vai al parco pazienti</a> </div>
      </div>
    </div>
    <div class="card-content"> <a  onclick="loadingModal()"  href="./pazientiMedicoBase.jsp">
      <h2>Pazienti</h2>
      <p>I tuoi pazienti</p>
      </a> </div>
  </div>
  <div class="card">
    <div class="card-img"> <img src="../images/calendar.jpg" alt="pills" style="height:220px;">
      <div class="overlay">
        <div class="overlay-content"> <a onclick="loadingModal()" href="./CalendarioVisiteBase">Vai alle visite</a> </div>
      </div>
    </div>
    <div class="card-content"> <a  onclick="loadingModal()" href="./CalendarioVisiteBase">
      <h2>Visite</h2>
      <p>Tutte le tue visite</p>
      </a> </div>
  </div>
</div>
<hr>


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
  

<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>

</html>
    