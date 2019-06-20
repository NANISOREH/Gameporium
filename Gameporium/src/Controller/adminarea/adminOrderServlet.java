package Controller.adminarea;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.Bean;
import Beans.BeanOrdine;
import Model.OrdineModel;

/**
 * Servlet implementation class adminOrderServlet
 */
@WebServlet("/adminOrderServlet")
public class adminOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static OrdineModel om=new OrdineModel();   
 
    public adminOrderServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String op=request.getParameter("operation");
//		int operation=Integer.parseInt(op);
		String user=request.getParameter("username");
		//if(operation==1) {
			Collection<Bean> bo=null;
			try {
				bo=om.doRetrieveAll(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("listaOrdini", bo);
			System.out.println(bo.toString());
		/*}
		else {
			Collection<Bean> bo=null;
			try {
				bo=om.doRetrieveByUser(user);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("listaOrdini", bo);
			System.out.println(bo.toString());
		}*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user=request.getParameter("username");
		Collection<Bean> bo=null;
		try {
			bo=om.doRetrieveByUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaOrdini", bo);
		System.out.println(bo.toString());
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderoperation.jsp");
		dispatcher.forward(request, response);
	}

}
