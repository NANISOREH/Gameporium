package Controller.testing;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.BeanGioco;
import Beans.BeanProduct;
import Model.GiocoModel;
import Model.ProductModel;

/**
 * Servlet implementation class TestProduct
 */
@WebServlet("/TestProduct")
public class TestProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		GiocoModel pm = new GiocoModel();
		BeanGioco bg = new BeanGioco();
		
		try {
			bg = pm.doRetrieveByKey(2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("currentProduct", bg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
