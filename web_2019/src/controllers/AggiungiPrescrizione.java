package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;

/**
 * Salva la prescrizione nel database
 */
@WebServlet("/medico/AggiungiPrescrizione")
public class AggiungiPrescrizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String farmaco = request.getParameter("prescrizione");
		PazienteDTO paziente = (PazienteDTO) request.getSession().getAttribute("paziente");
		if (farmaco!= null && paziente != null)
			paziente.AggiugiPrescrizione(farmaco);
		
		response.sendRedirect(request.getContextPath()+"/medico/dettagliPaziente.jsp");
	}

}
