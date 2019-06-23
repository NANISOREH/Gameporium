package Controller.userarea;
import Model.ClienteModel;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Beans.BeanCliente;

public class JsonRetrievalClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteModel model=new ClienteModel();
	
	public JsonRetrievalClienteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("sono nella JsonRetrievalClienteServlet");
		BeanCliente bc=new BeanCliente();
		String username= request.getParameter("user");
		String jsonBean = null;
		try {
			bc =model.doRetrieveByKey(username);
			System.out.println(bc);
			jsonBean= new Gson().toJson(bc);
						
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
