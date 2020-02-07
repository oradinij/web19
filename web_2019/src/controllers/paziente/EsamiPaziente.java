package controllers.paziente;


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
@WebServlet("/paziente/Esami")
public class EsamiPaziente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		PazienteDTO user= (PazienteDTO) request.getSession().getAttribute("user");
		
		request.getSession().setAttribute("user", user);

		
		
		response.sendRedirect(request.getContextPath()+"/paziente/esamiPaziente.jsp");
		
	}

}
