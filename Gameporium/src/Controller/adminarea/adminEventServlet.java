package Controller.adminarea;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.Bean;
import Beans.BeanEvento;
import Model.EventoModel;

/**
 * Servlet implementation class adminServlet
 */

public class adminEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static EventoModel model=new EventoModel();

 
    public adminEventServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op=request.getParameter("operation");
		int operation=Integer.parseInt(op);
		
		if(operation==3) {
			System.out.println("operation: "+operation);
			int codE=Integer.parseInt(request.getParameter("codiceEvento"));
			try {
				model.doDelete(codE);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return;
		}
		
		else if(operation==1) {
			BeanEvento be =new BeanEvento();
			int codE=Integer.parseInt(request.getParameter("codiceEvento"));
			String nome=request.getParameter("nome");
			String luogo=request.getParameter("luogo");
			String descrizione=request.getParameter("descrizione");
			String dataEvento=request.getParameter("dataEvento");
			String ora=request.getParameter("ora");
			String locandina=request.getParameter("locandina");
		
			be.setCodiceEvento(codE);
			be.setDescrizione(descrizione);
			be.setNome(nome);
			be.setLuogo(luogo);
			be.setDataEvento(LocalDate.parse(dataEvento));
			be.setOra(LocalTime.parse(ora));
			be.setNumeroPartecipanti(0);
			be.setLocandina(locandina);
			System.out.println(be.toString());
			
			try {
				model.doSave(be);
			}
			catch (SQLException e) {
				e.printStackTrace();
				}
			return;
		}
		else if(operation ==2) {
			System.out.println("operazione 2");
			BeanEvento be= new BeanEvento();
			int codE=Integer.parseInt(request.getParameter("codiceEvento"));
			try {
				be=model.doRetrieveByKey(codE);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			int codiceEvento=Integer.parseInt(request.getParameter("codiceEvento"));
			if(codiceEvento!=be.getCodiceEvento()) {
				try {
					model.doUpdate("codiceEvento", codE, codiceEvento);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String nome=request.getParameter("nome");
			if(!nome.equals(be.getNome())) {
				try {
					model.doUpdate("produttore", codE, nome);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String descrizione=request.getParameter("descrizione");
			if(!descrizione.equals(be.getDescrizione())) {
				try {
					model.doUpdate("descrizione", codE, descrizione);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String luogo=request.getParameter("luogo");
			if(!luogo.equals(be.getLuogo())) {
				try {
					model.doUpdate("luogo", codE, luogo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String dataEvento=request.getParameter("dataEvento");
			LocalDate de= LocalDate.parse(dataEvento);
			if((de)!=be.getDataEvento()) {
				try {
					model.doUpdate("dataEvento", codE, de);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String ora=request.getParameter("ora");
			LocalTime o= LocalTime.parse(ora);
			if((o)!=be.getOra()) {
				try {
					model.doUpdate("ora", codE, o);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String numeroPartecipanti=request.getParameter("numeroPartecipanti");
			if(Integer.parseInt(numeroPartecipanti)!=be.getNumeroPartecipanti()) {
				try {
					model.doUpdate("numeroPartecipanti", codE, numeroPartecipanti);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			String locandina=request.getParameter("locandina");
			if(!locandina.equals(be.getLocandina())) {
				try {
					model.doUpdate("locandina", codE, locandina);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			
			return;
		}
			Collection <Bean> bpr = null;
			try {
				bpr=model.doRetrieveAll("codiceEvento");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println(bpr);

			request.setAttribute("elencoEventi", bpr);

			return;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
