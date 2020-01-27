package web_2019;

import java.io.ByteArrayOutputStream;

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

import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import utils.Logger;

/**
 * Servlet implementation class EsamePdf
 */
public class PdfPrescrizione {
	private static final long serialVersionUID = 1L;

	public static void inviaMail(PazienteDTO paziente, PrescrizioneDTO prescrizione){

		String pdfFileName = String.format("dettagli_prescrizione_%d.pdf", prescrizione.getId_prescrizione());
		ByteArrayOutputStream file = creaPdf(paziente, prescrizione, pdfFileName);
		try {
			MailingService.sendTo(paziente.getEmail(), "Nuova prescrizione", "Nuova prescrizione", file, pdfFileName);
		} catch (Exception e) {	
			e.printStackTrace();// TODO messaggistica di errore
		}

	}


	public static ByteArrayOutputStream creaPdf(PazienteDTO paziente, PrescrizioneDTO prescrizione, String pdfFileName) {

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();


		Document document = new Document();
		try {
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
			Phrase phrase= new Phrase("Prescrizione", table_headers_font);
			table.addCell(phrase);
			phrase= new Phrase(prescrizione.getFarmaco(), table_content_font);
			table.addCell(phrase);

			document.add(table);

			//Creazione codice QR
			String qr_content = String.format("Codice medico: %d\n" + 
					"Codice paziente: %d \n" + 
					"Codicefiscale: %s\n" + 
					"Timestamp Prenotazione: %s\n" + 
					"Codice Prenotazione: %d\n" + 
					"Farmaco: %s", 
					prescrizione.getId_medico(), paziente.getId(), paziente.getCodice_fiscale(), prescrizione.getData(), 
					prescrizione.getId_prescrizione(), prescrizione.getFarmaco());
			BarcodeQRCode barcodeQRCode = new BarcodeQRCode(qr_content, 1000, 1000, null);
			Image codeQrImage = barcodeQRCode.getImage();
			codeQrImage.scaleAbsolute(100, 100);
			document.add(codeQrImage);
			Logger.log("Creto pdf %s:\n"+qr_content, pdfFileName);

			//chiusura documento
			document.close();
		}
		catch ( Exception e) {
			e.printStackTrace();
		}
		return outputStream;
	}
}
