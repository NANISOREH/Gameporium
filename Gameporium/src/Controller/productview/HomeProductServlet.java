package Controller.productview;
import Model.ProductModel;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
/**
 * Servlet implementation class ProductControl
 */
public class HomeProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model=new ProductModel();
	
	public HomeProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		if (session.getAttribute("listaOfferta")==null && session.getAttribute("listaNovita")==null)
		{
			try {
				Collection <Bean> bpo= model.doRetrieveByBool("offerta",true);
				session.setAttribute("listaOfferta", bpo);
				Collection <Bean> bpn= model.doRetrieveByBool("novita",true);
				session.setAttribute("listaNovita", bpn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
