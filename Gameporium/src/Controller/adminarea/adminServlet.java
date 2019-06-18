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
		String op=request.getParameter("operation");
		int operation=Integer.parseInt(op);
		
		if(operation==1) {
			BeanProduct p =new BeanProduct();
			int codP=Integer.parseInt(request.getParameter("codiceProdotto"));
			String titolo=request.getParameter("titolo");
			String produttore=request.getParameter("produttore");
			String descrizione=request.getParameter("descrizione");
			String prezzo=request.getParameter("prezzo");
			String quantita=request.getParameter("quantita");
			String iva=request.getParameter("IVA");
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
	
			
			String nomeCat=request.getParameter("categoria");
			if (nomeCat.equalsIgnoreCase("Gioco")) {
				p.setCodCategoria(1);
			
				BeanGioco g=new BeanGioco();
				String nGiocatori=request.getParameter("ngiocatori");
				String eta=request.getParameter("eta");
				String durata=request.getParameter("durata");
				String desCat=request.getParameter("sceltag");
				
			
				g.setNomeCategoria(nomeCat);
				g.setCodiceProdotto(codP);
				g.setDescrizioneCategoria(desCat);
				g.setDurata(durata);
				g.setNumeroGiocatori(nGiocatori);
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
				a.setCodiceProdotto(codP);
				a.setNomeCategoria(nomeCat);
				try {
					model.doSave(p);
					modela.doSave(a);
					System.out.println(a.toString());
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
		else if(operation ==2) {
			BeanProduct bp= new BeanProduct();
			int codP=Integer.parseInt(request.getParameter("codiceProdotto"));
			try {
				bp=model.doRetrieveByKey(codP);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String titolo=request.getParameter("titolo");
			if(!titolo.equals(bp.getTitolo())) {
				try {
					model.doUpdate("titolo", codP, titolo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String produttore=request.getParameter("produttore");
			if(!produttore.equals(bp.getProduttore())) {
				try {
					model.doUpdate("produttore", codP, produttore);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String descrizione=request.getParameter("descrizione");
			if(!descrizione.equals(bp.getDescrizione())) {
				try {
					model.doUpdate("descrizione", codP, descrizione);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String prezzo=request.getParameter("prezzo");
		
			BigDecimal price=new BigDecimal(prezzo);
	

			if((price)!=(bp.getPrezzo())) {
				try {
					model.doUpdate("prezzo", codP, price);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String quantita=request.getParameter("disponibilita");
			if(Integer.parseInt(quantita)!=bp.getDisponibilita()) {
				try {
					model.doUpdate("disponibilita", codP, quantita);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String iva=request.getParameter("IVA");
			if(Integer.parseInt(iva)!=bp.getIVA()) {
				try {
					model.doUpdate("IVA", codP, iva);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String novita=request.getParameter("novita");
			if(Boolean.parseBoolean(novita)!=bp.isNovita()) {
				try {
					model.doUpdate("novita", codP, novita);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String offerta=request.getParameter("offerta");
			if(Boolean.parseBoolean(offerta)!=bp.isOfferta()) {
				try {
					model.doUpdate("offerta", codP, offerta);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String foto=request.getParameter("foto");
			if(!foto.equals(bp.getFoto())) {
				try {
					model.doUpdate("foto", codP, foto);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			String nomeCat=request.getParameter("nomeCategoria");
			if (nomeCat.equalsIgnoreCase("Gioco")) {
				BeanGioco bg= new BeanGioco();
				try {
					bg=modelg.doRetrieveByKey(codP);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				String nGiocatori=request.getParameter("numeroGiocatori");
				if(!nGiocatori.equals(bg.getNumeroGiocatori())) {
					try {
						modelg.doUpdate("numGiocatori", codP, nGiocatori);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				String eta=request.getParameter("eta");
				if(Integer.parseInt(eta)!=bg.getEtaConsigliata()) {
					try {
						modelg.doUpdate("eta", codP, eta);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				String durata=request.getParameter("durata");
				if(!durata.equals(bg.getDurata())) {
					try {
						modelg.doUpdate("durata", codP, durata);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				String desCat=request.getParameter("descrizioneCategoriaGiochi");
				if(!desCat.equals(bg.getDescrizioneCategoria())) {
					try {
						modelg.doUpdate("descrizioneCategoria", codP, desCat);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			else {
				String desCat=request.getParameter("descrizioneCategoriaAccessori");
				BeanAccessorio ba= new BeanAccessorio();
				try {
					ba=modela.doRetrieveByKey(codP);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				if(!desCat.equals(ba.getDescrizioneCategoria())) {
					try {
						modela.doUpdate("descrizioneCategoria", codP, desCat);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
			}
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
