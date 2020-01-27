<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Esami</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/datatables.min.js"></script>
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/moment-with-locales.min.js"></script>
<script src="../js/tempusdominus-bootstrap-4.min.js"></script>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link " href="#" role="button" aria-haspopup="true" aria-expanded="false"> Pazienti </a> </li>
      <li class="nav-item"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Visite <span class="badge badge-pill badge-warning">2</span></a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="../images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger  " href="#">Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container text-center" style="background-color: #C1D4D9; border-radius: 20px; padding:20px; max-width: 70%"><img class="rounded-circle " src="../images/utente1img.jpg" width="150" height="150" alt="user" style="margin-bottom: 10px;">
  <h2>Esami di: <span class="badge badge-info">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</span></h2>
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-left" style="vertical-align: middel"></i> Torna al paziente</button>
  </form>
</div>
&nbsp;
<hr>
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Esami prescritti: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaEsamiPrescritti" class="table datatable table-striped table-hover table-light tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Esame</th>
            <th>Area</th>
            <th>Data prescrizione</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
          <tr>
            <td>${esame.nomeEsame}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.area}</span></td>
            <td style="vertical-align: middle">${esame.data}</td>
            <td style="vertical-align: middle"><a href="#" data-toggle="modal" data-target="#modalPrenotazioneEsame" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      <hr>
      <h5>Per prescrivere un nuovo esame compila una visita: </h5>
      <br>
      <button href="#" class="btn btn-success"><i class="fa fa-arrow-circle-right" style=" font-size: 20px; vertical-align: middle; padding: 5px 5px"></i> Vai alle visite del paziente</button>
    </div>
  </div>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Esami effettuati: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaEsamiEffettuati" class="table datatable table-striped table table-hover tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Esame</th>
            <th>Area</th>
            <th>Data</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td  style="vertical-align: middle">Colonscopia</td>
            <td style="vertical-align: middle">05/07/2019</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">Proctologia</span></td>
            <td style="vertical-align: middle"><a href="#" class="btn btn-outline-info" data-toggle="modal" data-target="#modalEsame"><i class="fa fa-info-circle"></i> Dettagli</a></td>
          </tr>
          <tr>
            <td  style="vertical-align: middle">Ispezione anale</td>
            <td style="vertical-align: middle">05/07/2019</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">Proctologia</span></td>
            <td style="vertical-align: middle"><a href="#" class="btn btn-outline-info" data-toggle="modal" data-target="#modalEsame"><i class="fa fa-info-circle"></i> Dettagli</a></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
&nbsp;
<div class="modal  fade" id="modalPrenotazioneEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4>Dettagli prescrizone esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Esame</p>
          </h5>
          <h5>Radiografia delle feci</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Specializzazione</p>
          </h5>
          <h5>Dermatologia</h5>
          <hr>
          <h5>
            <p class="badge badge-info">Medico prescrivente</p>
          </h5>
          <h5>Nome Medico</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5>23/01/2020</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>
          </h5>
          <a href="#" class="btn btn-success">Vai alla visita</a> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 class="badge badgeNumeroVisitaEsame" style="margin-top:10px;">Codice visita: 1223456599843882 </h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Esame</p>
          </h5>
          <h5> Colonscopia</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5> Nome Medico</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Area</p>
          </h5>
          <h5>Proctologia</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data</p>
          </h5>
          <h5>23/04/2019</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Luogo</p>
          </h5>
          <h5>Ospedale S. Maria di Rovereto</h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Referto</p>
          </h5>
          <p class="card-body text-left" style="border-style: solid; border-radius: 20px;"> kjljlkjljljljljluhihihhih.hih hu hiuihihpuhiuh iuh  . uihih iuh iuilh7yo8 y ugihiuih iuh puih hul òoòjh òhlk. hiuh </p>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Scarica referto</p>
          </h5>
          <a href="#" class="btn btn-success"><i class="fa fa-download"></i> Scarica referto</a> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 class="badge badgeNumeroVisitaEsame">Codice visita: 1223456599843882 </h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>
<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/medico_base/utils_esami_paziente_medico_base.js"></script>
</body>
</html>