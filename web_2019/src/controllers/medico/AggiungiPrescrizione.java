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
 * Salva la prescrizione nel database
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
			if(visita_corrente == null) {
				visita_corrente = new VisitaCorrente();
				request.getSession().setAttribute("visita_corrente", visita_corrente);
			}
			visita_corrente.aggiungiPrescrizione(farmaco);
			System.out.println(String.format("\n%s: \n\t aggiunto farmaco %s alla visita corrente", this.getClass().getName(), farmaco));
		}
		response.sendRedirect(request.getContextPath()+"/medico/dettagliPaziente.jsp");
		return;
	}

}
