package web_2019;

import java.io.ByteArrayOutputStream;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.DottedLineSeparator;

import dao.FarmaciaDAO;
import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import utils.Logger;

/**
 * Servlet implementation class EsamePdf
 */
public class PdfTicketPrescrizione {
	private static final long serialVersionUID = 1L;

	public static void inviaMail(PazienteDTO paziente, PrescrizioneDTO prescrizione){

		String pdfFileName = String.format("ticket_prescrizione_%d.pdf", prescrizione.getId_prescrizione());
		ByteArrayOutputStream file = creaPdf(paziente, prescrizione, pdfFileName);
		try {
			MailingService.sendTo(paziente.getEmail(), "Ticket prescrizione", "Ticket prescrizione", file, pdfFileName);
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
			Font title_font = FontFactory.getFont(FontFactory.TIMES_BOLD, 20, BaseColor.BLACK);
			Font table_headers_font = FontFactory.getFont(FontFactory.TIMES_BOLD, 11, BaseColor.BLACK);
			Font table_content_font = FontFactory.getFont(FontFactory.TIMES_ROMAN, 11, BaseColor.BLACK);
				
		    document.addTitle("Prescrizione");
		    
		    Paragraph title= new Paragraph("Ticket prescrizione", title_font);
		    title.setAlignment(1);
		    title.setSpacingAfter(20);
		    document.add(title);
		    
			//intestazione con dati utente
			Font header_font = FontFactory.getFont(FontFactory.TIMES, 11, BaseColor.BLACK);
			String header_string= String.format("Codice fiscale: %s\n Nome: %s \n Cogome: %s \n Data di nascita: %s \n Sesso: %s \n Medico: %s \n Data prescrizione: %s \n Farmacia erogatrice: %s \n Id Cartella: %06d",
					paziente.getCodice_fiscale(), paziente.getNome(), paziente.getCognome(),paziente.getData_nascita(), paziente.getSesso(), prescrizione.getNome_medico(), prescrizione.getData(), new FarmaciaDAO().getUserById(prescrizione.getId_farmacia()).getNome_farmacia(), paziente.getId());
			Paragraph header_paragraph = new Paragraph(header_string, header_font);
			document.add(header_paragraph);
			Chunk linebreak = new Chunk(new DottedLineSeparator());
			document.add(linebreak);  

			//tabella relativa ai dati esame
			
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
					"Farmaco: %s" + 
					"Totale: 3€",
					prescrizione.getId_medico(), paziente.getId(), paziente.getCodice_fiscale(), prescrizione.getData(), 
					prescrizione.getId_prescrizione(), prescrizione.getFarmaco());
			BarcodeQRCode barcodeQRCode = new BarcodeQRCode(qr_content, 1000, 1000, null);
			Image codeQrImage = barcodeQRCode.getImage();
			codeQrImage.setAlignment(1);
			codeQrImage.scaleAbsolute(100, 100);
			document.add(codeQrImage);
			
			Font price_font = FontFactory.getFont(FontFactory.TIMES_BOLD, 15, BaseColor.BLACK);
		    Paragraph price= new Paragraph("Totale: 3€", price_font);
		    price.setAlignment(2);
		    price.setSpacingBefore(30);
		    document.add(price);
			
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
