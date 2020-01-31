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
 * prende gli esami selezionati nella pagina /medico/listaEsami.jsp e li aggiunge all'oggetto visita corrente
 */
@WebServlet("/medico/AggiungiVisita")
public class AggiungiVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] id_visite = request.getParameterValues("visite_selezionate");
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if (id_visite!= null) {
			if(visita_corrente == null) {
				visita_corrente = new VisitaCorrente();
				request.getSession().setAttribute("visita_corrente", visita_corrente);
			}
			visita_corrente.aggiungiVisite(id_visite);
			Logger.log("aggiunta %d nuove VISITE SPECIALISTICHE a visita corrente", id_visite.length);
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