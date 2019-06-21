package Controller.registration;

import java.io.IOException;
import java.sql.SQLException;

import Beans.BeanAmministratore;
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
		
		BeanCliente cliente = new BeanCliente();
		BeanAmministratore amministratore = new BeanAmministratore();
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
		ClienteModel cm;
		AmministratoreModel am;
		
		try 
		{
			cm = new ClienteModel();
			am = new AmministratoreModel();
			cliente = cm.doRetrieveByUserPass(user, pass);
			amministratore = am.doRetrieveByUserPass(user, pass);
			
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		if (cliente.getPasswordU() != "" && cliente.getUsername() != "")
		{
			newSession.setAttribute("currentSessionUser", cliente);
			newSession.setAttribute("accessDone", true);	
			
			if (rem != null)
			{
				savePass = new Cookie("savePass", pass);
				saveUser = new Cookie("saveUser", user);
				savePass.setMaxAge(50000);
				saveUser.setMaxAge(50000);
				response.addCookie(savePass);
				response.addCookie(saveUser);
			}
			
			request.setAttribute("loginSuccess", true);
			response.sendRedirect("/Gameporium/home.jsp?loginSuccess=true"); 
		}
		if (amministratore.getPasswordU() != "" && amministratore.getUsername() != "")
		{
			newSession.setAttribute("currentSessionUser", amministratore);
			newSession.setAttribute("accessDone", true);	
			
			if (rem != null)
			{
				savePass = new Cookie("savePass", pass);
				saveUser = new Cookie("saveUser", user);
				savePass.setMaxAge(50000);
				saveUser.setMaxAge(50000);
				response.addCookie(savePass);
				response.addCookie(saveUser);
			}
			
			newSession.setAttribute("isAdmin", true);	
			request.setAttribute("loginSuccess", true);
			response.sendRedirect("/Gameporium/home.jsp?loginSuccess=true");
		}
		else if (amministratore.getUsername() == "" && cliente.getUsername() == "")
		{
			request.setAttribute("loginFail", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp?loginFail=true");
			dispatcher.forward(request, response);
		}
			
	}

}
