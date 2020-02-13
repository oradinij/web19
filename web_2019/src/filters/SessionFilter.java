package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web_2019.Notifica;

/**
 * Filtro che controlla l esistenza di una variabile user necessaria per le pagine che richiedono autenticazione (medico e paziente)
 */
@WebFilter(urlPatterns = { "/medico/*", "/paziente/*", "/farmacia/*" })
public class SessionFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest) request).getSession();
		if(session.getAttribute("user")==null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/index.jsp");
		}
		//((HttpServletRequest) request).getSession().setAttribute("notifica", new Notifica("<strong> Sessione scaduta</strong>, per favore effettua nuovamente il <strong>login</strong>", Notifica.WARNING));
		chain.doFilter(request, response);
	}
	

	public void init(FilterConfig fConfig) throws ServletException {}
	public void destroy() {}


}
