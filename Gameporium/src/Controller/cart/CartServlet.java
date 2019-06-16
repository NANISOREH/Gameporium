package Controller.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanProduct;
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
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		
		int quant=Integer.parseInt (request.getParameter("quantita"));
		int id=Integer.parseInt(request.getParameter("codice"));
		
		try {
				BeanProduct b = model.doRetrieveByKey(id);
				for (int i=0; i<quant; i++)
				{
					cart.addProduct(b);
				}
				
				session.setAttribute("cart", cart);
			}
		
		 catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		Collection<BeanProduct> bp = cart.getProducts();
		session.setAttribute("cartitems", bp);
		
		response.setStatus(200);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
