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
			String username=request.getParameter("username");
			Collection<Bean> bo=null;
			if(username!=null) {
				System.out.println("asfdas");
				try {
					bo=om.doRetrieveByUser(username);
					request.setAttribute("listaOrdini", bo);
					System.out.println("PARZIALE\n" + bo.toString());
//					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderoperation.jsp");
//					dispatcher.forward(request, response);
					response.setStatus(200);
					return;
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(username==null) {
					try {
						bo=om.doRetrieveAll("codiceOrdine");
						System.out.println("TOTALE\n" + bo.toString());
						request.setAttribute("listaOrdini", bo);
					}catch (SQLException e) {
						e.printStackTrace();
					}
				
				System.out.println(bo.toString());
//				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderoperation.jsp");
//				dispatcher.forward(request, response);
				response.setStatus(200);
			}
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
