package Controller.userarea;
import Model.*;
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
public class PagamentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel om =new OrdineModel();

	public PagamentiServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
