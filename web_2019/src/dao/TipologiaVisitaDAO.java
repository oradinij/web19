package dao;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.DatabaseService;

public class TipologiaVisitaDAO  implements Serializable{

	private static final long serialVersionUID = 6629777739354200574L;


	public ArrayList<TipologiaVisitaDTO> getAll() {
		String nomeVisita;
		int id_visita;

		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;
		ArrayList<TipologiaVisitaDTO> listaVisite = new ArrayList<TipologiaVisitaDTO>();
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM visite_specialistiche";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				nomeVisita = rs.getString("nome_visita");
				id_visita = rs.getInt("id_visita");
				int costo_esame = rs.getInt("costo_visita");
				listaVisite.add(new TipologiaVisitaDTO(id_visita, nomeVisita, costo_esame));

			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return listaVisite;

	}
	public String getNameById(int id_visita) {
		String nome_visita=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		try {
			String sql = "SELECT nome_visita FROM visite_specialistiche where id_visita = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_visita);
			rs = stmt.executeQuery();
			if(rs.next()){
				nome_visita = rs.getString("nome_visita");			
			}
			else
				return "Base";
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return nome_visita;
	}

}
