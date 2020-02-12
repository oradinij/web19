
package controllers.operatore;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OperatoreDAO;
import dao.PazienteDAO;
import dto.OperatoreDTO;
import dto.PazienteDTO;
import filters.CookiesFilterPaziente;
import utils.Logger;
import web_2019.Message;
import web_2019.Notifica;

/**
 * <h2>Controller login paziente</h2>
 *<p>
 * Controller dedicato all'autenticazione dell'utente in base a username e password
 * </p>
 * @see CookiesFilterPaziente
 */

@WebServlet("/login/loginOperatore")
public class LoginOperatore extends HttpServlet {
	private static final long serialVersionUID = 1L;


	//TODO: doPost
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		OperatoreDAO operatoreDAO = new OperatoreDAO();

		OperatoreDTO user=null;

		String attemptedPassword = request.getParameter("password");
		String email = request.getParameter("email");
		String remember_me = request.getParameter("remember_me"); 

		//cerco l'utente in base a user e pass e in caso setto i cookies
		try {user=operatoreDAO.getUser(email, attemptedPassword);}
		catch (Exception e) {e.printStackTrace();}

		if(remember_me != null && user != null) {	
			String remember_me_UUID = UUID.randomUUID().toString();
			Cookie cookie = new Cookie("REMEMBER_ME", remember_me_UUID);
			cookie.setHttpOnly(true);//contro gli XSS
			cookie.setMaxAge(60*15);// 60*15 secondi di durata del cookie
			response.addCookie(cookie);
			operatoreDAO.setNewSession(user.getId(), remember_me_UUID);//UUID crittograficamente sicuro
		}

		session.setAttribute("user", user);
		ArrayList<Message> lista_messaggi =new ArrayList<Message>();
		
		
		String nextPage;
		if(user!= null) {
			nextPage = "/operatore/homeOperatore.jsp";
			request.getSession().setAttribute("user", user);

			request.getSession().setAttribute("notifica", new Notifica("Login corretto", Notifica.SUCCESS));
			
		}
		else {
			nextPage = "/login/loginOperatore.jsp" ;
			request.getSession().setAttribute("notifica", new Notifica("Login fallito", Notifica.DANGER));
		
		}
		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);

	}

}