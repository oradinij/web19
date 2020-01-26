package controllers.medico;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MedicoDTO;
import dto.PazienteDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/medico/DettagliPaziente")
public class DettagliPaziente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");
		int id_paziente = Integer.parseInt(request.getParameter("id"));
		PazienteDTO paziente = user.getPazienteById(id_paziente);//cerca il paziente corrispondente nella lista dei suoi pazienti
		VisitaCorrente visita_corrente = new VisitaCorrente();
		visita_corrente.setPaziente(paziente);
		visita_corrente.setId_medico(user.getId_medico());
		request.getSession().setAttribute("visita_corrente", visita_corrente);
				
		response.sendRedirect(request.getContextPath()+"/medico/pazienteMedicoBase.jsp");
		
	}

}
