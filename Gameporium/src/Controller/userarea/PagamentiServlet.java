package Controller.userarea;
import Model.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Beans.Bean;
import Beans.BeanOrdine;
/**
 * Servlet implementation class ProductControl
 */
public class PagamentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static PagamentoModel pm =new PagamentoModel();

	public PagamentiServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String username=request.getParameter("username");
		Collection<Bean> bo=null;
		
		if(username!=null) {
			try {
				bo=pm.doRetrieveByUser(username);
				Collection<Bean> temp = bo.stream().distinct().collect(Collectors.toList());
				session.setAttribute("metodi", temp);
				response.setStatus(200);
				return;
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
