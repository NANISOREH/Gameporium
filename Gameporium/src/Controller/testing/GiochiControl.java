package Controller.testing;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Bean;
import Model.GiocoModel;
import Model.ProductModel;

/**
 * Servlet implementation class GiochiControl
 */
@WebServlet("/GiochiControl")
public class GiochiControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel model=new GiocoModel();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GiochiControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String 
		
		try {
			Collection <Bean> bpo= model.doRetrieveByKey("ruolo");
			session.setAttribute("listaOfferta", bpo);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
