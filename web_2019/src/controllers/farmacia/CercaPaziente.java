package controllers.farmacia;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		if(codice_fiscale != null) {
			PazienteDTO paziente = new PazienteDAO().getUserByCodiceFiscale(codice_fiscale);
			
			String nextPage = "/dettagliFarmacia.jsp";
			if(paziente != null) {
				request.setAttribute("paziente",paziente);
				nextPage = "/listaRicette.jsp";
				Logger.log("Paziente trovato:\n\tNome: %s\n\tCognome: %s\n\tNumero di Prescrizioni: %d", paziente.getNome(), paziente.getCognome(), paziente.getListaPrescrizioni().size());
			}
			RequestDispatcher rd = request.getRequestDispatcher("/farmacia"+nextPage);
			rd.forward(request, response);
			
		}
	}

}
