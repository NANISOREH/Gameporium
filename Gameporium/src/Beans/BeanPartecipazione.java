package Beans;

import java.io.Serializable;

public class BeanPartecipazione extends Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceEvento;
	String codiceCliente;
	
	public BeanPartecipazione()
	{
		codiceCliente="";
		codiceEvento=-1;
	}

	public String getCodiceCliente() {
		return codiceCliente;
	}

	public void setCodiceCliente(String newCodiceCliente) {
		this.codiceCliente = newCodiceCliente;
	}

	public int getCodiceEvento() {
		return codiceEvento;
	}

	public void setCodiceEvento(int newCodiceEvento) {
		this.codiceEvento = newCodiceEvento;
	}

	@Override
	public String toString() {
		return "BeanEffettua [codiceCliente=" + codiceCliente + ", codiceOrdine=" + codiceEvento + "]";
	}
	
	
	


}
