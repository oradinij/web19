<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>${visita_corrente.paziente.nome}${visita_corrente.paziente.cognome}</title>
</head>
<body>
	<img alt="foto_profilo" src="${visita_corrente.paziente.foto_path}">
	<br> ${visita_corrente.paziente.nome}
	<br> ${visita_corrente.paziente.cognome}
	<br> ${visita_corrente.paziente.codice_fiscale}
	<br> ${visita_corrente.paziente.data_nascita}
	<br> ${visita_corrente.paziente.luogo_nascita}
	<br> ${visita_corrente.paziente.sesso}
	<br>
	<br>
	<br>
	<br>
	<h1>VISITE</h1>
	<br>
	<form action="./riepilogoVisita">
		<c:forEach items="${visita_corrente.visitePrenotate}" var="prenotazione_visita">
			<input type="radio" name="id_prenotazione" value="${prenotazione_visita.id_prenotazione}" required="required"> ${prenotazione_visita.data} <br>
		</c:forEach>
			<input type="submit" value="completa lisita">
	</form>
	<br>
	<c:forEach items="${visita_corrente.paziente.listaVisite}" var="visita">
	 	Vistato in data: ${visita.data}<br>
	</c:forEach>
	<br>
	<br>

	<h1>ESAMI</h1>
	<br>
	<form action="./ListaEsami">
		<input type="submit" value="prescrivi Esame">
	</form>
	<br>
	<c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
	 	 ${esame.nomeEsame} ${esame.data}<br>
	</c:forEach>
	<br>
	<br>
	<h1>PRESCRIZIONI</h1>
	<br>
	<form action="./nuovaPrescrizione.jsp">
		<input type="submit" value="prescrivi Farmaco">
	</form>
	<c:forEach items="${visita_corrente.paziente.listaPrescrizioni}"
		var="prescrizione">
	 	 ${prescrizione.farmaco} ${prescrizione.data}<br>
	</c:forEach>
</body>
</html>