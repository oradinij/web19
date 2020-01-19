package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * Servlet implementation class RiepilogoVisita
 */
@WebServlet("/medico/riepilogoVisita")
public class RiepilogoVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		int id_prenotazione_corrente = Integer.parseInt(request.getParameter("id_prenotazione"));
		visita_corrente.setId_prenotazione_visita_corrente(id_prenotazione_corrente);
		Logger.log("Settata visita relativa alla prenotazione con id: %d", id_prenotazione_corrente);
		response.sendRedirect(request.getContextPath()+"/medico/riepilogoVisita.jsp");
	}

}
