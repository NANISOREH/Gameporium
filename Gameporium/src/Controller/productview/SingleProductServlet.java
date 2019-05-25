package Controller.productview;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.BeanAccessorio;
import Beans.BeanGioco;
import Model.AccessorioModel;
import Model.GiocoModel;

/**
 * Servlet implementation class SingleProductServlet
 */
@WebServlet("/SingleProductServlet")
public class SingleProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		String selCat = request.getParameter("selCat");
		
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
			request.setAttribute("isGioco", true);
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
			request.setAttribute("isAccessorio", true);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/productpage.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
