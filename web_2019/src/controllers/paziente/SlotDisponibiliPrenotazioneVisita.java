package controllers.paziente;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import utils.Logger;
import web_2019.DatabaseService;

/**
 * Servlet implementation class SlotDisponibiliPrenotazioneVisita
 */
@WebServlet(name = "SlotDisponibiliVisite", description = "Aggiunge alla request il parametro slot disponibili una volta scelta la data",
urlPatterns = { "/paziente/SlotDisponibiliVisite" })
public class SlotDisponibiliPrenotazioneVisita extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HashSet<String> orari_prenotati = new HashSet<String>();
		Set<String> orari_disponibili = orariDisponibili();
		String data = request.getParameter("data");
		Logger.log("Data selezionata: %s", data);
		if (data!= null) {
			Connection conn =DatabaseService.getDbConnection();
			PreparedStatement pst = null;
			ResultSet rs = null;
			try {
				//TODO controllare formato data
				String sql = "select date_trunc("
						+ "'day', prenotazioni_visite.data)  as data, "
						+ "to_char( prenotazioni_visite.data - date_trunc('day', prenotazioni_visite.data), 'HH24:MI:SS')as ora "
						+ "from prenotazioni_visite "
						+ "where data::date = TO_DATE(?, 'YYYY-DD-MM');";
				pst = conn.prepareStatement(sql);
				pst.setString(1,data);
				rs = pst.executeQuery();
				while(rs.next()){
					String orario_prenotato = rs.getString("ora");
					orari_prenotati.add(orario_prenotato);
					//Logger.log("Slot prenotato: %s", orario_prenotato);
				}
				rs.close();
				pst.close();
				conn.close();		
			}
			catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		orari_disponibili.removeAll(orari_prenotati);
		Object[] arrayObjects =  orari_disponibili.toArray();
		ArrayList<String> al_orari = new ArrayList<>();
		for (Object object : arrayObjects) {
			al_orari.add(object.toString());
		}
		Collections.sort(al_orari);
		JsonArray json_array_orari = new JsonArray();
		for (String orario : al_orari) {
			json_array_orari.add(orario);
		}
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "GET");
		out.print(json_array_orari);

	}

	Set<String> orariDisponibili(){
		Set orari_disponibili = new HashSet<String>();
		String[] orari_possibili = {"00","30"};
		int orario_inizio_visite = 8;
		int orario_fine_visite = 19;

		for(int i = orario_inizio_visite; i < orario_fine_visite; i++) {
			for(int j = 0; j < orari_possibili.length; j++) {
				String orario_disponibile = i + ":" + orari_possibili[j]+":00";
				if(i < 10) {
					orario_disponibile = "0" + orario_disponibile;
				}
				orari_disponibili.add(orario_disponibile);

			}
		}
		return orari_disponibili;
	}

}
