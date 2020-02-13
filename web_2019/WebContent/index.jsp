<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Servizio sanitario</title>
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/card_hover.css">
<link rel="stylesheet" href="css/normalize.min.css">
<link rel="stylesheet" href="css/fontawesome-pro-5.12.0-web/css/all.css">

<script src="js/popper.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark"><a class="navbar-brand" href="#">Sistema gestione servizio sanitario</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
             <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
             </li>
             <li class="nav-item">
                <a class="nav-link" href="./login/login.jsp"><i class="fa fa-sign-in"></i> Login</a>
             </li>
   
          </ul>
</div>
    </nav>
   <%@ include file="../notifica.jspf" %>
    <div style="background-color:#C1D4D9" class="jumbotron jumbotron-fluid text-center">
      <h1 class="display-4">Sistema Sanitario </h1>
      <p class="lead">Sistema per gestire l'azienda provinciale per i servizi sanitari. By Francesco Bertamini e Jan Oradini</p>
      <hr class="my-4">
      <p>Per accedere al servizio effettua il login: </p>
      <p class="lead">
          <a class="btn btn-success btn-lg" href="./login/login.jsp" role="button"><i class="fa fa-sign-in"></i> Vai al Login</a>
       </p>
    </div>
    <div class="container">
       <div class="row text-center">
          <div class="col-lg-6 offset-lg-3"> Con la presenza di 5 diverse tipologie di utente, ognuno di essi può svolgere le proprie mansioni all'interno dell'ecosistema del sistema sanitario. Gli attori di questo sistema sono paziente, medico di base, medico specialista, farmacia e operatore del servizio sanitario.</div>
       </div>
      </div>



<footer style="width:100%" class="text-center text-light">©2019 Oradini & Bertamini</footer>


</body>
</html>