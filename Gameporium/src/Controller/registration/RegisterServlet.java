package Controller.registration;

import java.io.IOException;
import java.sql.SQLException;

import Beans.BeanCliente;
import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.*;

/**
 * Servlet implementation class ProductControl
 */
public class RegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public RegisterServlet() 
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
		
		BeanCliente cliente = new BeanCliente();
		String user = "";
		String pass = "";
		String rem = request.getParameter("remember");
		
		Cookie[] cookies = request.getCookies();

		if (cookies != null) 
		{
			for (Cookie cookie : cookies) 
			{
				if (cookie.getName().equals("savePass")) 
				{
					pass = cookie.getValue();
				}
				if (cookie.getName().equals("saveUser")) 
				{
					user = cookie.getValue();
				}
			}
		}
			
		pass = request.getParameter("pw");
		user = request.getParameter("un");
		
		
		Cookie savePass;
		Cookie saveUser;
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
			
			if (rem != null)
			{
				savePass = new Cookie("savePass", pass);
				saveUser = new Cookie("saveUser", user);
				response.addCookie(savePass);
				response.addCookie(saveUser);
			}
				
			response.sendRedirect("/Gameporium/home.jsp"); 
		}
		else
		{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loginpage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
