package Beans;

import java.io.Serializable;

public class BeanProduct extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	int IVA,codiceProdotto,disponibilita,codCategoria;
	double prezzo;
	boolean offerta, novita;


	String titolo,descrizione,foto, produttore;


	public BeanProduct(){
		codiceProdotto=-1;
		disponibilita=0;
		codCategoria=0;
		prezzo=0.00;
		titolo="";
		descrizione="";
		foto="";
		produttore="";
		IVA=-1;
		offerta=false;
		novita=false;
	}
	
	public boolean isOfferta() {
		return offerta;
	}

	public void setOfferta(boolean newOfferta) {
		this.offerta = newOfferta;
	}

	public boolean isNovita() {
		return novita;
	}

	public void setNovita(boolean newNovita) {
		this.novita = newNovita;
	}

	public int getCodice() {
		return this.codiceProdotto;
	}
	public void setCodice(int newCodice) {
		this.codiceProdotto=newCodice;
	}
	public int getDisponibilita() {
		return this.disponibilita;
	}
	public void setDisponibilita(int q) {
		this.disponibilita=q;
	}

	public int getCodCategoria() {
		return this.codCategoria;
	}
	public void setCodCategoria(int newCodCat) {
		this.codCategoria=newCodCat;
	}
	
	public double getPrezzo() {
		return this.prezzo;
	}
	public void setPrezzo(double newPrezzo) {
		this.prezzo=newPrezzo;
	}

	public String getTitolo() {
		return this.titolo;
	}
	public void setTitolo(String newTitolo) {
		this.titolo=newTitolo;
	}
	public String getDescrizione() {
		return this.descrizione;
	}
	public void setDescrizione(String newDescrizione) {
		this.descrizione=newDescrizione;
	}
	public String getFoto() {
		return this.foto;
	}
	public void setFoto(String newFoto) {
		this.foto=newFoto;
	}
	public String getProduttore() {
		return this.produttore;
	}
	public void setProduttore(String newProduttore) {
		this.produttore=newProduttore;
	}
	public int getIVA() {
		return IVA;
	}
	public void setIVA(int newIVA) {
		IVA = newIVA;
	}
	@Override
	public String toString() {
		return "BeanProduct [IVA=" + IVA + ", codiceProdotto=" + codiceProdotto + ", disponibilita=" + disponibilita
				+ ", codCategoria=" + codCategoria + ", prezzo=" + prezzo + ", offerta=" + offerta + ", novita=" + novita + ", titolo=" + titolo + ", descrizione=" + descrizione + ", foto="
				+ foto + ", produttore=" + produttore + "]";
	}
	
}