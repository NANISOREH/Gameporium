package Beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

public class BeanOrdine extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceOrdine;
	Long metodo;
	String indirizzoSpedizione, statoProdotti, username;
	LocalDate dataSpedizione,dataOrdine;
	BigDecimal importo;
	
	public BeanOrdine()
	{
		codiceOrdine=-1;
		indirizzoSpedizione="";
		dataSpedizione=LocalDate.now();
		dataOrdine=LocalDate.now();
		importo = new BigDecimal("-1");
		metodo=(long) 11111111;
		username="";
	}

	public Long getMetodo() {
		return metodo;
	}

	public void setMetodo(Long newMetodo) {
		this.metodo =newMetodo;
	}

	public int getCodiceOrdine() {
		return codiceOrdine;
	}

	public void setCodiceOrdine(int newCodiceOrdine) {
		this.codiceOrdine = newCodiceOrdine;
	}

	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}

	public void setIndirizzoSpedizione(String newIndirizzoSpedizione) {
		this.indirizzoSpedizione = newIndirizzoSpedizione;
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
		return "BeanOrdine [codiceOrdine=" + codiceOrdine + ", indirizzoSpedizione=" + indirizzoSpedizione + ", metodo="
				+ metodo + ", statoProdotti=" + statoProdotti + ", username=" + username + ", dataSpedizione="
				+ dataSpedizione + ", dataOrdine=" + dataOrdine + ", importo=" + importo + "]";
	}
	

}
