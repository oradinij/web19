package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;

/**
 * Servlet implementation class AggiornaMedico
 */
@WebServlet("/paziente/AggiornaMedico")
public class AggiornaMedico extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			int id_medico = Integer.parseInt(request.getParameter("medico"));
			PazienteDTO user = (PazienteDTO)request.getSession().getAttribute("user");	
			user.setMedico(id_medico);
			response.sendRedirect(request.getContextPath()+"/paziente/dettagliPaziente.jsp");

	}


}
