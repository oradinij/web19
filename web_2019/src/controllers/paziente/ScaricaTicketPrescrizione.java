package controllers.paziente;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import utils.Logger;
import web_2019.PdfPrescrizione;
import web_2019.PdfTicketPrescrizione;

/**
 * Servlet implementation class ScaricaPrescrizione
 */
@WebServlet("/paziente/scaricaTicketPrescrizione")
public class ScaricaTicketPrescrizione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id_prescrizione = Integer.parseInt(request.getParameter("id_prescrizione"));
		PazienteDTO user = (PazienteDTO) request.getSession().getAttribute("user");
		ArrayList<PrescrizioneDTO> listaPrescrizioni = user.getListaPrescrizioni();
		String pdfFileName=null;

		ByteArrayOutputStream file = null;

		for (PrescrizioneDTO prescrizione : listaPrescrizioni) {
			if(prescrizione.getId_prescrizione() == id_prescrizione) {
				pdfFileName = String.format("dettagli_prescrizione_%d.pdf", prescrizione.getId_prescrizione());
				file = PdfTicketPrescrizione.creaPdf(user, prescrizione, pdfFileName);
			}
		}
		
		response.setContentType("application/pdf");
		response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
		response.setContentLength(file.size());
		response.getOutputStream().write(file.toByteArray());


	}


}
