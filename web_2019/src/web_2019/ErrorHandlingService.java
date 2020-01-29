package web_2019;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Logger;

@WebServlet("/ErrorHandler")

public class ErrorHandlingService extends HttpServlet {
	 
	   String testo_errore = "Oops  c'è stato un errore, riprova piu tardi";
	   public void service(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
	         
	      // Analyze the servlet exception       
	      Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
	      String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");  
	      String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
	      Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
	      
	      switch (statusCode) {
		case 404:
			testo_errore = String.format("404 Not Found <Strong>Impossibile trovare l'URL cercato: </Strong> %s", requestUri);
			break;
		case 500:
			testo_errore = String.format("500 Internal Server Error: <Strong> Oops qualcosa e' andato storto </Strong> alla pagina: %s", requestUri);
			break;

		default:
			break;
		}
	      
	      Logger.log("MESSAGGIO DI ERRORE:\n\t"
	      		+ "Status Code: %d\n\t"
	      		+ "Nome Servlet: %s\n\t"
	      		+ "Request URI: %s",
	      		statusCode, servletName, requestUri);
	     
	      if (servletName == null) servletName = "Unknown";
	      if (requestUri == null) requestUri = "Unknown";

	      request.getSession().setAttribute("notifica", new Notifica(testo_errore, Notifica.DANGER));
	      response.sendRedirect(request.getContextPath()+"/");
	   }
	}