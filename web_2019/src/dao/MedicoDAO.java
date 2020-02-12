package dao;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dto.MedicoDTO;
import dto.PazienteDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import utils.Logger;
import web_2019.DatabaseService;
import web_2019.PasswordEncryptionService;

public class MedicoDAO {
	
	
	public JsonArray getJsonMediciBase(String provincia, int id_medico_vecchio){
		System.out.println(provincia);
	
		JsonArray result = new JsonArray();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE id_specializzazione=0 AND provincia='"+ provincia+ "' AND id_medico!='"+id_medico_vecchio +"';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String nome = rs.getString("nome");	
				String cognome = rs.getString("cognome");	
				int id_medico = rs.getInt("id_medico");	
				
				JsonObject medico= new JsonObject();
				
				medico.addProperty("nome", nome);
				medico.addProperty("cognome", cognome);
				medico.addProperty("id_medico", id_medico);
				
				result.add(medico);
				System.out.println("Medico risultante: "+ medico);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(result);
		return result;
		
	};
	

	public MedicoDTO getUserBySession(String id_sessione) {
		MedicoDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM sessione_medico WHERE id_sessione = '"+id_sessione+"';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id_medico= rs.getInt("id_medico");	
				user= getUserById(id_medico);	

			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return user;
	}

	
	public JsonArray getJsonMediciVisita(int id_prenotazione, String nome_struttura){
		System.out.println(nome_struttura);
	
		JsonArray result = new JsonArray();
		int id_visita = new VisitaDAO().getById(id_prenotazione).getId_visita();
		int id_area = new VisitaDAO().getIdSpecializzazione(id_visita);
		System.out.println(id_area);
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE id_specializzazione = '"+id_area
					+"' AND struttura='"+ nome_struttura+ "';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String nome = rs.getString("nome");	
				String cognome = rs.getString("cognome");	
				int id_medico = rs.getInt("id_medico");	
				
				JsonObject medico= new JsonObject();
				
				medico.addProperty("nome", nome);
				medico.addProperty("cognome", cognome);
				medico.addProperty("id_medico", id_medico);
				
				result.add(medico);
				System.out.println("Medico risultante: "+ medico);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(result);
		return result;
		
	};
	
	public JsonArray getJsonMediciEsame(int id_prenotazione, String nome_struttura){
		System.out.println(nome_struttura);
	
		JsonArray result = new JsonArray();
		int id_esame = new EsameDAO().getById(id_prenotazione).getId_esame();
		int id_area = new EsameDAO().getIdSpecializzazione(id_esame);
		System.out.println(id_area);
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE id_specializzazione = '"+id_area
					+"' AND struttura='"+ nome_struttura+ "';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				
				String nome = rs.getString("nome");	
				String cognome = rs.getString("cognome");	
				int id_medico = rs.getInt("id_medico");	
				
				JsonObject medico= new JsonObject();
				
				medico.addProperty("nome", nome);
				medico.addProperty("cognome", cognome);
				medico.addProperty("id_medico", id_medico);
				
				result.add(medico);
				System.out.println("Medico risultante: "+ medico);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(result);
		return result;
		
	};
	
	
	public JsonArray getJsonStruttureVisita(int id_prenotazione, String provincia){
		System.out.println(provincia);
	
		JsonArray result = new JsonArray();
		int id_visita = new VisitaDAO().getById(id_prenotazione).getId_visita();
		int id_area = new VisitaDAO().getIdSpecializzazione(id_visita);
		System.out.println(id_area);
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT DISTINCT struttura FROM medici WHERE id_specializzazione = '"+id_area
					+"' AND provincia='"+ provincia+ "';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String struttura = rs.getString("struttura");	
				result.add(struttura);
				System.out.println("Struttura risultante: "+ struttura);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(result);
		return result;
		
	};
	
