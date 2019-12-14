package controllers.medico;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;
import web_2019.VisitaCorrente;

/**
 * Servlet implementation class AggiungiEsame
 */
@WebServlet("/medico/AggiungiEsame")
public class AggiungiEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String[] id_esami = request.getParameterValues("esameSelezionato");
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if (id_esami!= null) {
			if(visita_corrente == null) {
				visita_corrente = new VisitaCorrente();
				request.getSession().setAttribute("visita_corrente", visita_corrente);
			}
			visita_corrente.aggiungiEsami(id_esami);
			System.out.println(String.format("\n%s: \n\t aggiunti %d nuovi esami alla visita corrente", this.getClass().getName(), id_esami.length));
		}
		response.sendRedirect(request.getContextPath()+"/medico/dettagliPaziente.jsp");
		return;
	}
}

