package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import utils.Logger;
import web_2019.DatabaseService;

public class VisitaDAO {

	public ArrayList<VisitaDTO> getPrenotateBySpecialista( int id_medico, int id_paziente) {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_medico = ? AND id_paziente= ? AND stato=1;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_medico);
			stmt.setInt(2, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data");
				Date data = new Date(ts.getTime());
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_riferimento = rs.getInt("id_riferimento");
				Integer id_visita = rs.getInt("id_visita");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				String luogo= getLuogo(id_medico);
				
				String nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
				listaVisite.add(new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data, id_visita, luogo, nome_visita,id_riferimento));
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
	
	
	public ArrayList<VisitaDTO> getByRiferimento( int id_riferimento) {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_riferimento = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_riferimento);
			rs = stmt.executeQuery();
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data");
				Date data = new Date(ts.getTime());
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_medico = rs.getInt("id_medico");
				Integer id_visita = rs.getInt("id_visita");
				Integer stato = rs.getInt("stato");
				Integer id_paziente = rs.getInt("id_paziente");
				String referto= rs.getString("referto");
				String luogo= getLuogo(id_medico);
				
				String nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
				listaVisite.add(new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data, id_visita, luogo, nome_visita, id_riferimento));
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
	
	
	
	public ArrayList<VisitaDTO> getListaVisiteByUserId(int id_paziente) {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_paziente = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data");
				Date data = new Date(ts.getTime());
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_medico = rs.getInt("id_medico");
				Integer id_visita = rs.getInt("id_visita");
				Integer id_riferimento = rs.getInt("id_riferimento");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				String luogo= getLuogo(id_medico);
				
				String nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
				listaVisite.add(new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data, id_visita, luogo, nome_visita, id_riferimento));
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
	
	public String getLuogo(int id_medico) {
		String luogoVisita= new String();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT struttura FROM medici WHERE id_medico = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_medico);
			rs = stmt.executeQuery();
			while(rs.next()){

				luogoVisita = rs.getString("struttura");

			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return luogoVisita;
	}

	public void creaPrenotazioneVisita(int id_visita, int id_paziente, int id_medico, String data_ora,  int stato, int id_riferimento) {
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		//se e' una visita del medico di base l'utente la prenota direttamente altrimenti viene prima prescritta dal medico e successivamente prenotata
		//per questo il metodo prende anche lo stato
		try {
			String sql = "INSERT INTO public.prenotazioni_visite(data, id_paziente, id_medico, stato, id_riferimento, id_visita) VALUES (TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), ?, ?, ?, ?, ?);";
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, data_ora);
			stmt.setInt(2, id_paziente);
			stmt.setInt(3, id_medico);
			stmt.setInt(4, stato);
			stmt.setInt(5,	id_riferimento);
			stmt.setInt(6,	id_visita);

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void aggiornaStato(int id_prenotazione, int stato) {
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		try {
			String sql = "UPDATE public.prenotazioni_visite SET stato=? WHERE id_prenotazione = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, stato);
			stmt.setInt(2, id_prenotazione);

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void aggiornaReferto(int id_prenotazione, String referto) {
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		try {
			String sql = "UPDATE public.prenotazioni_visite SET referto=? WHERE id_prenotazione=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, referto);
			stmt.setInt(2, id_prenotazione);

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();

		}
	}

	public VisitaDTO getById(Integer id_prenotazione) {
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		VisitaDTO result = new VisitaDTO();

		try {
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_prenotazione = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_prenotazione);
			rs = stmt.executeQuery();
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data"); 
				Date data = new Date(ts.getTime());
				Integer id_paziente = rs.getInt("id_paziente");
				Integer id_medico = rs.getInt("id_medico");
				Integer id_visita = rs.getInt("id_visita");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				Integer id_riferimento = rs.getInt("id_riferimento");
				String luogo= getLuogo(id_medico);
				String nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
				result = new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data, id_visita, luogo, nome_visita,id_riferimento);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();

		}
		
		return result;
	
	}
}
