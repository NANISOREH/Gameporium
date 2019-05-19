package Controller;

import java.io.IOException;
import java.sql.SQLException;

import Beans.BeanCliente;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.*;

/**
 * Servlet implementation class ProductControl
 */
public class LoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

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
		HttpSession newSession = request.getSession(true);
		boolean accessDone;
//		if ((boolean) newSession.getAttribute("accessDone") == true)
//		{
//			accessDone = false;
//			response.sendRedirect("/Gameporium/home.jsp");
//		}
		
		BeanCliente cliente = new BeanCliente();
		String user = request.getParameter("un");
		String pass = request.getParameter("pw");
		ClienteModelDS cm;
		
		
		try 
		{
			cm = new ClienteModelDS();
			cliente = cm.doRetrieveByUserPass(user, pass);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if (cliente.getPasswordU() != "" && cliente.getUsername() != "")
		{
			newSession.setAttribute("currentSessionUser", cliente);
			accessDone = true;
			newSession.setAttribute("accessDone", accessDone);
			response.sendRedirect("/Gameporium/home.jsp"); 
		}
		else
			response.sendRedirect("/Gameporium/loginpage.jsp");
	}

}
