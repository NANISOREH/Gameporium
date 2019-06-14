package Controller.productview;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanProduct;
import Beans.Cart;
import Model.ProductModel;

/**
 * Servlet implementation class ProductControl
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	static ProductModel model= new ProductModel();

	
	public CartServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			System.out.println("Carrello nullo");
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		//String action = request.getParameter("cartbutton");
		int quant=Integer.parseInt (request.getParameter("quantita"));
		int id=Integer.parseInt(request.getParameter("acquistabtn"));
		
		try {
			cart.addProduct(model.doRetrieveByKey(id));
			session.setAttribute("cart", cart);
			}
		
		 catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("????????");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
