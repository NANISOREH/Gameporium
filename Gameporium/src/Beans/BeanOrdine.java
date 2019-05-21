package Beans;

import java.io.Serializable;

public class BeanOrdine extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceOrdine, codiceSpedizione, codicePagamento;
	String indirizzoSpedizione, tipoSpedizione,metodo, indirizzoFatturazione;
	java.sql.Date dataSpedizione;
	double importo;
	
	public BeanOrdine()
	{
		codiceOrdine=-1;
		codiceSpedizione=-1;
		codicePagamento=-1;
		indirizzoSpedizione="";
		tipoSpedizione="";
		dataSpedizione=null;
		importo=-1;
		metodo="";
		indirizzoFatturazione="";
	}

	public String getMetodo() {
		return metodo;
	}

	public void setMetodo(String newMetodo) {
		this.metodo =newMetodo;
	}

	public String getIndirizzoFatturazione() {
		return indirizzoFatturazione;
	}

	public void setIndirizzoFatturazione(String newIndirizzoFatturazione) {
		this.indirizzoFatturazione = newIndirizzoFatturazione;
	}

	public double getImporto() {
		return importo;
	}

	public void setImporto(double newImporto) {
		this.importo = newImporto;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int newCodiceOrdine) {
		this.codiceOrdine = newCodiceOrdine;
	}

	public int getCodiceSpedizione() {
		return codiceSpedizione;
	}

	public void setCodiceSpedizione(int newCodiceSpedizione) {
		this.codiceSpedizione = newCodiceSpedizione;
	}

	public int getCodicePagamento() {
		return codicePagamento;
	}

	public void setCodicePagamento(int newCodicePagamento) {
		this.codicePagamento = newCodicePagamento;
	}

	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}

	public void setIndirizzoSpedizione(String newIndirizzoSpedizione) {
		this.indirizzoSpedizione = newIndirizzoSpedizione;
	}

	public String getTipoSpedizione() {
		return tipoSpedizione;
	}

	public void setTipoSpedizione(String newTipoSpedizione) {
		this.tipoSpedizione = newTipoSpedizione;
	}

	public java.sql.Date getDataSpedizione() {
		return dataSpedizione;
	}

	public void setDataSpedizione(java.sql.Date newDataSpedizione) {
		this.dataSpedizione = newDataSpedizione;
	}

	@Override
	public String toString() {
		return "BeanOrdine [codiceOrdine=" + codiceOrdine + ", codiceSpedizione=" + codiceSpedizione
				+ ", codicePagamento=" + codicePagamento + ", indirizzoSpedizione=" + indirizzoSpedizione
				+ ", tipoSpedizione=" + tipoSpedizione + ", dataSpedizione=" + dataSpedizione + "]";
	}
	
	
	
	

}
