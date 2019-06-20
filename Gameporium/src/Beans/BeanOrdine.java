package Beans;

import java.io.Serializable;
import java.time.LocalDate;

public class BeanOrdine extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceOrdine, codiceSpedizione, codicePagamento;
	String indirizzoSpedizione, tipoSpedizione,metodo, indirizzoFatturazione, username;
	LocalDate dataSpedizione,dataOrdine;
	double importo;
	
	public BeanOrdine()
	{
		codiceOrdine=-1;
		codiceSpedizione=-1;
		codicePagamento=-1;
		indirizzoSpedizione="";
		tipoSpedizione="";
		dataSpedizione=LocalDate.now();
		dataOrdine=LocalDate.now();
		importo=-1;
		metodo="";
		indirizzoFatturazione="";
		username="";
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

	public LocalDate getDataSpedizione() {
		return dataSpedizione;
	}

	public void setDataSpedizione(LocalDate newDataSpedizione) {
		this.dataSpedizione = newDataSpedizione;
	}
	public LocalDate getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(LocalDate newDataOrdine) {
		this.dataOrdine = newDataOrdine;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String newUsername) {
		this.username=newUsername;
	}
	@Override
	public String toString() {
		return "BeanOrdine [codiceOrdine=" + codiceOrdine + ", Username="+username+", dataOrdine=" + dataOrdine +", codiceSpedizione=" + codiceSpedizione
				+ ", codicePagamento=" + codicePagamento + ", indirizzoSpedizione=" + indirizzoSpedizione
				+ ", tipoSpedizione=" + tipoSpedizione + ", dataSpedizione=" + dataSpedizione + "]";
	}
	
	
	
	

}
