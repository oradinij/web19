package controllers.medico;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * Prende la prescrizione dalla pagina /medico/nuovaPrescrizione.jsp e la aggiunge all'oggetto visita corrente
 * @see VisitaCorrente
 */
@WebServlet("/medico/AggiungiPrescrizione")
public class AggiungiPrescrizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String farmaco = request.getParameter("prescrizione");
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if (farmaco!= null) {
			request.getSession().setAttribute("visita_corrente", visita_corrente);
			visita_corrente.aggiungiPrescrizione(farmaco);
			Logger.log("aggiunto farmaco \" %s \" alla visita corrente", farmaco);
		}
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET");
        out.print(visita_corrente.toJson());
		return;
	}

}
