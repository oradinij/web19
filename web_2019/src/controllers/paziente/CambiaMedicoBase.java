package controllers.paziente;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.MedicoDAO;
import dao.PazienteDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;

/**
 * Servlet implementation class CambiaMedico
 */
@WebServlet("/paziente/cambiaMedicoBase")
public class CambiaMedicoBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Prepara la lista dei medici per la pagine cambiaMedico.jsp 
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();

		Integer id_paziente = Integer.parseInt(req.getParameter("id_paziente"));
		Integer id_medico = Integer.parseInt(req.getParameter("id_medico"));
		new PazienteDAO().setMedico(id_paziente, id_medico);
		PazienteDTO user = new PazienteDAO().getUserById(id_paziente);
		
		session.setAttribute("user", user);
		res.setCharacterEncoding("UTF-8");
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("Access-Control-Allow-Methods", "GET");
	


	}

}
