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
<h1>Lista PRESCRIZIONI</h1>
	<table>
		<th>Farmaco</th>
		<th>Data e ora</th>
		<th></th>
		<c:forEach items="${paziente.listaPrescrizioni}" var="prescrizione">
			<tr>
			
				<td>${prescrizione.farmaco}</td>
				<td>${prescrizione.data}</td>
				<td>${prescrizione.farmaco}</td>
				<td>${prescrizione.bottone}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>