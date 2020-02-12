package controllers.paziente;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.MedicoDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;

/**
 * Servlet implementation class CambiaMedico
 */
@WebServlet("/paziente/scegliMedicoBase")
public class ScegliMedicoBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Prepara la lista dei medici per la pagine cambiaMedico.jsp 
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String provincia = req.getParameter("provincia");
		Integer id_medico = Integer.parseInt(req.getParameter("id_medico"));
		JsonArray result = new MedicoDAO().getJsonMediciBase(provincia,id_medico);

		PrintWriter out = res.getWriter();
		res.setContentType("application/json");
		res.setCharacterEncoding("UTF-8");
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("Access-Control-Allow-Methods", "GET");
		System.out.println("Risultato: "+ result);
        out.print(result);


	}

}
