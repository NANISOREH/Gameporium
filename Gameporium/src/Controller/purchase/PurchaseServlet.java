package Controller.purchase;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.OrdineModel;

/**
 * Servlet implementation class ClientOrderServlet
 */
public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel om=new OrdineModel();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String username=request.getParameter("username");
		String jsonAddress=request.getParameter("jsonaddress");
		String importo=request.getParameter("importo");
		Cart cart=(Cart) session.getAttribute("cart");
		
		
		try {
			int oC=om.getMaxOrderCode()+1;
			String orderCode="000"+oC;
			LocalDate dataOrdine=LocalDate.now();
			
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
