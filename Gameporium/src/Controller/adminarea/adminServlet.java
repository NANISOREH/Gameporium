package Controller.adminarea;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.BeanAccessorio;
import Beans.BeanGioco;
import Beans.BeanProduct;
import Model.AccessorioModel;
import Model.GiocoModel;
import Model.ProductModel;

/**
 * Servlet implementation class adminServlet
 */
@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model=new ProductModel();
	static GiocoModel modelg=new GiocoModel();
	static AccessorioModel modela=new AccessorioModel();
 
    public adminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BeanProduct p =new BeanProduct();
		int codP=Integer.parseInt(request.getParameter("codProd"));
		String titolo=request.getParameter("titolo");
		String produttore=request.getParameter("produttore");
		String descrizione=request.getParameter("descrizione");
		String prezzo=request.getParameter("prezzo");
		String quantita=request.getParameter("quantita");
		String iva=request.getParameter("iva");
		String novita=request.getParameter("novita");
		String offerta=request.getParameter("offerta");
		String foto=request.getParameter("foto");
		
	
		p.setCodiceProdotto(codP);
		p.setDescrizione(descrizione);
		p.setDisponibilita(Integer.parseInt(quantita));
		p.setIVA(Integer.parseInt(iva));
		p.setNovita(Boolean.parseBoolean(novita));
		p.setOfferta(Boolean.parseBoolean(offerta));
		p.setPrezzo(new BigDecimal(prezzo));
		p.setProduttore(produttore);
		p.setTitolo(titolo);
		p.setFoto(foto);
		System.out.println(p.toString());
		
		String nGiocatori=request.getParameter("ngiocatori");
		String eta=request.getParameter("eta");
		String durata=request.getParameter("durata");

		
		String nomeCat=request.getParameter("categoria");
		if (nomeCat.equalsIgnoreCase("Gioco")) {
			p.setCodCategoria(1);
			String desCat=request.getParameter("sceltag");
			BeanGioco g=new BeanGioco();
			g.setNomeCategoria(nomeCat);
			g.setCodiceProdotto(codP);
			g.setDescrizioneCategoria(desCat);
			g.setDurata(durata);
			g.setNumeroGiocatori(nGiocatori);
			System.out.println(g.toString());
			g.setEtaConsigliata(Integer.parseInt(eta));

			System.out.println(g.toString());
			try {
				model.doSave(p);
				modelg.doSave(g);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(nomeCat.equalsIgnoreCase("Accessorio")) {
			p.setCodCategoria(2);
			BeanAccessorio a=new BeanAccessorio();
			String desCat=request.getParameter("sceltaa");
			a.setDescrizioneCategoria(desCat);
			try {
				model.doSave(p);
				modela.doSave(a);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
