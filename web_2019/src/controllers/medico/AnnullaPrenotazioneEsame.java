package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EsameDAO;
import dao.VisitaDAO;
import dto.MedicoDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina la visita selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/medico/annullaPrenotazioneEsame")
public class AnnullaPrenotazioneEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");

		if(id_prenotazione != null && visita_corrente!= null) {
			
		
			try {
			
				visita_corrente.getPaziente().getListaEsami().remove(new EsameDAO().getById(id_prenotazione));
				visita_corrente.getPaziente().annullaPrenotazioneEsame(id_prenotazione);
				Logger.log("rimossa prenotazione esame %d", id_prenotazione);
			} catch (Exception e) {
				Logger.log("Nessun esame rimosso");
				
			}
				
		
		} 

		response.sendRedirect(request.getContextPath()+"/medico/esamiPazienteMedicoSpecialista.jsp");
	}

}
