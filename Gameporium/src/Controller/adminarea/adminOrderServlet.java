package Controller.adminarea;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
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
			String dataDa=request.getParameter("dataDa");
			String dataA=request.getParameter("dataA");
			Collection<Bean> bo=null;
			if(dataDa!=null && dataDa!="" && (username==""||username==null)) {
				try {
					bo=om.doRetrieveByDateFrom(LocalDate.parse(dataDa));
					System.out.println("retrieve by DateFrom:" + bo);
					session.setAttribute("listaOrdini", bo);
					response.setStatus(200);
					return;
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(dataA!=null && dataA!="" && (username==""||username==null)) {
				try {
					bo=om.doRetrieveByDateTo(LocalDate.parse(dataA));
					session.setAttribute("listaOrdini", bo);
					System.out.println("retrieve by DateTo:" + bo);
					response.setStatus(200);
					return;
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(username!=null && username!="" && (dataDa==null||dataDa==""||dataA==""||dataA==null)) {
				try {
					bo=om.doRetrieveByUser(username);
					session.setAttribute("listaOrdini", bo);
					System.out.println("retrieve by username:" + bo);
					response.setStatus(200);
					return;
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(dataDa!=null && dataA!=null) {
				if(username!=null) {
					try {
						bo=om.doRetrieveByUserBetweenDate(LocalDate.parse(dataDa), LocalDate.parse(dataA), username);
						session.setAttribute("listaOrdini", bo);
						System.out.println("retrieve by username betweendate:" + bo);
						response.setStatus(200);
						return;
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
				else {
					try {
						bo=om.doRetrieveByDateBetween(LocalDate.parse(dataDa), LocalDate.parse(dataA));
						session.setAttribute("listaOrdini", bo);
						System.out.println("retrieve by dataDa e  dataA:" + bo);
						response.setStatus(200);
						return;
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			if(username==null) {
				System.out.println("lista totale");
					try {
						bo=om.doRetrieveAll("codiceOrdine");
						session.setAttribute("listaOrdini", bo);
						System.out.println("retrieve by all:" + bo);
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
