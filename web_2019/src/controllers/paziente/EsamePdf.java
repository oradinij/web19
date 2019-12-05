package controllers.paziente;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import dto.EsameDTO;
import dto.PazienteDTO;
import web_2019.MailingService;

/**
 * Servlet implementation class EsamePdf
 */
@WebServlet("/paziente/EsamePdf")
public class EsamePdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pdfFileName = "dettagli_esame.pdf";
		Integer id_esame = Integer.parseInt(request.getParameter("id_prenotazione"));
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		response.setContentType("application/pdf");
		response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);

		PazienteDTO paziente = (PazienteDTO) request.getSession().getAttribute("user");
		EsameDTO esame = null;
		for (EsameDTO esame_cercato : paziente.getListaEsami()) {
			if(esame_cercato.getId_prenotazione()== id_esame)
				esame = esame_cercato;
		}
		Document document = new Document();
		try {
			String file_name = "test.pdf";

			PdfWriter.getInstance(document, outputStream);

			document.open();
			//intestazione con dati utente
			Font header_font = FontFactory.getFont(FontFactory.TIMES, 11, BaseColor.BLACK);
			String header_string= String.format("Codice fiscale: %s\n Nome: %s \n Cogome: %s \n Data di nascita: %s \n Sesso: %s \n Id Cartella: %06d",
					paziente.getCodice_fiscale(), paziente.getNome(), paziente.getCognome(),paziente.getData_nascita(), paziente.getSesso(), paziente.getId());
			Paragraph header_paragraph = new Paragraph(header_string, header_font);
			document.add(header_paragraph);
			//tabella relativa ai dati esame
			Font table_headers_font = FontFactory.getFont(FontFactory.TIMES_BOLD, 11, BaseColor.BLACK);
			Font table_content_font = FontFactory.getFont(FontFactory.TIMES_ROMAN, 11, BaseColor.BLACK);
			PdfPTable table = new PdfPTable(2);
			Phrase phrase= new Phrase("Esame", table_headers_font);
			table.addCell(phrase);
			phrase= new Phrase(esame.getNomeEsame(), table_content_font);
			table.addCell(phrase);

			document.add(table);

			String qr_content = String.format("Codice medico: %d\n" + 
					"				Codice paziente: %d \n" + 
					"				Codicefiscale: %s\n" + 
					"				Timestamp Prenotazione: %s\n" + 
					"				Codice Prenotazione: %d\n" + 
					"				Nome Esame: %s", paziente.getId_medico(),paziente.getId(), paziente.getCodice_fiscale(), esame.getData().toString(), esame.getId_prenotazione(), esame.getNomeEsame());
					BarcodeQRCode barcodeQRCode = new BarcodeQRCode(qr_content, 1000, 1000, null);
			Image codeQrImage = barcodeQRCode.getImage();
			codeQrImage.scaleAbsolute(100, 100);
			document.add(codeQrImage);

			document.close();

			ServletOutputStream responseOutputStream = response.getOutputStream();
			responseOutputStream.write(outputStream.toByteArray());
			MailingService.sendTo("janoradini@gmail.com", "Esame", "Nuovo Esame", outputStream, file_name);
		} catch ( Exception e) {
			e.printStackTrace();
		}


	}

}
