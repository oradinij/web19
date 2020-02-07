package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.google.gson.JsonObject;

import dto.EsameDTO;
import dto.PrescrizioneDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import web_2019.DatabaseService;

public class EsameDAO {

	public JsonObject toJson(Integer id_prenotazione) {
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;
		JsonObject result = new JsonObject();

		try {
			String sql = "SELECT TO_CHAR(prenotazioni_esami.\"data_ora\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_esami WHERE id_prenotazione = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_prenotazione);
			rs = stmt.executeQuery();
			while(rs.next()){

				String data_ora = rs.getString("data_ora");
				Integer id_paziente = rs.getInt("id_paziente");
				Integer id_medico = rs.getInt("id_medico");
				Integer id_esame = rs.getInt("id_esame");
				Integer id_riferimento = rs.getInt("id_riferimento");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				String luogo= getLuogo(id_medico);
				String nome_esame= new TipologiaEsameDTO(id_esame).getNome_esame();
				String nome_medico= new MedicoDAO().getUserById(id_medico).getNome();
				String cognome_medico= new MedicoDAO().getUserById(id_medico).getCognome();
				String area = getAreaById(id_esame);
				VisitaDTO visita_tmp = new VisitaDAO().getById(id_riferimento);	
				Integer tipo_riferimento= visita_tmp.getId_visita();
				
				result.addProperty("data_ora", data_ora);
				result.addProperty("data", data_ora.split(" ")[0]);
				result.addProperty("id_paziente", id_paziente);
				result.addProperty("id_medico", id_medico);
				result.addProperty("id_esame", id_esame);
				result.addProperty("id_riferimento", id_riferimento);
				result.addProperty("stato", stato);
				result.addProperty("referto", referto);
				result.addProperty("luogo", luogo);
				result.addProperty("nome_esame", nome_esame);
				result.addProperty("area", area);
				result.addProperty("nome_medico", nome_medico);
				result.addProperty("cognome_medico", cognome_medico);
				result.addProperty("tipo_riferimento", tipo_riferimento);
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
	
	
	public EsameDTO getById(int id_prenotazione) { 
		EsameDTO esame= new EsameDTO();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prenotazioni_esami.\"data_ora\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_esami WHERE id_prenotazione = ?");
			stmt.setInt(1, id_prenotazione);
			rs = stmt.executeQuery();
			while(rs.next()){
				String data_ora = rs.getString("data_ora");
				int id_esame= rs.getInt("id_esame");
				int id_paziente= rs.getInt("id_paziente");
				int id_riferimento= rs.getInt("id_riferimento");
				int id_medico = rs.getInt("id_medico");
				int stato = rs.getInt("stato");
				String referto = rs.getString("referto");
				String nomeEsame = getNameById(id_esame);
				String area = getAreaById(id_esame);


				esame = new EsameDTO(id_esame, area, id_paziente, id_medico, data_ora, nomeEsame, referto, id_prenotazione, stato );
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		
		return esame;
	}
	
	
	public ArrayList<EsameDTO>  getByRiferimento(int id_riferimento) { 
		ArrayList<EsameDTO> listaEsami= new ArrayList<EsameDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prenotazioni_esami.\"data_ora\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_esami WHERE id_riferimento = ?");
			stmt.setInt(1, id_riferimento);
			rs = stmt.executeQuery();
			while(rs.next()){
				String data_ora = rs.getString("data_ora");
				int id_esame= rs.getInt("id_esame");
				int id_paziente= rs.getInt("id_paziente");
				int id_prenotazione= rs.getInt("id_prenotazione");
				int id_medico = rs.getInt("id_medico");
				int stato = rs.getInt("stato");
				String referto = rs.getString("referto");
				String nomeEsame = getNameById(id_esame);
				String area = getAreaById(id_esame);


				listaEsami.add(new EsameDTO(id_esame, area, id_paziente, id_medico, data_ora, nomeEsame, referto, id_prenotazione, stato ));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaEsami;
	}
	
	public ArrayList<EsameDTO>  getListaEsamiByUserId(int id_paziente) { 
		ArrayList<EsameDTO> listaEsami= new ArrayList<EsameDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prenotazioni_esami.\"data_ora\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_esami WHERE id_paziente = ?");
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){
				String data_ora = rs.getString("data_ora");
				int id_esame= rs.getInt("id_esame");
				int id_prenotazione= rs.getInt("id_prenotazione");
				int id_medico = rs.getInt("id_medico");
				int stato = rs.getInt("stato");
				String referto = rs.getString("referto");
				String nomeEsame = getNameById(id_esame);
				String area = getAreaById(id_esame);


				listaEsami.add(new EsameDTO(id_esame, area, id_paziente, id_medico, data_ora, nomeEsame, referto, id_prenotazione, stato ));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaEsami;
	}

	private String getNameById(int id_esame) {
		String nomeEsame = "";
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;

		try {
			stmt = conn.createStatement();
			String sql = "SELECT nome_esame FROM esami WHERE id_esame = "+id_esame+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				nomeEsame = rs.getString("nome_esame");
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return nomeEsame;
	}

	

	private String getAreaById(int id_esame) {
		Integer id_spec=null;
		String area="";
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;
		Statement stmt2;

		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM esami WHERE id_esame = "+id_esame+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				id_spec = rs.getInt("id_specializzazione");
			}
			rs.close();
			stmt.close();
			
			stmt2= conn.createStatement();
			String sql2 = "SELECT * FROM specializzazioni WHERE id_specializzazione= "+id_spec+";";
			rs = stmt2.executeQuery(sql2);
			while(rs.next()){
				area = rs.getString("descrizione");
			}
			
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return area;
	}

	
	public void creaPrenotazioneEsame(int id_esame, int id_paziente, String data_ora, int id_medico, int id_riferimento) {
		
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement stmt;

		try {
			String sql = "INSERT INTO public.prenotazioni_esami(id_esame, id_paziente, data_ora, id_medico, id_riferimento)	VALUES (?, ?,  TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?);";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_esame);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, data_ora);
			stmt.setInt(4, id_medico);
			stmt.setInt(5, id_riferimento);
			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public TipologiaEsameDTO getTipologiaEsame(int id_esame) {
		return new TipologiaEsameDAO().getById(id_esame);
		
	}

	public String getSpecializzazioneEsame(int id_esame) {
		return new TipologiaEsameDAO().getAreaById(id_esame);
		
	}
	
	public void aggiornaStato(int id_prenotazione, int stato) {
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		try {
			String sql = "UPDATE public.prenotazioni_esami SET stato=? WHERE id_prenotazione = ?;";
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
		System.out.println("Pronto referto: "+ referto);
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		try {
			String sql = "UPDATE public.prenotazioni_esami SET referto=? WHERE id_prenotazione=?;";
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

	public void aggiornaData(int id_prenotazione, String data) {
		Connection conn = DatabaseService.getDbConnection();
		PreparedStatement stmt;
		try {
			String sql = "UPDATE public.prenotazioni_esami SET data_ora=to_date(?, 'YYYY-MM-DD') WHERE id_prenotazione=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, data);
			stmt.setInt(2, id_prenotazione);

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();

		}
	}

}
