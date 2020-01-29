package controllers.medico;

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

import dao.MedicoDAO;
import dto.MedicoDTO;
import web_2019.Notifica;

/**
 * Servlet implementation class LoginMedico
 */
@WebServlet("/login/LoginMedico")
public class LoginMedico extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrintWriter out;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		MedicoDTO user=null;
		MedicoDAO medicoDAO = new MedicoDAO();

		String attemptedPassword = request.getParameter("password");
		String email = request.getParameter("email");
		String remember_me = request.getParameter("remember_me"); 


		//cerco l'utente in base a user e pass e in caso setto i cookies
		try {user=medicoDAO.getUser(email, attemptedPassword);}
		catch (Exception e) {e.printStackTrace();}

		if(remember_me != null) {
			String m_session=  UUID.randomUUID().toString();
			Cookie sessionCookie= new Cookie("m_session", m_session);
			sessionCookie.setMaxAge(60*15);

			medicoDAO.setNewSession(user.getId_medico(),m_session);

			response.addCookie(sessionCookie);
		}

		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		String nextPage;
		if(user != null) {
			nextPage = "/medico/homeMedicoBase.jsp";
		request.getSession().setAttribute("notifica", new Notifica("Login corretto", Notifica.SUCCESS));}
		else {
			nextPage = "/login/loginMedico.jsp" ;
			request.getSession().setAttribute("notifica", new Notifica("<strong>Login fallito:</strong> username o password sbagliati", Notifica.DANGER));
		}
		response.sendRedirect(request.getContextPath() + nextPage);

	}

}
