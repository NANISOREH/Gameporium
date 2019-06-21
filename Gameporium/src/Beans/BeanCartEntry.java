package Beans;

import java.io.Serializable;
import java.math.BigDecimal;

public class BeanCartEntry  extends Bean implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	BeanProduct product;
	int quantita;
	BigDecimal prezzoTotale;
	
	public BigDecimal getPrezzoTotale() {
		return prezzoTotale;
	}

	public void setPrezzoTotale(BigDecimal prezzoTotale) {
		this.prezzoTotale = prezzoTotale;
	}

	public BeanCartEntry(BeanProduct bp, int q)
	{
		quantita=q;
		product=bp;
		prezzoTotale=bp.getPrezzo().multiply(new BigDecimal(q));
	}
	
	public BeanCartEntry(BeanProduct bp)
	{
		product=bp;
	}
	
	public BeanProduct getProduct() {
		return product;
	}
	
	@Override
	public String toString() {
		return "BeanCartEntry [product=" + product + ", quantita=" + quantita + ", prezzoTotale=" + prezzoTotale + "]";
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
