package Controller.userarea;
import Model.ClienteModel;
import Model.PagamentoModel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
import Beans.BeanCliente;
import Beans.BeanPagamento;

public class UserPresetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ClienteModel model=new ClienteModel();
	static PagamentoModel pm =new PagamentoModel();
	

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//prende la carta predefinita
		
		HttpSession session = request.getSession();
		BeanCliente c = (BeanCliente) session.getAttribute("currentSessionUser");
		String pred = Long.toString(c.getCartaPred());
		System.out.println(pred);
		String securecode = pred.substring(pred.length() - 4);
		Collection<Bean> bo=null;
		
		bo=(Collection<Bean>) session.getAttribute("metodi");

		for (Bean b : bo)
		{
			if (((BeanPagamento) b).getSecureCode().equals(securecode))
			{
				session.setAttribute("userFavSecureCode", ((BeanPagamento) b).getSecureCode());
				session.setAttribute("userFavCircuito", ((BeanPagamento) b).getCircuito());
				break;
			}
		}
		
		
		response.setStatus(200);
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//setta la carta predefinita nel model
		
		HttpSession session = request.getSession();
		BeanCliente c = (BeanCliente) session.getAttribute("currentSessionUser");
		String username = c.getUsername();
		String securecode = request.getParameter("securecode");
		Collection<Bean> bo=null;
		
		try {
			bo=(Collection<Bean>) session.getAttribute("metodi");

			for (Bean b : bo)
			{
				if (((BeanPagamento) b).getSecureCode().equals(securecode))
				{
					session.setAttribute("userFavSecureCode", ((BeanPagamento) b).getSecureCode());
					session.setAttribute("userFavCircuito", ((BeanPagamento) b).getCircuito());
					model.doUpdate("cartaPred", username, ((BeanPagamento) b).getNumCarta());
					break;
				}
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		}
		
		
		response.setStatus(200);
	}


}
