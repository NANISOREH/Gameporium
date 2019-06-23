
package Controller.eventsview;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Beans.BeanEvento;
import Model.EventoModel;

public class SingleEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventoModel em=new EventoModel();
	
    public SingleEventServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String codE = request.getParameter("selEvento");
		BeanEvento be = new BeanEvento();
			try 
			{
				be = em.doRetrieveByKey(Integer.parseInt(codE));
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			
			request.setAttribute("evento", be);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/eventpage.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
