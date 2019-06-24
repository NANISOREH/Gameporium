package Beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

public class BeanOrdine extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceOrdine, codiceSpedizione, codicePagamento;
	String indirizzoSpedizione, tipoSpedizione, metodo, statoProdotti, indirizzoFatturazione, username;
	LocalDate dataSpedizione,dataOrdine;
	BigDecimal importo;
	
	public BeanOrdine()
	{
		codiceOrdine=-1;
		codiceSpedizione=-1;
		codicePagamento=-1;
		indirizzoSpedizione="";
		tipoSpedizione="";
		dataSpedizione=LocalDate.now();
		dataOrdine=LocalDate.now();
		importo = new BigDecimal("-1");
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
	
	public String getStatoProdotti() {
		return statoProdotti;
	}
	
	
	public void setStatoProdotti(String statoProdotti) {
		this.statoProdotti = statoProdotti;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String newUsername) {
		this.username=newUsername;
	}

	public BigDecimal getImporto() {
		return importo;
	}

	public void setImporto(BigDecimal importo) {
		this.importo = importo;
	}

	@Override
	public String toString() {
		return "BeanOrdine [codiceOrdine=" + codiceOrdine + ", codiceSpedizione=" + codiceSpedizione
				+ ", codicePagamento=" + codicePagamento + ", indirizzoSpedizione=" + indirizzoSpedizione
				+ ", tipoSpedizione=" + tipoSpedizione + ", metodo=" + metodo + ", statoProdotti=" + statoProdotti
				+ ", indirizzoFatturazione=" + indirizzoFatturazione + ", username=" + username + ", dataSpedizione="
				+ dataSpedizione + ", dataOrdine=" + dataOrdine + ", importo=" + importo + "]";
	}
	

}