	public JsonArray getJsonStruttureEsame(int id_prenotazione, String provincia){
		System.out.println(provincia);
	
		JsonArray result = new JsonArray();
		int id_esame = new EsameDAO().getById(id_prenotazione).getId_esame();
		int id_area = new EsameDAO().getIdSpecializzazione(id_esame);
		System.out.println(id_area);
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT DISTINCT struttura FROM medici WHERE id_specializzazione = '"+id_area
					+"' AND provincia='"+ provincia+ "';";		
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String struttura = rs.getString("struttura");	
				result.add(struttura);
				System.out.println("Struttura risultante: "+ struttura);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println(result);
		return result;
		
	};
	
	
	
	
	
	private Calendar dateToCalendar(Date date) {

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;

	}
 
	public JsonArray getJsonPrenotazioniVisiteBase(int id_medico){
		Connection conn =DatabaseService.getDbConnection();
		JsonArray result = new JsonArray ();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_medico = "+id_medico+" AND stato=1 AND id_visita=1;";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data");
				Date data = new Date(ts.getTime());
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_paziente = rs.getInt("id_paziente");
				String nome_paziente = new PazienteDAO().getUserById(id_paziente).getNome();
				String cognome_paziente = new PazienteDAO().getUserById(id_paziente).getCognome();
				String codice_fiscale = new PazienteDAO().getUserById(id_paziente).getCodice_fiscale();
				
				JsonObject item = new JsonObject();
								
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				f.format(data);
				
				
				Calendar start_c = dateToCalendar(data);
				Calendar end_c = dateToCalendar(data);
				
				end_c.add(Calendar.MINUTE, 30);
				
