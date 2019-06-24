package Controller.purchase;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
import Beans.BeanOrdine;
import Beans.BeanPagamento;
import Model.OrdineModel;
import Model.PagamentoModel;

/**
 * Servlet implementation class ClientOrderServlet
 */
public class PurchaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static OrdineModel om=new OrdineModel();
	static PagamentoModel pm=new PagamentoModel();
       
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		BeanOrdine b = new BeanOrdine();
		
//		String username=request.getParameter("username");
		String jsonAddress=request.getParameter("jsonaddress");
		String importo=request.getParameter("importo");
		String metodo=request.getParameter("metodoselect");
		
		Cart cart=(Cart) session.getAttribute("cart");
		String statoProdotti = cart.formatStatoProdotti();
		System.out.println(statoProdotti + "\n\n\n");
		System.out.println(metodo);
		
		try {
		b.setCodiceOrdine(om.getMaxOrderCode()+1);
		b.setIndirizzoSpedizione(jsonAddress);
		b.setDataOrdine(LocalDate.now());
		b.setDataSpedizione(null);
		b.setImporto(new BigDecimal(importo));
		b.setStatoProdotti(statoProdotti);
		
		@SuppressWarnings("unchecked")
		Collection<Bean> bo=(Collection<Bean>) session.getAttribute("metodi");
		for (Bean bean : bo)
		{
			if (((BeanPagamento) bean).getSecureCode().equals(metodo))
			{
				b.setMetodo(((BeanPagamento) bean).getNumCarta());
				break;
			}
		}
		
		om.doSave(b);
		
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		response.sendRedirect("/Gameporium/home.jsp?orderDone=true");
	}

}
