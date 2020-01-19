<%@page import="web_2019.Assets"%>
<%@page import="dto.EsameDTO"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
<title>${user.nome}${user.cognome}</title>
</head>
<body>
	<img alt="foto_profilo" src="${user.foto_path}">
	<br> ${user.nome}
	<br> ${user.cognome}
	<br> ${user.codice_fiscale}
	<br> ${user.data_nascita}
	<br> ${user.luogo_nascita}
	<br> ${user.sesso}
	<br>
	<br>
	<br>
	<br>

	<form action="./upload" method="post" enctype="multipart/form-data">
		Carica immagine profilo: <input type="file" name="file" id="file">
		<br> <input type="submit" value="upload Immagine" name="submit">
	</form>

	<a href="./cambiaMedico">Cambia Medico</a>
	<br>
	<br>
	<form action="./prenotaVisita">
		<h4>Prenota una visita dal tuo medico di base</h4>
		<br> <input type="date" name="data"><br> <input
			type="time" name="ora"><br> <input type="submit">
	</form>
	<br>
	<br>
	<h1>Lista VISITE</h1>
	<table>
		<th>data e ora</th>
		<c:forEach items="${user.listaVisite}" var="visita">
			<tr>
				<td>${visita.data}</td>
			</tr>
		</c:forEach>
	</table>
	
<h1>Lista ESAMI DA PRENOTARE</h1>
	<table>
		<th>Esame</th>
		<th>Data e ora</th>
		<c:forEach items="${user.lista_esami_da_prenotare}" var="esame">
			<tr>
				<td>${esame.nomeEsame}</td>
				<td>${esame.data}</td>
				<td>${esame.bottone}</td>
				
			</tr>
		</c:forEach>
	</table>	
<h1>Lista ESAMI PRENOTATI</h1>
	<table>
		<th>Esame</th>
		<th>Data e ora</th>
		<c:forEach items="${user.lista_esami_prenotati}" var="esame">
			<tr>
				<td>${esame.nomeEsame}</td>
				<td>${esame.data}</td>
				<td>${esame.bottone}</td>
				
			</tr>
		</c:forEach>
	</table>
	<h1>Lista ESAMI</h1>
	<table>
		<th>Esame</th>
		<th>Data e ora</th>
		<c:forEach items="${user.listaEsami}" var="esame">
			<tr>
				<td>${esame.nomeEsame}</td>
				<td>${esame.data}</td>
				<td>${esame.bottone}</td>
				
			</tr>
		</c:forEach>
	</table>

	<h1>Lista PRESCRIZIONI</h1>
	<table>
		<th>Farmaco</th>
		<th>Data e ora</th>
		<th>Download</th>
		<c:forEach items="${user.listaPrescrizioni}" var="prescrizione">
			<tr>
				<td>${prescrizione.farmaco}</td>
				<td>${prescrizione.data}</td>
				<td>
					<form action="./scaricaPrescrizione">
						<input type="hidden" value="${prescrizione.id_prescrizione}" name = "id_prescrizione">
						<input type="submit" value="scarica">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	
</body>
</html>