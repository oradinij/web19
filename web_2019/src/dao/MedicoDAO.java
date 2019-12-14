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

import dbHelpers.DatabaseUtils;
import dto.MedicoDTO;
import dto.PazienteDTO;
import web_2019.PasswordEncryptionService;

public class MedicoDAO {

	public MedicoDTO getUserBySession(String id_sessione) {
		MedicoDTO user=null;
		Connection conn =DatabaseUtils.getDbConnection();
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

	public MedicoDTO getUserById(int id_medico) {
		MedicoDTO user=null;
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE id_medico = "+id_medico+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){

				String email = rs.getString("email");
				int id = rs.getInt("id_medico");
				int idSpecializzazione = rs.getInt("id_specializzazione");
				ArrayList<PazienteDTO> listaPazienti = getListaPazienti(id, idSpecializzazione);

				user= new MedicoDTO(email, id, idSpecializzazione,listaPazienti);

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
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE email = "+email+";";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("id_medico");
				int idSpecializzazione = rs.getInt("id_specializzazione");
				ArrayList<PazienteDTO> listaPazienti = getListaPazienti(id, idSpecializzazione);

				user= new MedicoDTO(email, id, idSpecializzazione,listaPazienti);

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
	public ArrayList<MedicoDTO> getListaMediciBase(){
		ArrayList<MedicoDTO> listaMedici = new ArrayList<MedicoDTO>();
		Connection conn =DatabaseUtils.getDbConnection();
		PreparedStatement pst;
		ResultSet rs;
		String sql = "SELECT * FROM medici WHERE id_specializzazione = ?;";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1,0); //0 el'id specializzazione dei medici di base
			rs = pst.executeQuery();
			while(rs.next()){
				int id_medico= rs.getInt("id_medico");
				listaMedici.add(new MedicoDAO().getUserById(id_medico));//accede ad db quarantordici volte per nulla ma ok
			}
		}
		catch (Exception e) {e.printStackTrace();}
		return listaMedici;

	}

	private ArrayList<PazienteDTO> getListaPazienti(int id, int idSpecializzazione) {
		ArrayList<PazienteDTO> listaPazienti = new ArrayList<PazienteDTO>();
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		Statement stmt;

		try {
			stmt = conn.createStatement();
			String sql;
			//se e' un medico di base recupero solo la lista di pazienti a lui associati altrimenti recupero tutti i pazienti
			if (idSpecializzazione == 0)
				sql = "SELECT id_paziente FROM pazienti WHERE id_medico = "+id+";";
			else
				sql = "SELECT id_paziente FROM pazienti;";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				int id_paziente= rs.getInt("id_paziente");
				listaPazienti.add(new PazienteDAO().getUserById(id_paziente));//accede ad db quarantordici volte per nulla ma ok
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
		Connection conn =DatabaseUtils.getDbConnection();
		ResultSet rs = null;
		try {
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM medici WHERE email = '"+email+"';";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String encryptedPassword = rs.getString("pswd");	
				//se la mail non corrisponde alla psw criptata ritorna null
				if(!PasswordEncryptionService.validatePassword(attemptedPassword, encryptedPassword)) {
					System.out.println("MedicoDAO:getUser:109 -> la password inserita non e' corretta");
					return null;
				}
				int id = rs.getInt("id_medico");
				int idSpecializzazione = rs.getInt("id_specializzazione");

				user= new MedicoDTO(email, id, idSpecializzazione, getListaPazienti(id, idSpecializzazione));
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
						setNewSession(user.getId(), UUID.randomUUID().toString());
				}
				return user;//l'utente oppure null se non ne ho trovati
			}
		}
		return null;

	}
	public void setNewSession(int id_medico, String id_sessione) {
		Connection conn =DatabaseUtils.getDbConnection();
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
