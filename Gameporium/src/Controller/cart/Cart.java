package Controller.cart;

import Beans.*;

import java.util.ArrayList;
import java.util.Collection;

public class Cart {

	private Collection<BeanCartEntry> products;
	
	public Cart() {
		products = new ArrayList<BeanCartEntry>();
	}

	public synchronized void addProduct(BeanCartEntry bce) {
			products.add(bce);
	}
	
	
	public void deleteProduct(BeanCartEntry bce) {
		for(BeanCartEntry prod : products) {
			if(prod.getCodP() == bce.getCodP()) {
				products.remove(prod);
			}
		}
 	}
	
	public void setQuant(BeanCartEntry bce,int quant)
	{
		for(BeanCartEntry b: products)
			if(bce.getCodP()==b.getCodP())
				b.setQuantita(b.getQuantita()+quant);
	
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
