package controllers.medico;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;
import web_2019.VisitaCorrente;

/**
 * Servlet implementation class ResocontoVisita
 */
@WebServlet("/medico/ResocontoVisita")
public class ResocontoVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PazienteDTO paziente = (PazienteDTO) request.getSession().getAttribute("paziente");
		VisitaCorrente visita_corrente = (VisitaCorrente) request.getAttribute("visita_corrente");
		ArrayList<String> lista_prescrizioni = visita_corrente.getLista_prescrizioni();
		ArrayList<Integer> lista_esami = visita_corrente.getLista_esami(); 
		
		
	}

}
