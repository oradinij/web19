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
@WebServlet("/medico/CalendarioVisiteBase")
public class CalendarioVisiteBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");
		int id_medico = user.getId_medico();
		JsonArray visite= new MedicoDAO().getJsonPrenotazioniVisiteBase(id_medico);
		//System.out.println(visite);
		request.getSession().setAttribute("visite", visite);		
		response.sendRedirect(request.getContextPath()+"/medico/visiteMedicoBase.jsp");
		
	}

}
