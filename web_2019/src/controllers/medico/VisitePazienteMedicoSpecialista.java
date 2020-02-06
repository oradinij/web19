package controllers.medico;




import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MedicoDAO;
import dao.PazienteDAO;
import dao.TipologiaEsameDAO;
import dao.TipologiaVisitaDAO;
import dao.VisitaDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/medico/VisitePazienteSpecialista")
public class VisitePazienteMedicoSpecialista extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		MedicoDTO user= (MedicoDTO) request.getSession().getAttribute("user");
		int id_paziente = Integer.parseInt(request.getParameter("id"));
		PazienteDTO paziente = new PazienteDAO().getUserById(id_paziente);
		VisitaCorrente visita_corrente = new VisitaCorrente();
		visita_corrente.setId_medico(user.getId_medico());
		visita_corrente.setPaziente(paziente);

		
		if(request.getSession().getAttribute("tipi_visita") == null) {
			ArrayList<TipologiaVisitaDTO> tipi_visita = TipologiaVisitaDAO.getAll();
			request.getSession().setAttribute("tipi_visita", tipi_visita);
		}
		if(request.getSession().getAttribute("tipi_esame") == null) {
			ArrayList<TipologiaEsameDTO> tipi_esame = new TipologiaEsameDAO().getAll();
			request.getSession().setAttribute("tipi_esame", tipi_esame);
		}
		
	
		request.getSession().setAttribute("visita_corrente", visita_corrente);


		response.sendRedirect(request.getContextPath()+"/medico/visitePazienteMedicoSpecialista.jsp");

	}

}
