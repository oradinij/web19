<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
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

	<a href="./cambiaMedico">Cambia Medico</a><br><br>
<form action="./prenotaVisita">
	<h4>Prenota una visita dal tuo medico di base</h4><br>
	<input type="date" name="data"><br>
	<input type="time" name="ora"><br>
	<input type="submit">
	</form>
	<br><br>
	<h1>Lista VISITE</h1>
	<c:forEach items="${user.listaVisite}" var="visita">
	 	Vistato in data: ${visita.data}<br>
	</c:forEach>

	<h1>Lista ESAMI</h1>
	<c:forEach items="${user.listaEsami}" var="esame">
	 	 ${esame.nomeEsame} ${esame.data}<br>
	</c:forEach>

	<h1>Lista PRESCRIZIONI</h1>
	<c:forEach items="${user.listaPrescrizioni}" var="prescrizione">
	 	 ${prescrizione.farmaco} ${prescrizione.data}<br>
	</c:forEach>
</body>
</html>