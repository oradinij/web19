package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TipologiaEsameDAO;
import dto.TipologiaEsameDTO;

/**
 * Servlet implementation class ListaEsami
 */
@WebServlet(description = "recupera la lista esami per la pagina listaEsami.jsp", urlPatterns = { "/medico/ListaEsami" })
public class ListaEsami extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//controllo se gia c'e la lista esami in caso contrario la recupero e la associo alla sessione
		
		HttpSession session = request.getSession();
		ArrayList<TipologiaEsameDTO> listaEsami = (ArrayList<TipologiaEsameDTO>) session.getAttribute("listaEsami");
		
		if (listaEsami == null) {
			
			listaEsami = new TipologiaEsameDAO().getAll();
			session.setAttribute("listaEsami", listaEsami);
		}
		
		response.sendRedirect(request.getContextPath()+"/medico/listaEsami.jsp");	
		
	}


}
