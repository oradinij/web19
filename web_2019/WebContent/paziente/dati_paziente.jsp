<!DOCTYPE html5>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dati personali</title>
<link href="../css/custom.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="../js/bootstrap.js"></script>
<link rel="stylesheet" href="../css/paziente/change_picture_hover.css">
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
				<li class="nav-item active"><a class="nav-link" href="#"
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
				<li class="nav-item"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">5</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="${user.foto_path}"></li>
				<li class="nav-item"><a class="btn btn-danger  " href="#">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
	<h2 class="text-center">Il tuo profilo</h2>
	<div class="text-center">
		&nbsp;
		<div class="container"
			style="background-color: #C1D4D9; border-radius: 20px; padding: 20px; width: 80%">
			<div class="card"
				style="border-radius: 20px; padding: 10px; border-style: hidden">
				<h4 class="card-title">${user.nome}${user.cognome}</h4>
				<center>
					<div class="hovereffect">
						<img class="img-responsive" src="${user.foto_path}"
							alt="immagine_utente">
						<div class="overlay">
							<a class="info" href="#" data-toggle="modal"
								data-target="#modalCambioImmagine">Cambia immagine</a>
						</div>
					</div>
				</center>
				<div class="card-body">
					<p>
						<span class="badge text-white" style="background-color: #326173">Codice
							fiscale</span> ${user.codice_fiscale}
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Email</span>
						${user.email}
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Sesso</span>
						${user.sesso}
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Data
							di Nascita</span> ${user.data_nascita}
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Luogo
							Nascita</span> ${user.luogo_nascita}
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Telefono</span>
						Numero di telefono
					</p>
					<p>
						<span class="badge text-white" style="background-color: #326173">Indirizzo
						</span> sadadasdasd dasdas33 awdwwadawwaad
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalCambioImmagine">
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
					<h5>Seleziona un'immagine da caricare:</h5>
					<form>
						<div class="custom-file" style="width: 80%; margin: 20px;">
							<input required type="file" accept="image/*"
								class="custom-file-input" id="customFile"> <label
								class="custom-file-label" for="customFile">Scegli file</label>
						</div>
						&nbsp;
						<button type="submit" class="btn btn-success">Cambia foto</button>
					</form>
					<script type="text/javascript" src="../js/paziente/show_picture_file_name.js"></script>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer" style="background-color: #205373">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
</body>
</html>
