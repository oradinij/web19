<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Pazienti</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/medico_base/lista_pazienti.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item"> <a class="nav-link active" href="#"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti </a> </li>
      <li class="nav-item"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Visite <span class="badge badge-pill badge-warning">2</span></a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger  " href="#">Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="text-center">
  <h2> I tuoi pazienti</h2>
</div>
<hr>
<div class="container" style="margin-bottom: 50px; padding: 20px; border-radius: 20px; background-color: #C1D4D9;"> 
  <!-- contacts card -->
  <input class="form-control" id="myInput" type="text" placeholder="Cerca un paziente..">
  &nbsp;
  <div class="card card-default" id="card_contacts">
    <div id="contacts" class="panel-collapse collapse show" aria-expanded="true" >
      <ul class="list-group striped pull-down overflow-auto" id="contact-list" style="height: 780px;">
      <c:forEach items="${user.listaPazienti}" var="paziente">
      <form id="formPaziente${paziente.id}" action="DettagliPaziente">  
       <input type="hidden" value="${paziente.id}" name="id">  
      <li class="list-group-item list-group-item-action" onclick="formPaziente${paziente.id}.submit();">
          <div class="row w-100">
            <div class="col-12 col-sm-6 col-md-3 px-0"> <img src="${paziente.foto_path}" alt="${paziente.nome} ${paziente.cognome}" class="rounded-circle mx-auto d-block img-fluid"> </div>
            <div class="col-12 col-sm-6 col-md-9 text-center text-sm-left"> <span class="fa fa-mobile fa-2x text-success float-right pulse" title="online now"></span>
              <label class="name lead">${paziente.nome} ${paziente.cognome} </label>
              <br>
              ${paziente.data_nascita}<br>
              ${paziente.codice_fiscale}<br>
              <span class="fa fa-envelope fa-fw info-testo" data-toggle="tooltip"></span> <span class="info-testo small text-truncate">email@info.it</span></div>
          </div>
        </li>
      </form>   
      </c:forEach>
      </ul>
    </div>
  </div>
</div>
<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/medico_base/cerca_paziente.js"></script>
</body>
</html>