package controllers.paziente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VisitaDAO;
import dto.PazienteDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina la visita selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/paziente/annullaPrenotazioneVisita")
public class AnnullaPrenotazioneVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PazienteDTO user = (PazienteDTO)request.getSession().getAttribute("user");

		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		
		if(id_prenotazione != null) {

			Boolean visita_rimossa = user.getListaVisite().remove(new VisitaDAO().getById(id_prenotazione));

			if (visita_rimossa) {
				user.annullaPrenotazioneVisita(id_prenotazione);
				Logger.log("rimossa prenotazione visita %d", id_prenotazione);
			}
			else
				Logger.log("Nessuna visita rimossa");
		}

		response.sendRedirect(request.getContextPath()+"/paziente/visitePaziente.jsp");
	}

}
