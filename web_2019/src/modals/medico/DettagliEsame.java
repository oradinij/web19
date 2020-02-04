package modals.medico;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import dao.EsameDAO;
import dao.VisitaDAO;
import dto.VisitaDTO;
import utils.Logger;


@WebServlet("/medico/modal/dettagli_esame")
public class DettagliEsame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_prenotazioneStr = request.getParameter("id_prenotazione");
		if(id_prenotazioneStr!= null) {
			Integer id_prenotazione = Integer.parseInt(id_prenotazioneStr);
			JsonObject result = new EsameDAO().toJson(id_prenotazione);
			
			PrintWriter out = response.getWriter();
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "GET");
	        out.print(result);
	        Logger.log("JSON visita con id %d:\n\n%s", id_prenotazione,result);
		}
	}


}
