<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Esami</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/paziente/carousel_paziente.css">
<link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet"
	href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<script type="text/javascript" src="../js/popper.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/datatables.min.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
<script type="text/javascript"
	src="../js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="../js/paziente/esami_paziente.js"></script>
<script type="text/javascript" src="../js/paziente/common_esami_visite_pazienti.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="#">Nome Cognome</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Dati Personali </a></li>
				<li class="nav-item"><a class="nav-link" href="#" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Medico </a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette <span class="badge badge-pill badge-warning">4</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">2</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">5</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="../images/utente1img.jpg"></li>
				<li class="nav-item"><a class="btn btn-danger  " href="#">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
	<div class="container"
		style="border-radius: 20px; background-color: #C1D4D9">
		<h2 class="text-center">I tuoi esami</h2>
		<div class="container text-center">
			<div id="tabelle_esami" class="carousel slide">
				<ul class="carousel-indicators">
					<li id="page1" data-target="#tabelle_esami" data-slide-to="0"
						class="active"></li>
					<li id="page2" data-target="#tabelle_esami" data-slide-to="1"></li>
					<li id="page3" data-target="#tabelle_esami" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Esami prenotati</h4>
							<p class="text-light">Qui trovi gli esami che hai già
								prenotato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaEsamiPrenotati"
								class="table datatable table-striped table-hover text-center"
								style="background-color: #FFFFFF;">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data Prenotazione</th>
										<th style="vertical-align: middle">Area medica</th>
										<th style="vertical-align: middle">Tipo esame</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									
										<c:forEach items="${user.lista_esami_da_prenotare}" var="esame">
										<tr>
											<td style="vertical-align: middle">${esame.data}</td>
											<td style="vertical-align: middle">${esame.nomeEsame}</td>
											<td style="vertical-align: middle"><a href="#"
												class="btn btn-outline-info" data-toggle="modal"
												data-target="#modalDettagliEsameDaPrenotare">Dettagli</a></td>
											
										</tr>
									</c:forEach>

								
								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Esami da prenotare</h4>
							<p class="text-light">Qui trovi gli esami prescritti ma che
								non hai ancora prenotato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaEsamiDaPrenotare"
								class="table datatable table-striped table-hover text-center"
								style="background-color: #FFFFFF;">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data prescrizione</th>
										<th style="vertical-align: middle">Tipo esame</th>
										<th style="vertical-align: middle"></th>
										<th></th>
									</tr>
								</thead>
								<tbody>



									<c:forEach items="${user.lista_esami_da_prenotare}" var="esame">
										<tr>
											<td style="vertical-align: middle">${esame.data}</td>
											<td style="vertical-align: middle">${esame.nomeEsame}</td>
											<td style="vertical-align: middle"><a href="#"
												class="btn btn-outline-info" data-toggle="modal"
												data-target="#modalDettagliEsameDaPrenotare">Dettagli</a></td>
											<td style="vertical-align: middle"><a href="#"
												class="btn btn-outline-success" data-toggle="modal"
												data-target="#modalEffettuaPrenotazione">Prenota</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Esami effettuati</h4>
							<p class="text-light">Qui trovi gli esami che hai effettuato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaEsamiEffettuati"
								class="table datatable table-striped table-hover text-center"
								style="background-color: #FFFFFF; width: 100%">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data</th>
										<th style="vertical-align: middle">Area medica</th>
										<th style="vertical-align: middle">Esame</th>
										<th style="vertical-align: middle"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="vertical-align: middle">05/07/2019</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-info">Generica</span></td>
										<td style="vertical-align: middle">Radiografia</td>
										<td style="vertical-align: middle"><a href="#"
											class="btn btn-outline-info" data-toggle="modal"
											data-target="#modalEsame">Dettagli</a></td>
									</tr>
									<tr>
										<td>19/08/2019</td>
										<td><span class="badge badge-pill badge-info">Cardiologia</span></td>
										<td>Elettrocardiogramma<br></td>
										<td><a href="#" class="btn btn-outline-info"
											data-toggle="modal" data-target="#modalEsame">Dettagli</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<a class="carousel-control-prev" href="#tabelle_esami"
						data-slide="prev" style="width: 80px;"> <span
						class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#tabelle_esami"
						data-slide="next" style="width: 80px;"> <span
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		&nbsp;
	</div>
	&nbsp;
	<hr>
	&nbsp;
	<div class="text-center" style="margin-bottom: 40px;">
		<a class="btn btn-success" href="#" data-toggle="modal"
			data-target="#modalPrenotaVisitaBase">Prenota medico di base</a> <a
			class="btn btn-info" href="#">Torna alla home</a>
	</div>
	&nbsp;
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
	<div class="modal fade modalPrenotazione" id="modalPrenotazioneEsame">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Dettagli prenotazione esame</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Area medica</p>
						</h5>
						<h5>Dermatologia</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Luogo</p>
						</h5>
						<h5>Ospedale S. Maria, Rovereto</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Esame</p>
						</h5>
						<h5>Controllo nei</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data e ora prenotazione</p>
						</h5>
						<h5>23/04/2019 13:30</h5>
						<a href="#" data-toggle="modal"
							data-target="#modalCancellazionePrenotazione"
							class="btn btn-danger">Annulla prenotazione</a>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<h6 class="badge text-dark badgeNumeroVisitaEsame">Codice
						esame: 1223456599843882</h6>
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
					<h4 class="modal-title">Dettagli Esame</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Esame</p>
						</h5>
						<h5>Colonscopia</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Area medica</p>
						</h5>
						<h5>Generica</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data</p>
						</h5>
						<h5>23/04/2019</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Referto</p>
						</h5>
						<p class="card-body text-left"
							style="border-style: solid; border-radius: 20px;">
							kjljlkjljljljljluhihihhih.hih hu hiuihihpuhiuh iuh . uihih iuh
							iuilh7yo8 y ugihiuih iuh puih hul òoòjh òhlk. hiuh</p>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Ticket</p>
						</h5>
						<a href="#" class="btn btn-success">Scarica ticket</a>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<h6 class="badge badgeNumeroVisitaEsame">Codice esame:
						1223456599843882</h6>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalCancellazionePrenotazione">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Cancella prenotazione</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<h5 class="bg-warning text-center"
						style="border-radius: 20px; padding: 10px;">Sei sicuro di
						voler cancellare questa prenotazione?</h5>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a class="btn btn-warning">Cancella prenotazione</a>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalDettagliEsameDaPrenotare">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Esame da prenotare</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px; margin-bottom: 20px;">
						<h5>
							<p class="badge badge-info">Area medica</p>
						</h5>
						<h5>Oculistica</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Tipo esame</p>
						</h5>
						<h5>Misura pressione occhio</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico prescrittore</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data prescrizione visita</p>
						</h5>
						<h5>23/04/2019</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Visita in cui è stato prescritto</p>
						</h5>
						<a class="btn btn-success text-light">Vai alla visita</a>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<h6 class="badge text-dark badgeNumeroVisitaEsame"
							style="margin-top: 10px;">Codice esame: 1223456599843882</h6>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
