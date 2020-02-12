<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Insert title here</title>
</head>
<body>
cambia la tua password

<form action="./richiediCambioPassword" method="post" onsubmit="alert('ti e' stata inviata una mail per il recupero della password!');">
	per che tipo di account desideri recuperare la password?<br>
	<input type="radio" name="tipologia_utente" value="0" required="required">Sono un paziente<br>
	<input type="radio" name="tipologia_utente" value="1" required="required">Sono un medico<br>
	<input type="radio" name="tipologia_utente" value="2" required="required">Sono una farmacia<br>
	<input type="radio" name="tipologia_utente" value="3" required="required">Sono un operatore<br>
	<br><br>
	email: <input type="email" required="required" name = "email">
	<input type = "submit" value = "richiedi cambio password">
	
	
</form>
</body>
</html>