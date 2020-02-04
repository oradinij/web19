package controllers.medico;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import dao.MedicoDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/medico/CalendarioVisiteSpecialista")
public class CalendarioVisiteSpecialista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");
		int id_medico = user.getId_medico();
		JsonArray result= new MedicoDAO().getJsonPrenotazioniVisiteSpecialista(id_medico);
		JsonArray esami= new MedicoDAO().getJsonPrenotazioniEsamiSpecialista(id_medico);
		
		result.addAll(esami);
			
	
		request.getSession().setAttribute("result", result);		
	

		response.sendRedirect(request.getContextPath()+"/medico/visiteMedicoSpecialista.jsp");
		
	}

}
