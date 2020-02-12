package controllers.farmacia;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dao.PazienteDAO;
import dto.PazienteDTO;
import utils.Logger;

/**
 * Servlet implementation class CercaPaziente
 */
@WebServlet("/farmacia/cercaPaziente")
public class CercaPaziente extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codice_fiscale = request.getParameter("codice_fiscale");
		
		Logger.log("Ricerca per codice fiscale: %s", codice_fiscale);
		
		PrintWriter out = response.getWriter();


			
		if(codice_fiscale != null) {
			PazienteDTO paziente = new PazienteDAO().getUserByCodiceFiscale(codice_fiscale);
			
			if(paziente!=null) {
			JsonObject result = new PazienteDAO().getUserByCodiceFiscale(codice_fiscale).toJson();
			
			
			out.print(result);
			} else
				
			out.print("");
		}
	}

}
