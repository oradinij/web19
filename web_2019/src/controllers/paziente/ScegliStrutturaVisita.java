package controllers.paziente;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import dao.MedicoDAO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * prende gli esami selezionati nella pagina /medico/listaEsami.jsp e li aggiunge all'oggetto visita corrente
 */
@WebServlet("/paziente/modalPrenotaVisita")
public class ScegliStrutturaVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		String provincia = request.getParameter("provincia");
		
		
		JsonArray result = new MedicoDAO().getJsonStruttureVisita(id_prenotazione,provincia);
		
		System.out.println("Risultato: "+ result);
		
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET");
        out.print(result);
		
	}
}

