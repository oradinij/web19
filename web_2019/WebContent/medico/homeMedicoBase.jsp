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
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item"> <a class="nav-link " href="#"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti</a> </li>
      <li class="nav-item"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Visite <span class="badge badge-pill badge-warning">2</span></a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="#">Logout</a> </li>
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
        <div class="overlay-content"> <a class="hover" href="./pazientiMedicoBase.jsp">Vai al parco pazienti</a> </div>
      </div>
    </div>
    <div class="card-content"> <a href="#!">
      <h2>Pazienti</h2>
      <p>I tuoi pazienti</p>
      </a> </div>
  </div>
  <div class="card">
    <div class="card-img"> <img src="../images/visit.jpg" alt="pills" style="height:220px;">
      <div class="overlay">
        <div class="overlay-content"> <a href="#!">Vai alle visite</a> </div>
      </div>
    </div>
    <div class="card-content"> <a href="#!">
      <h2>Visite</h2>
      <p>Tutte le tue visite</p>
      </a> </div>
  </div>
</div>
<hr>
<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/card_hover.js"></script>
</body>
</html>
    