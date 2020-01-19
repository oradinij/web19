package controllers.medico;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * rimuova dalla lista prescrizioni della visita corrente il farmaco indicato
 * @see VisitaCorrente
 */
@WebServlet("/medico/annullaPrescrizioneFarmaco")
public class AnnullaPrescrizioneFarmaco extends HttpServlet {

	private static final long serialVersionUID = -8814925732288150677L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prescrizione = request.getParameter("prescrizione");
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if(prescrizione != null && visita_corrente!= null) {
			Boolean esame_rimosso = visita_corrente.getLista_prescrizioni().remove(prescrizione);
			if (esame_rimosso)//TODO: messaggistica di errore
				Logger.log("rimossa prescrizione: '%s'", prescrizione);
			else
				Logger.log("Nessuna prescrizione rimossa");
		}
		else {
			Logger.log("ERRORE");
		}
		response.sendRedirect(request.getContextPath()+"/medico/riepilogoVisita.jsp");
	}
}