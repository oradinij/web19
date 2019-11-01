package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Filtro che controlla l esistenza di una variabile user necessaria per le pagine che richiedono autenticazione (medico e paziente)
 */
@WebFilter(urlPatterns = { "/medico/*", "/paziente/*" })
public class SessionFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest) request).getSession();
		if(session.getAttribute("user")==null) {
			((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/index.jsp");
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {}
	public void destroy() {}


}
