package controllers.medico;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TipologiaEsameDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina l'esame selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
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
		PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "GET");
        out.print(visita_corrente.toJson());
		return;
	}
}
