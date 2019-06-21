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
import javax.servlet.http.HttpSession;

import Beans.Bean;
import Beans.BeanOrdine;
import Model.OrdineModel;

/**
 * Servlet implementation class adminOrderServlet
 */
//@WebServlet("/adminOrderServlet")
public class adminOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static OrdineModel om=new OrdineModel();   
 
    public adminOrderServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String username=request.getParameter("username");
			Collection<Bean> bo=null;
			if(username!=null) {
				try {
					bo=om.doRetrieveByUser(username);
					session.setAttribute("listaOrdini", bo);
					response.setStatus(200);
					return;
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(username==null) {
				System.out.println("lista totale");
					try {
						bo=om.doRetrieveAll("codiceOrdine");
						session.setAttribute("listaOrdini", bo);
						System.out.println(bo);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					response.setStatus(200);
			}
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
