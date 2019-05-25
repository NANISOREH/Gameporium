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
public class ProductShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model=new ProductModel();
	
	public ProductShowServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		String cat=request.getParameter("categoria");
		String val=request.getParameter("value");
		String at=request.getParameter("attribute");
		try {
				if (at!=null && at!=null) {
					Collection <Bean> bpr= model.doRetrieveByAttribute(cat,at,val);
					session.setAttribute("listaRisultati", bpr);
				}
				else{
					Collection <Bean> bpr=model.doRetrieveByCat(cat);
					session.setAttribute("listaRisultati", bpr);
				}
				
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
