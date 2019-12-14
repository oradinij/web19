package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import web_2019.Logger;
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
		
		for (String farmaco : visita_corrente.getLista_prescrizioni()) {
			paziente.aggiugiPrescrizioneFarmaco(farmaco);
		}
		for (TipologiaEsameDTO esame : visita_corrente.getLista_esami()) {
			paziente.aggiungiPrenotazioneEsame(esame.getId_esame());
		}
		
		paziente.completaVisita(visita_corrente.getId_prenotazione_visita_corrente(), null);

		request.getSession().removeAttribute("visita_corrente");
		//TODO: messaggistica di errore
		Logger.log("Conclusione visita con id %d\n\tAggiunti %d esami e %d prescrizioni per il paziente '%s %s'", visita_corrente.getId_prenotazione_visita_corrente(),visita_corrente.getLista_esami().size(), visita_corrente.getLista_prescrizioni().size(), paziente.getNome(), paziente.getCognome());
		response.sendRedirect(request.getContextPath()+"/medico/parcoPazienti.jsp");
	}

}
