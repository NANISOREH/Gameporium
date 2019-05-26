package Controller.eventsview;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
import Model.*;
/**
 * Servlet implementation class ProductControl
 */
public class EventShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static EventoModel model=new EventoModel();
	
	public EventShowServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		try {
				Collection <Bean> be= model.doRetrieveAll("codiceEvento");
				session.setAttribute("listaRisultatiEventi", be);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
