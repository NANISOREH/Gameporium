package Controller.productview;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.BeanAccessorio;
import Beans.BeanGioco;
import Beans.BeanProduct;
import Model.AccessorioModel;
import Model.GiocoModel;
import Model.ProductModel;

/**
 * Servlet implementation class SingleProductServlet
 */
@WebServlet("/SingleProductServlet")
public class SingleProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductModel pm=new ProductModel();
	GiocoModel gm=new GiocoModel();
	AccessorioModel am=new AccessorioModel();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingleProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String numProd = request.getParameter("selProd");
		String selCat =request.getParameter("selCat");
		BeanGioco bg = new BeanGioco();
		BeanAccessorio ba = new BeanAccessorio();
		
		if (Integer.parseInt(selCat) == 1)
		{
			GiocoModel gm = new GiocoModel();
			try 
			{
				bg = gm.doRetrieveByKey(Integer.parseInt(numProd));
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			request.setAttribute("gioco", bg);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/productpage.jsp");
			dispatcher.forward(request, response);
		}
		else if (Integer.parseInt(selCat) == 2) 
		{
			AccessorioModel am = new AccessorioModel();
			try 
			{
				ba = am.doRetrieveByKey(Integer.parseInt(numProd));
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			request.setAttribute("accessorio", ba);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/productpage.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String codP=request.getParameter("codProd");
		BeanGioco bg = new BeanGioco();
		BeanAccessorio ba = new BeanAccessorio();
		BeanProduct bp=new BeanProduct();
		
		try {
			bp=pm.doRetrieveByKey(Integer.parseInt(codP));
			if (bp.getCodCategoria()==1) {
				bg=gm.doRetrieveByKey(Integer.parseInt(codP));
				session.setAttribute("prodotto", bp);
				session.setAttribute("gioco", bg);
			}
			else if(bp.getCodCategoria()==2) {
				ba=am.doRetrieveByKey(Integer.parseInt(codP));
				session.setAttribute("accessorio", ba);
				session.setAttribute("prodotto", bp);				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
				System.out.println("sono nella post");
	}

}
