package controllers.cambioPassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MedicoDAO;
import dao.PazienteDAO;
import dto.MedicoDTO;
import dto.PazienteDTO;
import web_2019.DatabaseService;
import web_2019.MailingService;

/**
 * 
 * Elabora i dati presi dalla pagina /cambiaPassword.jsp (email e tipologoa utente) <br>
 * 	- crea la richiesta di cambio password nel database<br>
 * 	- invia la mail con il link per il cambio password<br>
 *
 */
@WebServlet("/richiediCambioPassword")
public class RichiediCambioPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//i valori seguenti servono a indicare la tipologia di utente che ha richiesto il cambio della password
	//fanno riferimento ai radio button di passwordDimenticata.jsp
	public static final int PAZIENTE = 0;
	public static final int MEDICO = 1;
	public static final int FARMACIA = 2;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		Integer tipologia_utente = Integer.parseInt(request.getParameter("tipologia_utente"));
		String token = UUID.randomUUID().toString();
		Integer id_utente= null;

		if(email != null && tipologia_utente != null) {
			if(tipologia_utente == PAZIENTE) {
				PazienteDTO user = new PazienteDAO().getUserByEmail(email);
				if(user != null)
					id_utente = user.getId();
			}
			if(tipologia_utente == MEDICO) {
				MedicoDTO user = new MedicoDAO().getUserByEmail(email);
				if(user != null)
					id_utente = user.getId_medico();
			}
			if(tipologia_utente == FARMACIA) {
				//TODO implementare farmacia
			}
			if(id_utente != null) {
				Connection conn =DatabaseService.getDbConnection();
				try {
					String sql = "INSERT INTO richieste_cambio_password (id_utente,token, tipologia_utente) VALUES (?, ?, ?)";		
					PreparedStatement stmt = conn.prepareStatement(sql);

					stmt.setInt(1, id_utente);
					stmt.setString(2, token);
					stmt.setInt(3, tipologia_utente);

					stmt.execute();
					stmt.close();
					conn.close();
				}
				catch (Exception e) {
					e.printStackTrace();
				}

				String link = request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/nuovaPassword?token="+token;
				String text =String.format("<html><body>E' stato richiesto un cambio password, per effettuare l'aggiornamento premere sul seguente link \n" + 
						"				<br><br>\n" + 
						"<a href=\"%s\"style=\"text-decoration:none;\n" + 
						"    width: 200px; padding: 15px; box-shadow: 6px 6px 5px; \n" + 
						"    font-weight: MEDIUM; background: #3ebfac; color: #000000; \n" + 
						"    cursor: pointer; border-radius: 10px; border: 1px solid #D9D9D9; \n" + 
						"    font-size: 14px;\">Cambia Password</a>"+
						"	<br><br><h3>oppure visita il link: </h3><br><br><a href=\"%s\">%s</a></body></html>",
						link, link, link
						);
				try {
					MailingService.sendTo(email, "cambio password", text, null, null);
				} catch (Exception e) {
					e.printStackTrace();
				}
				response.sendRedirect(request.getContextPath()+"/");

			}
		}
		else {

			//Logger.log("email = %s \n codice fiscale= %s", email, codice_fiscale));
		}
	}

}
