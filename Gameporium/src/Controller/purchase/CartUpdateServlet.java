package Controller.purchase;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanCartEntry;
import Beans.BeanProduct;
import Model.ProductModel;

public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model = new ProductModel();

	public CartUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		String remid = request.getParameter("rimuovibtn");
		int newQuant = Integer.parseInt(request.getParameter("quantita"));
		int refProd = Integer.parseInt(request.getParameter("productId"));

		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("cartcardinality", cart.cartCardinality());
			session.setAttribute("totale", cart.getTotale());
			session.setAttribute("iva", cart.getIva());
		}

		try {

			if (remid != null) {
				int remId = Integer.parseInt(remid);
				BeanProduct b = model.doRetrieveByKey(remId);
				BeanCartEntry bce = new BeanCartEntry(b);
				cart.deleteProduct(bce);
			}

			else {
				BeanProduct b1 = model.doRetrieveByKey(refProd);
				BeanCartEntry bce1 = new BeanCartEntry(b1);
				cart.refresh(bce1, newQuant);
			}

			session.setAttribute("cart", cart);
			session.setAttribute("cartcardinality", cart.cartCardinality());
			session.setAttribute("totale", cart.getTotale());
			session.setAttribute("iva", cart.getIva());

		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		Collection<BeanCartEntry> bce = cart.getProducts();
		session.setAttribute("cartitems", bce);
		// cart.printCart();

		response.setStatus(200);

		RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
