package controllers.paziente;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelpers.DatabaseUtils;
import dto.PazienteDTO;

/**
 * Servlet implementation class ImmaginePaziente
 */
@WebServlet("/paziente/immaginePaziente")
public class ImmaginePaziente extends HttpServlet {

	private static final long serialVersionUID = 977261461098253313L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PazienteDTO user = (PazienteDTO) request.getSession().getAttribute("user");

		try {
			Connection connection = DatabaseUtils.getDbConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT immagine FROM pazienti WHERE id_paziente = ?;");
			preparedStatement.setInt(1, user.getId());
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				InputStream image = resultSet.getBinaryStream("immagine");	
				String mimeType = URLConnection.guessContentTypeFromStream(image);
				System.out.println(mimeType);
				response.setContentType("image/jpg");
				response.getOutputStream().write(toByteArray(image));
							}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	byte[] toByteArray(InputStream in) throws IOException {

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		byte[] buffer = new byte[1024];
		int len;

		// read bytes from the input stream and store them in buffer
		while ((len = in.read(buffer)) != -1) {
			// write bytes from the buffer into output stream
			os.write(buffer, 0, len);
		}

		return os.toByteArray();
	}

}
