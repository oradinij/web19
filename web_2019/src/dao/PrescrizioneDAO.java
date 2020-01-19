package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dto.PrescrizioneDTO;
import web_2019.DatabaseService;

public class PrescrizioneDAO {

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

	public PrescrizioneDTO  creaPrescrizione(int id_paziente, int id_medico,String farmaco) { 
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement stmt;
		PrescrizioneDTO ultima_prescrizione = null;
		
		try {
			stmt = conn.prepareStatement("INSERT INTO prescrizioni (id_medico, id_paziente, farmaco)	VALUES (?, ?, ?);");
			stmt.setInt(1, id_medico);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, farmaco);
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
