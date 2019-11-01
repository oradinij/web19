<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <c:forEach items= "${user.listaPazienti}" var = "paziente" >
		 <form action="DettagliPaziente">
	         Nome: ${paziente.nome}<br>
	         Codice Fiscale: ${paziente.codice_fiscale}<br>
	         Ultima visita: ${paziente.dataUltimaVisita}<br>
	         <input type="hidden" value="${paziente.id}" name="id">
	         <input type="submit" value="Dettagli">
	      </form>
      </c:forEach>
</body>
</html>