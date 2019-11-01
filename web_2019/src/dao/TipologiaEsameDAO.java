package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dbHelpers.DatabaseUtils;
import dto.TipologiaEsameDTO;

public class TipologiaEsameDAO {
	
	public ArrayList<TipologiaEsameDTO> getAll() {
		String nomeEsame;
		int id_esame;
		
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		Statement stmt;
		ArrayList<TipologiaEsameDTO> listaEsami = new ArrayList<TipologiaEsameDTO>();
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM esami";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				nomeEsame = rs.getString("nome_esame");
				id_esame = rs.getInt("id_esame");
				listaEsami.add(new TipologiaEsameDTO(id_esame, nomeEsame));
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return listaEsami;
		
	}

}
