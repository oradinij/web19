package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dbHelpers.DatabaseUtils;
import dto.TipologiaEsameDTO;
import web_2019.Logger;

public class TipologiaEsameDAO  implements Serializable{
	
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
	public String getNameById(int id_esame) {
		String nome_esame=null;
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		try {
			String sql = "SELECT nome_esame FROM esami where id_esame = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_esame);
			rs = stmt.executeQuery();
			if(rs.next()){
				nome_esame = rs.getString("nome_esame");			
			}
			else
				Logger.log("nome esame non trovato per %d", id_esame);
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return nome_esame;
	}

}
