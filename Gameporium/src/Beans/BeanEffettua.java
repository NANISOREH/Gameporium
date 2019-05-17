package Beans;

import java.io.Serializable;

public class BeanEffettua implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceCliente, codiceOrdine;
	
	public BeanEffettua()
	{
		codiceCliente=-1;
		codiceOrdine=-1;
	}

	public int getCodiceCliente() {
		return codiceCliente;
	}

	public void setCodiceCliente(int newCodiceCliente) {
		this.codiceCliente = newCodiceCliente;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int newCodiceOrdine) {
		this.codiceOrdine = newCodiceOrdine;
	}

	@Override
	public String toString() {
		return "BeanEffettua [codiceCliente=" + codiceCliente + ", codiceOrdine=" + codiceOrdine + "]";
	}
	
	
	


}
