package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.google.gson.JsonObject;

import dto.PrescrizioneDTO;
import dto.VisitaDTO;
import web_2019.DatabaseService;

public class PrescrizioneDAO {
	

	public JsonObject  toJson(int id_ricetta) { 
		JsonObject json = new JsonObject();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT * FROM prescrizioni WHERE id_prescrizione = ?");
			stmt.setInt(1, id_ricetta);
			rs = stmt.executeQuery();
			while(rs.next()){
				int id_riferimento= rs.getInt("id_riferimento");
				int id_paziente= rs.getInt("id_paziente");
				int id_medico = rs.getInt("id_medico");
				int id_farmacia = rs.getInt("id_farmacia");
				String data = rs.getString("timestamp");
				String farmaco = rs.getString("farmaco");
				int stato = rs.getInt("stato");
				String nome_medico = new MedicoDAO().getUserById(id_medico).getNome();
				String cognome_medico =  new MedicoDAO().getUserById(id_medico).getCognome();
				VisitaDTO visita_tmp = new VisitaDAO().getById(id_riferimento);	
				Integer tipo_riferimento= visita_tmp.getId_visita();
				
				if(stato==1) {
					String nome_farmacia = new FarmaciaDAO().getUserById(id_farmacia).getNome();
					json.addProperty("farmacia", nome_farmacia);
			}
				json.addProperty("farmaco", farmaco);
				json.addProperty("data", data);
				json.addProperty("id_prescrizione", id_ricetta);
				json.addProperty("stato", stato);
				json.addProperty("id_riferimento", id_riferimento);
				json.addProperty("nome_medico", nome_medico);
				json.addProperty("cognome_medico", cognome_medico);
				json.addProperty("tipo_riferimento", tipo_riferimento);
				
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return json;
	}
	
	
	
	
	public ArrayList<PrescrizioneDTO>  getByRiferimento(int id_riferimento) { 
		ArrayList<PrescrizioneDTO> listaPrescrizioni= new ArrayList<PrescrizioneDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT * FROM prescrizioni WHERE id_riferimento = ?");
			stmt.setInt(1, id_riferimento);
			rs = stmt.executeQuery();
			while(rs.next()){
				int id_prescrizione= rs.getInt("id_prescrizione");
				int id_paziente= rs.getInt("id_paziente");
				int id_medico = rs.getInt("id_medico");
				String data = rs.getString("timestamp");
				String farmaco = rs.getString("farmaco");
				int stato = rs.getInt("stato");

				listaPrescrizioni.add(new PrescrizioneDTO(id_prescrizione, id_paziente, id_medico, data, farmaco, stato));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaPrescrizioni;
	}
	

	public ArrayList<PrescrizioneDTO>  getListaPrescrizioniByUserId(int id_paziente) { 
		ArrayList<PrescrizioneDTO> listaPrescrizioni= new ArrayList<PrescrizioneDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prescrizioni.\"timestamp\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prescrizioni WHERE id_paziente = ?");
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){
				int id_prescrizione= rs.getInt("id_prescrizione");
				int id_medico = rs.getInt("id_medico");
				String data = rs.getString("data_ora");
				String farmaco = rs.getString("farmaco");
				int stato = rs.getInt("stato");

				listaPrescrizioni.add(new PrescrizioneDTO(id_prescrizione, id_paziente, id_medico, data, farmaco, stato));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaPrescrizioni;
	}

	public PrescrizioneDTO  creaPrescrizione(int id_paziente, int id_medico,String farmaco, String timestamp, int id_riferimento) { 
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement stmt;
		PrescrizioneDTO ultima_prescrizione = null;
		
		try {
			//timestamp 
			stmt = conn.prepareStatement("INSERT INTO prescrizioni (id_medico, id_paziente, farmaco, timestamp, id_riferimento)	VALUES (?, ?, ?,  TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS'),?);");
			stmt.setInt(1, id_medico);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, farmaco);
			stmt.setString(4, timestamp);
			stmt.setInt(5, id_riferimento);
			stmt.execute();
			stmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prescrizioni.\"timestamp\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prescrizioni WHERE id_paziente = ? AND id_medico = ? AND farmaco = ? ORDER BY prescrizioni.timestamp LIMIT 1;");
			stmt.setInt(1, id_paziente);
			stmt.setInt(2, id_medico);
			stmt.setString(3, farmaco);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				int id_prescrizione= rs.getInt("id_prescrizione");
				String data = rs.getString("data_ora");
				int stato= rs.getInt("stato");
				ultima_prescrizione = new PrescrizioneDTO(id_prescrizione, id_paziente, id_medico, data, farmaco, stato);
			}
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ultima_prescrizione;
		
	}

}
