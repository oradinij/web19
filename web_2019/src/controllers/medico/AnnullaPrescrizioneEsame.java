package controllers.medico;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TipologiaEsameDTO;
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
				System.out.println(String.format("\n%s: \n\t rimosso esame '%s'", this.getClass().getName(), esame.getNome_esame() ));
			else
				System.out.println(String.format("\n%s: \n\tNessun esame rimosso", getClass()));
		}
		else {
			System.out.println(String.format("\n%s: \n\tid_esame %d:", getClass(), id_esame));
			System.out.println(String.format("\n%s: \n\t visita_corrente: ", getClass())+visita_corrente);
		}
		response.sendRedirect(request.getContextPath()+"/medico/riepilogoVisita.jsp");
	}
}
