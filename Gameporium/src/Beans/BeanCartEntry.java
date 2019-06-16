package Beans;

import java.io.Serializable;

public class BeanCartEntry  extends Bean implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BeanProduct product;
	int quantita;
	
	public BeanCartEntry(BeanProduct bp, int q)
	{
		quantita=q;
		product=bp;
	}
	
	public BeanProduct getProduct() {
		return product;
	}
	
	@Override
	public String toString() {
		return "BeanCartEntry [product=" + product + ", quantita=" + quantita + "]";
	}
	public void setProduct(BeanProduct product) {
		this.product = product;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	public int getCodP()
	{
		return product.getCodiceProdotto();
	}

}
