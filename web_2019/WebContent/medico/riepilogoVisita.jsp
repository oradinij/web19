<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<h1>Esami:</h1>
	<c:forEach items="${visita_corrente.lista_esami}" var="esame">
		<form action="./annullaPrescrizioneEsame">
			<p>${esame.nome_esame}</p>
			<input type="hidden" name="id_esame" value="${esame.id_esame}">
			<input type="submit" value="cancella"> <br>
		</form>
	</c:forEach>
	<h1>Prescrizioni:</h1>
	<c:forEach items="${visita_corrente.lista_prescrizioni}" var="prescrizione">
		<form action="./annullaPrescrizioneFarmaco">
			<p>${prescrizione}</p>
			<input type="hidden" name="prescrizione" value="${prescrizione}">
			<input type="submit" value="cancella"> <br>
		</form>
	</c:forEach>
	<form action="./concludiVisita" method = "post"><input type="submit" value="Conferma"></form>
</body>
</html>