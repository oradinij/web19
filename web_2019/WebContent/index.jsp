<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<!-- Bootstrap -->

<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/custom.css" rel="stylesheet" type="text/css">
<link href="./css/card_hover.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="US-ASCII">
<title>Servizio Sanitario here</title>
</head>
<body>
<%@include file="./notifica.jspf" %>
cose <br>cose <br> cose
<a href="./login/loginPaziente.jsp">Login Paziente</a>
<a href="./login/loginOperatore.jsp">Login Operatore</a>
<a href="./login/loginMedico.jsp">Login Medico</a>
<a href="./login/loginFarmacia.jsp">Login Farmacia</a>
<a href="./passwordDimenticata.jsp">Cambia password</a>
</body>
</html>