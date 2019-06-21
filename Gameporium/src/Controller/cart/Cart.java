package Controller.cart;

import Beans.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;

public class Cart {

	private Collection<BeanCartEntry> products;
	BigDecimal totale;
	public Cart() {
		products = new ArrayList<BeanCartEntry>();
		totale=new BigDecimal("0"); 

	}

	public void addProduct(BeanCartEntry bce) {
			products.add(bce);
			
			totale=totale.add(bce.getPrezzoTotale());
			
	}
	
	public BigDecimal getTotale()
	{
		return totale;
	}
	

	
	public void deleteProduct(BeanCartEntry bce) {
		Collection<BeanCartEntry> toRemove=new ArrayList<BeanCartEntry>();
		for(BeanCartEntry prod : products) {
			if(prod.getCodP() == bce.getCodP()) {
				toRemove.add(prod);
				
				totale=totale.subtract(prod.getPrezzoTotale());			
				}
			
		}
		
		products.removeAll(toRemove);
 	}
	
	public void setQuant(BeanCartEntry bce,int quant)
	{
		BeanCartEntry selected = null;
		int oldquantita;
		
		for(BeanCartEntry b: products)
		{
			if(bce.getCodP()==b.getCodP())
			{
				selected = b;
			}
		}
		
		oldquantita=selected.getQuantita();
		selected.setQuantita(quant);
		selected.setPrezzoTotale(selected.getProduct().getPrezzo().multiply(new BigDecimal (quant)));
		
		totale=totale.add(selected.getProduct().getPrezzo().multiply(new BigDecimal (quant-selected.getQuantita())));
	
	}
	
	public void refresh(BeanCartEntry bce,int quant)
	{
		for(BeanCartEntry b: products)
			if(bce.getCodP()==b.getCodP())
			{
				b.setQuantita(quant);
				b.setPrezzoTotale(b.getProduct().getPrezzo().multiply(new BigDecimal (quant)));
				totale=totale.add(b.getPrezzoTotale());
			}
	}	
	
	
	public Collection<BeanCartEntry> getProducts() {
		return products;
	}
	
	public void printCart () {
		for(BeanCartEntry bce : products) {
			System.out.println(bce.toString());
		}
	}
	
	public int cartCardinality()
	{
		int result = 0;
		
		for(BeanCartEntry p: products)
		{
			result = result + p.getQuantita();
		}
		
		return result;
	}
	
	public boolean cartContains(BeanCartEntry bce)
	{
		for(BeanCartEntry p: products)
		{
			if(p.getCodP()==bce.getCodP())
				return true;
		}
		return false;
	}
	
}
