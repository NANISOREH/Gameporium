package Controller.eventsview;
import Model.AccessorioModel;
import Model.EventoModel;
import Model.GiocoModel;
import Model.ProductModel;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Beans.BeanAccessorio;
import Beans.BeanEvento;
import Beans.BeanGioco;
import Beans.BeanProduct;
/**
 * Servlet implementation class ProductControl
 */
public class JsonRetrievalEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static EventoModel model=new EventoModel();
	
	public JsonRetrievalEventServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		BeanEvento be=new BeanEvento();
		String codEvento= request.getParameter("codEvento");
		String jsonBean = null;
		try {
			be =model.doRetrieveByKey(Integer.parseInt(codEvento));
			jsonBean= new Gson().toJson(be);
						
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
