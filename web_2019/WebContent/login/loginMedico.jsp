<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>LoginMedico</title>
</head>
<body>
Login MEDICI
	<br>
	<br>
	<form action="./LoginMedico">
		Email:	<input type="text" name="email"><br>
		Password:	<input type="password" name="password"><br>
		Ricordami: <input type="checkbox" name = "remember_me"><br>
		<input type="submit" value="login!">
	</form>
	
	<a href="./loginPaziente.jsp">Login Pazienti</a>
	<br><br><br><br>
	<a href="../aggiungiMedico.jsp">Aggiungi Medico</a>
<body>
</body>
</html>