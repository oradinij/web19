package controllers.operatore;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@WebServlet("/operatore/pagaVisita")
public class PagaVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OperatoreDTO user = (OperatoreDTO)request.getSession().getAttribute("user");
		
		Integer id_operatore = user.getId();

		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		
		if(id_prenotazione != null) {

			new VisitaDAO().aggiornaStato(id_prenotazione, 3);
			
			user = new OperatoreDAO().getUserById(id_operatore);
			
			request.getSession().setAttribute("user",user);
			
			Logger.log("pagata prenotazione visita %d", id_prenotazione);
			} else  {
				Logger.log("Nessuna visita rimossa");
		};

		response.sendRedirect(request.getContextPath()+"/operatore/visiteOperatore.jsp");
		
		
	}


}