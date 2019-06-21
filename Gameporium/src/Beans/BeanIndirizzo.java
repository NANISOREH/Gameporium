package Beans;

import java.io.Serializable;



public class BeanIndirizzo extends Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceIndirizzo, civico, cap;
	String citta,via;
	
	public BeanIndirizzo()
	{
		codiceIndirizzo=-1;
		civico= -1;
		cap = -1;
		citta="";
	}

	public int getCodiceIndirizzo() {
		return codiceIndirizzo;
	}

	public void setCodiceIndirizzo(int newCodiceIndirizzo) {
		this.codiceIndirizzo = newCodiceIndirizzo;
	}

	public int getCivico() {
		return civico;
	}

	public void setCivico(int newCivico) {
		this.civico = newCivico;
	}
	
	public int getCap() {
		
		return this.cap;
	}
	
	public void setCap(int newCap) {
		this.cap = newCap;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String newCitta) {
		this.citta = newCitta;
	}
	
	public String getVia() {
		return via;
	}
	
	public void setVia(String newVia) {
		this.via = newVia;
	}

	@Override
	public String toString() {
		return "BeanIndirizzo [codiceIndirizzo=" + codiceIndirizzo + ", citta=" + citta + ", via="
				+ via + ",civico= " + civico + ",cap=" + cap + "]";
	}


}


