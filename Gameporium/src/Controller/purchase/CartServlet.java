package Controller.purchase;

import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanCartEntry;
import Beans.BeanProduct;
import Model.ProductModel;

/**
 * Servlet implementation class ProductControl
 */
public class CartServlet extends HttpServlet implements Serializable {
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
			session.setAttribute("cartcardinality", cart.cartCardinality());
			session.setAttribute("totale", cart.getTotale());
		}
		
		int quant=Integer.parseInt (request.getParameter("quantita"));
		int id=Integer.parseInt(request.getParameter("codice"));
																		
	
		try {
				BeanProduct b = model.doRetrieveByKey(id);
				BeanCartEntry bce=new BeanCartEntry(b,quant);
				if(b.getDisponibilita()>=quant)
				{
				 if(cart.cartContains(bce)) {
					        cart.setQuant(bce, quant);
				 						    }
				 else cart.addProduct(bce);
				}
				session.setAttribute("cart", cart);
				session.setAttribute("cartcardinality", cart.cartCardinality());
				session.setAttribute("totale", cart.getTotale());

			}
		
		 catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		Collection<BeanCartEntry> bce = cart.getProducts();
		session.setAttribute("cartitems", bce);

		response.setStatus(200);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
