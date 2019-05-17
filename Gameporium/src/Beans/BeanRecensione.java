package Beans;

import java.io.Serializable;

public class BeanRecensione implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceCliente, codiceProdotto;
	String testo;
	
	public BeanRecensione()
	{
		codiceCliente=-1;
		codiceProdotto=-1;
		testo="";
	}

	public int getCodiceCliente() {
		return codiceCliente;
	}

	public void setCodiceCliente(int newCodiceCliente) {
		this.codiceCliente = newCodiceCliente;
	}

	public int getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceOrdine(int newCodiceProdotto) {
		this.codiceProdotto = newCodiceProdotto;
	}

	public String getTesto() {
		return testo;
	}

	public void setTesto(String newTesto) {
		this.testo = newTesto;
	}

	@Override
	public String toString() {
		return "BeanRecensione [codiceCliente=" + codiceCliente + ", codiceProdotto=" + codiceProdotto + ", testo="
				+ testo + "]";
	}


	
	
	


}
