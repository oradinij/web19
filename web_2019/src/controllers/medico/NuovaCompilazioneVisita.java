package controllers.medico;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import web_2019.VisitaCorrente;

/**
 * Riceve l'id 
 */
@WebServlet("/medico/nuovaCompilazioneVisita")
public class NuovaCompilazioneVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_visita = Integer.parseInt(request.getParameter("id_visita"));
		if(id_visita != null) {
			VisitaCorrente vc = (VisitaCorrente)request.getSession().getAttribute("visita_corrente");
			
			vc.setId_prenotazione_visita_corrente(id_visita);
			vc.setLista_esami(new ArrayList<TipologiaEsameDTO>());
			vc.setLista_prescrizioni(new ArrayList<String>());
			vc.setLista_visite(new ArrayList<TipologiaVisitaDTO>());
			
		}
	}

}
