package Controller.userarea;
import Model.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Beans.Bean;
import Beans.BeanPagamento;
/**
 * Servlet implementation class ProductControl
 */
public class PagamentiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static PagamentoModel pm =new PagamentoModel();

	public PagamentiServlet() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("prova");
		
		HttpSession session = request.getSession();
		String username=request.getParameter("username");
		String securecode=request.getParameter("securecode");
		Collection<Bean> bo=null;
		
		if(username!=null && request.getParameter("retrieve") != null) {
			try {
				bo=pm.doRetrieveByUser(username);
				session.setAttribute("metodi", bo);
				response.setStatus(200);
				return;
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(request.getParameter("remove") != null)
		{
			try {
				bo=(Collection<Bean>) session.getAttribute("metodi");

				for (Bean b : bo)
				{
					if (((BeanPagamento) b).getSecureCode().equals(securecode))
					{
						pm.doDelete(((BeanPagamento) b).getNumCarta());
						break;
					}
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		response.setStatus(200);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		BeanPagamento metodo = new BeanPagamento();
		Collection<Bean> bo=null;
		
		String username=request.getParameter("username");

		if(request.getParameter("insert")!= null)
		{
			metodo.setNumCarta(Long.parseLong(request.getParameter("numero")));
			metodo.setCvv(Integer.parseInt(request.getParameter("cvv")));
			metodo.setCircuito(request.getParameter("circuito"));
			metodo.setScadenza(request.getParameter("scadenza"));
			try {
				pm.customDoSave(metodo, request.getParameter("username"));
			} catch (SQLException e) {
				if (request.getParameter("isOrder") != null)
				{
					response.sendRedirect("/Gameporium/order.jsp?azione=pagamento&cardNotAdded=true"); 
				}
				response.sendRedirect("/Gameporium/clientpage.jsp?azione=pagamento&cardNotAdded=true");
				e.printStackTrace();
				return;
			}
				
			if (request.getParameter("isOrder") != null)
			{
				response.sendRedirect("/Gameporium/order.jsp?creditCardSuccess=true"); 
				return;
			}
			if (request.getParameter("isOrder") == null)
			{
				response.sendRedirect("/Gameporium/clientpage.jsp?azione=pagamento&creditCardSuccess=true"); 
			}
				
		}
		
		response.setStatus(200);
	}

}
