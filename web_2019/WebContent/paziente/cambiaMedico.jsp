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

	<h2>lista medici</h2>


	<h3>Il tuo attuale medico: ${medico_corrente.email}</h3>
	TODO: inserire nel databse dei dati piu' significativi
	<br>
	<br> Scegli medico:
	<br>
	<form action="./AggiornaMedico">
		<c:forEach items="${listaMedici}" var="medico">
			<input type="radio" name="medico" id="medico" value="${medico.id}"> ${medico.email}<br>
		</c:forEach>
		<br><br>
		<input type="submit" value="cambia medico" name="submit">
	</form>
</body>
</html>