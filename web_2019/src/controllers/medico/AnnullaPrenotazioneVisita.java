package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VisitaDAO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina la visita selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/medico/annullaPrenotazioneVisita")
public class AnnullaPrenotazioneVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if(id_prenotazione != null && visita_corrente!= null) {

			Boolean visita_rimossa = visita_corrente.getPaziente().getListaVisite().remove(new VisitaDAO().getById(id_prenotazione));

			if (visita_rimossa) {
				visita_corrente.getPaziente().annullaPrenotazioneVisita(id_prenotazione);
				Logger.log("rimossa prenotazione visita %d", id_prenotazione);
			}
			else
				Logger.log("Nessuna visita rimossa");
		}

		response.sendRedirect(request.getContextPath()+"/medico/visitePazienteMedicoBase.jsp");
	}

}
