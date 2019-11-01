<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<h1>Nuova prescrisione per ${paziente.nome} ${paziente.cognome }</h1>
	<br>
	<form action="./AggiungiPrescrizione">
		<textarea rows="4" cols="50" name="prescrizione"></textarea><br>
		<input type="submit" value="Salva Prescrizione">
	</form>
</body>
</html>