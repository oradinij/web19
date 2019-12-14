package controllers.paziente;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MedicoDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;

/**
 * Servlet implementation class CambiaMedico
 */
@WebServlet("/paziente/cambiaMedico")
public class CambiaMedico extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Prepara la lista dei medici per la pagine cambiaMedico.jsp 
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<MedicoDTO> listaMedici = new MedicoDAO().getListaMediciBase();
		PazienteDTO user = (PazienteDTO)request.getSession().getAttribute("user");
		MedicoDTO medico_corrente = new MedicoDAO().getUserById(user.getId_medico());

		request.getSession().setAttribute("medico_corrente", medico_corrente);
		request.getSession().setAttribute("listaMedici", listaMedici);	
		response.sendRedirect("./cambiaMedico.jsp");
	}

}
