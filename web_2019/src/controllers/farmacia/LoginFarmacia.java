package controllers.farmacia;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FarmaciaDAO;
import dto.FarmaciaDTO;
import filters.CookiesFilterFarmacia;


/**
 * <h2>Controller login Farmacia</h2>
 *<p>
 * Controller dedicato all'autenticazione della farmacia in base a username e password
 * </p>
 * @see CookiesFilterFarmacia
 */
@WebServlet("/login/LoginFarmacia")
public class LoginFarmacia extends HttpServlet {
	private static final long serialVersionUID = 1L;


	//TODO: doPost
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		FarmaciaDTO user=null;

		String attemptedPassword = request.getParameter("password");
		String email = request.getParameter("email");
		String remember_me = request.getParameter("remember_me"); 

		//cerco l'utente in base a user e pass e in caso setto i cookies
		try {user=new FarmaciaDAO().getUser(email, attemptedPassword);}
		catch (Exception e) {e.printStackTrace();}

		if(remember_me != null && user != null) {	
			String remember_me_UUID = UUID.randomUUID().toString();
			Cookie cookie = new Cookie("REMEMBER_ME", remember_me_UUID);
			cookie.setHttpOnly(true);//contro gli XSS
			cookie.setMaxAge(60*15);// 60*15 secondi di durata del cookie
			response.addCookie(cookie);
			new FarmaciaDAO().setNewSession(user.getId(), remember_me_UUID);//UUID crittograficamente sicuro
		}

		session.setAttribute("user", user);
		String nextPage = user!= null? "/farmacia/dettagliFarmacia.jsp": "/login/loginFarmacia.jsp" ;
		response.sendRedirect(request.getContextPath() + nextPage);

	}

}

