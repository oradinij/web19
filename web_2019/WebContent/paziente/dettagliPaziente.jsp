<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="UTF8"%>
<%@include file="../navbar.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>

<!-- Bootstrap -->

<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css/custom.css" rel="stylesheet" type="text/css">
<link href="../css/card_hover.css" rel="stylesheet" type="text/css">

</head>
<body>
<% navbar(); %>
	<div class="container bg-faded"
		style="background-color: #C1D4D9; padding: 20px; border-radius: 20px; max-width: 50%;">
		<div class="container">
			<div class="media">
				<div class="media-body text-center" style="background-color:">
					<img class="rounded-circle " src="../images/utente1img.jpg"
						width="150" height="150" alt="user">
					<h3 class="mt-0">Il tuo medico di base</h3>
					<div class="container"
						style="border-radius: 20px; background-color: #F2F2F2; padding-bottom: 10px; padding-top: 10px;">
						<h4>Nome medico: ${user.medico.nome} ${user.medico.cognome}</h4>
						<hr>
						<h4>Telefono: ${user.medico.telefono_studio}</h4>
						<hr>
						<a class="btn btn-success" href="#">Prenota visita</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	&nbsp;
	<hr>
	<link rel="stylesheet" href="../css/normalize.min.css">
	<div class="container text-center">
		<div class="card">
			<div class="card-img">
				<img src="../images/pills.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a class="hover" href="#!">Vai alle ricette</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a href="#!">
					<h2>Ricette</h2>
					<p>Le tue prescrizioni</p>
				</a>
			</div>
		</div>
		<div class="card">
			<div class="card-img">
				<img src="../images/visit.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a href="#!">Vai alle visite</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a href="#!">
					<h2>Visite</h2>
					<p>Tutte le tue visite</p>
				</a>
			</div>
		</div>
		<div class="card">
			<div class="card-img">
				<img src="../images/exam.jpg" alt="pills" style="height: 220px;">
				<div class="overlay">
					<div class="overlay-content">
						<a href="#!">Vai agli esami</a>
					</div>
				</div>
			</div>
			<div class="card-content">
				<a href="#!">
					<h2>Esami</h2>
					<p>I tuoi esami</p>
				</a>
			</div>
		</div>
	</div>
	<hr>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<!-- robba -->
	<script type="text/javascript" id="rendered-js"
		src="../js/card_hover.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script type="text/javascript" src="../js/popper.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
</body>
</html>
