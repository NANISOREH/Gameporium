package Controller.userarea;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanCliente;
import Model.ClienteModel;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteModel cm=new ClienteModel();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		BeanCliente cliente = new BeanCliente();

		
		cliente=(BeanCliente) session.getAttribute("currentSessionUser");
		String lastUser=cliente.getUsername();
		String user = request.getParameter("username");
		String pass = request.getParameter("pass");
		String mail = request.getParameter("mail");
		String name = request.getParameter("nome");
		String surname = request.getParameter("cognome");
		
		
		
		try 
		{
			cm.doUpdate(name,surname, user, pass, mail, lastUser);
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		cliente.setNome(name);
		cliente.setCognome(surname);
		cliente.setUsername(user);
		cliente.setPasswordU(pass);
		cliente.setRecapito(mail);
		session.setAttribute("currentSessionUser", cliente);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp?editDone=true");
		dispatcher.forward(request, response);
	}

}
