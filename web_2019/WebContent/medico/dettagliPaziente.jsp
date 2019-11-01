<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>${paziente.nome}${paziente.cognome}</title>
</head>
<body>
	<img alt="foto_profilo" src="${paziente.foto_path}">
	<br> ${paziente.nome}
	<br> ${paziente.cognome}
	<br> ${paziente.codice_fiscale}
	<br> ${paziente.data_nascita}
	<br> ${paziente.luogo_nascita}
	<br> ${paziente.sesso}
	<br>
	<br>
	<br>
	<br>
	<h1>VISITE</h1>
	<br>
	<form action="/medico/ConcludiVisita">
		<input type="submit" value="completa lisita">
	</form>
	<br>
	<c:forEach items="${paziente.listaVisite}" var="visita">
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
	<c:forEach items="${paziente.listaEsami}" var="esame">
	 	 ${esame.nomeEsame} ${esame.data}<br>
	</c:forEach>
	<br>
	<br>
	<h1>PRESCRIZIONI</h1>
	<br>
	<form action="./nuovaPrescrizione.jsp">
		<input type="submit" value="prescrivi Farmaco">
	</form>
	<c:forEach items="${paziente.listaPrescrizioni}" var="prescrizione">
	 	 ${prescrizione.farmaco} ${prescrizione.data}<br>
	</c:forEach>
</body>
</html>