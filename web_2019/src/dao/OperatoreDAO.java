package dao;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonArray;

import dto.EsameDTO;
import dto.OperatoreDTO;
import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import web_2019.DatabaseService;
import web_2019.PasswordEncryptionService;

/**
 * 
 * Data Access Object per la tabella <b>pazienti</b>
 *
 */

public class OperatoreDAO {

	/**
	 * Prende in ingresso una stringa id_sessione, ne cerca la corrispondenza nel database e ritorna l'utente in caso di successo
	 * @param id_sessione @see {@link UUID#randomUUID()}
	 * @return
	 */
	
	
	

	public OperatoreDTO getUserByEmail(String email) {
		OperatoreDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM operatori WHERE email = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while(rs.next()){

		
				int id_operatore = rs.getInt("id_operatore");
				String codice_fiscale = rs.getString("codice_fiscale");	
				String luogo_nascita = rs.getString("luogo_nascita");		
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");
				String provincia = rs.getString("provincia");	

				//TODO: String foto_path = rs.getString("");		
				user= new OperatoreDTO(id_operatore, codice_fiscale, email, luogo_nascita, provincia, nome, sesso, data_nascita, cognome, foto_path);

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
	
	
	public ArrayList<PrescrizioneDTO>  getRicetteErogate() { 
		ArrayList<PrescrizioneDTO> listaPrescrizioni= new ArrayList<PrescrizioneDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prescrizioni.\"timestamp\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prescrizioni WHERE stato=1");
			rs = stmt.executeQuery();
			while(rs.next()){
				int id_prescrizione= rs.getInt("id_prescrizione");
				int id_riferimento= rs.getInt("id_riferimento");
				int id_paziente= rs.getInt("id_paziente");
				int id_medico = rs.getInt("id_medico");
				String data_ora = rs.getString("data_ora");
				String farmaco = rs.getString("farmaco");
				int stato = rs.getInt("stato");

				listaPrescrizioni.add(new PrescrizioneDTO(id_prescrizione, id_paziente, id_medico, data_ora, farmaco, stato));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		return listaPrescrizioni;
	}
	
	public ArrayList<VisitaDTO> getVisiteSvolte() {
		ArrayList<VisitaDTO> listaVisite = new ArrayList<VisitaDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			String sql = "SELECT  TO_CHAR(prenotazioni_visite.\"data\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_visite WHERE stato=2 AND id_visita!=1 OR stato=3 AND id_visita!=1;";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while(rs.next()){

				String data_ora = rs.getString("data_ora"); 
				Integer id_prenotazione = rs.getInt("id_prenotazione");
				Integer id_riferimento = rs.getInt("id_riferimento");
				Integer id_visita = rs.getInt("id_visita");
				Integer id_medico = rs.getInt("id_medico");
				Integer id_paziente = rs.getInt("id_paziente");
				Integer stato = rs.getInt("stato");
				String referto= rs.getString("referto");
				String luogo= new VisitaDAO().getLuogo(id_medico);
				
				String nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
				listaVisite.add(new VisitaDTO(id_prenotazione, id_medico, id_paziente, stato, referto, data_ora, id_visita, luogo, nome_visita,id_riferimento));
			}
			rs.close();
			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();//puo essere che semplicemente non nulla
		}

		System.out.println("Viva la f...");
		
		return listaVisite;
	}
	
	public ArrayList<EsameDTO>  getEsamiSvolti() { 
		ArrayList<EsameDTO> listaEsami= new ArrayList<EsameDTO>();
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement("SELECT TO_CHAR(prenotazioni_esami.\"data_ora\", 'DD-MM-YYYY HH24:MI')as data_ora, * FROM prenotazioni_esami WHERE stato=2 OR stato=3");
			rs = stmt.executeQuery();
			while(rs.next()){
				String data_ora = rs.getString("data_ora");
				int id_esame= rs.getInt("id_esame");
				int id_paziente= rs.getInt("id_paziente");
				int id_prenotazione= rs.getInt("id_prenotazione");
				int id_riferimento= rs.getInt("id_riferimento");
				int id_medico = rs.getInt("id_medico");
				int stato = rs.getInt("stato");
				String referto = rs.getString("referto");
				String nomeEsame = new TipologiaEsameDAO().getNameById(id_esame);
				String area = new TipologiaEsameDAO().getAreaById(id_esame);
				listaEsami.add(new EsameDTO(id_esame, area, id_paziente, id_medico, data_ora, nomeEsame, referto, id_prenotazione, id_riferimento, stato ));
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
	
	
	public OperatoreDTO getUserBySession(String id_sessione) {
		OperatoreDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM sessione WHERE id_sessione = ?;";
			pst = conn.prepareStatement(sql);
			pst.setString(1,id_sessione);
			rs = pst.executeQuery();
			while(rs.next()){
				int id_operatore= rs.getInt("id_paziente");	
				user= getUserById(id_operatore);	
			}
			rs.close();
			pst.close();
			conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}	
		return user;
	}
/**
 *  recupera i dati di un paziente dal database e li incapsula in un oggetto PazienteDTO
 * 
 * @param id_paziente
 * @return il relativo oggetto PazienteDto oppure null se non trova corrispondenza
 */

	
	public OperatoreDTO getUserById(int id_operatore) {
		OperatoreDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM operatori WHERE id_operatore = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_operatore);
			rs = stmt.executeQuery();
			while(rs.next()){

				
				String codice_fiscale = rs.getString("codice_fiscale");	
				String mail = rs.getString("email");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String provincia = rs.getString("provincia");	
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");	
				user= new OperatoreDTO(id_operatore,codice_fiscale, mail, luogo_nascita, provincia, nome, sesso, data_nascita, cognome, foto_path);

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
	

	
	/**
	 * cerca di recuperare l'utente in base alla mail e alla password inserite nel form di login
	 * 
	 * @param email
	 * @param attemptedPassword
	 * @return l'utente corrispondente
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeySpecException
	 * @see {@link PazienteDTO}
	 */
	public OperatoreDTO getUser(String email, String attemptedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
		OperatoreDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM operatori WHERE email = '"+email+"';";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				String encryptedPassword = rs.getString("pswd");	
				//se la mail non corrisponde alla psw criptata ritorna null
				if(!PasswordEncryptionService.validatePassword(attemptedPassword, encryptedPassword)) {
					System.out.println("la password inserita non e' corretta");
					return null;
				}
				int id = rs.getInt("id_operatore");
				
				String codice_fiscale = rs.getString("codice_fiscale");	
				String mail = rs.getString("email");		
				String nome = rs.getString("nome");	
				String cognome = rs.getString("cognome");
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String foto_path = rs.getString("immagine");
				String provincia = rs.getString("provincia");	

				
				
				user= new OperatoreDTO(id, codice_fiscale, mail, luogo_nascita, provincia, nome, sesso, data_nascita, cognome, foto_path);
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

	/**
	 * cerca nei cookies il cookie <b>REMEMBER_ME</b> e restituisce l'utente corrispondente oppure null.
	 * Se trova l'utente aggiorna la sessione nel database
	 * 
	 * @param request HttpRequest da cui estrarre il cookie
	 * @return 
	 */
	public OperatoreDTO getUserbyCookie(HttpServletRequest request) {
		OperatoreDTO user=null;
		String id_sessione=null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals("REMEMBER_ME")) {
					id_sessione = cookie.getValue();
					user = getUserBySession(id_sessione);//cerco di recuperare i dati dal db
					if(user != null)
						setNewSession(user.getId(), request.getSession().getId());//aggiorno la sessione nel DB con la nuova sessione TODO distruzione al logout
				}
				return user;//l'utente oppure null se non ne ho trovati
			}
		}
		return null;

	}
	
	
	/**
	 * inserisce o aggiorna nel db la sessione corrispondente all'utente
	 * 
	 * @param id_paziente 
	 * @param id_sessione 
	 * @see UUID#randomUUID()
	 */
	public void setNewSession(int id_operatore, String id_sessione) {

		Connection conn =DatabaseService.getDbConnection();

		try {
			//se gia' e' presente la aggiorno e basta, la sintassi dipende dal db
			String sql = "INSERT INTO sessione(id_sessione, id_paziente) VALUES(?, ?) ON CONFLICT (id_paziente) DO UPDATE SET id_sessione = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id_sessione);
			stmt.setInt(2, id_operatore);
			stmt.setString(3, id_sessione);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}



	}

	public void setFoto_path(int id_operatore, String fileName) {
		Connection conn =DatabaseService.getDbConnection();

		try {
			String sql = "UPDATE operatori SET immagine = ? WHERE id_paziente = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, fileName);
			stmt.setInt(2, id_operatore);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}

};
	
