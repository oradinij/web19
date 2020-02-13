package controllers.medico;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PazienteDAO;
import dao.PrescrizioneDAO;
import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import utils.Logger;
import web_2019.PdfPrescrizione;
import web_2019.PdfTicketPrescrizione;

/**
 * Servlet implementation class ScaricaPrescrizione
 */
@WebServlet("/medico/scaricaPrescrizione")
public class ScaricaPrescrizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id_prescrizione = Integer.parseInt(request.getParameter("id_prescrizione"));

		String pdfFileName=null;

		ByteArrayOutputStream file = null;

		PrescrizioneDTO prescrizione =  new PrescrizioneDAO().getById(id_prescrizione);
		PazienteDTO user = new PazienteDAO().getUserById(prescrizione.getId_paziente());
		
				pdfFileName = String.format("dettagli_prescrizione_%d.pdf", prescrizione.getId_prescrizione());
				file = PdfPrescrizione.creaPdf(user, prescrizione, pdfFileName);
			
		
		response.setContentType("application/pdf");
		response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
		response.setContentLength(file.size());
		response.getOutputStream().write(file.toByteArray());


	}


}
