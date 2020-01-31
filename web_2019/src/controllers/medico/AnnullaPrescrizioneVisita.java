package controllers.medico;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.VisitaCorrente;

/**
 * elimina l'esame selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/medico/annullaPrescrizioneVisita")
public class AnnullaPrescrizioneVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_visita = Integer.parseInt(request.getParameter("id_visita"));
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getSession().getAttribute("visita_corrente");
		if(id_visita != null && visita_corrente!= null) {
			TipologiaVisitaDTO visita = new TipologiaVisitaDTO(id_visita);
			Boolean visita_rimossa = visita_corrente.getPaziente().getListaVisite().remove(visita);
			if (visita_rimossa)//TODO: messaggistica di errore
				Logger.log("rimossa visita '%s'", visita.getNome_visita());
			else
				Logger.log("Nessuna visita rimossa");
		}
		else {
			Logger.log("id_esame %d:", id_visita);
			
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
