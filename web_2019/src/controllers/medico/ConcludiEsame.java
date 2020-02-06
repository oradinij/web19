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
@WebServlet("/medico/concludiEsame")	
public class ConcludiEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		PazienteDTO paziente = visita_corrente.getPaziente();
		String data = request.getParameter("data"); 
			
		
		paziente.completaEsame(visita_corrente.getId_prenotazione_esame_corrente(), visita_corrente.getEsame_corrente().getReferto(), data);
		
		VisitaCorrente nuova_visita = new VisitaCorrente();
		nuova_visita.setPaziente(paziente);
		
		request.setAttribute("visita_corrente", nuova_visita);
		//TODO: messaggistica di errore
		Logger.log("Conclusione visita con id %d\n\tAggiunti %d esami e %d prescrizioni per il paziente '%s %s'", 
				visita_corrente.getId_prenotazione_visita_corrente(),visita_corrente.getLista_esami().size(), 
				visita_corrente.getLista_prescrizioni().size(), paziente.getNome(), paziente.getCognome());
		
		
		String next_page = "/medico/esamiPazienteMedicoSpecialista.jsp";
		
		response.sendRedirect(request.getContextPath()+next_page);
	}

}
