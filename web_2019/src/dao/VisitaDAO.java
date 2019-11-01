package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import dbHelpers.DatabaseUtils;
import dto.VisitaDTO;

public class VisitaDAO {

	public ArrayList<VisitaDTO> getListaVisiteByUserId(int id_paziente) {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT * FROM visite_svolte WHERE id_paziente = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){

				Date data = rs.getDate("data");

				listaVisite.add(new VisitaDTO(data));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaVisite;
	}

}
