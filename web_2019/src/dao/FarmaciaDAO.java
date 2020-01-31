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

import dto.FarmaciaDTO;
import utils.Logger;
import web_2019.DatabaseService;
import web_2019.PasswordEncryptionService;

/**
 * 
 * Data Access Object per la tabella <b>farmacia</b>
 *
 */

public class FarmaciaDAO {

	/**
	 * Prende in ingresso una stringa id_sessione, ne cerca la corrispondenza nel database e ritorna l'utente in caso di successo
	 * @param id_sessione @see {@link UUID#randomUUID()}
	 * @return
	 */
	
	
	public FarmaciaDTO getUserBySession(String id_sessione) {
		FarmaciaDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM sessione_farmacia WHERE id_sessione = ?;";
			pst = conn.prepareStatement(sql);
			pst.setString(1,id_sessione);
			rs = pst.executeQuery();
			while(rs.next()){
				int id_farmacia= rs.getInt("id_farmacia");	
				user= getUserById(id_farmacia);	
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
 *  recupera i dati di un farmacia dal database e li incapsula in un oggetto FarmaciaDTO
 * 
 * @param id_farmacia
 * @return il relativo oggetto FarmaciaDto oppure null se non trova corrispondenza
 */
	
	public FarmaciaDTO getUserById(int id_farmacia) {
		FarmaciaDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM farmacie WHERE id_farmacia = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id_farmacia);
			rs = stmt.executeQuery();
			while(rs.next()){
				String mail = rs.getString("email");		
				String indirizzo = rs.getString("indirizzo");
				String nome_farmacia = rs.getString("nome_farmacia");
				user= new FarmaciaDTO(id_farmacia, mail, indirizzo, nome_farmacia);
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
	public FarmaciaDTO getUserByEmail(String email) {
		FarmaciaDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM farmacie WHERE email = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while(rs.next()){
				Integer id_farmacia = rs.getInt("id_farmacia");		
				String indirizzo = rs.getString("indirizzo");
				String nome_farmacia = rs.getString("nome_farmacia");
				user= new FarmaciaDTO(id_farmacia, email, indirizzo, nome_farmacia);
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
	 * @see {@link FarmaciaDTO}
	 */
	public FarmaciaDTO getUser(String email, String attemptedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
		FarmaciaDTO user=null;
		Connection conn =DatabaseService.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM farmacie WHERE email = '"+email+"';";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				String encryptedPassword = rs.getString("pswd");	
				//se la mail non corrisponde alla psw criptata ritorna null
				if(!PasswordEncryptionService.validatePassword(attemptedPassword, encryptedPassword)) {
					Logger.log("password errata per la mail: %s", email);
					return null;
				}
				Integer id_farmacia = rs.getInt("id_farmacia");	
				String indirizzo = rs.getString("indirizzo");
				String nome_farmacia = rs.getString("nome_farmacia");
				user= new FarmaciaDTO(id_farmacia, email, indirizzo, nome_farmacia);

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
	public FarmaciaDTO getUserbyCookie(HttpServletRequest request) {
		FarmaciaDTO user=null;
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
	 * @param id_farmacia 
	 * @param id_sessione 
	 * @see UUID#randomUUID()
	 */
	public void setNewSession(int id_farmacia, String id_sessione) {

		Connection conn =DatabaseService.getDbConnection();

		try {
			//se gia' e' presente la aggiorno e basta, la sintassi dipende dal db
			String sql = "INSERT INTO sessione_farmacia(id_sessione, id_farmacia) VALUES(?, ?) ON CONFLICT (id_farmacia) DO UPDATE SET id_sessione = ?;";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, id_sessione);
			stmt.setInt(2, id_farmacia);
			stmt.setString(3, id_sessione);
			stmt.executeUpdate();

			stmt.close();
			conn.close();
		}

		catch (Exception e) {
			e.printStackTrace();
		}



	}


}

