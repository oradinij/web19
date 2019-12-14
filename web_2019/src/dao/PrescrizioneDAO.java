package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import dbHelpers.DatabaseUtils;
import dto.PrescrizioneDTO;

public class PrescrizioneDAO {

	public ArrayList<PrescrizioneDTO>  getListaPrescrizioniByUserId(int id_paziente) { 
		ArrayList<PrescrizioneDTO> listaPrescrizioni= new ArrayList<PrescrizioneDTO>();
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT * FROM prescrizioni WHERE id_paziente = ?");
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){
				int id_prescrizione= rs.getInt("id_prescrizione");
				int id_medico = rs.getInt("id_medico");
				Date data = rs.getDate("timestamp");
				String farmaco = rs.getString("farmaco");

				listaPrescrizioni.add(new PrescrizioneDTO(id_prescrizione, id_paziente, id_medico, data, farmaco));
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

	public void  creaPrescrizione(int id_paziente, int id_medico,String farmaco) { 
		Connection conn =DatabaseUtils.getDbConnection();
		PreparedStatement stmt;
		
		try {
			stmt = conn.prepareStatement("INSERT INTO prescrizioni (id_medico, id_paziente, farmaco)	VALUES (?, ?, ?);");
			stmt.setInt(1, id_medico);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, farmaco);
			stmt.execute();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
