package Controller.cart;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanCartEntry;
import Beans.BeanProduct;
import Model.ProductModel;

/**
 * Servlet implementation class CartRemove
 */
public class CartRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model= new ProductModel();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession();
		int remId=Integer.parseInt(request.getParameter("rimuovibtn"));
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("cartcardinality", cart.cartCardinality());
		}
		
		try {
			 BeanProduct b=model.doRetrieveByKey(remId);
	
			 BeanCartEntry bce=new BeanCartEntry(b);
			 cart.deleteProduct(bce);
			 
			 session.setAttribute("cart", cart);
			 session.setAttribute("cartcardinality", cart.cartCardinality());
			 }
		 catch (SQLException e) {
				System.out.println("Error:" + e.getMessage());
			}
		
		Collection<BeanCartEntry> bce = cart.getProducts();
		session.setAttribute("cartitems", bce);
		//cart.printCart();

		response.setStatus(200);
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("cart.jsp");
		dispatcher.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
