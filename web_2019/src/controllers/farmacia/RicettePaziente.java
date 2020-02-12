package controllers.farmacia;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PazienteDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/farmacia/ricettePaziente")
public class RicettePaziente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		Integer id_paziente= Integer.parseInt(request.getParameter("id_paziente"));
		
		PazienteDTO paziente = new PazienteDAO().getUserById(id_paziente);
		
		request.getSession().setAttribute("paziente", paziente);

		
		
		response.sendRedirect(request.getContextPath()+"/farmacia/ricettePazienteFarmacia.jsp");
		
	}

}
