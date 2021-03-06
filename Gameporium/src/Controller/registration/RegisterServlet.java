package Controller.registration;

import java.io.IOException;
import java.sql.SQLException;

import Beans.BeanCliente;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		ClienteModel cm = new ClienteModel();;
		BeanCliente cliente = new BeanCliente();
		BeanCliente testCliente = null;
		
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String mail = request.getParameter("mail");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String check = request.getParameter("check");
		
		try 
		{
			testCliente = cm.doRetrieveByKey(user);
			testCliente = cm.doRetrieveByEmail(mail);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		String testUser = testCliente.getUsername();
		String testMail = testCliente.getRecapito();
		
		if (!testUser.equals("") || !testMail.equals(""))
		{
			if (!testUser.equals(""))
				request.setAttribute("userPresent", true);
			
			if (!testMail.equals(""))
				request.setAttribute("mailPresent", true);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		
		
		if (check != null)
		{
			cliente.setNome(name);
			cliente.setCognome(surname);
			cliente.setUsername(user);
			cliente.setPasswordU(pass);
			cliente.setRecapito(mail);
		
			try 
			{
				cm.doSave(cliente);
				System.out.println(cliente);
			} 
			catch (SQLException e) 
			{
				request.setAttribute("notRegistered", true);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
				dispatcher.forward(request, response);
				e.printStackTrace();
			}
			
			request.setAttribute("registered", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
			dispatcher.forward(request, response);
		}
		else
		{	
			request.setAttribute("notRegistered", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
