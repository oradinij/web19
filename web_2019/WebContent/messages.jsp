<%@page import="java.net.HttpRetryException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>

<%@page import="java.util.ArrayList"%>
<%@page import="web_2019.Message"%>
<%!
  public void check_messages(HttpServletRequest req, HttpServletResponse res)
  {
	ArrayList<Message> lista_messaggi =(ArrayList<Message>) req.getSession().getAttribute("lista_messaggi");
	PrintWriter out = res.getWriter();
	if(lista_messaggi.size()>0){
		for(Message messaggio: lista_messaggi){
			String testo = messaggio.getTesto();
			String tipo = messaggio.getTipoStr();
			if(messaggio.getTipo() == Message.SUCCESS){%>
				<div class="alert alert-success">
					<%! out.print(messaggio.getTesto()); %>
				</div>

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