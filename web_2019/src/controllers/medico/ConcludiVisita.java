package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.PdfPrescrizione;
import web_2019.VisitaCorrente;

/**
 * Servlet implementation class ConcludiVisita
 */
@WebServlet("/medico/concludiVisita")	
public class ConcludiVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		PazienteDTO paziente = visita_corrente.getPaziente();
		String data = request.getParameter("data") + " 00:00:00"; 
		
		for (String farmaco : visita_corrente.getLista_prescrizioni()) {
			PrescrizioneDTO ultima_prescrizione = paziente.aggiugiPrescrizioneFarmaco(farmaco, visita_corrente.getId_medico(), data, visita_corrente.getId_prenotazione_visita_corrente());
			PdfPrescrizione.inviaMail(paziente, ultima_prescrizione);
		}
		for (TipologiaEsameDTO esame : visita_corrente.getLista_esami()) {
			paziente.aggiungiPrenotazioneEsame(esame.getId_esame(), visita_corrente.getId_medico(), data, visita_corrente.getId_prenotazione_visita_corrente());
		}
		for (TipologiaVisitaDTO visita : visita_corrente.getLista_visite()) {
			paziente.aggiungiPrenotazioneVisita(visita.getId_visita(), data, visita_corrente.getId_medico(), visita_corrente.getId_prenotazione_visita_corrente());
		}
		
		paziente.completaVisita(visita_corrente.getId_prenotazione_visita_corrente(), null);
		
		VisitaCorrente nuova_visita = new VisitaCorrente();
		nuova_visita.setPaziente(paziente);
		
		request.setAttribute("visita_corrente", nuova_visita);
		//TODO: messaggistica di errore
		Logger.log("Conclusione visita con id %d\n\tAggiunti %d esami e %d prescrizioni per il paziente '%s %s'", 
				visita_corrente.getId_prenotazione_visita_corrente(),visita_corrente.getLista_esami().size(), 
				visita_corrente.getLista_prescrizioni().size(), paziente.getNome(), paziente.getCognome());
		
		
		String next_page = "/medico/visitePazienteMedicoSpecialista.jsp";
		if(visita_corrente.getId_medico() == paziente.getId_medico())
			next_page = "/medico/visitePazienteMedicoBase.jsp";
		response.sendRedirect(request.getContextPath()+next_page);
	}

}
