<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    
<%@page import = "java.util.ArrayList" %>
<%@page import = "web_2019.Message" %>
<%!
  public void check_messages()
  {
	ArrayList<Message> lista_messaggi =(ArrayList<Message>) getServletContext().getAttribute("lista_messaggi");
	PrintWriter out = getServletContext()
	if(lista_messaggi.size()>0){
		for(Message messaggio: lista_messaggi){
			String testo = messaggio.getTesto();
			String tipo = messaggio.getTipoStr();
			if(messaggio.getTipo() == Message.SUCCESS){%>
				
				<% out.print(messaggio.get); %>
			<%!}
			if(messaggio.getTipo() == Message.SUCCESS){%>
			
			
			<%!}
			if(messaggio.getTipo() == Message.SUCCESS){%>
			
			
			<%!} //INFO
			else{%> 
			
			
			<%!}
		}
	}
   %>
   <%! } %>