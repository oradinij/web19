package controllers.paziente;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PazienteDAO;
import dto.PazienteDTO;
import filters.CookiesFilterPaziente;

/**
 * <h2>Controller login paziente</h2>
 *<p>
 * Controller dedicato all'autenticazione dell'utente in base a username e password
 * </p>
 * @see CookiesFilterPaziente
 */

@WebServlet("/login/loginPaziente")
public class LoginPaziente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrintWriter out;
	//Statement stmt = null;


	//TODO: doPost
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		HttpSession session = request.getSession();
		PazienteDAO pazienteDAO = new PazienteDAO();

		PazienteDTO user=null;

		String attemptedPassword = request.getParameter("password");
		String email = request.getParameter("email");
		String remember_me = request.getParameter("remember_me"); 

		//cerco l'utente in base a user e pass e in caso setto i cookies
		try {user=pazienteDAO.getUser(email, attemptedPassword);}
		catch (Exception e) {e.printStackTrace();}

		if(remember_me != null && user != null) {	
			String remember_me_UUID = UUID.randomUUID().toString();
			Cookie cookie = new Cookie("REMEMBER_ME", remember_me_UUID);
			cookie.setHttpOnly(true);//contro gli XSS
			cookie.setMaxAge(60*15);// 60*15 secondi di durata del cookie
			response.addCookie(cookie);
			pazienteDAO.setNewSession(user.getId(), remember_me_UUID);//UUID crittograficamente sicuro
		}

		session.setAttribute("user", user);
		String nextPage = user!= null? "/paziente/dettagliPaziente.jsp": "/login/loginPaziente.jsp" ;
		response.sendRedirect(request.getContextPath() + nextPage);

	}

}
