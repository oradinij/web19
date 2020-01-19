package utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web_2019.DatabaseService;
import web_2019.PasswordEncryptionService;

/**
 * Aggiunge le farmacie al db: GET: /api/farmacia/?email=?pwd=?indirizzo=?
 */
@WebServlet("/api/farmacia")
public class ApiFarmacia extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("email");
		String pwd= request.getParameter("pwd");
		String indirizzo= request.getParameter("indirizzo");

		PrintWriter out = response.getWriter();

		if (email != null && pwd != null)	{
				out.write(inserisciFarmacia(email, pwd, indirizzo));
		}
		else {
			out.write("<form action=\"./farmacia\">\n" + 
					"		email: <input type=\"text\" name=\"email\"> <br>\n" + 
					"		passwd: <input type=\"text\" name=\"pwd\"> <br>\n" + 
					"		indirizzo: <input type=\"text\" name=\"indirizzo\"> <br> \n" + 
					"		<input type=\"submit\">\n" + 
					"	</form>");
		}
		
		
	}

	public String inserisciFarmacia(String email, String pwd, String indirizzo){

		Connection conn =DatabaseService.getDbConnection();
		try {
			String hashedPassword = PasswordEncryptionService.generateStorngPasswordHash(pwd);

			String sql = "INSERT INTO public.farmacie(email, pswd, indirizzo) VALUES (?, ?, ?);";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, hashedPassword);
			stmt.setString(3, indirizzo);
			stmt.executeUpdate();
			return Logger.log("Aggiunta Farmacia :\n\temail %s\n\tpassword hash: %s\n\tid indirizzo: %s", email, hashedPassword, indirizzo);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return "<h2>Inserimento Fallito</h2>";


	}

}
