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

import dao.PazienteDAO;
import dto.PazienteDTO;

/**
 * Filtra le richieste dirette alla pagina di login, se trova un cookie ne cerca la corrispodenza nel database
 */
@WebFilter("/login/loginPaziente.jsp")
public class CookiesFilterPaziente implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		PazienteDTO user= new PazienteDAO().getUserbyCookie(request);

		if (user != null) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/paziente/dettagliPaziente.jsp");
		}
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {}
	public CookiesFilterPaziente() {}
	public void destroy() {}


}
