package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

import dbHelpers.DatabaseUtils;
import dto.VisitaDTO;

public class VisitaDAO {

	public ArrayList<VisitaDTO> getListaVisiteByUserId(int id_paziente) {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_paziente = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){

				Date data = rs.getDate("data");
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_medico = rs.getInt("id_medico");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				listaVisite.add(new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data));
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

	public void creaPrenotazioneVisita(int id_paziente, int id_medico, String data_ora,  int stato) {
		Connection conn = DatabaseUtils.getDbConnection();
		PreparedStatement stmt;
		//se e' una visita del medico di base l'utente la prenota direttamente altrimenti viene prima prescritta dal medico e successivamente prenotata
		//per questo il metodo prende anche lo stato
		try {
			String sql = "INSERT INTO public.prenotazioni_visite(data, id_paziente, id_medico, stato) VALUES (TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI'), ?, ?, ?);";
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, data_ora);
			stmt.setInt(2, id_paziente);
			stmt.setInt(3, id_medico);
			stmt.setInt(4, stato);

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();

		}
	}
}
