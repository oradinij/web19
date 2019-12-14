package controllers.cambioPassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.DatabaseUtils;
import web_2019.Logger;
import web_2019.PasswordEncryptionService;

/**
 * Servlet implementation class CambiaPassword
 */
@WebServlet("/cambiaPassword")
public class CambiaPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			String password =request.getParameter("password");
			Integer tipologia_utente = (Integer) request.getSession().getAttribute("tipologia_utente");
			Integer id_utente = (Integer) request.getSession().getAttribute("id_utente");
			String secure_password;
			String tabella_utente= null;
			String campo_utente= null;

			switch (tipologia_utente) {
			case RichiediCambioPassword.PAZIENTE:
				tabella_utente="pazienti";
				campo_utente = "id_paziente";
				break;
			case RichiediCambioPassword.MEDICO:
				tabella_utente="medici";
				campo_utente = "id_medico";
				break;
			case RichiediCambioPassword.FARMACIA:
				tabella_utente="farmacie";
				campo_utente = "id_farmacia";
				break;
			default:
				Logger.log("\nCambiaPassword.java: Nessuna tipologia utente ha corrispondenza per %d\n", tipologia_utente);
				break;
			}

			secure_password = PasswordEncryptionService.generateStorngPasswordHash(password);

			Logger.log("\nCambiaPassword.java: \ntabella_utente: %s\ncampo_utente: %s\nid_utente: %d\n",tabella_utente, campo_utente, id_utente);


			Connection conn =DatabaseUtils.getDbConnection();
			String sql="UPDATE "+tabella_utente+"	SET pswd=?	WHERE "+campo_utente+" = ?;";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, secure_password);
			statement.setInt(2, id_utente);
			int rows = statement.executeUpdate();
			if(rows == 1) {
				Logger.log("%s: password aggiornata per %s con id %d", this.getClass().getName(), tabella_utente, id_utente);
				response.sendRedirect(request.getContextPath()+"/");
			}
			else {
				Logger.log("%s: qualcosa e andato male", this.getClass().getName());
				response.sendRedirect(request.getContextPath()+"/");
			}
			//TODO gestione errori vera
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

}