				item.addProperty("start",f.format(start_c.getTime()));
				item.addProperty("end", f.format(end_c.getTime()));
				item.addProperty("title", nome_paziente + " " + cognome_paziente + " " + codice_fiscale);
		
				
				result.add(item);
				
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}
		
		
		return result;
		
	}
	
	
	public JsonArray getJsonPrenotazioniVisiteSpecialista(int id_medico){
		Connection conn =DatabaseService.getDbConnection();
		JsonArray result = new JsonArray ();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM prenotazioni_visite WHERE id_medico = "+id_medico+" AND stato=1 AND id_visita!=1;";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data");
				Date data = new Date(ts.getTime());
			
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_paziente = rs.getInt("id_paziente");
				String nome_paziente = new PazienteDAO().getUserById(id_paziente).getNome();
				String cognome_paziente = new PazienteDAO().getUserById(id_paziente).getCognome();
				String codice_fiscale = new PazienteDAO().getUserById(id_paziente).getCodice_fiscale();
				String tipo_visita = new TipologiaVisitaDAO().getById(id_prenotazione).getNome_visita();
				
				JsonObject item = new JsonObject();
								
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				f.format(data);
				
				
				Calendar start_c = dateToCalendar(data);
				Calendar end_c = dateToCalendar(data);
				
				end_c.add(Calendar.MINUTE, 30);
				
				item.addProperty("start",f.format(start_c.getTime()));
				item.addProperty("end", f.format(end_c.getTime()));
				item.addProperty("title", nome_paziente + " " + cognome_paziente + " " + codice_fiscale + " " + tipo_visita);
				item.addProperty("backgroundColor","#6A95A6");
				
				result.add(item);
				
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}
		
		
		return result;
		
	}
	
	
	public JsonArray getJsonPrenotazioniEsamiSpecialista(int id_medico){
		Connection conn =DatabaseService.getDbConnection();
		JsonArray result = new JsonArray ();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM prenotazioni_esami WHERE id_medico = "+id_medico+" AND stato=1;";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				Timestamp ts = rs.getTimestamp("data_ora");
				Date data = new Date(ts.getTime());
				Integer id_paziente = rs.getInt("id_paziente");
				Integer id_esame = rs.getInt("id_esame");
				String nome_paziente = new PazienteDAO().getUserById(id_paziente).getNome();
				String cognome_paziente = new PazienteDAO().getUserById(id_paziente).getCognome();
				String codice_fiscale = new PazienteDAO().getUserById(id_paziente).getCodice_fiscale();
				String tipo_esame = new TipologiaEsameDAO().getById(id_esame).getNome_esame();
				
				JsonObject item = new JsonObject();
								
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				f.format(data);
				
				
				Calendar start_c = dateToCalendar(data);
				Calendar end_c = dateToCalendar(data);
				
				end_c.add(Calendar.MINUTE, 30);
				
				item.addProperty("start",f.format(start_c.getTime()));
				item.addProperty("end", f.format(end_c.getTime()));
				item.addProperty("title", nome_paziente + " " + cognome_paziente + " " + codice_fiscale + " " + tipo_esame);
				item.addProperty("backgroundColor","#326173");
				
				result.add(item);
				
				
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}
		
		
		return result;
		
	}
	
	
	public MedicoDTO getUserById(int id_medico) {
		MedicoDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE id_medico = "+id_medico+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				String email = rs.getString("email");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				int id = rs.getInt("id_medico");
				int idSpecializzazione = rs.getInt("id_specializzazione");
				String telefono_stuidio = rs.getString("telefono_studio");
				String telefono_cellulare = rs.getString("telefono_cellulare");
				String immagine = rs.getString("immagine");
				String struttura = rs.getString("struttura");
				String provincia = rs.getString("provincia");
				user= new MedicoDTO(email, id, idSpecializzazione, nome, cognome, provincia, telefono_stuidio, telefono_cellulare, immagine, struttura);

			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}

		return user;
	}
	public MedicoDTO getUserByEmail(String email) {
		MedicoDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT id_medico FROM medici WHERE email = "+email+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id_medico = rs.getInt("id_medico");
				return getUserById(id_medico);

			}
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}

		return user;
	}


	public ArrayList<PazienteDTO> getListaPazienti(int id, int idSpecializzazione) {
		ArrayList<PazienteDTO> listaPazienti = new ArrayList<PazienteDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		Statement stmt;

		try {
			stmt = conn.createStatement();
			String sql;
			//se e' un medico di base recupero solo la lista di pazienti a lui associati altrimenti recupero tutti i pazienti
			if (idSpecializzazione == 0)
				sql = "SELECT * FROM pazienti WHERE id_medico = "+id+";";
			else
				sql = "SELECT * FROM pazienti;";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id_paziente = rs.getInt("id_paziente");
				int id_medico = rs.getInt("id_medico");
				String codice_fiscale = rs.getString("codice_fiscale");	
				String mail = rs.getString("email");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");
				String provincia = rs.getString("provincia");	

				PazienteDTO paziente= new PazienteDTO(id_paziente, id_medico, codice_fiscale, mail, luogo_nascita,provincia, nome, sesso, data_nascita, cognome, foto_path);
				listaPazienti.add(paziente);//accede ad db quarantordici volte per nulla ma ok
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non trovi l' utente
		}

		return listaPazienti;
	}
	


	public MedicoDTO getUser(String email, String attemptedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
		MedicoDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE email = '"+email+"';";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String encryptedPassword = rs.getString("pswd");	
				//se la mail non corrisponde alla psw criptata ritorna null
				if(!PasswordEncryptionService.validatePassword(attemptedPassword, encryptedPassword)) {
					Logger.log("la password inserita non e' corretta");
					return null;
				}
				int id_medico = rs.getInt("id_medico");
				user = getUserById(id_medico);
				rs.close();
				stmt.close();
				return user;
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
	}

	public MedicoDTO getUserbyCookie(HttpServletRequest request) {
		MedicoDTO user=null;
		String id_sessione=null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("m_session")) {
					id_sessione = cookie.getValue();
					user = getUserBySession(id_sessione);//cerco di recuperare i dati dal db
					if(user!= null)
						setNewSession(user.getId_medico(), UUID.randomUUID().toString());
				}
				return user;//l'utente oppure null se non ne ho trovati
			}
		}
		return null;

	}
	public void setNewSession(int id_medico, String id_sessione) {
		Connection conn =DatabaseService.getDbConnection();
		try {
			Statement stmt = conn.createStatement();
			//se gia' e' presente la aggiorno e basta, la sintassi dipende dal db
			String sql = "INSERT INTO sessione_medico(id_sessione, id_medico) VALUES('"+id_sessione+"', "+id_medico+") ON CONFLICT (id_medico) DO UPDATE SET id_sessione = '"+id_sessione+"';";
			stmt.executeUpdate(sql);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}





}
