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
@WebServlet("/medico/AggiungiEsame")
public class AggiungiEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id_esame = request.getParameter("id_esame");
		
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if (id_esame!= null) {
			if(visita_corrente == null) {
				visita_corrente = new VisitaCorrente();
				request.getSession().setAttribute("visita_corrente", visita_corrente);
			}
			visita_corrente.aggiungiEsame(id_esame);
			
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

