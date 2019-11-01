package dbHelpers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_2019.PasswordEncryptionService;

/**
 * Servlet implementation class AggiungiMedicoDB
 */
@WebServlet("/db/medico")
public class Medico extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String pwd= request.getParameter("pwd");
		String spec= request.getParameter("spec");

		PrintWriter out = response.getWriter();

		if (email != null)	{
			if (spec != null) {
				int specInt = Integer.parseInt(spec);
				inserisciMedico(email, pwd, specInt);
				out.write("Aggiunto "+email);
			}
		}
		else {
			out.write("<form action=\"./medico\">\n" + 
					"		email: <input type=\"text\" name=\"email\"> <br>\n" + 
					"		passwd: <input type=\"text\" name=\"pwd\"> <br>\n" + 
					"		id_spec: <input type=\"text\" name=\"spec\"> <br> \n" + 
					"		<input type=\"submit\">\n" + 
					"	</form>");
		}
	}

	public void inserisciMedico(String email, String password, int idSpecializzazione ){

		Connection conn =DatabaseUtils.getDbConnection();
		try {
			String hashedPassword = PasswordEncryptionService.generateStorngPasswordHash(password);

			String sql = "INSERT INTO public.medici(email, pswd, id_specializzazione) VALUES (?, ?, ?);";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, hashedPassword);
			stmt.setInt(3, idSpecializzazione);
			stmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}


	}

}
