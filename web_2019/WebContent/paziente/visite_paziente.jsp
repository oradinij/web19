<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visite</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/paziente/carousel_paziente.css">
<link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet"
	href="../css/font-awesome-4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">


<script src="../js/paziente/common_esami_visite_pazienti.js"></script>
<script src="../js/paziente/visite_paziente.js"></script>
<script src="../js/paziente/prenota_visita_timepicker.js"></script>

<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/datatables.min.js"></script>
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/moment-with-locales.min.js"></script>
<script src="../js/tempusdominus-bootstrap-4.min.js"></script>


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
				<li class="nav-item active"><a class="nav-link" href="#"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Visite <span
						class="badge badge-pill badge-warning">2</span></a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">5</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="images/utente1img.jpg"></li>
				<li class="nav-item"><a class="btn btn-danger  " href="#">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
	<div class="container"
		style="border-radius: 20px; background-color: #C1D4D9">
		<h2 class="text-center">Le tue visite</h2>
		<div class="container text-center">
			<div id="tabelle_visite" class="carousel slide">
				<ul class="carousel-indicators">
					<li id="page1" data-target="#tabelle_visite" data-slide-to="0"
						class="active"></li>
					<li id="page2" data-target="#tabelle_visite" data-slide-to="1"></li>
					<li id="page3" data-target="#tabelle_visite" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite prenotate</h4>
							<p class="text-light">Qui trovi le visite che hai già
								prenotato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaVisitePrenotate"
								class="table datatable table-striped table-hover text-center"
								style="background-color: #FFFFFF;">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data Prenotazione</th>
										<th style="vertical-align: middle">Tipo</th>
										<th style="vertical-align: middle">Dottore</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${user.lista_visite_prenotate}" var="visita">
									<tr>
										<td style="vertical-align: middle">${visita.data}</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-secondary">${visita.nome_visita} </span></td>
										<td style="vertical-align: middle">${visita.nome_medico}</td>
										<td style="vertical-align: middle"><a href="#"
											data-toggle="modal" data-target="#modalPrenotazioneBase"
											class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite da prenotare</h4>
							<p class="text-light">Qui trovi le visite prescritte ma che
								non hai ancora prenotato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaVisiteDaPrenotare"
								class="table datatable table-striped table-hover"
								style="background-color: #FFFFFF;">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data prescrizione</th>
										<th style="vertical-align: middle">Tipo</th>
										<th style="vertical-align: middle"></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user.lista_visite_da_prenotare}" var="visita">
									<tr>
										<td style="vertical-align: middle">${visita.data}</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-secondary">${visita.nome_visita} </span></td>
										<td style="vertical-align: middle">${visita.nome_medico}</td>
										<td style="vertical-align: middle"><a href="#"
											data-toggle="modal" data-target="#modalPrenotazioneBase"
											class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite effettuate</h4>
							<p class="text-light">Qui trovi le visite che hai effettuato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaVisiteEffettuate"
								class="table datatable table-striped table-hover"
								style="background-color: #FFFFFF; width: 100%">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data</th>
										<th style="vertical-align: middle">Tipo</th>
										<th style="vertical-align: middle">Dottore</th>
										<th style="vertical-align: middle"></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${user.lista_visite_da_prenotare}" var="visita">
									<tr>
										<td style="vertical-align: middle">visita.data</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-secondary">visita.nome_visita</span></td>
										<td style="vertical-align: middle">visita.nome_medico</td>
										<td style="vertical-align: middle"><a href="#"
											class="btn btn-outline-info" data-toggle="modal"
											data-target="#modalVisitaBase">Dettagli</a></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<a class="carousel-control-prev" href="#tabelle_visite"
						data-slide="prev" style="width: 80px;"> <span
						class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#tabelle_visite"
						data-slide="next" style="width: 80px;"> <span
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		&nbsp;
	</div>
	&nbsp;
	<div class="text-center" style="margin-bottom: 40px;">
		<a class="btn btn-success" href="#" data-toggle="modal"
			data-target="#modalPrenotaVisitaBase">Prenota medico di base</a> <a
			class="btn btn-info" href="./dettagliPaziente.jsp">Torna alla home</a>
	</div>
	&nbsp;
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
	<div class="modal fade modalPrenotazione" id="modalPrenotazioneBase">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light"
					style="background-color: #205373">
					<h4 class="modal-title">Dettagli prenotazione</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" style="background-color: #C1D4D9">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Tipologia</p>
						</h5>
						<h5>Visita da medico di base</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Luogo</p>
						</h5>
						<h5>Via tal dei tali 11</h5>
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
				<div class="modal-footer text-light"
					style="background-color: #205373">
					<h6 class="badge text-dark badgeNumeroVisitaEsame"
						style="margin-top: 10px;">Codice visita: 1223456599843882</h6>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade modalPrenotazione"
		id="modalPrenotazioneSpecialistica">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Dettagli prenotazione</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Tipologia</p>
						</h5>
						<h5>Visita da medico specialista</h5>
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
							<p class="badge badge-info">Specializzazione</p>
						</h5>
						<h5>Dermatologia</h5>
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
					<h6 class="badge text-dark badgeNumeroVisitaEsame"
						style="margin-top: 10px;">Codice visita: 1223456599843882</h6>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalVisitaSpecialistica">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Dettagli visita</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Tipologia</p>
						</h5>
						<h5>Visita da medico specialista</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Tipologia</p>
						</h5>
						<h5>Dermatologia</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data e ora prenotazione</p>
						</h5>
						<h5>23/04/2019 13:30</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Luogo</p>
						</h5>
						<h5>Ospedale S. Maria di Rovereto</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Ticket</p>
						</h5>
						<a href="#" data-toggle="modal"
							data-target="#modalCancellazioneVisita1" class="btn btn-success">Scarica
							ticket</a>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Referto</p>
						</h5>
						<p class="card-body text-left"
							style="border-style: solid; border-radius: 20px;">
							kjljlkjljljljljluhihihhih.hih hu hiuihihpuhiuh iuh . uihih iuh
							iuilh7yo8 y ugihiuih iuh puih hul Ã²oÃ²jh Ã²hlk. hiuh</p>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Ricette</p>
						</h5>
						<div class="container">
							<table
								class="table datatable table-hover table-striped table-bordered  tabellaRicetteEsami">
								<thead style="">
									<tr>
										<th>Numero Ricetta</th>
										<th>Dettagli</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Esami</p>
						</h5>
						<div class="container">
							<table
								class="table  datatable table-hover table-striped table-bordered  tabellaRicetteEsami">
								<thead style="">
									<tr>
										<th>Numero Esame</th>
										<th>Dettagli</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<h6 class="badge badgeNumeroVisitaEsame">Codice visita:
						1223456599843882</h6>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalVisitaBase">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Dettagli visita</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px">
						<h5>
							<p class="badge badge-info">Tipologia</p>
						</h5>
						<h5>Visita da medico di base</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Medico</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data e ora prenotazione</p>
						</h5>
						<h5>23/04/2019 13:30</h5>
						<hr class="bg-light">

						<h5>
							<p class="badge badge-info">Ricette</p>
						</h5>
						<div class="container">
							<table
								class="table datatable table-hover table-striped table-bordered tabellaRicetteEsami">
								<thead style="">
									<tr>
										<th>Numero Ricetta</th>
										<th>Dettagli</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Esami</p>
						</h5>
						<div class="container">
							<table
								class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami">
								<thead style="">
									<tr>
										<th>Numero Esame</th>
										<th>Dettagli</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
									<tr>
										<td>123456789067677</td>
										<td><a class="btn btn-outline-info">Dettagli</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<h6 class="badge badgeNumeroVisitaEsame">Codice visita:
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
	<div class="modal fade" id="modalDettagliDaPrenotare">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light">
					<h4 class="modal-title">Visita specialistica da prenotare</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container  bg-light text-center"
						style="padding: 10px; border-radius: 20px; margin-bottom: 20px;">
						<h5>
							<p class="badge badge-info">Medico prescrittore</p>
						</h5>
						<h5>Nome Medico</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Specializzazione</p>
						</h5>
						<h5>Oculistica</h5>
						<hr class="bg-light">
						<h5>
							<p class="badge badge-info">Data prescrizione visita</p>
						</h5>
						<h5>23/04/2019</h5>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<h6 class="badge text-dark badgeNumeroVisitaEsame"
							style="margin-top: 10px;">Codice visita: 1223456599843882</h6>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalPrenotaVisitaBase">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light"
					style="background-color: #205373">
					<h4 class="modal-title">Prenotazione medico di base</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body text-center"
					style="background-color: #C1D4D9">
					<h5>Seleziona una data disponibile:</h5>
					<div class="form-group text-center container"
						style="background-color: #F2F2F2; border-radius: 20px; padding: 20px; max-width: 60%">
						<form action="#" method="post" class="text-center"
							style="display: inline-block">
							<div class="input-group date" id="datePickerVisita"
								data-target-input="nearest" style="max-width: 200px;">
								<input name="dataVisita" type="text"
									class="form-control datetimepicker-input text-center" readonly
									data-target="#datetimepickerVisita" id="dataVisita">
								<div class="input-group-append"
									data-target="#datetimepickerVisita"
									data-toggle="datetimepicker">
									<div class="input-group-text">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
							<br>
							<button type="button" class="btn text-light btn-success"
								id="bottoneScegliOra">Scegli ora</button>
						</form>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="background-color: #205373">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalSceltaOra">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header text-light"
					style="background-color: #205373">
					<h4 class="modal-title">Prenotazione medico di base</h4>
					<button type="button" class="close text-light" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body text-center"
					style="background-color: #C1D4D9">
					<h5>
						Seleziona un'ora disponibile in data <span
							class="badge text-light" id="dataSelezionata"
							style="background-color: #326173">14-10-2019</span> :
					</h5>
					<form class="text-center">
						<div class="text-left "
							style="overflow-y: scroll; height: 370px; margin-bottom: 20px;">
							<div
								class="text-left custom-control custom-radio text-light fasciaOraria">
								<input style="margin-left: 10px;" type="radio"
									class="custom-control-input" id="customRadio" name="example1"
									value="customEx" required> <label
									class="custom-control-label" for="customRadio">Custom
									radio</label>
							</div>
							<div
								class="text-left custom-control custom-radio text-light fasciaOraria">
								<input style="margin-left: 10px;" type="radio"
									class="custom-control-input" id="customRadio2" name="example1"
									value="customEx" required> <label
									class="custom-control-label" for="customRadio2">Custom
									radio</label>
							</div>
							<div
								class="text-left custom-control custom-radio text-light fasciaOraria">
								<input style="margin-left: 10px;" type="radio"
									class="custom-control-input" id="customRadio3" name="example1"
									value="customEx" required> <label
									class="custom-control-label" for="customRadio3">Custom
									radio</label>
							</div>
						</div>
						<button type="submit" class="btn btn-success">Prenota
							visita</button>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="background-color: #205373">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
