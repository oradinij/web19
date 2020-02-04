package controllers.medico;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import dao.MedicoDAO;
import dao.PazienteDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/medico/pazientiMedicoSpecialista")
public class PazientiMedicoSpecialista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");
		String provincia = user.getProvincia();
		System.out.println("Dio porco: " + provincia);
		ArrayList <PazienteDTO> pazienti =new PazienteDAO().getUserByProvincia(provincia);
		//System.out.println(visite);
		
		request.getSession().setAttribute("pazienti", pazienti);		
		response.sendRedirect(request.getContextPath()+"/medico/pazientiMedicoSpecialista.jsp");
		
	}

}
