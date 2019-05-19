package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanCliente;
import Model.*;

/**
 * Servlet implementation class ProductControl
 */
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static ProductModel model = new ProductModelDS();

	public LoginServlet() 
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		BeanCliente cliente = new BeanCliente();
		String user = request.getParameter("un");
		String pass = request.getParameter("pw");
		
		try 
		{
			ClienteModelDS cm = new ClienteModelDS();
			cliente = cm.doRetrieveByUserPass(user, pass);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if (cliente.getPasswordU() != "" && cliente.getUsername() != "")
		{
			HttpSession session = request.getSession(true);
			session.setAttribute("currentSessionUser", cliente); 
			response.sendRedirect("/Gameporium/result.jsp"); 
		}
		else
			response.sendRedirect("/Gameporium/result.jsp");
	}

}
