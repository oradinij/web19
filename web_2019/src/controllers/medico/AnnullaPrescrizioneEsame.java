package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TipologiaEsameDTO;
import web_2019.Logger;
import web_2019.VisitaCorrente;

/**
 * Annulla la prescrizione di un esame prima del completamento di una visita
 */
@WebServlet("/medico/annullaPrescrizioneEsame")
public class AnnullaPrescrizioneEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_esame = Integer.parseInt(request.getParameter("id_esame"));
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if(id_esame != null && visita_corrente!= null) {
			TipologiaEsameDTO esame = new TipologiaEsameDTO(id_esame);
			Boolean esame_rimosso = visita_corrente.getLista_esami().remove(esame);
			if (esame_rimosso)//TODO: messaggistica di errore
				Logger.log("rimosso esame '%s'", esame.getNome_esame());
			else
				Logger.log("Nessun esame rimosso");
		}
		else {
			Logger.log("id_esame %d:", id_esame);
			
		}
		response.sendRedirect(request.getContextPath()+"/medico/riepilogoVisita.jsp");
	}
}
