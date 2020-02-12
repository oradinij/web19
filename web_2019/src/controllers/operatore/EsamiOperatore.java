package controllers.operatore;




import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OperatoreDAO;
import dao.TipologiaEsameDAO;
import dao.TipologiaVisitaDAO;
import dto.MedicoDTO;
import dto.OperatoreDTO;
import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import web_2019.VisitaCorrente;

/**
 *  
 */
@WebServlet("/operatore/esamiOperatore")
public class EsamiOperatore extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		

		OperatoreDTO user = (OperatoreDTO) request.getSession().getAttribute("user");
		if(user!=null) {
		int id_operatore = user.getId();
		
		user = new OperatoreDAO().getUserById(id_operatore);
		
		//TODO per mettere le info nel parco pazienti devo caricare gia la lista pazienti con relative info
		
		request.getSession().setAttribute("user",user);
		}

		response.sendRedirect(request.getContextPath()+"/operatore/esamiOperatore.jsp");

	}

}
