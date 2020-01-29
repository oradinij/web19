<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>APSS per poveri</title>
</head>
<body>
Login PAZIENTI
<!-- Bootstrap -->

<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="../css/custom.css" rel="stylesheet" type="text/css">
<link href="../css/card_hover.css" rel="stylesheet" type="text/css">

    <%@ include file="../notifica.jspf" %>
	<br>r
	<br>
	<form action="./loginPaziente">
	
		User-name:	<input type="text" name="email"><br>
		Password:	<input type="password" name="password"><br>
		Ricordami: <input type="checkbox" name = "remember_me"><br>
		<input type="submit" value="login!">
	</form>
	
	<a href="loginMedico.jsp">Login Medici</a>
</body>
</html>