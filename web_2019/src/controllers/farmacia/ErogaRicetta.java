package controllers.farmacia;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EsameDAO;
import dao.OperatoreDAO;
import dao.PazienteDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;
import dto.FarmaciaDTO;
import dto.OperatoreDTO;
import dto.PazienteDTO;
import dto.PrescrizioneDTO;
import dto.TipologiaVisitaDTO;
import utils.Logger;
import web_2019.PdfTicketPrescrizione;
import web_2019.VisitaCorrente;

/**
 * elimina la visita selezionato in /medico/riepilogoVisita.jsp dalla lista esami della visita corrente prima del definitivo inserimento nel database
 * @see VisitaCorrente
 */
@WebServlet("/farmacia/erogaRicetta")
public class ErogaRicetta extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FarmaciaDTO user = (FarmaciaDTO) request.getSession().getAttribute("user");
		Integer id_farmacia = user.getId();
		PazienteDTO paziente = (PazienteDTO) request.getSession().getAttribute("paziente");
		Integer id_paziente = paziente.getId();
		
		Integer id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		
		if(id_prenotazione != null) {

			new PrescrizioneDAO().aggiornaStato(id_prenotazione, 1);
			new PrescrizioneDAO().aggiornaFarmacia(id_prenotazione, id_farmacia);
			new PrescrizioneDAO().aggiornaData(id_prenotazione);
			PdfTicketPrescrizione.inviaMail(paziente, new PrescrizioneDAO().getById(id_prenotazione));
			
			paziente = new PazienteDAO().getUserById(id_paziente);
			
			request.getSession().setAttribute("paziente", paziente);
			
			Logger.log("erogata prescrizione %d", id_prenotazione);
			} else  {
				Logger.log("Nessuna  prescrizinoe erogata");
		};

		response.sendRedirect(request.getContextPath()+"/farmacia/ricettePazienteFarmacia.jsp");
		
		
	}


}