package Controller.purchase;

import Beans.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;

public class Cart {

	private Collection<BeanCartEntry> products;
	BigDecimal totale;
	BigDecimal ivaTotale;
	public Cart() {
		products = new ArrayList<BeanCartEntry>();
		totale=new BigDecimal("0"); 
		ivaTotale=new BigDecimal("0");

	}

	public void addProduct(BeanCartEntry bce) {
			products.add(bce);
			
			totale=totale.add(bce.getPrezzoTotale());
			
	}
	
	public BigDecimal getTotale()
	{
		ivaTotale = totale.multiply(new BigDecimal("0.22"));
		
		return totale.add(ivaTotale);
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
		
		for(BeanCartEntry b: products)
		{
			if(bce.getCodP()==b.getCodP())
			{
				selected = b;
			}
		}
		totale=totale.subtract(selected.getProduct().getPrezzo().multiply(new BigDecimal(selected.getQuantita())));
	//	oldquantita=selected.getQuantita();
		selected.setQuantita(selected.getQuantita()+quant);
		System.out.println("Nel carrello ci stanno "+selected.getQuantita());
		selected.setPrezzoTotale(selected.getProduct().getPrezzo().multiply(new BigDecimal(selected.getQuantita())));
		
		totale=totale.add(selected.getProduct().getPrezzo().multiply(new BigDecimal (selected.getQuantita())));
	
	}
	
	public void refresh(BeanCartEntry bce,int quant)
	{
		for(BeanCartEntry b: products)
			if(bce.getCodP()==b.getCodP())
			{
				totale=totale.subtract(b.getProduct().getPrezzo().multiply(new BigDecimal(b.getQuantita())));

				b.setQuantita(quant);
				System.out.println("Nel carrello ci stanno "+b.getQuantita());

				b.setPrezzoTotale(b.getProduct().getPrezzo().multiply(new BigDecimal (quant)));
				System.out.println("Totale: "+totale);

				totale=totale.add(b.getProduct().getPrezzo().multiply(new BigDecimal (b.getQuantita())));
				System.out.println("Totale: "+totale);

				
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
	
	public String formatStatoProdotti()
	{
		int c=1;
		String format="[\n";
		for(BeanCartEntry b : products)
		{
			if (c < products.size())
			{
				format = format + "\n\t{" + "\n" 
						+ "\t\t\"" + "nomeProdotto" + "\" : \"" + b.getProduct().getTitolo() + "\",\n"
						+ "\t\t\"" + "prezzoProdotto" + "\" : \"" + b.getProduct().getPrezzo().toString() + "\",\n"
						+ "\t\t\"" + "quantita" + "\" : \"" + b.getQuantita() + "\"\n"
						+ "\t},";
			}
			else
			{
				format = format + "\n\t{" + "\n" 
						+ "\t\t\"" + "nomeProdotto" + "\" : \"" + b.getProduct().getTitolo() + "\",\n"
						+ "\t\t\"" + "prezzoProdotto" + "\" : \"" + b.getProduct().getPrezzo().toString() + "\",\n"
						+ "\t\t\"" + "quantita" + "\" : \"" + b.getQuantita() + "\"\n"
						+ "\t}";
			}
			
			c++;
		}
		
		return format + "\n]";
	}
	
}
