package controllers.cambioPassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.Logger;
import web_2019.DatabaseService;

/**
 * gestisce i link invati nella mail del cambio pasword<br>
 * - se il token esiste ed e' valido (tempo trascorso dall invio < time limit), ridireziona alla pagina /cambiaPassword.jsp
 * - se il token non e' valido, o e' scaduto rimanda alla pagina /passwordDimenticata.jsp per poter fare una nuova richiesta
 */


@WebServlet("/nuovaPassword")
public class NuovaPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static int minutes_time_limit= 60;//massimo 1 ora per recuperare la password

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String token = request.getParameter("token");

		if (token != null) {
			Connection conn =DatabaseService.getDbConnection();
			try {
				//controllo contemporaneamente che il token sia presente e che non sia gia' scaduto
				String sql = "SELECT id_utente, tipologia_utente from richieste_cambio_password " + 
						"where (EXTRACT(epoch FROM (NOW() - richieste_cambio_password.timestamp))/60)<? " + 
						"AND richieste_cambio_password.token=?;";		
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, minutes_time_limit);
				stmt.setString(2, token);

				ResultSet rs = stmt.executeQuery();
				if(rs.next()){
					int id_utente=rs.getInt("id_utente");
					int tipologia_utente = rs.getInt("tipologia_utente");
					request.getSession().setAttribute("id_utente", id_utente);
					request.getSession().setAttribute("tipologia_utente", tipologia_utente);
					request.getRequestDispatcher("/cambiaPassword.jsp").forward(request, response);

				}
				else {
					Logger.log("Token non valido, fare una nuova richiesta token \nToken: %s\n\n", token);
					request.getRequestDispatcher("/passwordDimenticata.jsp").forward(request, response);
				}


				stmt.close();
				conn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

