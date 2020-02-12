package controllers.paziente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.iap.Response;

import dao.EsameDAO;
import dao.PazienteDAO;
import dao.VisitaDAO;
import dto.PazienteDTO;

/**
 * Prenotazione visita dal prorio medico di base
 */
@WebServlet("/paziente/prenotaVisitaBase")
public class PrenotaVisitaBase extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String time = req.getParameter("time");
		Integer id_medico = Integer.parseInt(req.getParameter("id_medico"));
		Integer id_paziente = Integer.parseInt(req.getParameter("id_paziente"));

		if(time != null && id_medico != null && id_paziente != null) {
			
			System.out.println("Nuova data: " + time);
			
			new VisitaDAO().creaPrenotazioneVisitaBase(1,id_paziente,id_medico, time, 1);
									
			PazienteDTO user = new PazienteDAO().getUserById(id_paziente);
			session.setAttribute("user", user);

			resp.sendRedirect(req.getContextPath()+"/paziente/medicoBasePaziente.jsp");
		}
		else {}//TODO messaggistica di errore
		}
	}
