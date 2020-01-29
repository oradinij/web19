package controllers.paziente;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.iap.Response;

import dto.PazienteDTO;

/**
 * Prenotazione visita dal prorio medico di base
 */
@WebServlet("/paziente/prenotaVisita")
public class PrenotaVisita extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String data = req.getParameter("data");
		String ora = req.getParameter("ora");

		if(data != null && ora != null) {
			String data_ora = data +" "+ora;
			PazienteDTO user = (PazienteDTO)req.getSession().getAttribute("user");
			user.aggiungiPrenotazioneVisita(data_ora);
			resp.sendRedirect(req.getContextPath()+"/paziente/dettagliPaziente.jsp");
		}
		else {}//TODO messaggistica di errore
		}
	}
