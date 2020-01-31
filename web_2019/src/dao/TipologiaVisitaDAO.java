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


	public static ArrayList<TipologiaVisitaDTO> getAll() {
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
				//TODO aggiungere durata
				//String durata = rs.getString("durata");
				nomeVisita = rs.getString("nome_visita");
				id_visita = rs.getInt("id_visita");
				String costo_visita = rs.getString("costo_visita");
				String specializzazione = getSpecializzazioneById(rs.getInt("id_specializzazione"));
				listaVisite.add(new TipologiaVisitaDTO(id_visita, nomeVisita, costo_visita, specializzazione));

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
	public TipologiaVisitaDTO getById(int id_visita) {

		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		TipologiaVisitaDTO visita = null;
		try {
			String sql = "SELECT * FROM visite_specialistiche where id_visita = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_visita);
			rs = stmt.executeQuery();
			while(rs.next()){
				//TODO aggiungere durata
				//String durata = rs.getString("durata");
				int id_specializzazione = rs.getInt("id_specializzazione");
				String nome_visita = rs.getString("nome_visita");
				String costo_visita = rs.getString("costo_visita");
				String specializzazione = getSpecializzazioneById(rs.getInt("id_specializzazione"));
				visita = new TipologiaVisitaDTO(id_visita, nome_visita, costo_visita, specializzazione);

			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return visita;

	}

	private static String getSpecializzazioneById(int id_specializzazione) {
		String specializzazione = "";
		

		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		try {
			String sql = "SELECT descrizione FROM specializzazioni where id_specializzazione = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_specializzazione);
			rs = stmt.executeQuery();
			while(rs.next()){
				//TODO aggiungere durata
				//String durata = rs.getString("durata");
				specializzazione = rs.getString("descrizione");

			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return specializzazione;
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
