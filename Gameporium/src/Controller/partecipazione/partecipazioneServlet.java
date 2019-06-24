package Controller.partecipazione;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.BeanPartecipazione;
import Model.PartecipazioneModel;

@WebServlet("/partecipazioneServlet")
public class partecipazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PartecipazioneModel pm=new PartecipazioneModel();
	

    public partecipazioneServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String codE=request.getParameter("codiceEvento");
		String user=request.getParameter("username");
		System.out.println("mamma");
		BeanPartecipazione bp=new BeanPartecipazione();
		bp.setCodiceCliente(user);
		bp.setCodiceEvento(Integer.parseInt(codE));
		try {
			pm.doSave(bp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
