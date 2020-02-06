package controllers.medico;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.EsameDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import web_2019.VisitaCorrente;

/**
 * Riceve l'id 
 */
@WebServlet("/medico/nuovaCompilazioneEsame")
public class NuovaCompilazioneEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id_esame = Integer.parseInt(request.getParameter("id_esame"));
		System.out.println(id_esame);
		if(id_esame != null) {
			VisitaCorrente vc = (VisitaCorrente)request.getSession().getAttribute("visita_corrente");
			vc.setEsame_corrente(new EsameDTO());
			vc.setId_prenotazione_esame_corrente(id_esame);
			vc.getEsame_corrente().setReferto("");
			request.getSession().setAttribute("visita_corrente", vc);
		}
	
	}

}
