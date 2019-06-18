package Controller.productview;
import Model.AccessorioModel;
import Model.GiocoModel;
import Model.ProductModel;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Beans.BeanAccessorio;
import Beans.BeanGioco;
import Beans.BeanProduct;
/**
 * Servlet implementation class ProductControl
 */
public class JsonRetrievalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model=new ProductModel();
	static GiocoModel gm=new GiocoModel();
	static AccessorioModel am=new AccessorioModel();
	
	public JsonRetrievalServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		BeanProduct bp= new BeanProduct();
		BeanGioco bg=new BeanGioco();
		BeanAccessorio ba=new BeanAccessorio();
		String codProd= request.getParameter("codiceProdotto");
		String jsonBean = null;
		try {
			bp =model.doRetrieveByKey(Integer.parseInt(codProd));
			if (bp.getCodCategoria()==1) {
				bg=gm.doRetrieveByKey(Integer.parseInt(codProd));
				jsonBean= new Gson().toJson(bg);
			}
			else {
				ba=am.doRetrieveByKey(Integer.parseInt(codProd));
				jsonBean= new Gson().toJson(ba);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.getWriter().write(jsonBean);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
