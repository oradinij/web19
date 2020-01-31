package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.TipologiaEsameDTO;
import utils.Logger;
import web_2019.DatabaseService;

public class TipologiaEsameDAO  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8893820252947975277L;
	
	public String getAreaById(int id_esame) {
		
		String area="";
		int id_specializzazione;

		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;
		
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM esami WHERE id_esame=" + id_esame +";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				id_specializzazione = rs.getInt("id_specializzazione");
				area = getDescrizione(id_specializzazione);

			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return area;

	}
	
	
	
	public ArrayList<TipologiaEsameDTO> getAll() {
		String nomeEsame;
		String area;
		String costo_esame;
		int id_esame;
		int id_specializzazione;

		Connection conn =DatabaseService.getDbConnection();
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
				id_specializzazione = rs.getInt("id_specializzazione");
				area = getDescrizione(id_specializzazione);
				costo_esame = rs.getString("costo_esame");
				listaEsami.add(new TipologiaEsameDTO(id_esame, id_specializzazione, area, nomeEsame, costo_esame));

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
		Connection conn =DatabaseService.getDbConnection();
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





	public static String getDescrizione(int id_specializzazione) {
		String area_esame=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		try {
			String sql = "select descrizione from specializzazioni inner join esami "
					+ "on esami.id_specializzazione=specializzazioni.id_specializzazione "
					+ "where esami.id_specializzazione=? limit 1 ;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_specializzazione);
			rs = stmt.executeQuery();
			if(rs.next()){
				area_esame = rs.getString("descrizione");			
			}
			else
				Logger.log("area esame non trovata per %d", id_specializzazione);
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return area_esame;
	}
	
	public TipologiaEsameDTO getById(int id_esame) {
		String nomeEsame;
		String area;
		String costo_esame;

		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		ArrayList<TipologiaEsameDTO> listaEsami = new ArrayList<TipologiaEsameDTO>();
		try {
			stmt = conn.prepareStatement("SELECT * FROM esami where id_esame = ?");
			stmt.setInt(1, id_esame);
			rs = stmt.executeQuery();
			while(rs.next()){
				nomeEsame = rs.getString("nome_esame");
				id_esame = rs.getInt("id_esame");
				int id_specializzazione = rs.getInt("id_specializzazione");
				area = getDescrizione(id_specializzazione);
				costo_esame = rs.getString("costo_esame");
				return (new TipologiaEsameDTO(id_esame,id_specializzazione, area, nomeEsame, costo_esame));

			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}





	}
