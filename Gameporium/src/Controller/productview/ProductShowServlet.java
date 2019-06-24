package Controller.productview;
import Model.ProductModel;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;

public class ProductShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model=new ProductModel();
	
	public ProductShowServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		//home
		if (request.getAttribute("home") != null)
		{
			try {
				Collection <Bean> bpo= model.doRetrieveByBool("offerta",true);
				request.setAttribute("offerteHome", bpo);
				Collection <Bean> bpn= model.doRetrieveByBool("novita",true);
				request.setAttribute("novitaHome", bpn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return;
		}
		//home
	
		Collection <Bean> bpr;
		
		String cat=request.getParameter("categoria");
		String val=request.getParameter("value");
		String at=request.getParameter("attribute");
		String ric=request.getParameter("searchtxt");
		
		try {
				if(ric!=null) {
					bpr=model.doRetrieveByResearch(ric);
					session.setAttribute("listaRisultati", bpr);
				}
							
				if (at!=null && val!=null) {
					if (cat == null || cat.equals("")) {
						bpr= model.doRetrieveByAttribute(at,val);
						session.setAttribute("listaRisultati", bpr);
					}
					else {
						bpr= model.doRetrieveByAttribute(cat,at,val);
						session.setAttribute("listaRisultati", bpr);
					}
				}
				else{
					bpr=model.doRetrieveByCat(cat);
					session.setAttribute("listaRisultati", bpr);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
