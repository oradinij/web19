package dao;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import dto.PazienteDTO;
import web_2019.DatabaseService;
import web_2019.PasswordEncryptionService;

/**
 * 
 * Data Access Object per la tabella <b>pazienti</b>
 *
 */

public class PazienteDAO {

	/**
	 * Prende in ingresso una stringa id_sessione, ne cerca la corrispondenza nel database e ritorna l'utente in caso di successo
	 * @param id_sessione @see {@link UUID#randomUUID()}
	 * @return
	 */
	public PazienteDTO getUserBySession(String id_sessione) {
		PazienteDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM sessione WHERE id_sessione = ?;";
			pst = conn.prepareStatement(sql);
			pst.setString(1,id_sessione);
			rs = pst.executeQuery();
			while(rs.next()){
				int id_paziente= rs.getInt("id_paziente");	
				user= getUserById(id_paziente);	
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
	
	public PazienteDTO getUserById(int id_paziente) {
		PazienteDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM pazienti WHERE id_paziente = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_paziente);
			rs = stmt.executeQuery();
			while(rs.next()){

				int id_medico = rs.getInt("id_medico");
				String codice_fiscale = rs.getString("codice_fiscale");	
				String mail = rs.getString("email");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");	
				user= new PazienteDTO(id_paziente, id_medico, codice_fiscale, mail, luogo_nascita, nome, sesso, data_nascita, cognome, foto_path);

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
	public PazienteDTO getUserByEmail(String email) {
		PazienteDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM pazienti WHERE email = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while(rs.next()){

				int id_medico = rs.getInt("id_medico");
				int id_paziente = rs.getInt("id_paziente");
				String codice_fiscale = rs.getString("codice_fiscale");	
				String luogo_nascita = rs.getString("luogo_nascita");		
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");
				//TODO: String foto_path = rs.getString("");		
				user= new PazienteDTO(id_paziente, id_medico, codice_fiscale, email, luogo_nascita, nome, sesso, data_nascita, cognome, foto_path);

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
	public PazienteDTO getUser(String email, String attemptedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
		PazienteDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM pazienti WHERE email = '"+email+"';";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				String encryptedPassword = rs.getString("pswd");	
				//se la mail non corrisponde alla psw criptata ritorna null
				if(!PasswordEncryptionService.validatePassword(attemptedPassword, encryptedPassword)) {
					System.out.println("la password inserita non e' corretta");
					return null;
				}
				int id = rs.getInt("id_paziente");
				int id_medico = rs.getInt("id_medico");
				String codice_fiscale = rs.getString("codice_fiscale");	
				String mail = rs.getString("email");		
				String nome = rs.getString("nome");	
				String cognome = rs.getString("cognome");
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String foto_path = rs.getString("immagine");	
				
				user= new PazienteDTO(id, id_medico, codice_fiscale, mail, luogo_nascita, nome, sesso, data_nascita, cognome, foto_path);
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
	public PazienteDTO getUserbyCookie(HttpServletRequest request) {
		PazienteDTO user=null;
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
	
	public PazienteDTO getUserByCodiceFiscale(String codice_fiscale) {
		PazienteDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM pazienti WHERE codice_fiscale = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, codice_fiscale);
			rs = stmt.executeQuery();
			while(rs.next()){

				int id_medico = rs.getInt("id_medico");
				Integer id_paziente = rs.getInt("id_paziente");	
				String mail = rs.getString("email");		
				String luogo_nascita = rs.getString("luogo_nascita");		
				String nome = rs.getString("nome");	
				String sesso = rs.getString("sesso");		
				String data_nascita = rs.getString("data_nascita");		
				String cognome = rs.getString("cognome");
				String foto_path = rs.getString("immagine");	
				user= new PazienteDTO(id_paziente, id_medico, codice_fiscale, mail, luogo_nascita, nome, sesso, data_nascita, cognome, foto_path);

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
	 * inserisce o aggiorna nel db la sessione corrispondente all'utente
	 * 
	 * @param id_paziente 
	 * @param id_sessione 
	 * @see UUID#randomUUID()
	 */
	public void setNewSession(int id_paziente, String id_sessione) {

		Connection conn =DatabaseService.getDbConnection();

		try {
			//se gia' e' presente la aggiorno e basta, la sintassi dipende dal db
			String sql = "INSERT INTO sessione(id_sessione, id_paziente) VALUES(?, ?) ON CONFLICT (id_paziente) DO UPDATE SET id_sessione = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id_sessione);
			stmt.setInt(2, id_paziente);
			stmt.setString(3, id_sessione);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}



	}

	public void setFoto_path(int id_paziente, String fileName) {
		Connection conn =DatabaseService.getDbConnection();

		try {
			String sql = "UPDATE pazienti SET immagine = ? WHERE id_paziente = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, fileName);
			stmt.setInt(2, id_paziente);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void setMedico(int id_paziente, int id_medico) {
		Connection conn =DatabaseService.getDbConnection();

		try {
			String sql = "UPDATE pazienti SET id_medico = ? WHERE id_paziente = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_medico);
			stmt.setInt(2, id_paziente);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	

}
