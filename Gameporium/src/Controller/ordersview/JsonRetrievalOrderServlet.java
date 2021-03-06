package Controller.ordersview;
import Model.OrdineModel;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Beans.BeanOrdine;
/**
 * Servlet implementation class ProductControl
 */
public class JsonRetrievalOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel om =new OrdineModel();

	public JsonRetrievalOrderServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		BeanOrdine bo= new BeanOrdine();

		String username= request.getParameter("username");
		String jsonBean = null;
		try {
			bo =om.doRetrieveByKey(username);
			jsonBean= new Gson().toJson(bo);
			System.out.println(jsonBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.getWriter().write(jsonBean);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
