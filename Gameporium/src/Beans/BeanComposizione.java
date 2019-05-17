package Beans;

import java.io.Serializable;

public class BeanComposizione implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceOrdine, codiceProdotto, quantità;
	
	public BeanComposizione()
	{
		codiceOrdine=-1;
		codiceProdotto=-1;
		quantità=-1;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int newCodiceOrdine) {
		this.codiceOrdine = newCodiceOrdine;
	}

	public int getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceProdotto(int newCodiceProdotto) {
		this.codiceProdotto = newCodiceProdotto;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int newQuantità) {
		this.quantità = newQuantità;
	}

	@Override
	public String toString() {
		return "BeanComposizione [codiceOrdine=" + codiceOrdine + ", codiceProdotto=" + codiceProdotto + ", quantit�="
				+ quantità + "]";
	}
	
	
	
	
	

}
