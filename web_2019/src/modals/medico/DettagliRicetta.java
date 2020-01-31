package modals.medico;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dao.MedicoDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;
import dto.PrescrizioneDTO;
import dto.VisitaDTO;
import utils.Logger;


@WebServlet("/medico/modal/dettagli_ricetta")
public class DettagliRicetta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_ricettaStr = request.getParameter("id_ricetta");
		if(id_ricettaStr!= null) {
			Integer id_ricetta = Integer.parseInt(id_ricettaStr);
			
			JsonObject result = new PrescrizioneDTO().toJson(id_ricetta);
						
			PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "GET");
	        out.print(result);
	        Logger.log("JSON visita con id %d:\n\n%s", id_ricetta, result);
		} else {
			
			Logger.log("non riesco a restituire il json della ricetta");
			
		}
	}


}
