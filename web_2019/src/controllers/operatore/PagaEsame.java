package controllers.operatore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EsameDAO;
import dao.OperatoreDAO;
import dao.VisitaDAO;
import dto.OperatoreDTO;
import dto.PazienteDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina la visita selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/operatore/pagaEsame")
public class PagaEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OperatoreDTO user = (OperatoreDTO)request.getSession().getAttribute("user");
		
		Integer id_operatore = user.getId();

		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		
		if(id_prenotazione != null) {

			new EsameDAO().aggiornaStato(id_prenotazione, 3);
			
			user = new OperatoreDAO().getUserById(id_operatore);
			
			request.getSession().setAttribute("user",user);
			
			Logger.log("pagata prenotazione esame %d", id_prenotazione);
			} else  {
				Logger.log("Nessun esame pagato");
		};

		response.sendRedirect(request.getContextPath()+"/operatore/esamiOperatore.jsp");
		
		
	}


}