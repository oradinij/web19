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

import dbHelpers.DatabaseUtils;

/**
 * Controlla se il token ricevuto come parametro e' ancora valido
 */


@WebServlet("/nuovaPassword")
public class NuovaPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static int minutes_time_limit= 60;//massimo 1 ora per recuperare la password

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String token = request.getParameter("token");

		if (token != null) {
			Connection conn =DatabaseUtils.getDbConnection();
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
					System.out.println(String.format("\nNuovaPassword.java: Token non valido, fare una nuova richiesta token \nToken: %s\n\n", token));
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

